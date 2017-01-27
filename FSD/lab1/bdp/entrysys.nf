Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(entrysys))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(entrysys))==(Machine(entrysys));
  Level(Machine(entrysys))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(entrysys)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(entrysys))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(entrysys))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(entrysys))==(?);
  List_Includes(Machine(entrysys))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(entrysys))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(entrysys))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(entrysys))==(?);
  Context_List_Variables(Machine(entrysys))==(?);
  Abstract_List_Variables(Machine(entrysys))==(?);
  Local_List_Variables(Machine(entrysys))==(maxin,inside);
  List_Variables(Machine(entrysys))==(maxin,inside);
  External_List_Variables(Machine(entrysys))==(maxin,inside)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(entrysys))==(?);
  Abstract_List_VisibleVariables(Machine(entrysys))==(?);
  External_List_VisibleVariables(Machine(entrysys))==(?);
  Expanded_List_VisibleVariables(Machine(entrysys))==(?);
  List_VisibleVariables(Machine(entrysys))==(?);
  Internal_List_VisibleVariables(Machine(entrysys))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(entrysys))==(btrue);
  Gluing_List_Invariant(Machine(entrysys))==(btrue);
  Expanded_List_Invariant(Machine(entrysys))==(btrue);
  Abstract_List_Invariant(Machine(entrysys))==(btrue);
  Context_List_Invariant(Machine(entrysys))==(btrue);
  List_Invariant(Machine(entrysys))==(maxin: NAT1 & inside <: PID & card(inside)<=maxin)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(entrysys))==(btrue);
  Abstract_List_Assertions(Machine(entrysys))==(btrue);
  Context_List_Assertions(Machine(entrysys))==(btrue);
  List_Assertions(Machine(entrysys))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(entrysys))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(entrysys))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(entrysys))==(inside,maxin:={},500);
  Context_List_Initialisation(Machine(entrysys))==(skip);
  List_Initialisation(Machine(entrysys))==(inside:={} || maxin:=500)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(entrysys))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(entrysys))==(btrue);
  List_Constraints(Machine(entrysys))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(entrysys))==(enter);
  List_Operations(Machine(entrysys))==(enter)
END
&
THEORY ListInputX IS
  List_Input(Machine(entrysys),enter)==(pp)
END
&
THEORY ListOutputX IS
  List_Output(Machine(entrysys),enter)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(entrysys),enter)==(enter(pp))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(entrysys),enter)==(pp: PID & pp/:inside & card(inside)<maxin)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(entrysys),enter)==(pp: PID & pp/:inside & card(inside)<maxin | inside:=inside\/{pp});
  List_Substitution(Machine(entrysys),enter)==(inside:=inside\/{pp})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(entrysys))==(?);
  Inherited_List_Constants(Machine(entrysys))==(?);
  List_Constants(Machine(entrysys))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(entrysys),PID)==(?);
  Context_List_Enumerated(Machine(entrysys))==(?);
  Context_List_Defered(Machine(entrysys))==(?);
  Context_List_Sets(Machine(entrysys))==(?);
  List_Valuable_Sets(Machine(entrysys))==(PID);
  Inherited_List_Enumerated(Machine(entrysys))==(?);
  Inherited_List_Defered(Machine(entrysys))==(?);
  Inherited_List_Sets(Machine(entrysys))==(?);
  List_Enumerated(Machine(entrysys))==(?);
  List_Defered(Machine(entrysys))==(PID);
  List_Sets(Machine(entrysys))==(PID)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(entrysys))==(?);
  Expanded_List_HiddenConstants(Machine(entrysys))==(?);
  List_HiddenConstants(Machine(entrysys))==(?);
  External_List_HiddenConstants(Machine(entrysys))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(entrysys))==(btrue);
  Context_List_Properties(Machine(entrysys))==(btrue);
  Inherited_List_Properties(Machine(entrysys))==(btrue);
  List_Properties(Machine(entrysys))==(PID: FIN(INTEGER) & not(PID = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(entrysys),enter)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(entrysys)) == (PID | ? | maxin,inside | ? | enter | ? | ? | ? | entrysys);
  List_Of_HiddenCst_Ids(Machine(entrysys)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(entrysys)) == (?);
  List_Of_VisibleVar_Ids(Machine(entrysys)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(entrysys)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(entrysys)) == (Type(PID) == Cst(SetOf(atype(PID,"[PID","]PID"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(entrysys)) == (Type(maxin) == Mvl(btype(INTEGER,?,?));Type(inside) == Mvl(SetOf(atype(PID,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(entrysys)) == (Type(enter) == Cst(No_type,atype(PID,?,?)))
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
