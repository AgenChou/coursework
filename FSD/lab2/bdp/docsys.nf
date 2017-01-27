Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(docsys))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(docsys))==(Machine(docsys));
  Level(Machine(docsys))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(docsys)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(docsys))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(docsys))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(docsys))==(?);
  List_Includes(Machine(docsys))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(docsys))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(docsys))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(docsys))==(?);
  Context_List_Variables(Machine(docsys))==(?);
  Abstract_List_Variables(Machine(docsys))==(?);
  Local_List_Variables(Machine(docsys))==(restricted,viewing,allowed,registered);
  List_Variables(Machine(docsys))==(restricted,viewing,allowed,registered);
  External_List_Variables(Machine(docsys))==(restricted,viewing,allowed,registered)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(docsys))==(?);
  Abstract_List_VisibleVariables(Machine(docsys))==(?);
  External_List_VisibleVariables(Machine(docsys))==(?);
  Expanded_List_VisibleVariables(Machine(docsys))==(?);
  List_VisibleVariables(Machine(docsys))==(?);
  Internal_List_VisibleVariables(Machine(docsys))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(docsys))==(btrue);
  Gluing_List_Invariant(Machine(docsys))==(btrue);
  Expanded_List_Invariant(Machine(docsys))==(btrue);
  Abstract_List_Invariant(Machine(docsys))==(btrue);
  Context_List_Invariant(Machine(docsys))==(btrue);
  List_Invariant(Machine(docsys))==(registered <: PID & restricted <: DOC & allowed: registered <-> DOC & viewing: registered <-> DOC)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(docsys))==(btrue);
  Abstract_List_Assertions(Machine(docsys))==(btrue);
  Context_List_Assertions(Machine(docsys))==(btrue);
  List_Assertions(Machine(docsys))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(docsys))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(docsys))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(docsys))==(registered,allowed,viewing,restricted:={},{},{},{});
  Context_List_Initialisation(Machine(docsys))==(skip);
  List_Initialisation(Machine(docsys))==(registered:={} || allowed:={} || viewing:={} || restricted:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(docsys))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(docsys))==(btrue);
  List_Constraints(Machine(docsys))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(docsys))==(adduser,removeuser,isregistered,isallowed,listalloweddocs,listallowedusers,accessdoc,stopaccess,allowaccess,disallowaccess,allowall,addrestricted,removerestricted);
  List_Operations(Machine(docsys))==(adduser,removeuser,isregistered,isallowed,listalloweddocs,listallowedusers,accessdoc,stopaccess,allowaccess,disallowaccess,allowall,addrestricted,removerestricted)
END
&
THEORY ListInputX IS
  List_Input(Machine(docsys),adduser)==(pid);
  List_Input(Machine(docsys),removeuser)==(pid);
  List_Input(Machine(docsys),isregistered)==(pid);
  List_Input(Machine(docsys),isallowed)==(pid,doc);
  List_Input(Machine(docsys),listalloweddocs)==(pid);
  List_Input(Machine(docsys),listallowedusers)==(doc);
  List_Input(Machine(docsys),accessdoc)==(pid,doc);
  List_Input(Machine(docsys),stopaccess)==(pid,doc);
  List_Input(Machine(docsys),allowaccess)==(pid,doc);
  List_Input(Machine(docsys),disallowaccess)==(pid,doc);
  List_Input(Machine(docsys),allowall)==(doc);
  List_Input(Machine(docsys),addrestricted)==(doc);
  List_Input(Machine(docsys),removerestricted)==(doc)
END
&
THEORY ListOutputX IS
  List_Output(Machine(docsys),adduser)==(?);
  List_Output(Machine(docsys),removeuser)==(?);
  List_Output(Machine(docsys),isregistered)==(check);
  List_Output(Machine(docsys),isallowed)==(check);
  List_Output(Machine(docsys),listalloweddocs)==(docs);
  List_Output(Machine(docsys),listallowedusers)==(pids);
  List_Output(Machine(docsys),accessdoc)==(?);
  List_Output(Machine(docsys),stopaccess)==(?);
  List_Output(Machine(docsys),allowaccess)==(?);
  List_Output(Machine(docsys),disallowaccess)==(?);
  List_Output(Machine(docsys),allowall)==(?);
  List_Output(Machine(docsys),addrestricted)==(?);
  List_Output(Machine(docsys),removerestricted)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(docsys),adduser)==(adduser(pid));
  List_Header(Machine(docsys),removeuser)==(removeuser(pid));
  List_Header(Machine(docsys),isregistered)==(check <-- isregistered(pid));
  List_Header(Machine(docsys),isallowed)==(check <-- isallowed(pid,doc));
  List_Header(Machine(docsys),listalloweddocs)==(docs <-- listalloweddocs(pid));
  List_Header(Machine(docsys),listallowedusers)==(pids <-- listallowedusers(doc));
  List_Header(Machine(docsys),accessdoc)==(accessdoc(pid,doc));
  List_Header(Machine(docsys),stopaccess)==(stopaccess(pid,doc));
  List_Header(Machine(docsys),allowaccess)==(allowaccess(pid,doc));
  List_Header(Machine(docsys),disallowaccess)==(disallowaccess(pid,doc));
  List_Header(Machine(docsys),allowall)==(allowall(doc));
  List_Header(Machine(docsys),addrestricted)==(addrestricted(doc));
  List_Header(Machine(docsys),removerestricted)==(removerestricted(doc))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(docsys),adduser)==(pid: PID & pid/:registered);
  List_Precondition(Machine(docsys),removeuser)==(pid: registered);
  List_Precondition(Machine(docsys),isregistered)==(pid: PID);
  List_Precondition(Machine(docsys),isallowed)==(pid: registered & doc: DOC);
  List_Precondition(Machine(docsys),listalloweddocs)==(pid: registered);
  List_Precondition(Machine(docsys),listallowedusers)==(doc: DOC);
  List_Precondition(Machine(docsys),accessdoc)==(pid: registered & doc: DOC & pid|->doc: allowed & (doc: restricted & card(ran({pid}<|allowed)/\restricted) = 0));
  List_Precondition(Machine(docsys),stopaccess)==(pid: registered & doc: DOC & pid|->doc: viewing);
  List_Precondition(Machine(docsys),allowaccess)==(pid: registered & doc: DOC & pid|->doc/:allowed);
  List_Precondition(Machine(docsys),disallowaccess)==(pid: registered & doc: DOC & pid|->doc: allowed);
  List_Precondition(Machine(docsys),allowall)==(doc: DOC);
  List_Precondition(Machine(docsys),addrestricted)==(doc: DOC);
  List_Precondition(Machine(docsys),removerestricted)==(doc: restricted)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(docsys),removerestricted)==(doc: restricted | restricted:=restricted-{doc});
  Expanded_List_Substitution(Machine(docsys),addrestricted)==(doc: DOC | restricted:=restricted\/{doc});
  Expanded_List_Substitution(Machine(docsys),allowall)==(doc: DOC | allowed:=allowed\/registered*{doc});
  Expanded_List_Substitution(Machine(docsys),disallowaccess)==(pid: registered & doc: DOC & pid|->doc: allowed | allowed:=allowed-{pid|->doc});
  Expanded_List_Substitution(Machine(docsys),allowaccess)==(pid: registered & doc: DOC & pid|->doc/:allowed | allowed:=allowed\/{pid|->doc});
  Expanded_List_Substitution(Machine(docsys),stopaccess)==(pid: registered & doc: DOC & pid|->doc: viewing | viewing:=viewing-{pid|->doc});
  Expanded_List_Substitution(Machine(docsys),accessdoc)==(pid: registered & doc: DOC & pid|->doc: allowed & (doc: restricted & card(ran({pid}<|allowed)/\restricted) = 0) | viewing:=viewing\/{pid|->doc});
  Expanded_List_Substitution(Machine(docsys),listallowedusers)==(doc: DOC | pids:=dom(allowed|>{doc}));
  Expanded_List_Substitution(Machine(docsys),listalloweddocs)==(pid: registered | card(ran({pid}<|viewing)/\restricted) = 0 ==> docs:=ran({pid}<|allowed) [] not(card(ran({pid}<|viewing)/\restricted) = 0) ==> docs:=ran({pid}<|allowed)-restricted\/ran({pid}<|viewing)/\restricted);
  Expanded_List_Substitution(Machine(docsys),isallowed)==(pid: registered & doc: DOC | pid|->doc/:allowed or (doc: restricted & card(ran({pid}<|viewing)/\restricted)/=0 & pid|->doc/:viewing) ==> check:=no [] not(pid|->doc/:allowed or (doc: restricted & card(ran({pid}<|viewing)/\restricted)/=0 & pid|->doc/:viewing)) ==> check:=yes);
  Expanded_List_Substitution(Machine(docsys),isregistered)==(pid: PID | pid: registered ==> check:=yes [] not(pid: registered) ==> check:=no);
  Expanded_List_Substitution(Machine(docsys),removeuser)==(pid: registered | registered:=registered-{pid});
  Expanded_List_Substitution(Machine(docsys),adduser)==(pid: PID & pid/:registered | registered:=registered\/{pid});
  List_Substitution(Machine(docsys),adduser)==(registered:=registered\/{pid});
  List_Substitution(Machine(docsys),removeuser)==(registered:=registered-{pid});
  List_Substitution(Machine(docsys),isregistered)==(IF pid: registered THEN check:=yes ELSE check:=no END);
  List_Substitution(Machine(docsys),isallowed)==(IF pid|->doc/:allowed or (doc: restricted & card(ran({pid}<|viewing)/\restricted)/=0 & pid|->doc/:viewing) THEN check:=no ELSE check:=yes END);
  List_Substitution(Machine(docsys),listalloweddocs)==(IF card(ran({pid}<|viewing)/\restricted) = 0 THEN docs:=ran({pid}<|allowed) ELSE docs:=ran({pid}<|allowed)-restricted\/ran({pid}<|viewing)/\restricted END);
  List_Substitution(Machine(docsys),listallowedusers)==(pids:=dom(allowed|>{doc}));
  List_Substitution(Machine(docsys),accessdoc)==(viewing:=viewing\/{pid|->doc});
  List_Substitution(Machine(docsys),stopaccess)==(viewing:=viewing-{pid|->doc});
  List_Substitution(Machine(docsys),allowaccess)==(allowed:=allowed\/{pid|->doc});
  List_Substitution(Machine(docsys),disallowaccess)==(allowed:=allowed-{pid|->doc});
  List_Substitution(Machine(docsys),allowall)==(allowed:=allowed\/registered*{doc});
  List_Substitution(Machine(docsys),addrestricted)==(restricted:=restricted\/{doc});
  List_Substitution(Machine(docsys),removerestricted)==(restricted:=restricted-{doc})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(docsys))==(?);
  Inherited_List_Constants(Machine(docsys))==(?);
  List_Constants(Machine(docsys))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(docsys),PID)==(?);
  Context_List_Enumerated(Machine(docsys))==(?);
  Context_List_Defered(Machine(docsys))==(?);
  Context_List_Sets(Machine(docsys))==(?);
  List_Valuable_Sets(Machine(docsys))==(PID,DOC);
  Inherited_List_Enumerated(Machine(docsys))==(?);
  Inherited_List_Defered(Machine(docsys))==(?);
  Inherited_List_Sets(Machine(docsys))==(?);
  List_Enumerated(Machine(docsys))==(CHECK);
  List_Defered(Machine(docsys))==(PID,DOC);
  List_Sets(Machine(docsys))==(PID,DOC,CHECK);
  Set_Definition(Machine(docsys),DOC)==(?);
  Set_Definition(Machine(docsys),CHECK)==({yes,no})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(docsys))==(?);
  Expanded_List_HiddenConstants(Machine(docsys))==(?);
  List_HiddenConstants(Machine(docsys))==(?);
  External_List_HiddenConstants(Machine(docsys))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(docsys))==(btrue);
  Context_List_Properties(Machine(docsys))==(btrue);
  Inherited_List_Properties(Machine(docsys))==(btrue);
  List_Properties(Machine(docsys))==(PID: FIN(INTEGER) & not(PID = {}) & DOC: FIN(INTEGER) & not(DOC = {}) & CHECK: FIN(INTEGER) & not(CHECK = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(docsys),adduser)==(?);
  List_ANY_Var(Machine(docsys),removeuser)==(?);
  List_ANY_Var(Machine(docsys),isregistered)==(?);
  List_ANY_Var(Machine(docsys),isallowed)==(?);
  List_ANY_Var(Machine(docsys),listalloweddocs)==(?);
  List_ANY_Var(Machine(docsys),listallowedusers)==(?);
  List_ANY_Var(Machine(docsys),accessdoc)==(?);
  List_ANY_Var(Machine(docsys),stopaccess)==(?);
  List_ANY_Var(Machine(docsys),allowaccess)==(?);
  List_ANY_Var(Machine(docsys),disallowaccess)==(?);
  List_ANY_Var(Machine(docsys),allowall)==(?);
  List_ANY_Var(Machine(docsys),addrestricted)==(?);
  List_ANY_Var(Machine(docsys),removerestricted)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(docsys)) == (PID,DOC,CHECK,yes,no | ? | restricted,viewing,allowed,registered | ? | adduser,removeuser,isregistered,isallowed,listalloweddocs,listallowedusers,accessdoc,stopaccess,allowaccess,disallowaccess,allowall,addrestricted,removerestricted | ? | ? | ? | docsys);
  List_Of_HiddenCst_Ids(Machine(docsys)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(docsys)) == (?);
  List_Of_VisibleVar_Ids(Machine(docsys)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(docsys)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(docsys)) == (Type(PID) == Cst(SetOf(atype(PID,"[PID","]PID")));Type(DOC) == Cst(SetOf(atype(DOC,"[DOC","]DOC")));Type(CHECK) == Cst(SetOf(etype(CHECK,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(docsys)) == (Type(yes) == Cst(etype(CHECK,0,1));Type(no) == Cst(etype(CHECK,0,1)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(docsys)) == (Type(restricted) == Mvl(SetOf(atype(DOC,?,?)));Type(viewing) == Mvl(SetOf(atype(PID,?,?)*atype(DOC,?,?)));Type(allowed) == Mvl(SetOf(atype(PID,?,?)*atype(DOC,?,?)));Type(registered) == Mvl(SetOf(atype(PID,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(docsys)) == (Type(removerestricted) == Cst(No_type,atype(DOC,?,?));Type(addrestricted) == Cst(No_type,atype(DOC,?,?));Type(allowall) == Cst(No_type,atype(DOC,?,?));Type(disallowaccess) == Cst(No_type,atype(PID,?,?)*atype(DOC,?,?));Type(allowaccess) == Cst(No_type,atype(PID,?,?)*atype(DOC,?,?));Type(stopaccess) == Cst(No_type,atype(PID,?,?)*atype(DOC,?,?));Type(accessdoc) == Cst(No_type,atype(PID,?,?)*atype(DOC,?,?));Type(listallowedusers) == Cst(SetOf(atype(PID,?,?)),atype(DOC,?,?));Type(listalloweddocs) == Cst(SetOf(atype(DOC,?,?)),atype(PID,?,?));Type(isallowed) == Cst(etype(CHECK,?,?),atype(PID,?,?)*atype(DOC,?,?));Type(isregistered) == Cst(etype(CHECK,?,?),atype(PID,?,?));Type(removeuser) == Cst(No_type,atype(PID,?,?));Type(adduser) == Cst(No_type,atype(PID,?,?)));
  Observers(Machine(docsys)) == (Type(listallowedusers) == Cst(SetOf(atype(PID,?,?)),atype(DOC,?,?));Type(listalloweddocs) == Cst(SetOf(atype(DOC,?,?)),atype(PID,?,?));Type(isallowed) == Cst(etype(CHECK,?,?),atype(PID,?,?)*atype(DOC,?,?));Type(isregistered) == Cst(etype(CHECK,?,?),atype(PID,?,?)))
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
