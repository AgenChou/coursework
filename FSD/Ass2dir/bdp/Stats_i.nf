Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Stats_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Stats_i))==(Machine(Stats));
  Level(Implementation(Stats_i))==(1);
  Upper_Level(Implementation(Stats_i))==(Machine(Stats))
END
&
THEORY LoadedStructureX IS
  Implementation(Stats_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Stats_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Stats_i))==(?);
  Inherited_List_Includes(Implementation(Stats_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Stats_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Stats_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Stats_i))==(?);
  Context_List_Variables(Implementation(Stats_i))==(?);
  Abstract_List_Variables(Implementation(Stats_i))==(tally);
  Local_List_Variables(Implementation(Stats_i))==(?);
  List_Variables(Implementation(Stats_i))==(?);
  External_List_Variables(Implementation(Stats_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Stats_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Stats_i))==(?);
  External_List_VisibleVariables(Implementation(Stats_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Stats_i))==(?);
  List_VisibleVariables(Implementation(Stats_i))==(tally);
  Internal_List_VisibleVariables(Implementation(Stats_i))==(tally)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Stats_i))==(btrue);
  Expanded_List_Invariant(Implementation(Stats_i))==(btrue);
  Abstract_List_Invariant(Implementation(Stats_i))==(tally: 0..10 --> NAT);
  Context_List_Invariant(Implementation(Stats_i))==(btrue);
  List_Invariant(Implementation(Stats_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(Stats_i))==(btrue);
  Abstract_List_Assertions(Implementation(Stats_i))==(btrue);
  Context_List_Assertions(Implementation(Stats_i))==(btrue);
  List_Assertions(Implementation(Stats_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Stats_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Stats_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Stats_i))==(tally:=(0..10)*{0});
  Context_List_Initialisation(Implementation(Stats_i))==(skip);
  List_Initialisation(Implementation(Stats_i))==(tally:=(0..10)*{0})
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Stats_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Stats_i))==(btrue);
  List_Context_Constraints(Implementation(Stats_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Stats_i))==(tested,querytot,queryreg,querypc,querymean,querymedian);
  List_Operations(Implementation(Stats_i))==(tested,querytot,queryreg,querypc,querymean,querymedian)
END
&
THEORY ListInputX IS
  List_Input(Implementation(Stats_i),tested)==(nn);
  List_Input(Implementation(Stats_i),querytot)==(?);
  List_Input(Implementation(Stats_i),queryreg)==(nn);
  List_Input(Implementation(Stats_i),querypc)==(nn);
  List_Input(Implementation(Stats_i),querymean)==(?);
  List_Input(Implementation(Stats_i),querymedian)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Stats_i),tested)==(?);
  List_Output(Implementation(Stats_i),querytot)==(oo);
  List_Output(Implementation(Stats_i),queryreg)==(oo);
  List_Output(Implementation(Stats_i),querypc)==(oo);
  List_Output(Implementation(Stats_i),querymean)==(oo);
  List_Output(Implementation(Stats_i),querymedian)==(oo)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Stats_i),tested)==(tested(nn));
  List_Header(Implementation(Stats_i),querytot)==(oo <-- querytot);
  List_Header(Implementation(Stats_i),queryreg)==(oo <-- queryreg(nn));
  List_Header(Implementation(Stats_i),querypc)==(oo <-- querypc(nn));
  List_Header(Implementation(Stats_i),querymean)==(oo <-- querymean);
  List_Header(Implementation(Stats_i),querymedian)==(oo <-- querymedian)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(Stats_i),tested)==(btrue);
  List_Precondition(Implementation(Stats_i),tested)==(nn: 0..10);
  Own_Precondition(Implementation(Stats_i),querytot)==(btrue);
  List_Precondition(Implementation(Stats_i),querytot)==(btrue);
  Own_Precondition(Implementation(Stats_i),queryreg)==(btrue);
  List_Precondition(Implementation(Stats_i),queryreg)==(nn: 0..10);
  Own_Precondition(Implementation(Stats_i),querypc)==(btrue);
  List_Precondition(Implementation(Stats_i),querypc)==(nn: 0..10);
  Own_Precondition(Implementation(Stats_i),querymean)==(btrue);
  List_Precondition(Implementation(Stats_i),querymean)==(btrue);
  Own_Precondition(Implementation(Stats_i),querymedian)==(btrue);
  List_Precondition(Implementation(Stats_i),querymedian)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Stats_i),querymedian)==(btrue | @(ii,sum,mid).(ii:=0;sum:=0;WHILE ii<=10 DO (sum+tally(ii): INT & ii: dom(tally) & sum: INT & tally(ii): INT | sum:=sum+tally(ii));(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT sum = SIGMA(jj).(jj: 0..ii | tally(jj)) VARIANT 10-ii END;(sum+1: INT & sum: INT & 1: INT & (sum+1)/2: INT & 2: INT & not(2 = 0) | mid:=(sum+1)/2);(mid = 0 ==> (0: INT | oo:=0) [] not(mid = 0) ==> ((0: INT | ii:=0);(0: INT | sum:=0);WHILE sum<mid DO (sum+tally(ii): INT & ii: dom(tally) & sum: INT & tally(ii): INT | sum:=sum+tally(ii));(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT sum = SIGMA(jj).(jj: 0..ii | tally(jj)) VARIANT 10-ii END;(ii: INT | oo:=ii)))));
  Expanded_List_Substitution(Implementation(Stats_i),querymean)==(btrue | @(sum,ii,score).(sum:=0;ii:=0;score:=0;WHILE ii<=10 DO (sum+tally(ii): INT & ii: dom(tally) & sum: INT & tally(ii): INT | sum:=sum+tally(ii));(score+ii*tally(ii): INT & ii: dom(tally) & ii*tally(ii): INT & ii: INT & tally(ii): INT & score: INT | score:=score+ii*tally(ii));(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT sum = SIGMA(jj).(jj: 0..ii | tally(jj)) & score = SIGMA(kk).(kk: 0..ii | kk*tally(kk)) VARIANT 10-ii END;(sum = 0 ==> (0: INT | oo:=0) [] not(sum = 0) ==> (score/sum: INT & score: INT & sum: INT & not(sum = 0) | oo:=score/sum))));
  Expanded_List_Substitution(Implementation(Stats_i),querypc)==(nn: 0..10 | 0<=nn & nn<=10 ==> @(sum,ii).(sum:=0;ii:=0;WHILE ii<=10 DO (sum+tally(ii): INT & ii: dom(tally) & sum: INT & tally(ii): INT | sum:=sum+tally(ii));(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT sum = SIGMA(jj).(jj: 0..ii | tally(jj)) VARIANT 10-ii END;(sum = 0 ==> (0: INT | oo:=0) [] not(sum = 0) ==> (100*tally(nn)/sum: INT & nn: dom(tally) & 100*tally(nn): INT & 100: INT & tally(nn): INT & sum: INT & not(sum = 0) | oo:=100*tally(nn)/sum))) [] not(0<=nn & nn<=10) ==> skip);
  Expanded_List_Substitution(Implementation(Stats_i),queryreg)==(nn: 0..10 | 0<=nn & nn<=10 ==> (tally(nn): INT & nn: dom(tally) | oo:=tally(nn)) [] not(0<=nn & nn<=10) ==> skip);
  Expanded_List_Substitution(Implementation(Stats_i),querytot)==(btrue | @(sum,ii).(sum:=0;ii:=0;WHILE ii<=10 DO (sum+tally(ii): INT & ii: dom(tally) & sum: INT & tally(ii): INT | sum:=sum+tally(ii));(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT sum = SIGMA(jj).(jj: 0..ii | tally(jj)) VARIANT 10-ii END));
  Expanded_List_Substitution(Implementation(Stats_i),tested)==(nn: 0..10 | 0<=nn & nn<=10 ==> (nn: dom(tally) & tally(nn)+1: INT & tally(nn): INT & 1: INT | tally:=tally<+{nn|->tally(nn)+1}) [] not(0<=nn & nn<=10) ==> skip);
  List_Substitution(Implementation(Stats_i),tested)==(IF 0<=nn & nn<=10 THEN tally(nn):=tally(nn)+1 END);
  List_Substitution(Implementation(Stats_i),querytot)==(VAR sum,ii IN sum:=0;ii:=0;WHILE ii<=10 DO sum:=sum+tally(ii);ii:=ii+1 INVARIANT sum = SIGMA(jj).(jj: 0..ii | tally(jj)) VARIANT 10-ii END END);
  List_Substitution(Implementation(Stats_i),queryreg)==(IF 0<=nn & nn<=10 THEN oo:=tally(nn) END);
  List_Substitution(Implementation(Stats_i),querypc)==(IF 0<=nn & nn<=10 THEN VAR sum,ii IN sum:=0;ii:=0;WHILE ii<=10 DO sum:=sum+tally(ii);ii:=ii+1 INVARIANT sum = SIGMA(jj).(jj: 0..ii | tally(jj)) VARIANT 10-ii END;IF sum = 0 THEN oo:=0 ELSE oo:=100*tally(nn)/sum END END END);
  List_Substitution(Implementation(Stats_i),querymean)==(VAR sum,ii,score IN sum:=0;ii:=0;score:=0;WHILE ii<=10 DO sum:=sum+tally(ii);score:=score+ii*tally(ii);ii:=ii+1 INVARIANT sum = SIGMA(jj).(jj: 0..ii | tally(jj)) & score = SIGMA(kk).(kk: 0..ii | kk*tally(kk)) VARIANT 10-ii END;IF sum = 0 THEN oo:=0 ELSE oo:=score/sum END END);
  List_Substitution(Implementation(Stats_i),querymedian)==(VAR ii,sum,mid IN ii:=0;sum:=0;WHILE ii<=10 DO sum:=sum+tally(ii);ii:=ii+1 INVARIANT sum = SIGMA(jj).(jj: 0..ii | tally(jj)) VARIANT 10-ii END;mid:=(sum+1)/2;IF mid = 0 THEN oo:=0 ELSE ii:=0;sum:=0;WHILE sum<mid DO sum:=sum+tally(ii);ii:=ii+1 INVARIANT sum = SIGMA(jj).(jj: 0..ii | tally(jj)) VARIANT 10-ii END;oo:=ii END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Stats_i))==(?);
  Inherited_List_Constants(Implementation(Stats_i))==(?);
  List_Constants(Implementation(Stats_i))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(Stats_i))==(?);
  Context_List_Defered(Implementation(Stats_i))==(?);
  Context_List_Sets(Implementation(Stats_i))==(?);
  List_Own_Enumerated(Implementation(Stats_i))==(?);
  List_Valuable_Sets(Implementation(Stats_i))==(?);
  Inherited_List_Enumerated(Implementation(Stats_i))==(?);
  Inherited_List_Defered(Implementation(Stats_i))==(?);
  Inherited_List_Sets(Implementation(Stats_i))==(?);
  List_Enumerated(Implementation(Stats_i))==(?);
  List_Defered(Implementation(Stats_i))==(?);
  List_Sets(Implementation(Stats_i))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Stats_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Stats_i))==(?);
  List_HiddenConstants(Implementation(Stats_i))==(?);
  External_List_HiddenConstants(Implementation(Stats_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Stats_i))==(btrue);
  Context_List_Properties(Implementation(Stats_i))==(btrue);
  Inherited_List_Properties(Implementation(Stats_i))==(btrue);
  List_Properties(Implementation(Stats_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(Stats_i))==(aa: aa);
  List_Values(Implementation(Stats_i))==(?)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(Stats_i))==(Type(tally) == Mvv(SetOf(btype(INTEGER,0,10)*btype(INTEGER,0,MAXINT))));
  Operations(Implementation(Stats_i))==(Type(querymedian) == Cst(btype(INTEGER,?,?),No_type);Type(querymean) == Cst(btype(INTEGER,?,?),No_type);Type(querypc) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(queryreg) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(querytot) == Cst(btype(INTEGER,?,?),No_type);Type(tested) == Cst(No_type,btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Stats_i)) == (? | ? | ? | ? | tested,querytot,queryreg,querypc,querymean,querymedian | ? | ? | ? | Stats_i);
  List_Of_HiddenCst_Ids(Implementation(Stats_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Stats_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Stats_i)) == (tally | ?);
  List_Of_Ids_SeenBNU(Implementation(Stats_i)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(Stats_i)) == (Type(tally) == Mvv(SetOf(btype(INTEGER,0,10)*btype(INTEGER,0,MAXINT))))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(Stats_i),querytot, 1) == (Type(sum) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Stats_i),querypc, 1) == (Type(sum) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Stats_i),querymean, 1) == (Type(sum) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(score) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Stats_i),querymedian, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(sum) == Lvl(btype(INTEGER,?,?));Type(mid) == Lvl(btype(INTEGER,?,?)))
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
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(Stats_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(Stats_i))==(tally: POW(INTEGER*INTEGER))
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
