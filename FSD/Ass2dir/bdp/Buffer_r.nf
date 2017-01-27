Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(Buffer_r))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(Buffer_r))==(Machine(Buffer));
  Level(Refinement(Buffer_r))==(1);
  Upper_Level(Refinement(Buffer_r))==(Machine(Buffer))
END
&
THEORY LoadedStructureX IS
  Refinement(Buffer_r)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(Buffer_r))==(Resp)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(Buffer_r))==(?);
  List_Includes(Refinement(Buffer_r))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(Buffer_r))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(Buffer_r))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(Buffer_r))==(?);
  Context_List_Variables(Refinement(Buffer_r))==(?);
  Abstract_List_Variables(Refinement(Buffer_r))==(buff);
  Local_List_Variables(Refinement(Buffer_r))==(used,start,aa);
  List_Variables(Refinement(Buffer_r))==(used,start,aa);
  External_List_Variables(Refinement(Buffer_r))==(used,start,aa)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(Buffer_r))==(?);
  Abstract_List_VisibleVariables(Refinement(Buffer_r))==(?);
  External_List_VisibleVariables(Refinement(Buffer_r))==(?);
  Expanded_List_VisibleVariables(Refinement(Buffer_r))==(?);
  List_VisibleVariables(Refinement(Buffer_r))==(?);
  Internal_List_VisibleVariables(Refinement(Buffer_r))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(Buffer_r))==(used,start,aa)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(Buffer_r))==(btrue);
  Expanded_List_Invariant(Refinement(Buffer_r))==(btrue);
  Abstract_List_Invariant(Refinement(Buffer_r))==(buff: seq(ELEM) & size(buff)<=qlen);
  Context_List_Invariant(Refinement(Buffer_r))==(btrue);
  List_Invariant(Refinement(Buffer_r))==(aa: 1..qlen --> ELEM & start: 1..qlen & used: 0..qlen & used = size(buff) & !xx.(xx: dom(buff) => buff(xx) = aa((start+xx-2) mod qlen+1)))
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(Buffer_r))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Refinement(Buffer_r))==(btrue);
  Abstract_List_Assertions(Refinement(Buffer_r))==(btrue);
  Context_List_Assertions(Refinement(Buffer_r))==(btrue);
  List_Assertions(Refinement(Buffer_r))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Refinement(Buffer_r))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Refinement(Buffer_r))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(Buffer_r))==(@elem.(elem: ELEM ==> aa:=(1..qlen)*{elem}) || start:=1 || used:=0);
  Context_List_Initialisation(Refinement(Buffer_r))==(skip);
  List_Initialisation(Refinement(Buffer_r))==(ANY elem WHERE elem: ELEM THEN aa:=(1..qlen)*{elem} END || start:=1 || used:=0)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(Buffer_r))==(add,remove,emptyquery,fullquery,contentsquery);
  List_Operations(Refinement(Buffer_r))==(add,remove,emptyquery,fullquery,contentsquery)
END
&
THEORY ListInputX IS
  List_Input(Refinement(Buffer_r),add)==(xx);
  List_Input(Refinement(Buffer_r),remove)==(?);
  List_Input(Refinement(Buffer_r),emptyquery)==(?);
  List_Input(Refinement(Buffer_r),fullquery)==(?);
  List_Input(Refinement(Buffer_r),contentsquery)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(Buffer_r),add)==(?);
  List_Output(Refinement(Buffer_r),remove)==(ee);
  List_Output(Refinement(Buffer_r),emptyquery)==(rr);
  List_Output(Refinement(Buffer_r),fullquery)==(rr);
  List_Output(Refinement(Buffer_r),contentsquery)==(oo)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(Buffer_r),add)==(add(xx));
  List_Header(Refinement(Buffer_r),remove)==(ee <-- remove);
  List_Header(Refinement(Buffer_r),emptyquery)==(rr <-- emptyquery);
  List_Header(Refinement(Buffer_r),fullquery)==(rr <-- fullquery);
  List_Header(Refinement(Buffer_r),contentsquery)==(oo <-- contentsquery)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(Buffer_r),add)==(xx: ELEM & used<qlen);
  List_Precondition(Refinement(Buffer_r),add)==(xx: ELEM & used<qlen & xx: ELEM & size(buff)<qlen);
  Own_Precondition(Refinement(Buffer_r),remove)==(used>0);
  List_Precondition(Refinement(Buffer_r),remove)==(used>0 & buff/=<>);
  Own_Precondition(Refinement(Buffer_r),emptyquery)==(btrue);
  List_Precondition(Refinement(Buffer_r),emptyquery)==(btrue);
  Own_Precondition(Refinement(Buffer_r),fullquery)==(btrue);
  List_Precondition(Refinement(Buffer_r),fullquery)==(btrue);
  Own_Precondition(Refinement(Buffer_r),contentsquery)==(btrue);
  List_Precondition(Refinement(Buffer_r),contentsquery)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(Buffer_r),contentsquery)==(btrue | oo:=used);
  Expanded_List_Substitution(Refinement(Buffer_r),fullquery)==(btrue | used = qlen ==> rr:=yes [] not(used = qlen) ==> rr:=no);
  Expanded_List_Substitution(Refinement(Buffer_r),emptyquery)==(btrue | used = 0 ==> rr:=yes [] not(used = 0) ==> rr:=no);
  Expanded_List_Substitution(Refinement(Buffer_r),remove)==(used>0 & buff/=<> | @index.(index = start ==> (@(ee$0).(ee$0: ran({index}<|aa) ==> ee:=ee$0) || used:=used-1 || (start = qlen ==> start:=1 [] not(start = qlen) ==> start:=start+1))));
  Expanded_List_Substitution(Refinement(Buffer_r),add)==(xx: ELEM & used<qlen & xx: ELEM & size(buff)<qlen | @index.(index = (start-1+used) mod qlen+1 ==> aa,start,used:=aa<+{index|->xx},(start-1+1) mod qlen+1,used+1));
  List_Substitution(Refinement(Buffer_r),add)==(LET index BE index = (start-1+used) mod qlen+1 IN aa:=aa<+{index|->xx} || start:=(start-1+1) mod qlen+1 || used:=used+1 END);
  List_Substitution(Refinement(Buffer_r),remove)==(LET index BE index = start IN ee:: ran({index}<|aa) || used:=used-1 || IF start = qlen THEN start:=1 ELSE start:=start+1 END END);
  List_Substitution(Refinement(Buffer_r),emptyquery)==(IF used = 0 THEN rr:=yes ELSE rr:=no END);
  List_Substitution(Refinement(Buffer_r),fullquery)==(IF used = qlen THEN rr:=yes ELSE rr:=no END);
  List_Substitution(Refinement(Buffer_r),contentsquery)==(oo:=used)
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(Buffer_r))==(qlen,ELEM)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Refinement(Buffer_r),Machine(Resp))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(Buffer_r))==(qlen: NAT1 & ELEM: FIN(INTEGER) & not(ELEM = {}));
  List_Context_Constraints(Refinement(Buffer_r))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(Buffer_r))==(?);
  Inherited_List_Constants(Refinement(Buffer_r))==(?);
  List_Constants(Refinement(Buffer_r))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Refinement(Buffer_r),RESP)==({yes,no});
  Context_List_Enumerated(Refinement(Buffer_r))==(RESP);
  Context_List_Defered(Refinement(Buffer_r))==(?);
  Context_List_Sets(Refinement(Buffer_r))==(RESP);
  List_Valuable_Sets(Refinement(Buffer_r))==(?);
  Inherited_List_Enumerated(Refinement(Buffer_r))==(?);
  Inherited_List_Defered(Refinement(Buffer_r))==(?);
  Inherited_List_Sets(Refinement(Buffer_r))==(?);
  List_Enumerated(Refinement(Buffer_r))==(?);
  List_Defered(Refinement(Buffer_r))==(?);
  List_Sets(Refinement(Buffer_r))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(Buffer_r))==(?);
  Expanded_List_HiddenConstants(Refinement(Buffer_r))==(?);
  List_HiddenConstants(Refinement(Buffer_r))==(?);
  External_List_HiddenConstants(Refinement(Buffer_r))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(Buffer_r))==(btrue);
  Context_List_Properties(Refinement(Buffer_r))==(RESP: FIN(INTEGER) & not(RESP = {}));
  Inherited_List_Properties(Refinement(Buffer_r))==(btrue);
  List_Properties(Refinement(Buffer_r))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Refinement(Buffer_r),Machine(Resp))==(?);
  Seen_Context_List_Enumerated(Refinement(Buffer_r))==(?);
  Seen_Context_List_Invariant(Refinement(Buffer_r))==(btrue);
  Seen_Context_List_Assertions(Refinement(Buffer_r))==(btrue);
  Seen_Context_List_Properties(Refinement(Buffer_r))==(btrue);
  Seen_List_Constraints(Refinement(Buffer_r))==(btrue);
  Seen_List_Operations(Refinement(Buffer_r),Machine(Resp))==(?);
  Seen_Expanded_List_Invariant(Refinement(Buffer_r),Machine(Resp))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(Buffer_r),?)==(Var(elem) == atype(ELEM,?,?));
  List_ANY_Var(Refinement(Buffer_r),add)==(?);
  List_ANY_Var(Refinement(Buffer_r),remove)==(?);
  List_ANY_Var(Refinement(Buffer_r),emptyquery)==(?);
  List_ANY_Var(Refinement(Buffer_r),fullquery)==(?);
  List_ANY_Var(Refinement(Buffer_r),contentsquery)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(Buffer_r)) == (? | ? | used,start,aa | ? | add,remove,emptyquery,fullquery,contentsquery | ? | seen(Machine(Resp)) | qlen,ELEM | Buffer_r);
  List_Of_HiddenCst_Ids(Refinement(Buffer_r)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(Buffer_r)) == (?);
  List_Of_VisibleVar_Ids(Refinement(Buffer_r)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(Buffer_r)) == (?: ?);
  List_Of_Ids(Machine(Resp)) == (RESP,yes,no | ? | ? | ? | ? | ? | ? | ? | Resp);
  List_Of_HiddenCst_Ids(Machine(Resp)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Resp)) == (?);
  List_Of_VisibleVar_Ids(Machine(Resp)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Resp)) == (?: ?)
END
&
THEORY ParametersEnvX IS
  Parameters(Refinement(Buffer_r)) == (Type(ELEM) == Prm(SetOf(atype(ELEM,?,?)));Type(qlen) == Prm(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(Buffer_r)) == (Type(used) == Mvl(btype(INTEGER,?,?));Type(start) == Mvl(btype(INTEGER,?,?));Type(aa) == Mvl(SetOf(btype(INTEGER,1,qlen)*atype(ELEM,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(Buffer_r)) == (Type(contentsquery) == Cst(btype(INTEGER,?,?),No_type);Type(fullquery) == Cst(etype(RESP,?,?),No_type);Type(emptyquery) == Cst(etype(RESP,?,?),No_type);Type(remove) == Cst(atype(ELEM,?,?),No_type);Type(add) == Cst(No_type,atype(ELEM,?,?)))
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
