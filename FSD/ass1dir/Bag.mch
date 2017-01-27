/* Bag
 * Author: Agata Borkowska
 * UID: 1690550
 * Creation date: 13/11/2016
 */
MACHINE
    Bag(ELEM, cap)
CONSTRAINTS
    cap : NAT1 
    // note that we excluding the case where the cap is 0, so no elements are allowed in the bag
    // so we can always add at least one element - otherwise the machine would be pointless
VARIABLES
    bag
INVARIANT
    bag : ELEM +-> NAT1 &
    !(ee).(ee : dom(bag) => bag(ee) <= cap)
    
INITIALISATION
    bag := {}
OPERATIONS
    // add an element to the bag
    addbag(ee) =
    PRE
        ee : ELEM
    THEN
        IF
            ee : dom(bag) // if at least one of these elements is in the bag, increase the amount
        THEN
            IF
                bag(ee) < cap // but only if we're below the cap
            THEN
                bag := bag <+ {ee |-> bag(ee) + 1}
            END
        ELSE
            bag := bag \/ {ee |-> 1} // else expand the domain of bag
        END
    END;
    
    // remove an element from the bag (if there is at least one inside)
    rembag(ee) =
    PRE
        ee : dom(bag)
    THEN
        IF
            bag(ee) > 1
        THEN
            bag := bag <+ {ee |-> bag(ee) - 1}
        ELSE
            bag := bag - {ee |-> 1}
        END
    END;
    
    // query how many of the given element are there in the bag
    oo <-- contelm(ee) =
    PRE
        ee : ELEM
    THEN
        IF
            ee : dom(bag)
        THEN
            oo := bag(ee)
        ELSE
            oo := 0
        END
    END;
    
    // count how many elements in total there are in the bag
    oo <-- totelms =
    IF
        card(dom(bag)) = 0 // deal with the case that the bag is empty
    THEN
        oo := 0
    ELSE
        oo := SIGMA(xx).(xx : ran(bag) | xx)
    END;
    
    // query if at least one of a given element is in the bag
    bb <-- isin(ee) =
    PRE 
        ee : ELEM
    THEN
        IF
            ee : dom(bag)
        THEN
            bb := TRUE
        ELSE
            bb := FALSE
        END
    END;
    
        
    
        

END
