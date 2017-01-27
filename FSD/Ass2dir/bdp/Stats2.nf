Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Stats2))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Stats2))==(Machine(Stats2));
  Level(Machine(Stats2))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Stats2)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Stats2))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Stats2))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Stats2))==(?);
  List_Includes(Machine(Stats2))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Stats2))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Stats2))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Stats2))==(?);
  Context_List_Variables(Machine(Stats2))==(?);
  Abstract_List_Variables(Machine(Stats2))==(?);
  Local_List_Variables(Machine(Stats2))==(tally);
  List_Variables(Machine(Stats2))==(tally);
  External_List_Variables(Machine(Stats2))==(tally)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Stats2))==(?);
  Abstract_List_VisibleVariables(Machine(Stats2))==(?);
  External_List_VisibleVariables(Machine(Stats2))==(?);
  Expanded_List_VisibleVariables(Machine(Stats2))==(?);
  List_VisibleVariables(Machine(Stats2))==(?);
  Internal_List_VisibleVariables(Machine(Stats2))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Stats2))==(btrue);
  Gluing_List_Invariant(Machine(Stats2))==(btrue);
  Expanded_List_Invariant(Machine(Stats2))==(btrue);
  Abstract_List_Invariant(Machine(Stats2))==(btrue);
  Context_List_Invariant(Machine(Stats2))==(btrue);
  List_Invariant(Machine(Stats2))==(tally: 0..10 --> NAT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Stats2))==(btrue);
  Abstract_List_Assertions(Machine(Stats2))==(btrue);
  Context_List_Assertions(Machine(Stats2))==(btrue);
  List_Assertions(Machine(Stats2))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Stats2))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Stats2))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Stats2))==(tally:=(0..10)*{0});
  Context_List_Initialisation(Machine(Stats2))==(skip);
  List_Initialisation(Machine(Stats2))==(tally:=(0..10)*{0})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Stats2))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Stats2))==(btrue);
  List_Constraints(Machine(Stats2))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Stats2))==(tested,querytot,queryreg,querypc,querymean,querymedian);
  List_Operations(Machine(Stats2))==(tested,querytot,queryreg,querypc,querymean,querymedian)
END
&
THEORY ListInputX IS
  List_Input(Machine(Stats2),tested)==(nn);
  List_Input(Machine(Stats2),querytot)==(?);
  List_Input(Machine(Stats2),queryreg)==(nn);
  List_Input(Machine(Stats2),querypc)==(nn);
  List_Input(Machine(Stats2),querymean)==(?);
  List_Input(Machine(Stats2),querymedian)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Stats2),tested)==(?);
  List_Output(Machine(Stats2),querytot)==(oo);
  List_Output(Machine(Stats2),queryreg)==(oo);
  List_Output(Machine(Stats2),querypc)==(oo);
  List_Output(Machine(Stats2),querymean)==(oo);
  List_Output(Machine(Stats2),querymedian)==(oo)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Stats2),tested)==(tested(nn));
  List_Header(Machine(Stats2),querytot)==(oo <-- querytot);
  List_Header(Machine(Stats2),queryreg)==(oo <-- queryreg(nn));
  List_Header(Machine(Stats2),querypc)==(oo <-- querypc(nn));
  List_Header(Machine(Stats2),querymean)==(oo <-- querymean);
  List_Header(Machine(Stats2),querymedian)==(oo <-- querymedian)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Stats2),tested)==(nn: 0..10);
  List_Precondition(Machine(Stats2),querytot)==(btrue);
  List_Precondition(Machine(Stats2),queryreg)==(nn: 0..10);
  List_Precondition(Machine(Stats2),querypc)==(nn: 0..10);
  List_Precondition(Machine(Stats2),querymean)==(btrue);
  List_Precondition(Machine(Stats2),querymedian)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Stats2),querymedian)==(btrue | @mid.(mid = (SIGMA(xx).(xx: 0..10 | tally(xx))+1)/2 ==> (mid = 0 ==> oo:=0 [] not(mid = 0) ==> @xx.(xx: 0..10 & SIGMA(ii).(ii: 0..xx-1 | tally(ii))<mid & SIGMA(jj).(jj: xx+1..10 | tally(jj))>mid ==> oo:=xx))));
  Expanded_List_Substitution(Machine(Stats2),querymean)==(btrue | @total.(total = SIGMA(xx).(xx: 0..10 | tally(xx)) ==> (total = 0 ==> oo:=0 [] not(total = 0) ==> oo:=SIGMA(xx).(xx: 0..10 | xx*tally(xx))/total)));
  Expanded_List_Substitution(Machine(Stats2),querypc)==(nn: 0..10 | @total.(total = SIGMA(xx).(xx: 0..10 | tally(xx)) ==> (total = 0 ==> oo:=0 [] not(total = 0) ==> oo:=100*tally(nn)/total)));
  Expanded_List_Substitution(Machine(Stats2),queryreg)==(nn: 0..10 | oo:=tally(nn));
  Expanded_List_Substitution(Machine(Stats2),querytot)==(btrue | oo:=SIGMA(zz).(zz: 0..10 | tally(zz)));
  Expanded_List_Substitution(Machine(Stats2),tested)==(nn: 0..10 | tally:=tally<+{nn|->tally(nn)+1});
  List_Substitution(Machine(Stats2),tested)==(tally(nn):=tally(nn)+1);
  List_Substitution(Machine(Stats2),querytot)==(oo:=SIGMA(zz).(zz: 0..10 | tally(zz)));
  List_Substitution(Machine(Stats2),queryreg)==(oo:=tally(nn));
  List_Substitution(Machine(Stats2),querypc)==(LET total BE total = SIGMA(xx).(xx: 0..10 | tally(xx)) IN IF total = 0 THEN oo:=0 ELSE oo:=100*tally(nn)/total END END);
  List_Substitution(Machine(Stats2),querymean)==(LET total BE total = SIGMA(xx).(xx: 0..10 | tally(xx)) IN IF total = 0 THEN oo:=0 ELSE oo:=SIGMA(xx).(xx: 0..10 | xx*tally(xx))/total END END);
  List_Substitution(Machine(Stats2),querymedian)==(LET mid BE mid = (SIGMA(xx).(xx: 0..10 | tally(xx))+1)/2 IN IF mid = 0 THEN oo:=0 ELSE ANY xx WHERE xx: 0..10 & SIGMA(ii).(ii: 0..xx-1 | tally(ii))<mid & SIGMA(jj).(jj: xx+1..10 | tally(jj))>mid THEN oo:=xx END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Stats2))==(?);
  Inherited_List_Constants(Machine(Stats2))==(?);
  List_Constants(Machine(Stats2))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Stats2))==(?);
  Context_List_Defered(Machine(Stats2))==(?);
  Context_List_Sets(Machine(Stats2))==(?);
  List_Valuable_Sets(Machine(Stats2))==(?);
  Inherited_List_Enumerated(Machine(Stats2))==(?);
  Inherited_List_Defered(Machine(Stats2))==(?);
  Inherited_List_Sets(Machine(Stats2))==(?);
  List_Enumerated(Machine(Stats2))==(?);
  List_Defered(Machine(Stats2))==(?);
  List_Sets(Machine(Stats2))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Stats2))==(?);
  Expanded_List_HiddenConstants(Machine(Stats2))==(?);
  List_HiddenConstants(Machine(Stats2))==(?);
  External_List_HiddenConstants(Machine(Stats2))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Stats2))==(btrue);
  Context_List_Properties(Machine(Stats2))==(btrue);
  Inherited_List_Properties(Machine(Stats2))==(btrue);
  List_Properties(Machine(Stats2))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Stats2),tested)==(?);
  List_ANY_Var(Machine(Stats2),querytot)==(?);
  List_ANY_Var(Machine(Stats2),queryreg)==(?);
  List_ANY_Var(Machine(Stats2),querypc)==(?);
  List_ANY_Var(Machine(Stats2),querymean)==(?);
  List_ANY_Var(Machine(Stats2),querymedian)==(Var(xx) == btype(INTEGER,?,?))
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Stats2)) == (? | ? | tally | ? | tested,querytot,queryreg,querypc,querymean,querymedian | ? | ? | ? | Stats2);
  List_Of_HiddenCst_Ids(Machine(Stats2)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Stats2)) == (?);
  List_Of_VisibleVar_Ids(Machine(Stats2)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Stats2)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Stats2)) == (Type(tally) == Mvl(SetOf(btype(INTEGER,0,10)*btype(INTEGER,0,MAXINT))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Stats2)) == (Type(querymedian) == Cst(btype(INTEGER,?,?),No_type);Type(querymean) == Cst(btype(INTEGER,?,?),No_type);Type(querypc) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(queryreg) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(querytot) == Cst(btype(INTEGER,?,?),No_type);Type(tested) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(Stats2)) == (Type(querymedian) == Cst(btype(INTEGER,?,?),No_type);Type(querymean) == Cst(btype(INTEGER,?,?),No_type);Type(querypc) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(queryreg) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(querytot) == Cst(btype(INTEGER,?,?),No_type))
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
