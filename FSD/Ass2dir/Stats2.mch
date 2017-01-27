MACHINE
    Stats2
VARIABLES
    tally
INVARIANT
    tally : 0..10 --> NAT
INITIALISATION
    tally := (0..10)*{0}
OPERATIONS
    tested(nn) = 
    PRE 
        nn : 0..10
    THEN 
        tally(nn) := tally(nn) + 1
    END;
    
    oo <-- querytot =
    oo := SIGMA(zz).(zz : 0..10 | tally(zz));
    
    oo <-- queryreg(nn)=
    PRE
        nn : 0..10
    THEN
        oo := tally(nn)
    END;
    
    
    oo <-- querypc(nn) =
    PRE
        nn : 0..10
    THEN
        LET
            total
        BE
            total = SIGMA(xx).(xx : 0..10 | tally(xx))
        IN
            IF
                total = 0
            THEN
                oo := 0
            ELSE
                oo := 100 * tally(nn) / total
            END
        END
    END;
    
    oo <-- querymean =
    LET 
        total
    BE 
        total = SIGMA(xx).(xx : 0..10 | tally(xx))
    IN
        IF
            total = 0
        THEN 
            oo := 0
        ELSE
            oo := SIGMA(xx).(xx : 0..10 | xx*tally(xx)) / total
        END
    END;
    
    oo <-- querymedian = 
    LET 
        mid
    BE 
        mid = (((SIGMA(xx).(xx : 0..10 | tally(xx)) + 1) / 2))
    IN
        IF
            mid = 0
        THEN 
            oo := 0
        ELSE
            ANY
                xx
            WHERE
                xx : 0..10 &
                SIGMA(ii).(ii : 0..xx-1 | tally(ii)) < mid &
                SIGMA(jj).(jj : xx+1..10 | tally(jj)) > mid
            THEN
                oo := xx
            END       
        END
    END
    
END

/* NOTE:
 * This machine has 19 POs generated, 18 of which are automatically proved with force 0. The last one is as follows:
 * In the operation tested: "Invariant is preserved" => tally<+{nn|->tally(nn)+1}: 0..10 --> NAT 
 * which is a partial function override. The new maplet is nn |-> tally(nn)+1. PRE ensures that nn is in 0..10
 * and if tally(nn) is in NAT, then so is tally(nn) + 1 (by infinity of Natural numbers). 
 * Thus the maplet is of the correct type.
 * Therefore, the operation preserves the Invariant.
 */
