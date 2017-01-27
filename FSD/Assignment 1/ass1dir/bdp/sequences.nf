Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(sequences))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(sequences))==(Machine(sequences));
  Level(Machine(sequences))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(sequences)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(sequences))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(sequences))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(sequences))==(?);
  List_Includes(Machine(sequences))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(sequences))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(sequences))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(sequences))==(?);
  Context_List_Variables(Machine(sequences))==(?);
  Abstract_List_Variables(Machine(sequences))==(?);
  Local_List_Variables(Machine(sequences))==(?);
  List_Variables(Machine(sequences))==(?);
  External_List_Variables(Machine(sequences))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(sequences))==(?);
  Abstract_List_VisibleVariables(Machine(sequences))==(?);
  External_List_VisibleVariables(Machine(sequences))==(?);
  Expanded_List_VisibleVariables(Machine(sequences))==(?);
  List_VisibleVariables(Machine(sequences))==(?);
  Internal_List_VisibleVariables(Machine(sequences))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(sequences))==(btrue);
  Gluing_List_Invariant(Machine(sequences))==(btrue);
  Expanded_List_Invariant(Machine(sequences))==(btrue);
  Abstract_List_Invariant(Machine(sequences))==(btrue);
  Context_List_Invariant(Machine(sequences))==(btrue);
  List_Invariant(Machine(sequences))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(sequences))==(btrue);
  Abstract_List_Assertions(Machine(sequences))==(btrue);
  Context_List_Assertions(Machine(sequences))==(btrue);
  List_Assertions(Machine(sequences))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(sequences))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(sequences))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(sequences))==(skip);
  Context_List_Initialisation(Machine(sequences))==(skip);
  List_Initialisation(Machine(sequences))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(sequences))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(sequences))==(btrue);
  List_Constraints(Machine(sequences))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(sequences))==(subsequence,gensubsequence);
  List_Operations(Machine(sequences))==(subsequence,gensubsequence)
END
&
THEORY ListInputX IS
  List_Input(Machine(sequences),subsequence)==(ss,tt);
  List_Input(Machine(sequences),gensubsequence)==(ss,tt)
END
&
THEORY ListOutputX IS
  List_Output(Machine(sequences),subsequence)==(bb);
  List_Output(Machine(sequences),gensubsequence)==(bb)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(sequences),subsequence)==(bb <-- subsequence(ss,tt));
  List_Header(Machine(sequences),gensubsequence)==(bb <-- gensubsequence(ss,tt))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(sequences),subsequence)==(ss: seq(NAT) & tt: seq(NAT));
  List_Precondition(Machine(sequences),gensubsequence)==(ss: seq(NAT) & tt: seq(NAT))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(sequences),gensubsequence)==(ss: seq(NAT) & tt: seq(NAT) | ran(tt) <: ran(ss) & #ff.(ff: tt --> ss & !ii.(ii: 1..size(tt) => !jj.(jj: ii+1..size(tt) => ss~(tt(ii))<ss~(tt(jj))))) ==> bb:=TRUE [] not(ran(tt) <: ran(ss) & #ff.(ff: tt --> ss & !ii.(ii: 1..size(tt) => !jj.(jj: ii+1..size(tt) => ss~(tt(ii))<ss~(tt(jj)))))) ==> bb:=FALSE);
  Expanded_List_Substitution(Machine(sequences),subsequence)==(ss: seq(NAT) & tt: seq(NAT) | #ii.(ii: 1..size(ss)-size(tt)+1 & !jj.(jj: 1..size(tt) => ss(ii+jj-1) = tt(jj))) ==> bb:=TRUE [] not(#ii.(ii: 1..size(ss)-size(tt)+1 & !jj.(jj: 1..size(tt) => ss(ii+jj-1) = tt(jj)))) ==> bb:=FALSE);
  List_Substitution(Machine(sequences),subsequence)==(IF #ii.(ii: 1..size(ss)-size(tt)+1 & !jj.(jj: 1..size(tt) => ss(ii+jj-1) = tt(jj))) THEN bb:=TRUE ELSE bb:=FALSE END);
  List_Substitution(Machine(sequences),gensubsequence)==(IF ran(tt) <: ran(ss) & #ff.(ff: tt --> ss & !ii.(ii: 1..size(tt) => !jj.(jj: ii+1..size(tt) => ss~(tt(ii))<ss~(tt(jj))))) THEN bb:=TRUE ELSE bb:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(sequences))==(?);
  Inherited_List_Constants(Machine(sequences))==(?);
  List_Constants(Machine(sequences))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(sequences))==(?);
  Context_List_Defered(Machine(sequences))==(?);
  Context_List_Sets(Machine(sequences))==(?);
  List_Valuable_Sets(Machine(sequences))==(?);
  Inherited_List_Enumerated(Machine(sequences))==(?);
  Inherited_List_Defered(Machine(sequences))==(?);
  Inherited_List_Sets(Machine(sequences))==(?);
  List_Enumerated(Machine(sequences))==(?);
  List_Defered(Machine(sequences))==(?);
  List_Sets(Machine(sequences))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(sequences))==(?);
  Expanded_List_HiddenConstants(Machine(sequences))==(?);
  List_HiddenConstants(Machine(sequences))==(?);
  External_List_HiddenConstants(Machine(sequences))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(sequences))==(btrue);
  Context_List_Properties(Machine(sequences))==(btrue);
  Inherited_List_Properties(Machine(sequences))==(btrue);
  List_Properties(Machine(sequences))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(sequences),subsequence)==(?);
  List_ANY_Var(Machine(sequences),gensubsequence)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(sequences)) == (? | ? | ? | ? | subsequence,gensubsequence | ? | ? | ? | sequences);
  List_Of_HiddenCst_Ids(Machine(sequences)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(sequences)) == (?);
  List_Of_VisibleVar_Ids(Machine(sequences)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(sequences)) == (?: ?)
END
&
THEORY OperationsEnvX IS
  Operations(Machine(sequences)) == (Type(gensubsequence) == Cst(btype(BOOL,?,?),SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))*SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(subsequence) == Cst(btype(BOOL,?,?),SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))*SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))));
  Observers(Machine(sequences)) == (Type(gensubsequence) == Cst(btype(BOOL,?,?),SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))*SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(subsequence) == Cst(btype(BOOL,?,?),SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))*SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))))
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
