Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Stats))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Stats))==(Machine(Stats));
  Level(Machine(Stats))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Stats)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Stats))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Stats))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Stats))==(?);
  List_Includes(Machine(Stats))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Stats))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Stats))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Stats))==(?);
  Context_List_Variables(Machine(Stats))==(?);
  Abstract_List_Variables(Machine(Stats))==(?);
  Local_List_Variables(Machine(Stats))==(tally);
  List_Variables(Machine(Stats))==(tally);
  External_List_Variables(Machine(Stats))==(tally)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Stats))==(?);
  Abstract_List_VisibleVariables(Machine(Stats))==(?);
  External_List_VisibleVariables(Machine(Stats))==(?);
  Expanded_List_VisibleVariables(Machine(Stats))==(?);
  List_VisibleVariables(Machine(Stats))==(?);
  Internal_List_VisibleVariables(Machine(Stats))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Stats))==(btrue);
  Gluing_List_Invariant(Machine(Stats))==(btrue);
  Expanded_List_Invariant(Machine(Stats))==(btrue);
  Abstract_List_Invariant(Machine(Stats))==(btrue);
  Context_List_Invariant(Machine(Stats))==(btrue);
  List_Invariant(Machine(Stats))==(tally: 0..10 --> NAT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Stats))==(btrue);
  Abstract_List_Assertions(Machine(Stats))==(btrue);
  Context_List_Assertions(Machine(Stats))==(btrue);
  List_Assertions(Machine(Stats))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Stats))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Stats))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Stats))==(tally:=(0..10)*{0});
  Context_List_Initialisation(Machine(Stats))==(skip);
  List_Initialisation(Machine(Stats))==(tally:=(0..10)*{0})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Stats))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Stats))==(btrue);
  List_Constraints(Machine(Stats))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Stats))==(tested,querytot,queryreg,querypc,querymean,querymedian);
  List_Operations(Machine(Stats))==(tested,querytot,queryreg,querypc,querymean,querymedian)
END
&
THEORY ListInputX IS
  List_Input(Machine(Stats),tested)==(nn);
  List_Input(Machine(Stats),querytot)==(?);
  List_Input(Machine(Stats),queryreg)==(nn);
  List_Input(Machine(Stats),querypc)==(nn);
  List_Input(Machine(Stats),querymean)==(?);
  List_Input(Machine(Stats),querymedian)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Stats),tested)==(?);
  List_Output(Machine(Stats),querytot)==(oo);
  List_Output(Machine(Stats),queryreg)==(oo);
  List_Output(Machine(Stats),querypc)==(oo);
  List_Output(Machine(Stats),querymean)==(oo);
  List_Output(Machine(Stats),querymedian)==(oo)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Stats),tested)==(tested(nn));
  List_Header(Machine(Stats),querytot)==(oo <-- querytot);
  List_Header(Machine(Stats),queryreg)==(oo <-- queryreg(nn));
  List_Header(Machine(Stats),querypc)==(oo <-- querypc(nn));
  List_Header(Machine(Stats),querymean)==(oo <-- querymean);
  List_Header(Machine(Stats),querymedian)==(oo <-- querymedian)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Stats),tested)==(nn: 0..10);
  List_Precondition(Machine(Stats),querytot)==(btrue);
  List_Precondition(Machine(Stats),queryreg)==(nn: 0..10);
  List_Precondition(Machine(Stats),querypc)==(nn: 0..10);
  List_Precondition(Machine(Stats),querymean)==(btrue);
  List_Precondition(Machine(Stats),querymedian)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Stats),querymedian)==(btrue | @mid.(mid = (SIGMA(xx).(xx: 0..10 | tally(xx))+1)/2 ==> (mid = 0 ==> oo:=0 [] not(mid = 0) ==> @xx.(xx: 0..10 & SIGMA(ii).(ii: 0..xx-1 | tally(ii))<mid & SIGMA(jj).(jj: xx+1..10 | tally(jj))>mid ==> oo:=xx))));
  Expanded_List_Substitution(Machine(Stats),querymean)==(btrue | @total.(total = SIGMA(xx).(xx: 0..10 | tally(xx)) ==> (total = 0 ==> oo:=0 [] not(total = 0) ==> oo:=SIGMA(xx).(xx: 0..10 | xx*tally(xx))/total)));
  Expanded_List_Substitution(Machine(Stats),querypc)==(nn: 0..10 | @total.(total = SIGMA(xx).(xx: 0..10 | tally(xx)) ==> (total = 0 ==> oo:=0 [] not(total = 0) ==> oo:=100*tally(nn)/total)));
  Expanded_List_Substitution(Machine(Stats),queryreg)==(nn: 0..10 | oo:=tally(nn));
  Expanded_List_Substitution(Machine(Stats),querytot)==(btrue | oo:=SIGMA(zz).(zz: 0..10 | tally(zz)));
  Expanded_List_Substitution(Machine(Stats),tested)==(nn: 0..10 | tally:=tally<+{nn|->tally(nn)+1});
  List_Substitution(Machine(Stats),tested)==(tally(nn):=tally(nn)+1);
  List_Substitution(Machine(Stats),querytot)==(oo:=SIGMA(zz).(zz: 0..10 | tally(zz)));
  List_Substitution(Machine(Stats),queryreg)==(oo:=tally(nn));
  List_Substitution(Machine(Stats),querypc)==(LET total BE total = SIGMA(xx).(xx: 0..10 | tally(xx)) IN IF total = 0 THEN oo:=0 ELSE oo:=100*tally(nn)/total END END);
  List_Substitution(Machine(Stats),querymean)==(LET total BE total = SIGMA(xx).(xx: 0..10 | tally(xx)) IN IF total = 0 THEN oo:=0 ELSE oo:=SIGMA(xx).(xx: 0..10 | xx*tally(xx))/total END END);
  List_Substitution(Machine(Stats),querymedian)==(LET mid BE mid = (SIGMA(xx).(xx: 0..10 | tally(xx))+1)/2 IN IF mid = 0 THEN oo:=0 ELSE ANY xx WHERE xx: 0..10 & SIGMA(ii).(ii: 0..xx-1 | tally(ii))<mid & SIGMA(jj).(jj: xx+1..10 | tally(jj))>mid THEN oo:=xx END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Stats))==(?);
  Inherited_List_Constants(Machine(Stats))==(?);
  List_Constants(Machine(Stats))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Stats))==(?);
  Context_List_Defered(Machine(Stats))==(?);
  Context_List_Sets(Machine(Stats))==(?);
  List_Valuable_Sets(Machine(Stats))==(?);
  Inherited_List_Enumerated(Machine(Stats))==(?);
  Inherited_List_Defered(Machine(Stats))==(?);
  Inherited_List_Sets(Machine(Stats))==(?);
  List_Enumerated(Machine(Stats))==(?);
  List_Defered(Machine(Stats))==(?);
  List_Sets(Machine(Stats))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Stats))==(?);
  Expanded_List_HiddenConstants(Machine(Stats))==(?);
  List_HiddenConstants(Machine(Stats))==(?);
  External_List_HiddenConstants(Machine(Stats))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Stats))==(btrue);
  Context_List_Properties(Machine(Stats))==(btrue);
  Inherited_List_Properties(Machine(Stats))==(btrue);
  List_Properties(Machine(Stats))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Stats),tested)==(?);
  List_ANY_Var(Machine(Stats),querytot)==(?);
  List_ANY_Var(Machine(Stats),queryreg)==(?);
  List_ANY_Var(Machine(Stats),querypc)==(?);
  List_ANY_Var(Machine(Stats),querymean)==(?);
  List_ANY_Var(Machine(Stats),querymedian)==(Var(xx) == btype(INTEGER,?,?))
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Stats)) == (? | ? | tally | ? | tested,querytot,queryreg,querypc,querymean,querymedian | ? | ? | ? | Stats);
  List_Of_HiddenCst_Ids(Machine(Stats)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Stats)) == (?);
  List_Of_VisibleVar_Ids(Machine(Stats)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Stats)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Stats)) == (Type(tally) == Mvl(SetOf(btype(INTEGER,0,10)*btype(INTEGER,0,MAXINT))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Stats)) == (Type(querymedian) == Cst(btype(INTEGER,?,?),No_type);Type(querymean) == Cst(btype(INTEGER,?,?),No_type);Type(querypc) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(queryreg) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(querytot) == Cst(btype(INTEGER,?,?),No_type);Type(tested) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(Stats)) == (Type(querymedian) == Cst(btype(INTEGER,?,?),No_type);Type(querymean) == Cst(btype(INTEGER,?,?),No_type);Type(querypc) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(queryreg) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(querytot) == Cst(btype(INTEGER,?,?),No_type))
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
