/* Warehouse
 * Author: u1690550
 * Creation date: 17/11/2016
 */
MACHINE
    Warehouse
SEES
    Items
VARIABLES
    stock
INVARIANT
    stock: ITEM --> NAT
INITIALISATION
    stock := ITEM*{0}
OPERATIONS
    add_stock(ii, nn) =
    PRE
        ii : ITEM & nn : NAT
    THEN
        stock := stock <+ {ii |-> nn}
    END;

    remove_stock(ii, nn) =
    PRE
        ii: ITEM & nn : NAT  
    THEN
        IF
            nn <= stock(ii)
        THEN
            stock(ii) := stock(ii) - nn
        END
    END;
    
    bb <-- stock_query(ii,nn) = 
    PRE
        ii : ITEM & nn : NAT
    THEN
        IF
            nn <= stock(ii)
        THEN
            bb := TRUE
        ELSE
            bb := FALSE
        END
    END
    
    
        

END
