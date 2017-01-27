/* AbSet
 * Author: u1690550
 * Creation date: 01/12/2016
 */
MACHINE AbSet
VARIABLES myset
INVARIANT myset : POW(NAT)
INITIALISATION myset := {}
OPERATIONS
set_add(nn) = PRE nn:NAT THEN myset := myset \/ {nn} END;
oo <-- set_out = PRE myset /= {} THEN oo :: myset END
END