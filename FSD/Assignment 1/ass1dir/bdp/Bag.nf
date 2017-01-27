Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Bag))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Bag))==(Machine(Bag));
  Level(Machine(Bag))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Bag)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Bag))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Bag))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Bag))==(?);
  List_Includes(Machine(Bag))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Bag))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Bag))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Bag))==(?);
  Context_List_Variables(Machine(Bag))==(?);
  Abstract_List_Variables(Machine(Bag))==(?);
  Local_List_Variables(Machine(Bag))==(bag);
  List_Variables(Machine(Bag))==(bag);
  External_List_Variables(Machine(Bag))==(bag)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Bag))==(?);
  Abstract_List_VisibleVariables(Machine(Bag))==(?);
  External_List_VisibleVariables(Machine(Bag))==(?);
  Expanded_List_VisibleVariables(Machine(Bag))==(?);
  List_VisibleVariables(Machine(Bag))==(?);
  Internal_List_VisibleVariables(Machine(Bag))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Bag))==(btrue);
  Gluing_List_Invariant(Machine(Bag))==(btrue);
  Expanded_List_Invariant(Machine(Bag))==(btrue);
  Abstract_List_Invariant(Machine(Bag))==(btrue);
  Context_List_Invariant(Machine(Bag))==(btrue);
  List_Invariant(Machine(Bag))==(bag: ELEM +-> NAT1 & !ee.(ee: dom(bag) => bag(ee)<=cap))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Bag))==(btrue);
  Abstract_List_Assertions(Machine(Bag))==(btrue);
  Context_List_Assertions(Machine(Bag))==(btrue);
  List_Assertions(Machine(Bag))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Bag))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Bag))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Bag))==(bag:={});
  Context_List_Initialisation(Machine(Bag))==(skip);
  List_Initialisation(Machine(Bag))==(bag:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Bag))==(ELEM,cap,cost)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Bag))==(btrue);
  List_Constraints(Machine(Bag))==(cap: NAT1 & cost: ELEM --> NAT & ELEM: FIN(INTEGER) & not(ELEM = {}))
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Bag))==(addbag,rembag,contelm,totelms,isin,bagunion,outputseq,addinseq,totalcost);
  List_Operations(Machine(Bag))==(addbag,rembag,contelm,totelms,isin,bagunion,outputseq,addinseq,totalcost)
END
&
THEORY ListInputX IS
  List_Input(Machine(Bag),addbag)==(ee);
  List_Input(Machine(Bag),rembag)==(ee);
  List_Input(Machine(Bag),contelm)==(ee);
  List_Input(Machine(Bag),totelms)==(?);
  List_Input(Machine(Bag),isin)==(ee);
  List_Input(Machine(Bag),bagunion)==(bb);
  List_Input(Machine(Bag),outputseq)==(?);
  List_Input(Machine(Bag),addinseq)==(ss);
  List_Input(Machine(Bag),totalcost)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Bag),addbag)==(?);
  List_Output(Machine(Bag),rembag)==(?);
  List_Output(Machine(Bag),contelm)==(oo);
  List_Output(Machine(Bag),totelms)==(oo);
  List_Output(Machine(Bag),isin)==(bb);
  List_Output(Machine(Bag),bagunion)==(?);
  List_Output(Machine(Bag),outputseq)==(ss);
  List_Output(Machine(Bag),addinseq)==(?);
  List_Output(Machine(Bag),totalcost)==(cc)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Bag),addbag)==(addbag(ee));
  List_Header(Machine(Bag),rembag)==(rembag(ee));
  List_Header(Machine(Bag),contelm)==(oo <-- contelm(ee));
  List_Header(Machine(Bag),totelms)==(oo <-- totelms);
  List_Header(Machine(Bag),isin)==(bb <-- isin(ee));
  List_Header(Machine(Bag),bagunion)==(bagunion(bb));
  List_Header(Machine(Bag),outputseq)==(ss <-- outputseq);
  List_Header(Machine(Bag),addinseq)==(addinseq(ss));
  List_Header(Machine(Bag),totalcost)==(cc <-- totalcost)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Bag),addbag)==(ee: ELEM);
  List_Precondition(Machine(Bag),rembag)==(ee: dom(bag));
  List_Precondition(Machine(Bag),contelm)==(ee: ELEM);
  List_Precondition(Machine(Bag),totelms)==(btrue);
  List_Precondition(Machine(Bag),isin)==(ee: ELEM);
  List_Precondition(Machine(Bag),bagunion)==(bb: ELEM +-> NAT1);
  List_Precondition(Machine(Bag),outputseq)==(btrue);
  List_Precondition(Machine(Bag),addinseq)==(ss: seq(ELEM));
  List_Precondition(Machine(Bag),totalcost)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Bag),totalcost)==(btrue | cc:=SIGMA(xx).(xx: dom(bag) | cost(xx)*bag(xx)));
  Expanded_List_Substitution(Machine(Bag),addinseq)==(ss: seq(ELEM) | @add.(add = %xx.(xx: ran(ss) | card({yy | yy: dom(ss) & ss(yy) = xx})) ==> @capelems.(capelems = {ee | ee: dom(bag)/\dom(add) & bag(ee)+add(ee)>=cap} ==> bag:=dom(bag)-dom(add)<|bag\/(dom(add)-dom(bag)<|add)\/%ee.(ee: (dom(bag)/\dom(add))-capelems | bag(ee)+add(ee))\/%ee.(ee: capelems | cap))));
  Expanded_List_Substitution(Machine(Bag),outputseq)==(btrue | @ff.(ff: {seqs | seqs: seq(bag) & ran(seqs) = bag} ==> ss:=ff));
  Expanded_List_Substitution(Machine(Bag),bagunion)==(bb: ELEM +-> NAT1 | @capelems.(capelems = {ee | ee: dom(bag)/\dom(bb) & bag(ee)+bb(ee)>=cap} ==> bag:=dom(bag)-dom(bb)<|bag\/(dom(bb)-dom(bag)<|bb)\/%ee.(ee: (dom(bag)/\dom(bb))-capelems | bag(ee)+bb(ee))\/%ee.(ee: capelems | cap)));
  Expanded_List_Substitution(Machine(Bag),isin)==(ee: ELEM | ee: dom(bag) ==> bb:=TRUE [] not(ee: dom(bag)) ==> bb:=FALSE);
  Expanded_List_Substitution(Machine(Bag),totelms)==(btrue | card(dom(bag)) = 0 ==> oo:=0 [] not(card(dom(bag)) = 0) ==> oo:=SIGMA(xx).(xx: ran(bag) | xx));
  Expanded_List_Substitution(Machine(Bag),contelm)==(ee: ELEM | ee: dom(bag) ==> oo:=bag(ee) [] not(ee: dom(bag)) ==> oo:=0);
  Expanded_List_Substitution(Machine(Bag),rembag)==(ee: dom(bag) | bag(ee)>1 ==> bag:=bag<+{ee|->bag(ee)-1} [] not(bag(ee)>1) ==> bag:=bag-{ee|->1});
  Expanded_List_Substitution(Machine(Bag),addbag)==(ee: ELEM | ee: dom(bag) ==> (bag(ee)<cap ==> bag:=bag<+{ee|->bag(ee)+1} [] not(bag(ee)<cap) ==> skip) [] not(ee: dom(bag)) ==> bag:=bag\/{ee|->1});
  List_Substitution(Machine(Bag),addbag)==(IF ee: dom(bag) THEN IF bag(ee)<cap THEN bag:=bag<+{ee|->bag(ee)+1} END ELSE bag:=bag\/{ee|->1} END);
  List_Substitution(Machine(Bag),rembag)==(IF bag(ee)>1 THEN bag:=bag<+{ee|->bag(ee)-1} ELSE bag:=bag-{ee|->1} END);
  List_Substitution(Machine(Bag),contelm)==(IF ee: dom(bag) THEN oo:=bag(ee) ELSE oo:=0 END);
  List_Substitution(Machine(Bag),totelms)==(IF card(dom(bag)) = 0 THEN oo:=0 ELSE oo:=SIGMA(xx).(xx: ran(bag) | xx) END);
  List_Substitution(Machine(Bag),isin)==(IF ee: dom(bag) THEN bb:=TRUE ELSE bb:=FALSE END);
  List_Substitution(Machine(Bag),bagunion)==(LET capelems BE capelems = {ee | ee: dom(bag)/\dom(bb) & bag(ee)+bb(ee)>=cap} IN bag:=dom(bag)-dom(bb)<|bag\/(dom(bb)-dom(bag)<|bb)\/%ee.(ee: (dom(bag)/\dom(bb))-capelems | bag(ee)+bb(ee))\/%ee.(ee: capelems | cap) END);
  List_Substitution(Machine(Bag),outputseq)==(ANY ff WHERE ff: {seqs | seqs: seq(bag) & ran(seqs) = bag} THEN ss:=ff END);
  List_Substitution(Machine(Bag),addinseq)==(LET add BE add = %xx.(xx: ran(ss) | card({yy | yy: dom(ss) & ss(yy) = xx})) IN LET capelems BE capelems = {ee | ee: dom(bag)/\dom(add) & bag(ee)+add(ee)>=cap} IN bag:=dom(bag)-dom(add)<|bag\/(dom(add)-dom(bag)<|add)\/%ee.(ee: (dom(bag)/\dom(add))-capelems | bag(ee)+add(ee))\/%ee.(ee: capelems | cap) END END);
  List_Substitution(Machine(Bag),totalcost)==(cc:=SIGMA(xx).(xx: dom(bag) | cost(xx)*bag(xx)))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Bag))==(?);
  Inherited_List_Constants(Machine(Bag))==(?);
  List_Constants(Machine(Bag))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Bag))==(?);
  Context_List_Defered(Machine(Bag))==(?);
  Context_List_Sets(Machine(Bag))==(?);
  List_Valuable_Sets(Machine(Bag))==(?);
  Inherited_List_Enumerated(Machine(Bag))==(?);
  Inherited_List_Defered(Machine(Bag))==(?);
  Inherited_List_Sets(Machine(Bag))==(?);
  List_Enumerated(Machine(Bag))==(?);
  List_Defered(Machine(Bag))==(?);
  List_Sets(Machine(Bag))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Bag))==(?);
  Expanded_List_HiddenConstants(Machine(Bag))==(?);
  List_HiddenConstants(Machine(Bag))==(?);
  External_List_HiddenConstants(Machine(Bag))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Bag))==(btrue);
  Context_List_Properties(Machine(Bag))==(btrue);
  Inherited_List_Properties(Machine(Bag))==(btrue);
  List_Properties(Machine(Bag))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Bag),addbag)==(?);
  List_ANY_Var(Machine(Bag),rembag)==(?);
  List_ANY_Var(Machine(Bag),contelm)==(?);
  List_ANY_Var(Machine(Bag),totelms)==(?);
  List_ANY_Var(Machine(Bag),isin)==(?);
  List_ANY_Var(Machine(Bag),bagunion)==(?);
  List_ANY_Var(Machine(Bag),outputseq)==(Var(ff) == SetOf(btype(INTEGER,?,?)*(atype(ELEM,?,?)*btype(INTEGER,?,?))));
  List_ANY_Var(Machine(Bag),addinseq)==(?);
  List_ANY_Var(Machine(Bag),totalcost)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Bag)) == (? | ? | bag | ? | addbag,rembag,contelm,totelms,isin,bagunion,outputseq,addinseq,totalcost | ? | ? | ELEM,cap,cost | Bag);
  List_Of_HiddenCst_Ids(Machine(Bag)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Bag)) == (?);
  List_Of_VisibleVar_Ids(Machine(Bag)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Bag)) == (?: ?)
END
&
THEORY ParametersEnvX IS
  Parameters(Machine(Bag)) == (Type(cost) == Prm(SetOf(atype(ELEM,?,?)*btype(INTEGER,0,MAXINT)));Type(cap) == Prm(btype(INTEGER,?,?));Type(ELEM) == Prm(SetOf(atype(ELEM,?,?))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Bag)) == (Type(bag) == Mvl(SetOf(atype(ELEM,?,?)*btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Bag)) == (Type(totalcost) == Cst(btype(INTEGER,?,?),No_type);Type(addinseq) == Cst(No_type,SetOf(btype(INTEGER,?,?)*atype(ELEM,?,?)));Type(outputseq) == Cst(SetOf(btype(INTEGER,?,?)*(atype(ELEM,?,?)*btype(INTEGER,?,?))),No_type);Type(bagunion) == Cst(No_type,SetOf(atype(ELEM,?,?)*btype(INTEGER,?,?)));Type(isin) == Cst(btype(BOOL,?,?),atype(ELEM,?,?));Type(totelms) == Cst(btype(INTEGER,?,?),No_type);Type(contelm) == Cst(btype(INTEGER,?,?),atype(ELEM,?,?));Type(rembag) == Cst(No_type,atype(ELEM,?,?));Type(addbag) == Cst(No_type,atype(ELEM,?,?)));
  Observers(Machine(Bag)) == (Type(totalcost) == Cst(btype(INTEGER,?,?),No_type);Type(outputseq) == Cst(SetOf(btype(INTEGER,?,?)*(atype(ELEM,?,?)*btype(INTEGER,?,?))),No_type);Type(isin) == Cst(btype(BOOL,?,?),atype(ELEM,?,?));Type(totelms) == Cst(btype(INTEGER,?,?),No_type);Type(contelm) == Cst(btype(INTEGER,?,?),atype(ELEM,?,?)))
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
