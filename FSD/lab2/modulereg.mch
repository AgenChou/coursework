/* modulereg
 * Author: u1690550
 * Creation date: 13/10/2016
 */
MACHINE
    modulereg
SETS
    STUDENTS; STAFF; MODULES
VARIABLES
    managing, registered, currentmodules
INVARIANT
    currentmodules <: MODULES &
    managing <: STAFF * currentmodules &
    registered <: STUDENTS * currentmodules &
    !(ss).( ss : STUDENTS => card(ran({ss} <| registered)) <= 6) &
    !(pp).( pp : STAFF => card(ran({pp} <| managing)) <=3) &
    !(mm).( mm : currentmodules => card(dom(managing |> {mm})) > 0)

END
