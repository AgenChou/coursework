Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Items))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Items))==(Machine(Items));
  Level(Machine(Items))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Items)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Items))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Items))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Items))==(?);
  List_Includes(Machine(Items))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Items))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Items))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Items))==(?);
  Context_List_Variables(Machine(Items))==(?);
  Abstract_List_Variables(Machine(Items))==(?);
  Local_List_Variables(Machine(Items))==(?);
  List_Variables(Machine(Items))==(?);
  External_List_Variables(Machine(Items))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Items))==(?);
  Abstract_List_VisibleVariables(Machine(Items))==(?);
  External_List_VisibleVariables(Machine(Items))==(?);
  Expanded_List_VisibleVariables(Machine(Items))==(?);
  List_VisibleVariables(Machine(Items))==(?);
  Internal_List_VisibleVariables(Machine(Items))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Items))==(btrue);
  Gluing_List_Invariant(Machine(Items))==(btrue);
  Expanded_List_Invariant(Machine(Items))==(btrue);
  Abstract_List_Invariant(Machine(Items))==(btrue);
  Context_List_Invariant(Machine(Items))==(btrue);
  List_Invariant(Machine(Items))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Items))==(btrue);
  Abstract_List_Assertions(Machine(Items))==(btrue);
  Context_List_Assertions(Machine(Items))==(btrue);
  List_Assertions(Machine(Items))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Items))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Items))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Items))==(skip);
  Context_List_Initialisation(Machine(Items))==(skip);
  List_Initialisation(Machine(Items))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Items))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Items))==(btrue);
  List_Constraints(Machine(Items))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Items))==(?);
  List_Operations(Machine(Items))==(?)
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
  List_Valuable_Constants(Machine(Items))==(?);
  Inherited_List_Constants(Machine(Items))==(?);
  List_Constants(Machine(Items))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Items),ITEM)==(?);
  Context_List_Enumerated(Machine(Items))==(?);
  Context_List_Defered(Machine(Items))==(?);
  Context_List_Sets(Machine(Items))==(?);
  List_Valuable_Sets(Machine(Items))==(ITEM);
  Inherited_List_Enumerated(Machine(Items))==(?);
  Inherited_List_Defered(Machine(Items))==(?);
  Inherited_List_Sets(Machine(Items))==(?);
  List_Enumerated(Machine(Items))==(?);
  List_Defered(Machine(Items))==(ITEM);
  List_Sets(Machine(Items))==(ITEM)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Items))==(?);
  Expanded_List_HiddenConstants(Machine(Items))==(?);
  List_HiddenConstants(Machine(Items))==(?);
  External_List_HiddenConstants(Machine(Items))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Items))==(btrue);
  Context_List_Properties(Machine(Items))==(btrue);
  Inherited_List_Properties(Machine(Items))==(btrue);
  List_Properties(Machine(Items))==(ITEM: FIN(INTEGER) & not(ITEM = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Items)) == (ITEM | ? | ? | ? | ? | ? | ? | ? | Items);
  List_Of_HiddenCst_Ids(Machine(Items)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Items)) == (?);
  List_Of_VisibleVar_Ids(Machine(Items)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Items)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Items)) == (Type(ITEM) == Cst(SetOf(atype(ITEM,"[ITEM","]ITEM"))))
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
