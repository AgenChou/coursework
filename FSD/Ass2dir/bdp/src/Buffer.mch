MACHINE
    Buffer ( qlen , ELEM )

CONSTRAINTS
    qlen : NAT1

SEES
    Resp

ABSTRACT_VARIABLES
    buff

INVARIANT
    buff : seq ( ELEM ) &
    size ( buff ) <= qlen

INITIALISATION
    buff := <>

OPERATIONS
    add ( xx ) =
    PRE xx : ELEM & size ( buff ) < qlen
    THEN
        buff := buff <- xx
    END ;

    ee <-- remove =
    PRE buff /= <>
    THEN
        ee := first ( buff ) ||
        buff := tail ( buff )
    END ;

    rr <-- emptyquery =
    IF buff = <>
    THEN
        rr := yes
    ELSE
        rr := no
    END ;

    rr <-- fullquery =
    IF size ( buff ) = qlen
    THEN
        rr := yes
    ELSE
        rr := no
    END ;

    oo <-- contentsquery =
        oo := size ( buff )
END
/*
* NOTE: this machine generates 13 POs, 7 of which are proven automatically. 
* The remaining 6 are Well-Defineness POs, of the form 'buff : seq(ran(buff))',
* which necessarily follows from the Invariant:
* buff : seq(ELEM) 
* <=> ran(buff) <: ELEM
* Now, buff is a sequence, and its range is ran(buff), therefore buff : seq(ran(buff))
*
* The only other proof obligation is 'buff : NATURAL-{0} +-> ELEM' which is true, because
* buff is a sequence, and finite sequences of ELEM form a subset of the partial functions
* describe above.
*/
