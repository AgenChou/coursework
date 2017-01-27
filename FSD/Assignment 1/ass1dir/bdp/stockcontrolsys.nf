Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(stockcontrolsys))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(stockcontrolsys))==(Machine(stockcontrolsys));
  Level(Machine(stockcontrolsys))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(stockcontrolsys)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(stockcontrolsys))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(stockcontrolsys))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(stockcontrolsys))==(?);
  List_Includes(Machine(stockcontrolsys))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(stockcontrolsys))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(stockcontrolsys))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(stockcontrolsys))==(?);
  Context_List_Variables(Machine(stockcontrolsys))==(?);
  Abstract_List_Variables(Machine(stockcontrolsys))==(?);
  Local_List_Variables(Machine(stockcontrolsys))==(orders,stock);
  List_Variables(Machine(stockcontrolsys))==(orders,stock);
  External_List_Variables(Machine(stockcontrolsys))==(orders,stock)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(stockcontrolsys))==(?);
  Abstract_List_VisibleVariables(Machine(stockcontrolsys))==(?);
  External_List_VisibleVariables(Machine(stockcontrolsys))==(?);
  Expanded_List_VisibleVariables(Machine(stockcontrolsys))==(?);
  List_VisibleVariables(Machine(stockcontrolsys))==(?);
  Internal_List_VisibleVariables(Machine(stockcontrolsys))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(stockcontrolsys))==(btrue);
  Gluing_List_Invariant(Machine(stockcontrolsys))==(btrue);
  Expanded_List_Invariant(Machine(stockcontrolsys))==(btrue);
  Abstract_List_Invariant(Machine(stockcontrolsys))==(btrue);
  Context_List_Invariant(Machine(stockcontrolsys))==(btrue);
  List_Invariant(Machine(stockcontrolsys))==(stock: ITEMS --> NAT & orders: seq(ITEMS <-> NAT1) & size(orders)<=maxorders)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(stockcontrolsys))==(btrue);
  Abstract_List_Assertions(Machine(stockcontrolsys))==(btrue);
  Context_List_Assertions(Machine(stockcontrolsys))==(btrue);
  List_Assertions(Machine(stockcontrolsys))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(stockcontrolsys))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(stockcontrolsys))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(stockcontrolsys))==(orders,stock:=<>,%ii.(ii: ITEMS | 0));
  Context_List_Initialisation(Machine(stockcontrolsys))==(skip);
  List_Initialisation(Machine(stockcontrolsys))==(orders:=<> || stock:=%ii.(ii: ITEMS | 0))
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(stockcontrolsys))==(maxorders)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(stockcontrolsys))==(btrue);
  List_Constraints(Machine(stockcontrolsys))==(maxorders: NAT1)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(stockcontrolsys))==(receiveorder,receivestock,howmany,whereisitem,totordered,lowstock,oneoflowest,serviceorder,complicatedserviceorder);
  List_Operations(Machine(stockcontrolsys))==(receiveorder,receivestock,howmany,whereisitem,totordered,lowstock,oneoflowest,serviceorder,complicatedserviceorder)
END
&
THEORY ListInputX IS
  List_Input(Machine(stockcontrolsys),receiveorder)==(oo);
  List_Input(Machine(stockcontrolsys),receivestock)==(ss);
  List_Input(Machine(stockcontrolsys),howmany)==(ii);
  List_Input(Machine(stockcontrolsys),whereisitem)==(ii);
  List_Input(Machine(stockcontrolsys),totordered)==(ii);
  List_Input(Machine(stockcontrolsys),lowstock)==(nn);
  List_Input(Machine(stockcontrolsys),oneoflowest)==(?);
  List_Input(Machine(stockcontrolsys),serviceorder)==(?);
  List_Input(Machine(stockcontrolsys),complicatedserviceorder)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(stockcontrolsys),receiveorder)==(?);
  List_Output(Machine(stockcontrolsys),receivestock)==(?);
  List_Output(Machine(stockcontrolsys),howmany)==(as);
  List_Output(Machine(stockcontrolsys),whereisitem)==(oos);
  List_Output(Machine(stockcontrolsys),totordered)==(ao);
  List_Output(Machine(stockcontrolsys),lowstock)==(iis);
  List_Output(Machine(stockcontrolsys),oneoflowest)==(ii);
  List_Output(Machine(stockcontrolsys),serviceorder)==(?);
  List_Output(Machine(stockcontrolsys),complicatedserviceorder)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(stockcontrolsys),receiveorder)==(receiveorder(oo));
  List_Header(Machine(stockcontrolsys),receivestock)==(receivestock(ss));
  List_Header(Machine(stockcontrolsys),howmany)==(as <-- howmany(ii));
  List_Header(Machine(stockcontrolsys),whereisitem)==(oos <-- whereisitem(ii));
  List_Header(Machine(stockcontrolsys),totordered)==(ao <-- totordered(ii));
  List_Header(Machine(stockcontrolsys),lowstock)==(iis <-- lowstock(nn));
  List_Header(Machine(stockcontrolsys),oneoflowest)==(ii <-- oneoflowest);
  List_Header(Machine(stockcontrolsys),serviceorder)==(serviceorder);
  List_Header(Machine(stockcontrolsys),complicatedserviceorder)==(complicatedserviceorder)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(stockcontrolsys),receiveorder)==(oo: ITEMS <-> NAT1);
  List_Precondition(Machine(stockcontrolsys),receivestock)==(ss: ITEMS +-> NAT1);
  List_Precondition(Machine(stockcontrolsys),howmany)==(ii: ITEMS);
  List_Precondition(Machine(stockcontrolsys),whereisitem)==(ii: ITEMS);
  List_Precondition(Machine(stockcontrolsys),totordered)==(ii: ITEMS);
  List_Precondition(Machine(stockcontrolsys),lowstock)==(nn: NAT1);
  List_Precondition(Machine(stockcontrolsys),oneoflowest)==(btrue);
  List_Precondition(Machine(stockcontrolsys),serviceorder)==(size(orders)>0);
  List_Precondition(Machine(stockcontrolsys),complicatedserviceorder)==(size(orders)>0)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(stockcontrolsys),complicatedserviceorder)==(size(orders)>0 | @oos.(oos = {oo | oo: ran(orders) & !ii.(ii: dom(oo) => oo(ii)<=stock(ii))} ==> (card(oos)>0 ==> @nn.(nn = min(dom(orders|>oos)) ==> stock,orders:=stock<+%ii.(ii: dom(orders(nn)) | stock(ii)-orders(nn)(ii)),orders/|\nn-1^(orders\|/nn)) [] not(card(oos)>0) ==> skip)));
  Expanded_List_Substitution(Machine(stockcontrolsys),serviceorder)==(size(orders)>0 | @oo.(oo = first(orders) ==> (!ii.(ii: dom(oo) => oo(ii)<=stock(ii)) ==> stock,orders:=stock<+%ii.(ii: dom(oo) | stock(ii)-oo(ii)),tail(orders) [] not(!ii.(ii: dom(oo) => oo(ii)<=stock(ii))) ==> skip)));
  Expanded_List_Substitution(Machine(stockcontrolsys),oneoflowest)==(btrue | @xx.(xx: {ss | ss: dom(stock) & stock(ss) = min(ran(stock))} ==> ii:=xx));
  Expanded_List_Substitution(Machine(stockcontrolsys),lowstock)==(nn: NAT1 | iis:={ii | ii: ITEMS & stock(ii)<nn});
  Expanded_List_Substitution(Machine(stockcontrolsys),totordered)==(ii: ITEMS | ao:=SIGMA(oo).(oo: ran(orders) & ii: dom(oo) | oo(ii)));
  Expanded_List_Substitution(Machine(stockcontrolsys),whereisitem)==(ii: ITEMS | oos:={oo | oo: ran(orders) & ii: dom(oo)});
  Expanded_List_Substitution(Machine(stockcontrolsys),howmany)==(ii: ITEMS | as:=stock(ii));
  Expanded_List_Substitution(Machine(stockcontrolsys),receivestock)==(ss: ITEMS +-> NAT1 | stock:=stock<+%xx.(xx: dom(ss) | stock(xx)+ss(xx)));
  Expanded_List_Substitution(Machine(stockcontrolsys),receiveorder)==(oo: ITEMS <-> NAT1 | size(orders)<maxorders ==> orders:=orders<-oo [] not(size(orders)<maxorders) ==> skip);
  List_Substitution(Machine(stockcontrolsys),receiveorder)==(IF size(orders)<maxorders THEN orders:=orders<-oo END);
  List_Substitution(Machine(stockcontrolsys),receivestock)==(stock:=stock<+%xx.(xx: dom(ss) | stock(xx)+ss(xx)));
  List_Substitution(Machine(stockcontrolsys),howmany)==(as:=stock(ii));
  List_Substitution(Machine(stockcontrolsys),whereisitem)==(oos:={oo | oo: ran(orders) & ii: dom(oo)});
  List_Substitution(Machine(stockcontrolsys),totordered)==(ao:=SIGMA(oo).(oo: ran(orders) & ii: dom(oo) | oo(ii)));
  List_Substitution(Machine(stockcontrolsys),lowstock)==(iis:={ii | ii: ITEMS & stock(ii)<nn});
  List_Substitution(Machine(stockcontrolsys),oneoflowest)==(ANY xx WHERE xx: {ss | ss: dom(stock) & stock(ss) = min(ran(stock))} THEN ii:=xx END);
  List_Substitution(Machine(stockcontrolsys),serviceorder)==(LET oo BE oo = first(orders) IN IF !ii.(ii: dom(oo) => oo(ii)<=stock(ii)) THEN stock:=stock<+%ii.(ii: dom(oo) | stock(ii)-oo(ii)) || orders:=tail(orders) END END);
  List_Substitution(Machine(stockcontrolsys),complicatedserviceorder)==(LET oos BE oos = {oo | oo: ran(orders) & !ii.(ii: dom(oo) => oo(ii)<=stock(ii))} IN IF card(oos)>0 THEN LET nn BE nn = min(dom(orders|>oos)) IN stock:=stock<+%ii.(ii: dom(orders(nn)) | stock(ii)-orders(nn)(ii)) || orders:=orders/|\nn-1^(orders\|/nn) END END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(stockcontrolsys))==(?);
  Inherited_List_Constants(Machine(stockcontrolsys))==(?);
  List_Constants(Machine(stockcontrolsys))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(stockcontrolsys),ITEMS)==(?);
  Context_List_Enumerated(Machine(stockcontrolsys))==(?);
  Context_List_Defered(Machine(stockcontrolsys))==(?);
  Context_List_Sets(Machine(stockcontrolsys))==(?);
  List_Valuable_Sets(Machine(stockcontrolsys))==(ITEMS);
  Inherited_List_Enumerated(Machine(stockcontrolsys))==(?);
  Inherited_List_Defered(Machine(stockcontrolsys))==(?);
  Inherited_List_Sets(Machine(stockcontrolsys))==(?);
  List_Enumerated(Machine(stockcontrolsys))==(?);
  List_Defered(Machine(stockcontrolsys))==(ITEMS);
  List_Sets(Machine(stockcontrolsys))==(ITEMS)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(stockcontrolsys))==(?);
  Expanded_List_HiddenConstants(Machine(stockcontrolsys))==(?);
  List_HiddenConstants(Machine(stockcontrolsys))==(?);
  External_List_HiddenConstants(Machine(stockcontrolsys))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(stockcontrolsys))==(btrue);
  Context_List_Properties(Machine(stockcontrolsys))==(btrue);
  Inherited_List_Properties(Machine(stockcontrolsys))==(btrue);
  List_Properties(Machine(stockcontrolsys))==(ITEMS: FIN(INTEGER) & not(ITEMS = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(stockcontrolsys),receiveorder)==(?);
  List_ANY_Var(Machine(stockcontrolsys),receivestock)==(?);
  List_ANY_Var(Machine(stockcontrolsys),howmany)==(?);
  List_ANY_Var(Machine(stockcontrolsys),whereisitem)==(?);
  List_ANY_Var(Machine(stockcontrolsys),totordered)==(?);
  List_ANY_Var(Machine(stockcontrolsys),lowstock)==(?);
  List_ANY_Var(Machine(stockcontrolsys),oneoflowest)==(Var(xx) == atype(ITEMS,?,?));
  List_ANY_Var(Machine(stockcontrolsys),serviceorder)==(?);
  List_ANY_Var(Machine(stockcontrolsys),complicatedserviceorder)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(stockcontrolsys)) == (ITEMS | ? | orders,stock | ? | receiveorder,receivestock,howmany,whereisitem,totordered,lowstock,oneoflowest,serviceorder,complicatedserviceorder | ? | ? | maxorders | stockcontrolsys);
  List_Of_HiddenCst_Ids(Machine(stockcontrolsys)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(stockcontrolsys)) == (?);
  List_Of_VisibleVar_Ids(Machine(stockcontrolsys)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(stockcontrolsys)) == (?: ?)
END
&
THEORY ParametersEnvX IS
  Parameters(Machine(stockcontrolsys)) == (Type(maxorders) == Prm(btype(INTEGER,?,?)))
END
&
THEORY SetsEnvX IS
  Sets(Machine(stockcontrolsys)) == (Type(ITEMS) == Cst(SetOf(atype(ITEMS,"[ITEMS","]ITEMS"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(stockcontrolsys)) == (Type(orders) == Mvl(SetOf(btype(INTEGER,?,?)*SetOf(atype(ITEMS,?,?)*btype(INTEGER,?,?))));Type(stock) == Mvl(SetOf(atype(ITEMS,"[ITEMS","]ITEMS")*btype(INTEGER,0,MAXINT))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(stockcontrolsys)) == (Type(complicatedserviceorder) == Cst(No_type,No_type);Type(serviceorder) == Cst(No_type,No_type);Type(oneoflowest) == Cst(atype(ITEMS,?,?),No_type);Type(lowstock) == Cst(SetOf(atype(ITEMS,?,?)),btype(INTEGER,?,?));Type(totordered) == Cst(btype(INTEGER,?,?),atype(ITEMS,?,?));Type(whereisitem) == Cst(SetOf(SetOf(atype(ITEMS,?,?)*btype(INTEGER,?,?))),atype(ITEMS,?,?));Type(howmany) == Cst(btype(INTEGER,?,?),atype(ITEMS,?,?));Type(receivestock) == Cst(No_type,SetOf(atype(ITEMS,?,?)*btype(INTEGER,?,?)));Type(receiveorder) == Cst(No_type,SetOf(atype(ITEMS,?,?)*btype(INTEGER,?,?))));
  Observers(Machine(stockcontrolsys)) == (Type(oneoflowest) == Cst(atype(ITEMS,?,?),No_type);Type(lowstock) == Cst(SetOf(atype(ITEMS,?,?)),btype(INTEGER,?,?));Type(totordered) == Cst(btype(INTEGER,?,?),atype(ITEMS,?,?));Type(whereisitem) == Cst(SetOf(SetOf(atype(ITEMS,?,?)*btype(INTEGER,?,?))),atype(ITEMS,?,?));Type(howmany) == Cst(btype(INTEGER,?,?),atype(ITEMS,?,?)))
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
