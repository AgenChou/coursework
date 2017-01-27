/* example1
 * Author: u1690550
 * Creation date: 06/10/2016
 */
MACHINE        example1

SETS           response = {yes, no}
    
CONSTANTS      max_val

PROPERTIES     max_val = 99999

VARIABLES      numset
    
INVARIANT      numset <: NAT1
    
INITIALISATION numset := {}

OPERATIONS
    
    enter(new) =
      PRE
        new : NAT1 & new <= max_val
      THEN
        numset := numset \/ {new}
      END;

    remove(new) =
      PRE
        new : NAT
      THEN
        numset := numset - {new}
      END;
        
    mx <-- maximum =
      PRE
        numset /= {}
      THEN
        mx := max(numset)
      END;
      
    mn <-- minimum =
      PRE
        numset /= {}
      THEN
        mn := min(numset)
      END;
      
    ssize <-- setsize = ssize := card(numset);
    
    is_in <-- numberinset(num) =
      PRE
        num : NAT1
      THEN
        IF 
          numset/\{num} /= {} 
        THEN
          is_in := yes
        ELSE
          is_in := no
        END
      END;
        
    setempty <-- is_empty = 
      IF 
        card(numset) = 0 
      THEN 
        setempty := yes
      ELSE 
        setempty := no 
    END;
    
    av <-- average =
      PRE
        card(numset) > 0
      THEN
        av := SIGMA(xx).(xx : numset | xx) / card(numset)
      END 

END
