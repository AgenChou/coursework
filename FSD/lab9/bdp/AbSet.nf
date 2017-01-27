Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(AbSet))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(AbSet))==(Machine(AbSet));
  Level(Machine(AbSet))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(AbSet)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(AbSet))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(AbSet))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(AbSet))==(?);
  List_Includes(Machine(AbSet))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(AbSet))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(AbSet))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(AbSet))==(?);
  Context_List_Variables(Machine(AbSet))==(?);
  Abstract_List_Variables(Machine(AbSet))==(?);
  Local_List_Variables(Machine(AbSet))==(myset);
  List_Variables(Machine(AbSet))==(myset);
  External_List_Variables(Machine(AbSet))==(myset)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(AbSet))==(?);
  Abstract_List_VisibleVariables(Machine(AbSet))==(?);
  External_List_VisibleVariables(Machine(AbSet))==(?);
  Expanded_List_VisibleVariables(Machine(AbSet))==(?);
  List_VisibleVariables(Machine(AbSet))==(?);
  Internal_List_VisibleVariables(Machine(AbSet))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(AbSet))==(btrue);
  Gluing_List_Invariant(Machine(AbSet))==(btrue);
  Expanded_List_Invariant(Machine(AbSet))==(btrue);
  Abstract_List_Invariant(Machine(AbSet))==(btrue);
  Context_List_Invariant(Machine(AbSet))==(btrue);
  List_Invariant(Machine(AbSet))==(myset: POW(NAT))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(AbSet))==(btrue);
  Abstract_List_Assertions(Machine(AbSet))==(btrue);
  Context_List_Assertions(Machine(AbSet))==(btrue);
  List_Assertions(Machine(AbSet))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(AbSet))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(AbSet))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(AbSet))==(myset:={});
  Context_List_Initialisation(Machine(AbSet))==(skip);
  List_Initialisation(Machine(AbSet))==(myset:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(AbSet))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(AbSet))==(btrue);
  List_Constraints(Machine(AbSet))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(AbSet))==(set_add,set_out);
  List_Operations(Machine(AbSet))==(set_add,set_out)
END
&
THEORY ListInputX IS
  List_Input(Machine(AbSet),set_add)==(nn);
  List_Input(Machine(AbSet),set_out)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(AbSet),set_add)==(?);
  List_Output(Machine(AbSet),set_out)==(oo)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(AbSet),set_add)==(set_add(nn));
  List_Header(Machine(AbSet),set_out)==(oo <-- set_out)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(AbSet),set_add)==(nn: NAT);
  List_Precondition(Machine(AbSet),set_out)==(myset/={})
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(AbSet),set_out)==(myset/={} | @(oo$0).(oo$0: myset ==> oo:=oo$0));
  Expanded_List_Substitution(Machine(AbSet),set_add)==(nn: NAT | myset:=myset\/{nn});
  List_Substitution(Machine(AbSet),set_add)==(myset:=myset\/{nn});
  List_Substitution(Machine(AbSet),set_out)==(oo:: myset)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(AbSet))==(?);
  Inherited_List_Constants(Machine(AbSet))==(?);
  List_Constants(Machine(AbSet))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(AbSet))==(?);
  Context_List_Defered(Machine(AbSet))==(?);
  Context_List_Sets(Machine(AbSet))==(?);
  List_Valuable_Sets(Machine(AbSet))==(?);
  Inherited_List_Enumerated(Machine(AbSet))==(?);
  Inherited_List_Defered(Machine(AbSet))==(?);
  Inherited_List_Sets(Machine(AbSet))==(?);
  List_Enumerated(Machine(AbSet))==(?);
  List_Defered(Machine(AbSet))==(?);
  List_Sets(Machine(AbSet))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(AbSet))==(?);
  Expanded_List_HiddenConstants(Machine(AbSet))==(?);
  List_HiddenConstants(Machine(AbSet))==(?);
  External_List_HiddenConstants(Machine(AbSet))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(AbSet))==(btrue);
  Context_List_Properties(Machine(AbSet))==(btrue);
  Inherited_List_Properties(Machine(AbSet))==(btrue);
  List_Properties(Machine(AbSet))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(AbSet),set_add)==(?);
  List_ANY_Var(Machine(AbSet),set_out)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(AbSet)) == (? | ? | myset | ? | set_add,set_out | ? | ? | ? | AbSet);
  List_Of_HiddenCst_Ids(Machine(AbSet)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(AbSet)) == (?);
  List_Of_VisibleVar_Ids(Machine(AbSet)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(AbSet)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(AbSet)) == (Type(myset) == Mvl(SetOf(btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(AbSet)) == (Type(set_out) == Cst(btype(INTEGER,?,?),No_type);Type(set_add) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(AbSet)) == (Type(set_out) == Cst(btype(INTEGER,?,?),No_type))
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
