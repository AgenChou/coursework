/* Bag
 * Author: Agata Borkowska
 * UID: 1690550
 * Creation date: 13/11/2016
 */
MACHINE
    Bag ( ELEM , cap , cost )
    // note: I'm passing cost as a parameter rather than machine variable, because we're not
    // told how to initialise it
CONSTRAINTS
    cap : NAT1 &
    // note that we excluding the case where the cap is 0, so no elements are allowed in the bag
    // so we can always add at least one element - otherwise the machine would be pointless

    cost : ELEM --> NAT
ABSTRACT_VARIABLES
    bag
INVARIANT
    bag : ELEM +-> NAT1 & // if an element is in dom(bag), then there's at least one of it
    ! ( ee ) . ( ee : dom ( bag ) => bag ( ee ) <= cap ) // for all items in the bag, their number doesn't exceed cap 
INITIALISATION
    bag := {}
OPERATIONS
    // add an element to the bag
    addbag ( ee ) =
    PRE
        ee : ELEM
    THEN
        IF
            ee : dom ( bag ) // if at least one of these elements is in the bag, increase the amount
        THEN
            IF
                bag ( ee ) < cap // but only if we're below the cap
            THEN
                bag := bag <+ { ee |-> bag ( ee ) + 1 }
            END
        ELSE
            bag := bag \/ { ee |-> 1 } // else expand the domain of bag
        END
    END ;

    // remove an element from the bag (if there is at least one inside)
    rembag ( ee ) =
    PRE
        ee : dom ( bag )
    THEN
        IF
            bag ( ee ) > 1
        THEN
            bag := bag <+ { ee |-> bag ( ee ) - 1 }
        ELSE
            bag := bag - { ee |-> 1 } // make sure we don't have ee |-> 0 in the bag
        END
    END ;

    // query how many of the given element are there in the bag
    oo <-- contelm ( ee ) =
    PRE
        ee : ELEM
    THEN
        IF
            ee : dom ( bag ) // note that dom(bag) includes only elements that appear at least once
        THEN
            oo := bag ( ee )
        ELSE
            oo := 0 // need to deal with 0 case separately
        END
    END ;

    // count how many elements in total there are in the bag
    oo <-- totelms =
    IF
        card ( dom ( bag ) ) = 0 // deal with the case that the bag is empty
    THEN
        oo := 0
    ELSE
        oo := SIGMA ( xx ) . ( xx : ran ( bag ) | xx )
    END ;

    // query if at least one of a given element is in the bag
    bb <-- isin ( ee ) =
    PRE
        ee : ELEM
    THEN
        IF
            ee : dom ( bag )
        THEN
            bb := TRUE
        ELSE
            bb := FALSE
        END
    END ;

    // Combine two bags
    bagunion ( bb ) =
    PRE
        bb : ELEM +-> NAT1
    THEN
        // partition bb into elements which are already in our bag and those which are not
        LET
            capelems // separate the elements from the intersection of bb and bag
            // such that adding them together would exceed the cap
        BE
            capelems = { ee | ee : dom ( bag ) /\ dom ( bb ) & bag ( ee ) + bb ( ee ) >= cap }
        IN
            bag := ( ( dom ( bag ) - dom ( bb ) ) <| bag ) \/
                ( ( dom ( bb ) - dom ( bag ) ) <| bb ) \/
                % ee . ( ee : ( dom ( bag ) /\ dom ( bb ) ) - capelems | bag ( ee ) + bb ( ee ) ) \/
                % ee . ( ee : capelems | cap )
        END
    END ;

    // output the elements of the bag, in sequence
    ss <-- outputseq =
    ANY
        ff
    WHERE
        ff : { seqs | seqs : seq ( bag ) & ran ( seqs ) = bag }
        // since no more details are given, we pick any sequence that contains all elements of bag
    THEN
        ss := ff
    END ;

    // add all of the elements in the given sequence to the bag
    addinseq ( ss ) =
    PRE
        ss : seq ( ELEM )
    THEN
        LET
            add
        BE
            add = % xx . ( xx : ran ( ss ) | card ( { yy | yy : dom ( ss ) & ss ( yy ) = xx } ) )
            // i.e. form a set of maplets ELEM -> NAT, mapping elements from the sequence to
            // the number of times they appear in that sequence (it doesn't say that ss
            // can't have repeated elements...?)
        IN
            LET
                capelems
            BE
                capelems = { ee | ee : dom ( bag ) /\ dom ( add ) & bag ( ee ) + add ( ee ) >= cap }
            IN
                // now that add and bag are both partial fractions ELEM +-> NAT1, we can
                // do what we did in bagunion
                bag := ( ( dom ( bag ) - dom ( add ) ) <| bag ) \/
                    ( ( dom ( add ) - dom ( bag ) ) <| add ) \/
                    % ee . ( ee : ( dom ( bag ) /\ dom ( add ) ) - capelems | bag ( ee ) + add ( ee ) ) \/
                    % ee . ( ee : capelems | cap )
            END
        END
    END ;

    cc <-- totalcost =
    cc := SIGMA ( xx ) . ( xx : dom ( bag ) | cost ( xx ) * bag ( xx ) )


END
