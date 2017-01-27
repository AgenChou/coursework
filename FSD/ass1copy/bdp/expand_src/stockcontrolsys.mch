/* stockcontrolsys
 * Author: Agata Borkowska
 * UID: 1690550
 * Creation date: 13/11/2016
 */
MACHINE
    stockcontrolsys ( maxorders )
CONSTRAINTS
    // The parameter maxorders is the maximum number of orders we can store in backlog
    maxorders : NAT1
SETS
    ITEMS // set of all items that can be ordered 
ABSTRACT_VARIABLES
    stock , orders
INVARIANT
    // stock is a total function mapping item --> quantity, describing how much of each item is in stock 
    stock : ITEMS --> NAT &
    // orders is a sequence of sets of maplets item |-> quantity 
    orders : seq ( ITEMS <-> NAT1 ) &
    // the number of waiting orders can't exceed the limit on the backlog 
    size ( orders ) <= maxorders
INITIALISATION
    orders := [] || // no orders to begin with
    stock := % ii . ( ii : ITEMS | 0 ) // empty stock to begin with
OPERATIONS
    // receive a new order and add it to the end of the waiting list
    receiveorder ( oo ) =
    PRE
        oo : ITEMS <-> NAT1 // Note: we are allowing only orders that ask for at least 1 item
    THEN
        IF
            size ( orders ) < maxorders
        THEN
            orders := orders <- oo
        END
    END ;

    // receive stock
    receivestock ( ss ) =
    PRE
        ss : ITEMS +-> NAT1 // we're allowing for multiple items to be delivered at once
    THEN
        stock := stock <+ ss
    END ;

    // query how many of the given item is held in stock
    as <-- howmany ( ii ) =
    PRE
        ii : ITEMS
    THEN
        as := stock ( ii )
    END ;

    // query which order require the given item
    oos <-- whereisitem ( ii ) =
    PRE
        ii : ITEMS
    THEN
        oos := { oo | oo : ran ( orders ) & ii : dom ( oo ) }
    END ;

    // query how many of the given item has been ordered
    ao <-- totordered ( ii ) =
    PRE
        ii : ITEMS
    THEN
        ao := SIGMA ( oo ) . ( oo : ran ( orders ) & ii : dom ( oo ) | oo ( ii ) )
    END ;

    // query which items held in stock are less than the given amount
    iis <-- lowstock ( nn ) =
    PRE
        nn : NAT1
    THEN
        iis := { ii | ii : ITEMS & stock ( ii ) < nn }
    END ;

    // output an item that has the lowest amount in stock
    ii <-- oneoflowest =
    ANY xx
    WHERE
        xx : { ss | ss : dom ( stock ) & stock ( ss ) = min ( ran ( stock ) ) }
    THEN
        ii := xx
    END ;

    // dispatch the longest waiting order, if the stock is sufficient
    serviceorder =
    PRE
        size ( orders ) > 0 // we can only attempt to process an order if one exists
    THEN
        LET
            oo
        BE
            oo = first ( orders )
        IN
            IF
                // for all items in the order, the quantity ordered is less than what's in stock
                ! ( ii ) . ( ii : dom ( oo ) => oo ( ii ) <= stock ( ii ) )
            THEN
                // for each item in the order, reduce the amount in stock
                stock := stock <+ % ii . ( ii : dom ( oo ) | stock ( ii ) - oo ( ii ) ) ||
                orders := tail ( orders )
            END
        END
    END ;

    // dispatch the longest waiting order for which we have sufficient stock
    complicatedserviceorder =
    PRE
        size ( orders ) > 0
    THEN
        LET
            oos
        BE
            // let oos be the set of all serviceable orders
            oos = { oo | oo : ran ( orders ) & ! ( ii ) . ( ii : dom ( oo ) => oo ( ii ) <= stock ( ii ) ) }
        IN
            LET
                nn
            BE
                // let nn be the index of the longest waiting order from oos
                nn = min ( dom ( orders |> oos ) )
            IN
                // as before, update the amount held in stock for each item in the order
                stock := stock <+ % ii . ( ii : dom ( orders ( nn ) ) | stock ( ii ) - orders ( nn ) ( ii ) ) ||
                // remove the element from orders by concatenating what's before and what's after it
                orders := orders /|\ nn - 1 ^ ( orders \|/ nn )

            END
        END
    END

END
