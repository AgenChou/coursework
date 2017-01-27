Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(AbSet_r1))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(AbSet_r1))==(Machine(AbSet));
  Level(Refinement(AbSet_r1))==(1);
  Upper_Level(Refinement(AbSet_r1))==(Machine(AbSet))
END
&
THEORY LoadedStructureX IS
  Refinement(AbSet_r1)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(AbSet_r1))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(AbSet_r1))==(?);
  List_Includes(Refinement(AbSet_r1))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(AbSet_r1))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(AbSet_r1))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(AbSet_r1))==(?);
  Context_List_Variables(Refinement(AbSet_r1))==(?);
  Abstract_List_Variables(Refinement(AbSet_r1))==(myset);
  Local_List_Variables(Refinement(AbSet_r1))==(num);
  List_Variables(Refinement(AbSet_r1))==(num);
  External_List_Variables(Refinement(AbSet_r1))==(num)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(AbSet_r1))==(?);
  Abstract_List_VisibleVariables(Refinement(AbSet_r1))==(?);
  External_List_VisibleVariables(Refinement(AbSet_r1))==(?);
  Expanded_List_VisibleVariables(Refinement(AbSet_r1))==(?);
  List_VisibleVariables(Refinement(AbSet_r1))==(?);
  Internal_List_VisibleVariables(Refinement(AbSet_r1))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(AbSet_r1))==(num)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(AbSet_r1))==(btrue);
  Expanded_List_Invariant(Refinement(AbSet_r1))==(btrue);
  Abstract_List_Invariant(Refinement(AbSet_r1))==(myset: POW(NAT));
  Context_List_Invariant(Refinement(AbSet_r1))==(btrue);
  List_Invariant(Refinement(AbSet_r1))==(num: NAT & (myset/={} => num: myset))
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(AbSet_r1))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Refinement(AbSet_r1))==(btrue);
  Abstract_List_Assertions(Refinement(AbSet_r1))==(btrue);
  Context_List_Assertions(Refinement(AbSet_r1))==(btrue);
  List_Assertions(Refinement(AbSet_r1))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Refinement(AbSet_r1))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Refinement(AbSet_r1))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(AbSet_r1))==(num:=0);
  Context_List_Initialisation(Refinement(AbSet_r1))==(skip);
  List_Initialisation(Refinement(AbSet_r1))==(num:=0)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(AbSet_r1))==(set_add,set_out);
  List_Operations(Refinement(AbSet_r1))==(set_add,set_out)
END
&
THEORY ListInputX IS
  List_Input(Refinement(AbSet_r1),set_add)==(nn);
  List_Input(Refinement(AbSet_r1),set_out)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(AbSet_r1),set_add)==(?);
  List_Output(Refinement(AbSet_r1),set_out)==(oo)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(AbSet_r1),set_add)==(set_add(nn));
  List_Header(Refinement(AbSet_r1),set_out)==(oo <-- set_out)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(AbSet_r1),set_add)==(btrue);
  List_Precondition(Refinement(AbSet_r1),set_add)==(nn: NAT);
  Own_Precondition(Refinement(AbSet_r1),set_out)==(btrue);
  List_Precondition(Refinement(AbSet_r1),set_out)==(myset/={})
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(AbSet_r1),set_out)==(myset/={} | oo:=num);
  Expanded_List_Substitution(Refinement(AbSet_r1),set_add)==(nn: NAT | num:=nn);
  List_Substitution(Refinement(AbSet_r1),set_add)==(num:=nn);
  List_Substitution(Refinement(AbSet_r1),set_out)==(oo:=num)
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(AbSet_r1))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(AbSet_r1))==(btrue);
  List_Context_Constraints(Refinement(AbSet_r1))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(AbSet_r1))==(?);
  Inherited_List_Constants(Refinement(AbSet_r1))==(?);
  List_Constants(Refinement(AbSet_r1))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Refinement(AbSet_r1))==(?);
  Context_List_Defered(Refinement(AbSet_r1))==(?);
  Context_List_Sets(Refinement(AbSet_r1))==(?);
  List_Valuable_Sets(Refinement(AbSet_r1))==(?);
  Inherited_List_Enumerated(Refinement(AbSet_r1))==(?);
  Inherited_List_Defered(Refinement(AbSet_r1))==(?);
  Inherited_List_Sets(Refinement(AbSet_r1))==(?);
  List_Enumerated(Refinement(AbSet_r1))==(?);
  List_Defered(Refinement(AbSet_r1))==(?);
  List_Sets(Refinement(AbSet_r1))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(AbSet_r1))==(?);
  Expanded_List_HiddenConstants(Refinement(AbSet_r1))==(?);
  List_HiddenConstants(Refinement(AbSet_r1))==(?);
  External_List_HiddenConstants(Refinement(AbSet_r1))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(AbSet_r1))==(btrue);
  Context_List_Properties(Refinement(AbSet_r1))==(btrue);
  Inherited_List_Properties(Refinement(AbSet_r1))==(btrue);
  List_Properties(Refinement(AbSet_r1))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(AbSet_r1),set_add)==(?);
  List_ANY_Var(Refinement(AbSet_r1),set_out)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(AbSet_r1)) == (? | ? | num | ? | set_add,set_out | ? | ? | ? | AbSet_r1);
  List_Of_HiddenCst_Ids(Refinement(AbSet_r1)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(AbSet_r1)) == (?);
  List_Of_VisibleVar_Ids(Refinement(AbSet_r1)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(AbSet_r1)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(AbSet_r1)) == (Type(num) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(AbSet_r1)) == (Type(set_out) == Cst(btype(INTEGER,?,?),No_type);Type(set_add) == Cst(No_type,btype(INTEGER,?,?)))
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
