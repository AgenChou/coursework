Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(TotBuffer))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(TotBuffer))==(Machine(TotBuffer));
  Level(Machine(TotBuffer))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(TotBuffer)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(TotBuffer))==(Resp)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(TotBuffer))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(TotBuffer))==(?);
  List_Includes(Machine(TotBuffer))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(TotBuffer))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(TotBuffer))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(TotBuffer))==(?);
  Context_List_Variables(Machine(TotBuffer))==(?);
  Abstract_List_Variables(Machine(TotBuffer))==(?);
  Local_List_Variables(Machine(TotBuffer))==(?);
  List_Variables(Machine(TotBuffer))==(?);
  External_List_Variables(Machine(TotBuffer))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(TotBuffer))==(?);
  Abstract_List_VisibleVariables(Machine(TotBuffer))==(?);
  External_List_VisibleVariables(Machine(TotBuffer))==(?);
  Expanded_List_VisibleVariables(Machine(TotBuffer))==(?);
  List_VisibleVariables(Machine(TotBuffer))==(?);
  Internal_List_VisibleVariables(Machine(TotBuffer))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(TotBuffer))==(btrue);
  Gluing_List_Invariant(Machine(TotBuffer))==(btrue);
  Expanded_List_Invariant(Machine(TotBuffer))==(btrue);
  Abstract_List_Invariant(Machine(TotBuffer))==(btrue);
  Context_List_Invariant(Machine(TotBuffer))==(btrue);
  List_Invariant(Machine(TotBuffer))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(TotBuffer))==(btrue);
  Abstract_List_Assertions(Machine(TotBuffer))==(btrue);
  Context_List_Assertions(Machine(TotBuffer))==(btrue);
  List_Assertions(Machine(TotBuffer))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(TotBuffer))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(TotBuffer))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(TotBuffer))==(skip);
  Context_List_Initialisation(Machine(TotBuffer))==(skip);
  List_Initialisation(Machine(TotBuffer))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(TotBuffer))==(qlen,ELEM)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(TotBuffer),Machine(Resp))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(TotBuffer))==(btrue);
  List_Constraints(Machine(TotBuffer))==(qlen: NAT1 & ELEM: FIN(INTEGER) & not(ELEM = {}))
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(TotBuffer))==(enc_add,enc_remove,enc_emptyquery,enc_fullquery,enc_contentsquery);
  List_Operations(Machine(TotBuffer))==(enc_add,enc_remove,enc_emptyquery,enc_fullquery,enc_contentsquery)
END
&
THEORY ListInputX IS
  List_Input(Machine(TotBuffer),enc_add)==(xx);
  List_Input(Machine(TotBuffer),enc_remove)==(?);
  List_Input(Machine(TotBuffer),enc_emptyquery)==(?);
  List_Input(Machine(TotBuffer),enc_fullquery)==(?);
  List_Input(Machine(TotBuffer),enc_contentsquery)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(TotBuffer),enc_add)==(err);
  List_Output(Machine(TotBuffer),enc_remove)==(err,ee);
  List_Output(Machine(TotBuffer),enc_emptyquery)==(err,rr);
  List_Output(Machine(TotBuffer),enc_fullquery)==(err,rr);
  List_Output(Machine(TotBuffer),enc_contentsquery)==(err,oo)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(TotBuffer),enc_add)==(err <-- enc_add(xx));
  List_Header(Machine(TotBuffer),enc_remove)==(err,ee <-- enc_remove);
  List_Header(Machine(TotBuffer),enc_emptyquery)==(err,rr <-- enc_emptyquery);
  List_Header(Machine(TotBuffer),enc_fullquery)==(err,rr <-- enc_fullquery);
  List_Header(Machine(TotBuffer),enc_contentsquery)==(err,oo <-- enc_contentsquery)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(TotBuffer),enc_add)==(xx: ELEM);
  List_Precondition(Machine(TotBuffer),enc_remove)==(btrue);
  List_Precondition(Machine(TotBuffer),enc_emptyquery)==(btrue);
  List_Precondition(Machine(TotBuffer),enc_fullquery)==(btrue);
  List_Precondition(Machine(TotBuffer),enc_contentsquery)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(TotBuffer),enc_contentsquery)==(btrue | @(err$0).(err$0: ERRORS ==> err:=err$0) || @(oo$0).(oo$0: 0..qlen ==> oo:=oo$0));
  Expanded_List_Substitution(Machine(TotBuffer),enc_fullquery)==(btrue | @(err$0).(err$0: ERRORS ==> err:=err$0) || @(rr$0).(rr$0: RESP ==> rr:=rr$0));
  Expanded_List_Substitution(Machine(TotBuffer),enc_emptyquery)==(btrue | @(err$0).(err$0: ERRORS ==> err:=err$0) || @(rr$0).(rr$0: RESP ==> rr:=rr$0));
  Expanded_List_Substitution(Machine(TotBuffer),enc_remove)==(btrue | @(err$0).(err$0: ERRORS ==> err:=err$0) || @(ee$0).(ee$0: ELEM ==> ee:=ee$0));
  Expanded_List_Substitution(Machine(TotBuffer),enc_add)==(xx: ELEM | @(err$0).(err$0: ERRORS ==> err:=err$0));
  List_Substitution(Machine(TotBuffer),enc_add)==(err:: ERRORS);
  List_Substitution(Machine(TotBuffer),enc_remove)==(err:: ERRORS || ee:: ELEM);
  List_Substitution(Machine(TotBuffer),enc_emptyquery)==(err:: ERRORS || rr:: RESP);
  List_Substitution(Machine(TotBuffer),enc_fullquery)==(err:: ERRORS || rr:: RESP);
  List_Substitution(Machine(TotBuffer),enc_contentsquery)==(err:: ERRORS || oo:: 0..qlen)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(TotBuffer))==(?);
  Inherited_List_Constants(Machine(TotBuffer))==(?);
  List_Constants(Machine(TotBuffer))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(TotBuffer),RESP)==({yes,no});
  Context_List_Enumerated(Machine(TotBuffer))==(RESP);
  Context_List_Defered(Machine(TotBuffer))==(?);
  Context_List_Sets(Machine(TotBuffer))==(RESP);
  List_Valuable_Sets(Machine(TotBuffer))==(?);
  Inherited_List_Enumerated(Machine(TotBuffer))==(?);
  Inherited_List_Defered(Machine(TotBuffer))==(?);
  Inherited_List_Sets(Machine(TotBuffer))==(?);
  List_Enumerated(Machine(TotBuffer))==(ERRORS);
  List_Defered(Machine(TotBuffer))==(?);
  List_Sets(Machine(TotBuffer))==(ERRORS);
  Set_Definition(Machine(TotBuffer),ERRORS)==({ok,full,empty})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(TotBuffer))==(?);
  Expanded_List_HiddenConstants(Machine(TotBuffer))==(?);
  List_HiddenConstants(Machine(TotBuffer))==(?);
  External_List_HiddenConstants(Machine(TotBuffer))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(TotBuffer))==(btrue);
  Context_List_Properties(Machine(TotBuffer))==(RESP: FIN(INTEGER) & not(RESP = {}));
  Inherited_List_Properties(Machine(TotBuffer))==(btrue);
  List_Properties(Machine(TotBuffer))==(ERRORS: FIN(INTEGER) & not(ERRORS = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(TotBuffer),Machine(Resp))==(?);
  Seen_Context_List_Enumerated(Machine(TotBuffer))==(?);
  Seen_Context_List_Invariant(Machine(TotBuffer))==(btrue);
  Seen_Context_List_Assertions(Machine(TotBuffer))==(btrue);
  Seen_Context_List_Properties(Machine(TotBuffer))==(btrue);
  Seen_List_Constraints(Machine(TotBuffer))==(btrue);
  Seen_List_Operations(Machine(TotBuffer),Machine(Resp))==(?);
  Seen_Expanded_List_Invariant(Machine(TotBuffer),Machine(Resp))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(TotBuffer),enc_add)==(?);
  List_ANY_Var(Machine(TotBuffer),enc_remove)==(?);
  List_ANY_Var(Machine(TotBuffer),enc_emptyquery)==(?);
  List_ANY_Var(Machine(TotBuffer),enc_fullquery)==(?);
  List_ANY_Var(Machine(TotBuffer),enc_contentsquery)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(TotBuffer)) == (ERRORS,ok,full,empty | ? | ? | ? | enc_add,enc_remove,enc_emptyquery,enc_fullquery,enc_contentsquery | ? | seen(Machine(Resp)) | qlen,ELEM | TotBuffer);
  List_Of_HiddenCst_Ids(Machine(TotBuffer)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(TotBuffer)) == (?);
  List_Of_VisibleVar_Ids(Machine(TotBuffer)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(TotBuffer)) == (?: ?);
  List_Of_Ids(Machine(Resp)) == (RESP,yes,no | ? | ? | ? | ? | ? | ? | ? | Resp);
  List_Of_HiddenCst_Ids(Machine(Resp)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Resp)) == (?);
  List_Of_VisibleVar_Ids(Machine(Resp)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Resp)) == (?: ?)
END
&
THEORY ParametersEnvX IS
  Parameters(Machine(TotBuffer)) == (Type(ELEM) == Prm(SetOf(atype(ELEM,?,?)));Type(qlen) == Prm(btype(INTEGER,?,?)))
END
&
THEORY SetsEnvX IS
  Sets(Machine(TotBuffer)) == (Type(ERRORS) == Cst(SetOf(etype(ERRORS,0,2))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(TotBuffer)) == (Type(ok) == Cst(etype(ERRORS,0,2));Type(full) == Cst(etype(ERRORS,0,2));Type(empty) == Cst(etype(ERRORS,0,2)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(TotBuffer)) == (Type(enc_contentsquery) == Cst(etype(ERRORS,?,?)*btype(INTEGER,0,qlen),No_type);Type(enc_fullquery) == Cst(etype(ERRORS,?,?)*etype(RESP,?,?),No_type);Type(enc_emptyquery) == Cst(etype(ERRORS,?,?)*etype(RESP,?,?),No_type);Type(enc_remove) == Cst(etype(ERRORS,?,?)*atype(ELEM,?,?),No_type);Type(enc_add) == Cst(etype(ERRORS,?,?),atype(ELEM,?,?)));
  Observers(Machine(TotBuffer)) == (Type(enc_contentsquery) == Cst(etype(ERRORS,?,?)*btype(INTEGER,0,qlen),No_type);Type(enc_fullquery) == Cst(etype(ERRORS,?,?)*etype(RESP,?,?),No_type);Type(enc_emptyquery) == Cst(etype(ERRORS,?,?)*etype(RESP,?,?),No_type);Type(enc_remove) == Cst(etype(ERRORS,?,?)*atype(ELEM,?,?),No_type);Type(enc_add) == Cst(etype(ERRORS,?,?),atype(ELEM,?,?)))
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
