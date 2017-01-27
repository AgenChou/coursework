/* ordersys
 * Author: u1690550
 * Creation date: 03/11/2016
 */
MACHINE
    ordersys
CONCRETE_CONSTANTS
    maxorders
PROPERTIES
    maxorders : NAT1
SETS
    OID ; PARTS ; NAMES
ABSTRACT_VARIABLES
    orders
INVARIANT
    orders : OID +-> struct ( o_cust : NAMES , o_part : PARTS , o_quant : NAT1 , o_disp : BOOL ) &
    card ( orders ) <= maxorders
INITIALISATION
    orders := {}
OPERATIONS

    addorder ( cc , pp , nn ) =
    PRE
        cc : NAMES &
        pp : PARTS &
        nn : NAT1 &
        card ( orders ) < maxorders
    THEN
        ANY
            oid
        WHERE
            oid : OID - dom ( orders )
        THEN
            orders := orders \/ { oid |-> rec ( cc , pp , nn , FALSE ) }
        END
    END ;

    rr <-- findorder ( oo ) =
    PRE
        oo : dom ( orders )
    THEN
        rr := orders ( oo )
    END ;

    bb <-- isvalidorder ( oo ) =
    PRE
        oo : OID
    THEN
        IF oo /: dom ( orders )
        THEN bb := TRUE
        ELSE bb := FALSE
        END
    END ;

    cancelorder ( oo ) =
    PRE
        oo : dom ( orders )
    THEN
        IF ( orders ( oo ) ) ' o_disp = FALSE
        THEN orders := orders - { oo |-> orders ( oo ) }
        END
    END ;

    dispatchorder ( oo ) =
    PRE
        oo : dom ( orders )
    THEN
        orders ( oo ) := rec ( ( orders ( oo ) ) ' o_cust , ( orders ( oo ) ) ' o_part , ( orders ( oo ) ) ' o_quant , TRUE )
    END ;

    oos <-- todispatch =
    oos := { oo | oo : dom ( orders ) & ( orders ( oo ) ) ' o_disp = FALSE } ;

    nn <-- numberordered ( pp ) =
    PRE
        pp : PARTS
    THEN
        nn := SIGMA ( zz ) . ( zz : dom ( orders ) & ( orders ( zz ) ) ' o_part = pp | ( orders ( zz ) ) ' o_quant )
    END

END
