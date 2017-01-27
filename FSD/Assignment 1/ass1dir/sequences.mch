/* sequences
 * Author: Agata
 * Creation date: 16/11/2016
 */
MACHINE
    sequences
OPERATIONS
    bb <-- subsequence(ss, tt) =
    PRE
        ss : seq(NAT) & tt : seq(NAT)
    THEN
        IF
            #(ii).(ii : 1..(size(ss)-size(tt)+1) & !(jj).(jj : 1 .. size(tt) => ss(ii+jj-1)=tt(jj)))
        THEN
            bb := TRUE
        ELSE
            bb := FALSE
        END
    END;
    
    bb <-- gensubsequence(ss,tt) =
    PRE
        ss: seq(NAT) & tt:seq(NAT)
    THEN
        IF
            ran(tt) <: ran(ss) &
            #(ff).(ff : tt --> ss & !(ii).(ii : 1..size(tt) =>
                    !(jj).(jj : (ii+1)..size(tt) => ss~(tt(ii)) < ss~(tt(jj)))))
        THEN
            bb := TRUE
        ELSE
            bb := FALSE
        END
    END
    
    

END
