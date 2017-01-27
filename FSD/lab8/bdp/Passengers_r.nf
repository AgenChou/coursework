Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(Passengers_r))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(Passengers_r))==(Machine(Passengers));
  Level(Refinement(Passengers_r))==(1);
  Upper_Level(Refinement(Passengers_r))==(Machine(Passengers))
END
&
THEORY LoadedStructureX IS
  Refinement(Passengers_r)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(Passengers_r))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(Passengers_r))==(?);
  List_Includes(Refinement(Passengers_r))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(Passengers_r))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(Passengers_r))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(Passengers_r))==(?);
  Context_List_Variables(Refinement(Passengers_r))==(?);
  Abstract_List_Variables(Refinement(Passengers_r))==(pass);
  Local_List_Variables(Refinement(Passengers_r))==(bookings);
  List_Variables(Refinement(Passengers_r))==(bookings);
  External_List_Variables(Refinement(Passengers_r))==(bookings)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(Passengers_r))==(?);
  Abstract_List_VisibleVariables(Refinement(Passengers_r))==(?);
  External_List_VisibleVariables(Refinement(Passengers_r))==(?);
  Expanded_List_VisibleVariables(Refinement(Passengers_r))==(?);
  List_VisibleVariables(Refinement(Passengers_r))==(?);
  Internal_List_VisibleVariables(Refinement(Passengers_r))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(Passengers_r))==(bookings)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(Passengers_r))==(btrue);
  Expanded_List_Invariant(Refinement(Passengers_r))==(btrue);
  Abstract_List_Invariant(Refinement(Passengers_r))==(pass: FIN(PID) & card(pass)<=50);
  Context_List_Invariant(Refinement(Passengers_r))==(btrue);
  List_Invariant(Refinement(Passengers_r))==(bookings: 1..50 >+> pass & ran(bookings) = pass)
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(Passengers_r))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Refinement(Passengers_r))==(btrue);
  Abstract_List_Assertions(Refinement(Passengers_r))==(btrue);
  Context_List_Assertions(Refinement(Passengers_r))==(btrue);
  List_Assertions(Refinement(Passengers_r))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Refinement(Passengers_r))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Refinement(Passengers_r))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(Passengers_r))==(bookings:={});
  Context_List_Initialisation(Refinement(Passengers_r))==(skip);
  List_Initialisation(Refinement(Passengers_r))==(bookings:={})
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(Passengers_r))==(book,cancel,query,spaces);
  List_Operations(Refinement(Passengers_r))==(book,cancel,query,spaces)
END
&
THEORY ListInputX IS
  List_Input(Refinement(Passengers_r),book)==(pp);
  List_Input(Refinement(Passengers_r),cancel)==(pp);
  List_Input(Refinement(Passengers_r),query)==(pp);
  List_Input(Refinement(Passengers_r),spaces)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(Passengers_r),book)==(?);
  List_Output(Refinement(Passengers_r),cancel)==(?);
  List_Output(Refinement(Passengers_r),query)==(oo);
  List_Output(Refinement(Passengers_r),spaces)==(oo)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(Passengers_r),book)==(book(pp));
  List_Header(Refinement(Passengers_r),cancel)==(cancel(pp));
  List_Header(Refinement(Passengers_r),query)==(oo <-- query(pp));
  List_Header(Refinement(Passengers_r),spaces)==(oo <-- spaces)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(Passengers_r),book)==(pp: PID & pp/:ran(bookings) & card(ran(bookings))<50);
  List_Precondition(Refinement(Passengers_r),book)==(pp: PID & pp/:ran(bookings) & card(ran(bookings))<50 & pp: PID & pp/:pass & card(pass)<50);
  Own_Precondition(Refinement(Passengers_r),cancel)==(pp: ran(bookings));
  List_Precondition(Refinement(Passengers_r),cancel)==(pp: ran(bookings) & pp: PID & pp: pass);
  Own_Precondition(Refinement(Passengers_r),query)==(pp: PID);
  List_Precondition(Refinement(Passengers_r),query)==(pp: PID & pp: PID);
  Own_Precondition(Refinement(Passengers_r),spaces)==(btrue);
  List_Precondition(Refinement(Passengers_r),spaces)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(Passengers_r),spaces)==(btrue | oo:=50-card(ran(bookings)));
  Expanded_List_Substitution(Refinement(Passengers_r),query)==(pp: PID & pp: PID | oo:=bool(pp: ran(bookings)));
  Expanded_List_Substitution(Refinement(Passengers_r),cancel)==(pp: ran(bookings) & pp: PID & pp: pass | bookings:=bookings-(bookings|>{pp}));
  Expanded_List_Substitution(Refinement(Passengers_r),book)==(pp: PID & pp/:ran(bookings) & card(ran(bookings))<50 & pp: PID & pp/:pass & card(pass)<50 | @xx.(xx = min((1..50)-dom(bookings)) ==> bookings:=bookings\/{xx|->pp}));
  List_Substitution(Refinement(Passengers_r),book)==(LET xx BE xx = min((1..50)-dom(bookings)) IN bookings:=bookings\/{xx|->pp} END);
  List_Substitution(Refinement(Passengers_r),cancel)==(bookings:=bookings-(bookings|>{pp}));
  List_Substitution(Refinement(Passengers_r),query)==(oo:=bool(pp: ran(bookings)));
  List_Substitution(Refinement(Passengers_r),spaces)==(oo:=50-card(ran(bookings)))
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(Passengers_r))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(Passengers_r))==(btrue);
  List_Context_Constraints(Refinement(Passengers_r))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(Passengers_r))==(?);
  Inherited_List_Constants(Refinement(Passengers_r))==(?);
  List_Constants(Refinement(Passengers_r))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Refinement(Passengers_r),PID)==(?);
  Context_List_Enumerated(Refinement(Passengers_r))==(?);
  Context_List_Defered(Refinement(Passengers_r))==(?);
  Context_List_Sets(Refinement(Passengers_r))==(?);
  List_Valuable_Sets(Refinement(Passengers_r))==(PID);
  Inherited_List_Enumerated(Refinement(Passengers_r))==(?);
  Inherited_List_Defered(Refinement(Passengers_r))==(PID);
  Inherited_List_Sets(Refinement(Passengers_r))==(PID);
  List_Enumerated(Refinement(Passengers_r))==(?);
  List_Defered(Refinement(Passengers_r))==(?);
  List_Sets(Refinement(Passengers_r))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(Passengers_r))==(?);
  Expanded_List_HiddenConstants(Refinement(Passengers_r))==(?);
  List_HiddenConstants(Refinement(Passengers_r))==(?);
  External_List_HiddenConstants(Refinement(Passengers_r))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(Passengers_r))==(PID: FIN(INTEGER) & not(PID = {}));
  Context_List_Properties(Refinement(Passengers_r))==(btrue);
  Inherited_List_Properties(Refinement(Passengers_r))==(btrue);
  List_Properties(Refinement(Passengers_r))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(Passengers_r),book)==(?);
  List_ANY_Var(Refinement(Passengers_r),cancel)==(?);
  List_ANY_Var(Refinement(Passengers_r),query)==(?);
  List_ANY_Var(Refinement(Passengers_r),spaces)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(Passengers_r)) == (? | ? | bookings | ? | book,cancel,query,spaces | ? | ? | ? | Passengers_r);
  List_Of_HiddenCst_Ids(Refinement(Passengers_r)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(Passengers_r)) == (?);
  List_Of_VisibleVar_Ids(Refinement(Passengers_r)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(Passengers_r)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Refinement(Passengers_r)) == (Type(PID) == Cst(SetOf(atype(PID,"[PID","]PID"))))
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(Passengers_r)) == (Type(bookings) == Mvl(SetOf(btype(INTEGER,?,?)*atype(PID,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(Passengers_r)) == (Type(spaces) == Cst(btype(INTEGER,?,?),No_type);Type(query) == Cst(btype(BOOL,?,?),atype(PID,?,?));Type(cancel) == Cst(No_type,atype(PID,?,?));Type(book) == Cst(No_type,atype(PID,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
