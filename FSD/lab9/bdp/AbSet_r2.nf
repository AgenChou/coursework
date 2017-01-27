Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(AbSet_r2))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(AbSet_r2))==(Machine(AbSet));
  Level(Refinement(AbSet_r2))==(1);
  Upper_Level(Refinement(AbSet_r2))==(Machine(AbSet))
END
&
THEORY LoadedStructureX IS
  Refinement(AbSet_r2)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(AbSet_r2))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(AbSet_r2))==(?);
  List_Includes(Refinement(AbSet_r2))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(AbSet_r2))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(AbSet_r2))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(AbSet_r2))==(?);
  Context_List_Variables(Refinement(AbSet_r2))==(?);
  Abstract_List_Variables(Refinement(AbSet_r2))==(myset);
  Local_List_Variables(Refinement(AbSet_r2))==(myseq);
  List_Variables(Refinement(AbSet_r2))==(myseq);
  External_List_Variables(Refinement(AbSet_r2))==(myseq)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(AbSet_r2))==(?);
  Abstract_List_VisibleVariables(Refinement(AbSet_r2))==(?);
  External_List_VisibleVariables(Refinement(AbSet_r2))==(?);
  Expanded_List_VisibleVariables(Refinement(AbSet_r2))==(?);
  List_VisibleVariables(Refinement(AbSet_r2))==(?);
  Internal_List_VisibleVariables(Refinement(AbSet_r2))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(AbSet_r2))==(myseq)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(AbSet_r2))==(btrue);
  Expanded_List_Invariant(Refinement(AbSet_r2))==(btrue);
  Abstract_List_Invariant(Refinement(AbSet_r2))==(myset: POW(NAT));
  Context_List_Invariant(Refinement(AbSet_r2))==(btrue);
  List_Invariant(Refinement(AbSet_r2))==(myseq: iseq(NAT) & myset = ran(myseq))
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(AbSet_r2))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Refinement(AbSet_r2))==(btrue);
  Abstract_List_Assertions(Refinement(AbSet_r2))==(btrue);
  Context_List_Assertions(Refinement(AbSet_r2))==(btrue);
  List_Assertions(Refinement(AbSet_r2))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Refinement(AbSet_r2))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Refinement(AbSet_r2))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(AbSet_r2))==(myseq:={});
  Context_List_Initialisation(Refinement(AbSet_r2))==(skip);
  List_Initialisation(Refinement(AbSet_r2))==(myseq:={})
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(AbSet_r2))==(set_add,set_out);
  List_Operations(Refinement(AbSet_r2))==(set_add,set_out)
END
&
THEORY ListInputX IS
  List_Input(Refinement(AbSet_r2),set_add)==(nn);
  List_Input(Refinement(AbSet_r2),set_out)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(AbSet_r2),set_add)==(?);
  List_Output(Refinement(AbSet_r2),set_out)==(oo)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(AbSet_r2),set_add)==(set_add(nn));
  List_Header(Refinement(AbSet_r2),set_out)==(oo <-- set_out)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(AbSet_r2),set_add)==(btrue);
  List_Precondition(Refinement(AbSet_r2),set_add)==(nn: NAT);
  Own_Precondition(Refinement(AbSet_r2),set_out)==(btrue);
  List_Precondition(Refinement(AbSet_r2),set_out)==(myset/={})
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(AbSet_r2),set_out)==(myset/={} | myseq = <> ==> oo:=0 [] not(myseq = <>) ==> oo:=first(myseq));
  Expanded_List_Substitution(Refinement(AbSet_r2),set_add)==(nn: NAT | nn/:ran(myseq) ==> myseq:=myseq<-nn [] not(nn/:ran(myseq)) ==> skip);
  List_Substitution(Refinement(AbSet_r2),set_add)==(IF nn/:ran(myseq) THEN myseq:=myseq<-nn END);
  List_Substitution(Refinement(AbSet_r2),set_out)==(IF myseq = <> THEN oo:=0 ELSE oo:=first(myseq) END)
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(AbSet_r2))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(AbSet_r2))==(btrue);
  List_Context_Constraints(Refinement(AbSet_r2))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(AbSet_r2))==(?);
  Inherited_List_Constants(Refinement(AbSet_r2))==(?);
  List_Constants(Refinement(AbSet_r2))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Refinement(AbSet_r2))==(?);
  Context_List_Defered(Refinement(AbSet_r2))==(?);
  Context_List_Sets(Refinement(AbSet_r2))==(?);
  List_Valuable_Sets(Refinement(AbSet_r2))==(?);
  Inherited_List_Enumerated(Refinement(AbSet_r2))==(?);
  Inherited_List_Defered(Refinement(AbSet_r2))==(?);
  Inherited_List_Sets(Refinement(AbSet_r2))==(?);
  List_Enumerated(Refinement(AbSet_r2))==(?);
  List_Defered(Refinement(AbSet_r2))==(?);
  List_Sets(Refinement(AbSet_r2))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(AbSet_r2))==(?);
  Expanded_List_HiddenConstants(Refinement(AbSet_r2))==(?);
  List_HiddenConstants(Refinement(AbSet_r2))==(?);
  External_List_HiddenConstants(Refinement(AbSet_r2))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(AbSet_r2))==(btrue);
  Context_List_Properties(Refinement(AbSet_r2))==(btrue);
  Inherited_List_Properties(Refinement(AbSet_r2))==(btrue);
  List_Properties(Refinement(AbSet_r2))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(AbSet_r2),set_add)==(?);
  List_ANY_Var(Refinement(AbSet_r2),set_out)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(AbSet_r2)) == (? | ? | myseq | ? | set_add,set_out | ? | ? | ? | AbSet_r2);
  List_Of_HiddenCst_Ids(Refinement(AbSet_r2)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(AbSet_r2)) == (?);
  List_Of_VisibleVar_Ids(Refinement(AbSet_r2)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(AbSet_r2)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(AbSet_r2)) == (Type(myseq) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(AbSet_r2)) == (Type(set_out) == Cst(btype(INTEGER,?,?),No_type);Type(set_add) == Cst(No_type,btype(INTEGER,?,?)))
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
