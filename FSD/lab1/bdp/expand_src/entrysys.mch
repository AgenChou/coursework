/* entrysys
 * Author: u1690550
 * Creation date: 06/10/2016
 */
MACHINE
    entrysys

SETS
    PID

ABSTRACT_VARIABLES
    inside , maxin

INVARIANT
    maxin : NAT1 &
    inside <: PID &
    card ( inside ) <= maxin

INITIALISATION
    inside := {} || maxin := 500

OPERATIONS
    enter ( pp ) =
        PRE
            pp : PID &
            pp /: inside &
            card ( inside ) < maxin
        THEN
            inside := inside \/ { pp }
        END
END
