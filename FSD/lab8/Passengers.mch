/* Passengers
 * Author: u1690550
 * Creation date: 24/11/2016
 */
MACHINE
    Passengers
SETS
    PID
VARIABLES
    pass
INVARIANT
    pass : FIN(PID) & card(pass) <= 50
INITIALISATION
    pass := {}
OPERATIONS
    book(pp) =
    PRE
        pp : PID & pp /: pass & card(pass) < 50
    THEN
        pass := pass \/ {pp}
    END;
    
    cancel(pp) = 
    PRE
        pp : PID & pp : pass
    THEN
        pass := pass - {pp}
    END;
    
    oo <-- query(pp) =
    PRE
        pp : PID
    THEN
        oo := bool(pp : pass)
    END;
    
    oo <-- spaces = oo := 50 - card(pass)

END
