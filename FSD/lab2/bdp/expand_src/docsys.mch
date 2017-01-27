/* docsys
 * Author: u1690550
 * Creation date: 13/10/2016
 */
MACHINE
    docsys

SETS
    PID ; DOC ; CHECK = { yes , no }

ABSTRACT_VARIABLES
    registered , allowed , viewing , restricted

INVARIANT
    registered <: PID &
    restricted <: DOC &
    allowed : registered <-> DOC &
    viewing : registered <-> DOC

INITIALISATION
    registered := {} ||
    allowed := {} ||
    viewing := {} ||
    restricted := {}

OPERATIONS
    adduser ( pid ) =
        PRE
            pid : PID & pid /: registered
        THEN
            registered := registered \/ { pid }
        END ;

    removeuser ( pid ) =
        PRE
            pid : registered
        THEN
            registered := registered - { pid }
        END ;

    check <-- isregistered ( pid ) =
        PRE
            pid : PID
        THEN
            IF pid : registered
            THEN check := yes
            ELSE check := no
            END
        END ;

    check <-- isallowed ( pid , doc ) =
        PRE
            pid : registered & doc : DOC
        THEN
            IF pid |-> doc /: allowed or
                ( doc : restricted &
                    card ( ran ( { pid } <| viewing ) /\ restricted ) /= 0 &
                    pid |-> doc /: viewing )
            THEN check := no
            ELSE check := yes
            END
        END ;

    docs <-- listalloweddocs ( pid ) =
        PRE
            pid : registered
        THEN
            IF
                card ( ran ( { pid } <| viewing ) /\ restricted ) = 0
            THEN
                docs := ran ( { pid } <| allowed )
            ELSE
                docs := ran ( { pid } <| allowed ) - restricted \/
                    ran ( { pid } <| viewing ) /\ restricted
            END
        END ;

    pids <-- listallowedusers ( doc ) =
        PRE
            doc : DOC
        THEN
            pids := dom ( allowed |> { doc } )
        END ;

    accessdoc ( pid , doc ) =
        PRE
            pid : registered &
            doc : DOC &
            pid |-> doc : allowed &
            ( doc : restricted &
                card ( ran ( { pid } <| allowed ) /\ restricted ) = 0 )

        THEN
            viewing := viewing \/ { pid |-> doc }
        END ;

    stopaccess ( pid , doc ) =
        PRE
            pid : registered &
            doc : DOC &
            pid |-> doc : viewing
        THEN
            viewing := viewing - { pid |-> doc }
        END ;

    allowaccess ( pid , doc ) =
        PRE
            pid : registered &
            doc : DOC &
            pid |-> doc /: allowed
        THEN
            allowed := allowed \/ { pid |-> doc }
        END ;

    disallowaccess ( pid , doc ) =
        PRE
            pid : registered &
            doc : DOC &
            pid |-> doc : allowed
        THEN
            allowed := allowed - { pid |-> doc }
        END ;

    allowall ( doc ) =
        PRE
            doc : DOC
        THEN
            allowed := allowed \/ registered * { doc }
        END ;

    addrestricted ( doc ) =
        PRE
            doc : DOC
        THEN
            restricted := restricted \/ { doc }
        END ;

    removerestricted ( doc ) =
        PRE
            doc : restricted
        THEN
            restricted := restricted - { doc }
        END

END
