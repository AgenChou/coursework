Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Passengers))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Passengers))==(Machine(Passengers));
  Level(Machine(Passengers))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Passengers)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Passengers))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Passengers))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Passengers))==(?);
  List_Includes(Machine(Passengers))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Passengers))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Passengers))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Passengers))==(?);
  Context_List_Variables(Machine(Passengers))==(?);
  Abstract_List_Variables(Machine(Passengers))==(?);
  Local_List_Variables(Machine(Passengers))==(pass);
  List_Variables(Machine(Passengers))==(pass);
  External_List_Variables(Machine(Passengers))==(pass)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Passengers))==(?);
  Abstract_List_VisibleVariables(Machine(Passengers))==(?);
  External_List_VisibleVariables(Machine(Passengers))==(?);
  Expanded_List_VisibleVariables(Machine(Passengers))==(?);
  List_VisibleVariables(Machine(Passengers))==(?);
  Internal_List_VisibleVariables(Machine(Passengers))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Passengers))==(btrue);
  Gluing_List_Invariant(Machine(Passengers))==(btrue);
  Expanded_List_Invariant(Machine(Passengers))==(btrue);
  Abstract_List_Invariant(Machine(Passengers))==(btrue);
  Context_List_Invariant(Machine(Passengers))==(btrue);
  List_Invariant(Machine(Passengers))==(pass: FIN(PID) & card(pass)<=50)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Passengers))==(btrue);
  Abstract_List_Assertions(Machine(Passengers))==(btrue);
  Context_List_Assertions(Machine(Passengers))==(btrue);
  List_Assertions(Machine(Passengers))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Passengers))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Passengers))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Passengers))==(pass:={});
  Context_List_Initialisation(Machine(Passengers))==(skip);
  List_Initialisation(Machine(Passengers))==(pass:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Passengers))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Passengers))==(btrue);
  List_Constraints(Machine(Passengers))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Passengers))==(book,cancel,query,spaces);
  List_Operations(Machine(Passengers))==(book,cancel,query,spaces)
END
&
THEORY ListInputX IS
  List_Input(Machine(Passengers),book)==(pp);
  List_Input(Machine(Passengers),cancel)==(pp);
  List_Input(Machine(Passengers),query)==(pp);
  List_Input(Machine(Passengers),spaces)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Passengers),book)==(?);
  List_Output(Machine(Passengers),cancel)==(?);
  List_Output(Machine(Passengers),query)==(oo);
  List_Output(Machine(Passengers),spaces)==(oo)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Passengers),book)==(book(pp));
  List_Header(Machine(Passengers),cancel)==(cancel(pp));
  List_Header(Machine(Passengers),query)==(oo <-- query(pp));
  List_Header(Machine(Passengers),spaces)==(oo <-- spaces)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Passengers),book)==(pp: PID & pp/:pass & card(pass)<50);
  List_Precondition(Machine(Passengers),cancel)==(pp: PID & pp: pass);
  List_Precondition(Machine(Passengers),query)==(pp: PID);
  List_Precondition(Machine(Passengers),spaces)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Passengers),spaces)==(btrue | oo:=50-card(pass));
  Expanded_List_Substitution(Machine(Passengers),query)==(pp: PID | oo:=bool(pp: pass));
  Expanded_List_Substitution(Machine(Passengers),cancel)==(pp: PID & pp: pass | pass:=pass-{pp});
  Expanded_List_Substitution(Machine(Passengers),book)==(pp: PID & pp/:pass & card(pass)<50 | pass:=pass\/{pp});
  List_Substitution(Machine(Passengers),book)==(pass:=pass\/{pp});
  List_Substitution(Machine(Passengers),cancel)==(pass:=pass-{pp});
  List_Substitution(Machine(Passengers),query)==(oo:=bool(pp: pass));
  List_Substitution(Machine(Passengers),spaces)==(oo:=50-card(pass))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Passengers))==(?);
  Inherited_List_Constants(Machine(Passengers))==(?);
  List_Constants(Machine(Passengers))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Passengers),PID)==(?);
  Context_List_Enumerated(Machine(Passengers))==(?);
  Context_List_Defered(Machine(Passengers))==(?);
  Context_List_Sets(Machine(Passengers))==(?);
  List_Valuable_Sets(Machine(Passengers))==(PID);
  Inherited_List_Enumerated(Machine(Passengers))==(?);
  Inherited_List_Defered(Machine(Passengers))==(?);
  Inherited_List_Sets(Machine(Passengers))==(?);
  List_Enumerated(Machine(Passengers))==(?);
  List_Defered(Machine(Passengers))==(PID);
  List_Sets(Machine(Passengers))==(PID)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Passengers))==(?);
  Expanded_List_HiddenConstants(Machine(Passengers))==(?);
  List_HiddenConstants(Machine(Passengers))==(?);
  External_List_HiddenConstants(Machine(Passengers))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Passengers))==(btrue);
  Context_List_Properties(Machine(Passengers))==(btrue);
  Inherited_List_Properties(Machine(Passengers))==(btrue);
  List_Properties(Machine(Passengers))==(PID: FIN(INTEGER) & not(PID = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Passengers),book)==(?);
  List_ANY_Var(Machine(Passengers),cancel)==(?);
  List_ANY_Var(Machine(Passengers),query)==(?);
  List_ANY_Var(Machine(Passengers),spaces)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Passengers)) == (PID | ? | pass | ? | book,cancel,query,spaces | ? | ? | ? | Passengers);
  List_Of_HiddenCst_Ids(Machine(Passengers)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Passengers)) == (?);
  List_Of_VisibleVar_Ids(Machine(Passengers)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Passengers)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Passengers)) == (Type(PID) == Cst(SetOf(atype(PID,"[PID","]PID"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Passengers)) == (Type(pass) == Mvl(SetOf(atype(PID,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Passengers)) == (Type(spaces) == Cst(btype(INTEGER,?,?),No_type);Type(query) == Cst(btype(BOOL,?,?),atype(PID,?,?));Type(cancel) == Cst(No_type,atype(PID,?,?));Type(book) == Cst(No_type,atype(PID,?,?)));
  Observers(Machine(Passengers)) == (Type(spaces) == Cst(btype(INTEGER,?,?),No_type);Type(query) == Cst(btype(BOOL,?,?),atype(PID,?,?)))
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
