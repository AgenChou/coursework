/* Big_business
 * Author: u1690550
 * Creation date: 17/11/2016
 */
MACHINE
    Big_business
USES
   Items
INCLUDES
     Warehouse, Orders

//PROMOTES
//    service_order

OPERATIONS
    dispatch(oid) =
    PRE
        oid : dom(orderitem)
    THEN
        IF 
            orderamt(oid) <= stock(orderitem(oid))
        THEN
            service_order(oid) ||
            remove_stock(orderitem(oid), orderamt(oid))
        END
    END;
    
    infoos <-- query_infeasible =
    infoos := {oo | oo : dom(orderitem) & orderamt(oo) < stock(orderitem(oo))}
    
    
    

END
