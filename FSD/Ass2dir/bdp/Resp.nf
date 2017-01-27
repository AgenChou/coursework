Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Resp))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Resp))==(Machine(Resp));
  Level(Machine(Resp))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Resp)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Resp))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Resp))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Resp))==(?);
  List_Includes(Machine(Resp))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Resp))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Resp))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Resp))==(?);
  Context_List_Variables(Machine(Resp))==(?);
  Abstract_List_Variables(Machine(Resp))==(?);
  Local_List_Variables(Machine(Resp))==(?);
  List_Variables(Machine(Resp))==(?);
  External_List_Variables(Machine(Resp))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Resp))==(?);
  Abstract_List_VisibleVariables(Machine(Resp))==(?);
  External_List_VisibleVariables(Machine(Resp))==(?);
  Expanded_List_VisibleVariables(Machine(Resp))==(?);
  List_VisibleVariables(Machine(Resp))==(?);
  Internal_List_VisibleVariables(Machine(Resp))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Resp))==(btrue);
  Gluing_List_Invariant(Machine(Resp))==(btrue);
  Expanded_List_Invariant(Machine(Resp))==(btrue);
  Abstract_List_Invariant(Machine(Resp))==(btrue);
  Context_List_Invariant(Machine(Resp))==(btrue);
  List_Invariant(Machine(Resp))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Resp))==(btrue);
  Abstract_List_Assertions(Machine(Resp))==(btrue);
  Context_List_Assertions(Machine(Resp))==(btrue);
  List_Assertions(Machine(Resp))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Resp))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Resp))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Resp))==(skip);
  Context_List_Initialisation(Machine(Resp))==(skip);
  List_Initialisation(Machine(Resp))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Resp))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Resp))==(btrue);
  List_Constraints(Machine(Resp))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Resp))==(?);
  List_Operations(Machine(Resp))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Resp))==(?);
  Inherited_List_Constants(Machine(Resp))==(?);
  List_Constants(Machine(Resp))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Resp),RESP)==({yes,no});
  Context_List_Enumerated(Machine(Resp))==(?);
  Context_List_Defered(Machine(Resp))==(?);
  Context_List_Sets(Machine(Resp))==(?);
  List_Valuable_Sets(Machine(Resp))==(?);
  Inherited_List_Enumerated(Machine(Resp))==(?);
  Inherited_List_Defered(Machine(Resp))==(?);
  Inherited_List_Sets(Machine(Resp))==(?);
  List_Enumerated(Machine(Resp))==(RESP);
  List_Defered(Machine(Resp))==(?);
  List_Sets(Machine(Resp))==(RESP)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Resp))==(?);
  Expanded_List_HiddenConstants(Machine(Resp))==(?);
  List_HiddenConstants(Machine(Resp))==(?);
  External_List_HiddenConstants(Machine(Resp))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Resp))==(btrue);
  Context_List_Properties(Machine(Resp))==(btrue);
  Inherited_List_Properties(Machine(Resp))==(btrue);
  List_Properties(Machine(Resp))==(RESP: FIN(INTEGER) & not(RESP = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Resp)) == (RESP,yes,no | ? | ? | ? | ? | ? | ? | ? | Resp);
  List_Of_HiddenCst_Ids(Machine(Resp)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Resp)) == (?);
  List_Of_VisibleVar_Ids(Machine(Resp)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Resp)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Resp)) == (Type(RESP) == Cst(SetOf(etype(RESP,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Resp)) == (Type(yes) == Cst(etype(RESP,0,1));Type(no) == Cst(etype(RESP,0,1)))
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
