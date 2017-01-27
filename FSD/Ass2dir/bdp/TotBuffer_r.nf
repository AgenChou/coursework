Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(TotBuffer_r))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(TotBuffer_r))==(Machine(TotBuffer));
  Level(Refinement(TotBuffer_r))==(1);
  Upper_Level(Refinement(TotBuffer_r))==(Machine(TotBuffer))
END
&
THEORY LoadedStructureX IS
  Refinement(TotBuffer_r)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(TotBuffer_r))==(Resp)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(TotBuffer_r))==(Buffer);
  List_Includes(Refinement(TotBuffer_r))==(Buffer)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(TotBuffer_r))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(TotBuffer_r))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(TotBuffer_r))==(?);
  Context_List_Variables(Refinement(TotBuffer_r))==(?);
  Abstract_List_Variables(Refinement(TotBuffer_r))==(?);
  Local_List_Variables(Refinement(TotBuffer_r))==(?);
  List_Variables(Refinement(TotBuffer_r))==(buff);
  External_List_Variables(Refinement(TotBuffer_r))==(buff)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(TotBuffer_r))==(?);
  Abstract_List_VisibleVariables(Refinement(TotBuffer_r))==(?);
  External_List_VisibleVariables(Refinement(TotBuffer_r))==(?);
  Expanded_List_VisibleVariables(Refinement(TotBuffer_r))==(?);
  List_VisibleVariables(Refinement(TotBuffer_r))==(?);
  Internal_List_VisibleVariables(Refinement(TotBuffer_r))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(TotBuffer_r))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(TotBuffer_r))==(btrue);
  Abstract_List_Invariant(Refinement(TotBuffer_r))==(btrue);
  Expanded_List_Invariant(Refinement(TotBuffer_r))==(buff: seq(ELEM) & size(buff)<=qlen);
  Context_List_Invariant(Refinement(TotBuffer_r))==(btrue);
  List_Invariant(Refinement(TotBuffer_r))==(btrue)
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(TotBuffer_r))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Refinement(TotBuffer_r))==(btrue);
  Expanded_List_Assertions(Refinement(TotBuffer_r))==(btrue);
  Context_List_Assertions(Refinement(TotBuffer_r))==(btrue);
  List_Assertions(Refinement(TotBuffer_r))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Refinement(TotBuffer_r))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Refinement(TotBuffer_r))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(TotBuffer_r))==(buff:=<>);
  Context_List_Initialisation(Refinement(TotBuffer_r))==(skip);
  List_Initialisation(Refinement(TotBuffer_r))==(skip)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(TotBuffer_r))==(enc_add,enc_remove,enc_emptyquery,enc_fullquery,enc_contentsquery);
  List_Operations(Refinement(TotBuffer_r))==(enc_add,enc_remove,enc_emptyquery,enc_fullquery,enc_contentsquery)
END
&
THEORY ListInputX IS
  List_Input(Refinement(TotBuffer_r),enc_add)==(xx);
  List_Input(Refinement(TotBuffer_r),enc_remove)==(?);
  List_Input(Refinement(TotBuffer_r),enc_emptyquery)==(?);
  List_Input(Refinement(TotBuffer_r),enc_fullquery)==(?);
  List_Input(Refinement(TotBuffer_r),enc_contentsquery)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(TotBuffer_r),enc_add)==(err);
  List_Output(Refinement(TotBuffer_r),enc_remove)==(err,ee);
  List_Output(Refinement(TotBuffer_r),enc_emptyquery)==(err,rr);
  List_Output(Refinement(TotBuffer_r),enc_fullquery)==(err,rr);
  List_Output(Refinement(TotBuffer_r),enc_contentsquery)==(err,oo)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(TotBuffer_r),enc_add)==(err <-- enc_add(xx));
  List_Header(Refinement(TotBuffer_r),enc_remove)==(err,ee <-- enc_remove);
  List_Header(Refinement(TotBuffer_r),enc_emptyquery)==(err,rr <-- enc_emptyquery);
  List_Header(Refinement(TotBuffer_r),enc_fullquery)==(err,rr <-- enc_fullquery);
  List_Header(Refinement(TotBuffer_r),enc_contentsquery)==(err,oo <-- enc_contentsquery)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(TotBuffer_r),enc_add)==(xx: ELEM);
  List_Precondition(Refinement(TotBuffer_r),enc_add)==(xx: ELEM & xx: ELEM);
  Own_Precondition(Refinement(TotBuffer_r),enc_remove)==(btrue);
  List_Precondition(Refinement(TotBuffer_r),enc_remove)==(btrue);
  Own_Precondition(Refinement(TotBuffer_r),enc_emptyquery)==(btrue);
  List_Precondition(Refinement(TotBuffer_r),enc_emptyquery)==(btrue);
  Own_Precondition(Refinement(TotBuffer_r),enc_fullquery)==(btrue);
  List_Precondition(Refinement(TotBuffer_r),enc_fullquery)==(btrue);
  Own_Precondition(Refinement(TotBuffer_r),enc_contentsquery)==(btrue);
  List_Precondition(Refinement(TotBuffer_r),enc_contentsquery)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(TotBuffer_r),enc_contentsquery)==(btrue | err,oo:=ok,size(buff));
  Expanded_List_Substitution(Refinement(TotBuffer_r),enc_fullquery)==(btrue | err:=ok || (size(buff) = qlen ==> rr:=yes [] not(size(buff) = qlen) ==> rr:=no));
  Expanded_List_Substitution(Refinement(TotBuffer_r),enc_emptyquery)==(btrue | err:=ok || (buff = <> ==> rr:=yes [] not(buff = <>) ==> rr:=no));
  Expanded_List_Substitution(Refinement(TotBuffer_r),enc_remove)==(btrue | buff = <> ==> err:=empty [] not(buff = <>) ==> (buff/=<> | ee,buff:=first(buff),tail(buff) || err:=ok));
  Expanded_List_Substitution(Refinement(TotBuffer_r),enc_add)==(xx: ELEM & xx: ELEM | size(buff)>=qlen ==> err:=full [] not(size(buff)>=qlen) ==> (xx: ELEM & size(buff)<qlen | buff:=buff<-xx || err:=ok));
  List_Substitution(Refinement(TotBuffer_r),enc_add)==(IF size(buff)>=qlen THEN err:=full ELSE add(xx) || err:=ok END);
  List_Substitution(Refinement(TotBuffer_r),enc_remove)==(IF buff = <> THEN err:=empty ELSE ee <-- remove || err:=ok END);
  List_Substitution(Refinement(TotBuffer_r),enc_emptyquery)==(err:=ok || rr <-- emptyquery);
  List_Substitution(Refinement(TotBuffer_r),enc_fullquery)==(err:=ok || rr <-- fullquery);
  List_Substitution(Refinement(TotBuffer_r),enc_contentsquery)==(err:=ok || oo:=size(buff))
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(TotBuffer_r))==(qlen,ELEM)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Refinement(TotBuffer_r),Machine(Buffer))==(qlen,ELEM);
  List_Instanciated_Parameters(Refinement(TotBuffer_r),Machine(Resp))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(TotBuffer_r),Machine(Buffer))==(qlen: NAT1 & ELEM: FIN(INTEGER) & not(ELEM = {}));
  List_Constraints(Refinement(TotBuffer_r))==(qlen: NAT1 & ELEM: FIN(INTEGER) & not(ELEM = {}));
  List_Context_Constraints(Refinement(TotBuffer_r))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(TotBuffer_r))==(?);
  Inherited_List_Constants(Refinement(TotBuffer_r))==(?);
  List_Constants(Refinement(TotBuffer_r))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Refinement(TotBuffer_r),ERRORS)==({ok,full,empty});
  Context_List_Enumerated(Refinement(TotBuffer_r))==(RESP);
  Context_List_Defered(Refinement(TotBuffer_r))==(?);
  Context_List_Sets(Refinement(TotBuffer_r))==(RESP);
  List_Valuable_Sets(Refinement(TotBuffer_r))==(?);
  Inherited_List_Enumerated(Refinement(TotBuffer_r))==(ERRORS);
  Inherited_List_Defered(Refinement(TotBuffer_r))==(?);
  Inherited_List_Sets(Refinement(TotBuffer_r))==(ERRORS);
  List_Enumerated(Refinement(TotBuffer_r))==(?);
  List_Defered(Refinement(TotBuffer_r))==(?);
  List_Sets(Refinement(TotBuffer_r))==(?);
  Set_Definition(Refinement(TotBuffer_r),RESP)==({yes,no})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(TotBuffer_r))==(?);
  Expanded_List_HiddenConstants(Refinement(TotBuffer_r))==(?);
  List_HiddenConstants(Refinement(TotBuffer_r))==(?);
  External_List_HiddenConstants(Refinement(TotBuffer_r))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(TotBuffer_r))==(ERRORS: FIN(INTEGER) & not(ERRORS = {}));
  Context_List_Properties(Refinement(TotBuffer_r))==(RESP: FIN(INTEGER) & not(RESP = {}));
  Inherited_List_Properties(Refinement(TotBuffer_r))==(btrue);
  List_Properties(Refinement(TotBuffer_r))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Refinement(TotBuffer_r),Machine(Resp))==(?);
  Seen_Context_List_Enumerated(Refinement(TotBuffer_r))==(?);
  Seen_Context_List_Invariant(Refinement(TotBuffer_r))==(btrue);
  Seen_Context_List_Assertions(Refinement(TotBuffer_r))==(btrue);
  Seen_Context_List_Properties(Refinement(TotBuffer_r))==(btrue);
  Seen_List_Constraints(Refinement(TotBuffer_r))==(btrue);
  Seen_List_Operations(Refinement(TotBuffer_r),Machine(Resp))==(?);
  Seen_Expanded_List_Invariant(Refinement(TotBuffer_r),Machine(Resp))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(TotBuffer_r),enc_add)==(?);
  List_ANY_Var(Refinement(TotBuffer_r),enc_remove)==(?);
  List_ANY_Var(Refinement(TotBuffer_r),enc_emptyquery)==(?);
  List_ANY_Var(Refinement(TotBuffer_r),enc_fullquery)==(?);
  List_ANY_Var(Refinement(TotBuffer_r),enc_contentsquery)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(TotBuffer_r)) == (? | ? | ? | buff | enc_add,enc_remove,enc_emptyquery,enc_fullquery,enc_contentsquery | ? | seen(Machine(Resp)),included(Machine(Buffer)) | qlen,ELEM | TotBuffer_r);
  List_Of_HiddenCst_Ids(Refinement(TotBuffer_r)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(TotBuffer_r)) == (?);
  List_Of_VisibleVar_Ids(Refinement(TotBuffer_r)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(TotBuffer_r)) == (seen(Machine(Resp)): (RESP,yes,no | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(Buffer)) == (? | ? | buff | ? | add,remove,emptyquery,fullquery,contentsquery | ? | seen(Machine(Resp)) | qlen,ELEM | Buffer);
  List_Of_HiddenCst_Ids(Machine(Buffer)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Buffer)) == (?);
  List_Of_VisibleVar_Ids(Machine(Buffer)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Buffer)) == (?: ?);
  List_Of_Ids(Machine(Resp)) == (RESP,yes,no | ? | ? | ? | ? | ? | ? | ? | Resp);
  List_Of_HiddenCst_Ids(Machine(Resp)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Resp)) == (?);
  List_Of_VisibleVar_Ids(Machine(Resp)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Resp)) == (?: ?)
END
&
THEORY ParametersEnvX IS
  Parameters(Refinement(TotBuffer_r)) == (Type(ELEM) == Prm(SetOf(atype(ELEM,?,?)));Type(qlen) == Prm(btype(INTEGER,?,?)))
END
&
THEORY SetsEnvX IS
  Sets(Refinement(TotBuffer_r)) == (Type(ERRORS) == Cst(SetOf(etype(ERRORS,0,2))))
END
&
THEORY ConstantsEnvX IS
  Constants(Refinement(TotBuffer_r)) == (Type(empty) == Cst(etype(ERRORS,0,2));Type(full) == Cst(etype(ERRORS,0,2));Type(ok) == Cst(etype(ERRORS,0,2)))
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(TotBuffer_r)) == (Type(buff) == Mvl(SetOf(btype(INTEGER,?,?)*atype(ELEM,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(TotBuffer_r)) == (Type(enc_contentsquery) == Cst(etype(ERRORS,?,?)*btype(INTEGER,0,qlen),No_type);Type(enc_fullquery) == Cst(etype(ERRORS,?,?)*etype(RESP,?,?),No_type);Type(enc_emptyquery) == Cst(etype(ERRORS,?,?)*etype(RESP,?,?),No_type);Type(enc_remove) == Cst(etype(ERRORS,?,?)*atype(ELEM,?,?),No_type);Type(enc_add) == Cst(etype(ERRORS,?,?),atype(ELEM,?,?)))
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
