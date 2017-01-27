/* Orders
 * Author: u1690550
 * Creation date: 17/11/2016
 */
MACHINE
    Orders
SEES
    Items
SETS
    OID
ABSTRACT_VARIABLES
    orderitem , orderamt
INVARIANT
    orderitem : OID +-> ITEM &
    orderamt : OID +-> NAT1 &
    dom ( orderitem ) = dom ( orderamt )
INITIALISATION
    orderitem := {} || orderamt := {}
OPERATIONS
    place_order ( ii , nn ) =
    PRE
        ii : ITEM & nn : NAT1
    THEN
        ANY
            oid
        WHERE
            oid : OID - dom ( orderitem )
        THEN
            orderitem := orderitem \/ { oid |-> ii } ||
            orderamt := orderamt \/ { oid |-> nn }
        END
    END ;

    service_order ( oo ) =
    PRE
        oo : dom ( orderitem )
    THEN
        orderitem := orderitem - { oo |-> orderitem ( oo ) } ||
        orderamt := orderamt - { oo |-> orderamt ( oo ) }
    END




END
