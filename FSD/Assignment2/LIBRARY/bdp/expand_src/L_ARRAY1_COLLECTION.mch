/******************************* CLEARSY *************************************
* File : $Id: $
* (C) 1998 CLEARSY
*
* Description :    L_ARRAY1_COLLECTION modelizes a collection of arrays
*
*
* History : $Log: $
*
******************************************************************************/
MACHINE
  L_ARRAY1_COLLECTION ( LAUC_maxobj , LAUC_maxidx , LAUC_minval , LAUC_maxval )

CONSTRAINTS
  LAUC_maxobj : NAT1 &
  LAUC_maxobj /= MAXINT &
  LAUC_maxidx : NAT &
  LAUC_minval : NAT &
  LAUC_maxval : NAT &
  LAUC_minval <= LAUC_maxval


DEFINITIONS
  LAUC_VALUE == ( LAUC_minval .. LAUC_maxval ) ;
  LAUC_RANGE == ( 1 .. LAUC_maxobj ) ;
  LAUC_INDEX == ( 0 .. LAUC_maxidx )

/*****Part copied from L_ARRAY_COLLECTION *****/
ABSTRACT_VARIABLES
  arr_col

INVARIANT
  arr_col : LAUC_RANGE +-> ( LAUC_INDEX --> LAUC_VALUE )
INITIALISATION
  arr_col := {}

OPERATIONS

  ii , bb <-- CRE_ARR_COL = ANY nrge , nbb , sol , fct , nac WHERE
    nrge : LAUC_RANGE &
    nbb : BOOL &
    sol <: LAUC_RANGE &
    sol = LAUC_RANGE - dom ( arr_col ) &
    fct : LAUC_INDEX --> LAUC_VALUE &
    nac : LAUC_RANGE +-> ( LAUC_INDEX --> LAUC_VALUE ) &
    ( sol = {} => nac = arr_col ) &
    ( sol /= {} => nrge : sol & nac = arr_col \/ { nrge |-> fct } ) &
    nbb = bool ( sol /= {} )
  THEN
    bb := nbb ||
    ii := nrge ||
    arr_col := nac
  END ;

  DEL_ARR_COL ( ii ) = PRE
    ii : LAUC_RANGE &
    ii : dom ( arr_col )
  THEN
    arr_col := { ii } <<| arr_col
  END ;

  vv <-- VAL_ARR_COL ( ii , jj ) = PRE
    ii : LAUC_RANGE &
    ii : dom ( arr_col ) &
    jj : LAUC_INDEX
  THEN
    vv := arr_col ( ii ) ( jj )
  END ;

  STR_ARR_COL ( ii , jj , vv ) = PRE
    ii : LAUC_RANGE &
    ii : dom ( arr_col ) &
    jj : LAUC_INDEX &
    vv : LAUC_VALUE
  THEN
    arr_col ( ii ) ( jj ) := vv
  END ;

  COP_ARR_COL ( dest , src ) = PRE
    dest : LAUC_RANGE &
    dest : dom ( arr_col ) &
    src : LAUC_RANGE &
    src : dom ( arr_col )
  THEN
    arr_col := arr_col <+ { dest |-> arr_col ( src ) }
  END ;

  bb <-- CMP_ARR_COL ( range1 , range2 ) = PRE
    range1 : LAUC_RANGE &
    range1 : dom ( arr_col ) &
    range2 : LAUC_RANGE &
    range2 : dom ( arr_col )
  THEN
    bb := bool ( arr_col ( range1 ) = arr_col ( range2 ) )
  END ;

/*****End of part copied from L_ARRAY_COLLECTION *****/

  /*----------------------------------------------------------------------**
  SET_ARR_COL : copies vv in the ii..jj part of the array rr
  **----------------------------------------------------------------------*/
  SET_ARR_COL ( rr , ii , jj , vv ) =
    PRE
      rr : LAUC_RANGE &
      rr : dom ( arr_col ) &
      ii : LAUC_INDEX &
      jj : LAUC_INDEX &
      jj /= MAXINT &
      vv : LAUC_VALUE
    THEN
      arr_col ( rr ) := arr_col ( rr ) <+ ( ii .. jj ) * { vv }
    END ;

  /*---------------------------------------------------------------------**
  PCOP_ARR_COL: copies the part ii..jj of the array src begining at
  position idx_dest of the array dest
  **----------------------------------------------------------------------*/
  PCOP_ARR_COL ( dest , idx_dst , src , ii , jj ) =
    PRE
      dest : LAUC_RANGE &
      dest : dom ( arr_col ) &
      idx_dst : LAUC_INDEX &
      src : LAUC_RANGE &
      src : dom ( arr_col ) &
      ii : LAUC_INDEX &
      jj : LAUC_INDEX &
      jj /= MAXINT &
      ii <= jj &
      dest /= src &
      idx_dst + jj - ii : LAUC_INDEX
    THEN
      arr_col ( dest ) := arr_col ( dest ) <+
                       % xx . ( xx : idx_dst .. idx_dst + jj - ii |
                            arr_col ( src ) ( xx + ii - idx_dst ) )
    END ;

  /*---------------------------------------------------------------------**
  idx,bb <-- PCMP_ARR_COL: searches for the first different element between
  the part ii..jj of the array rr1 and the part of the array rr2 begining
  at the index idx2 and of the same length. The boolean bb equals true if
  the search succeeds, and in this case, the index idx of this element
  (included between ii and jj) is returned.
  **----------------------------------------------------------------------*/
  idx , bb <-- PCMP_ARR_COL ( rr2 , idx2 , rr1 , ii , jj ) =
    PRE
      rr2 : LAUC_RANGE &
      rr2 : dom ( arr_col ) &
      idx2 : LAUC_INDEX &
      rr1 : LAUC_RANGE &
      rr1 : dom ( arr_col ) &
      ii : LAUC_INDEX &
      jj : LAUC_INDEX &
      ii <= jj &
      idx2 + jj - ii : LAUC_INDEX
    THEN
      ANY nidx , nbb , sol WHERE
        nidx : NAT &
        nbb : BOOL &
        sol = { xx | xx : ii .. jj &
                    arr_col ( rr1 ) ( xx ) /= arr_col ( rr2 ) ( xx + idx2 - ii ) } &

        ( sol /= {} => nidx = min ( sol ) ) &
        nbb = bool ( sol /= {} )
      THEN
        idx := nidx ||
        bb := nbb
      END
    END

END
