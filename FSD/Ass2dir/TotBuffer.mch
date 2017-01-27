MACHINE
    TotBuffer(qlen, ELEM)
    
CONSTRAINTS
    qlen : NAT1
   
SEES
    Resp

SETS
    ERRORS = {ok,full,empty}

OPERATIONS
    err <-- enc_add(xx) =
    PRE xx : ELEM
    THEN
        err :: ERRORS
    END;

    err, ee <-- enc_remove =
    BEGIN
        err :: ERRORS ||
        ee :: ELEM
    END;

    err, rr <-- enc_emptyquery =
    BEGIN
        err :: ERRORS ||
        rr :: RESP
    END;

    err, rr <-- enc_fullquery =
    BEGIN
        err :: ERRORS ||
        rr :: RESP
    END;

    err, oo <-- enc_contentsquery =
    BEGIN
        err :: ERRORS ||
        oo :: 0..qlen
    END
END
