Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(ordersys))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(ordersys))==(Machine(ordersys));
  Level(Machine(ordersys))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(ordersys)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(ordersys))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(ordersys))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(ordersys))==(?);
  List_Includes(Machine(ordersys))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(ordersys))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(ordersys))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(ordersys))==(?);
  Context_List_Variables(Machine(ordersys))==(?);
  Abstract_List_Variables(Machine(ordersys))==(?);
  Local_List_Variables(Machine(ordersys))==(orders);
  List_Variables(Machine(ordersys))==(orders);
  External_List_Variables(Machine(ordersys))==(orders)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(ordersys))==(?);
  Abstract_List_VisibleVariables(Machine(ordersys))==(?);
  External_List_VisibleVariables(Machine(ordersys))==(?);
  Expanded_List_VisibleVariables(Machine(ordersys))==(?);
  List_VisibleVariables(Machine(ordersys))==(?);
  Internal_List_VisibleVariables(Machine(ordersys))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(ordersys))==(btrue);
  Gluing_List_Invariant(Machine(ordersys))==(btrue);
  Expanded_List_Invariant(Machine(ordersys))==(btrue);
  Abstract_List_Invariant(Machine(ordersys))==(btrue);
  Context_List_Invariant(Machine(ordersys))==(btrue);
  List_Invariant(Machine(ordersys))==(orders: OID +-> struct(o_cust>>NAMES,o_part>>PARTS,o_quant>>NAT1,o_disp>>BOOL) & card(orders)<=maxorders)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(ordersys))==(btrue);
  Abstract_List_Assertions(Machine(ordersys))==(btrue);
  Context_List_Assertions(Machine(ordersys))==(btrue);
  List_Assertions(Machine(ordersys))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(ordersys))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(ordersys))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(ordersys))==(orders:={});
  Context_List_Initialisation(Machine(ordersys))==(skip);
  List_Initialisation(Machine(ordersys))==(orders:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(ordersys))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(ordersys))==(btrue);
  List_Constraints(Machine(ordersys))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(ordersys))==(addorder,findorder,isvalidorder,cancelorder,dispatchorder,todispatch,numberordered);
  List_Operations(Machine(ordersys))==(addorder,findorder,isvalidorder,cancelorder,dispatchorder,todispatch,numberordered)
END
&
THEORY ListInputX IS
  List_Input(Machine(ordersys),addorder)==(cc,pp,nn);
  List_Input(Machine(ordersys),findorder)==(oo);
  List_Input(Machine(ordersys),isvalidorder)==(oo);
  List_Input(Machine(ordersys),cancelorder)==(oo);
  List_Input(Machine(ordersys),dispatchorder)==(oo);
  List_Input(Machine(ordersys),todispatch)==(?);
  List_Input(Machine(ordersys),numberordered)==(pp)
END
&
THEORY ListOutputX IS
  List_Output(Machine(ordersys),addorder)==(?);
  List_Output(Machine(ordersys),findorder)==(rr);
  List_Output(Machine(ordersys),isvalidorder)==(bb);
  List_Output(Machine(ordersys),cancelorder)==(?);
  List_Output(Machine(ordersys),dispatchorder)==(?);
  List_Output(Machine(ordersys),todispatch)==(oos);
  List_Output(Machine(ordersys),numberordered)==(nn)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(ordersys),addorder)==(addorder(cc,pp,nn));
  List_Header(Machine(ordersys),findorder)==(rr <-- findorder(oo));
  List_Header(Machine(ordersys),isvalidorder)==(bb <-- isvalidorder(oo));
  List_Header(Machine(ordersys),cancelorder)==(cancelorder(oo));
  List_Header(Machine(ordersys),dispatchorder)==(dispatchorder(oo));
  List_Header(Machine(ordersys),todispatch)==(oos <-- todispatch);
  List_Header(Machine(ordersys),numberordered)==(nn <-- numberordered(pp))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(ordersys),addorder)==(cc: NAMES & pp: PARTS & nn: NAT1 & card(orders)<maxorders);
  List_Precondition(Machine(ordersys),findorder)==(oo: dom(orders));
  List_Precondition(Machine(ordersys),isvalidorder)==(oo: OID);
  List_Precondition(Machine(ordersys),cancelorder)==(oo: dom(orders));
  List_Precondition(Machine(ordersys),dispatchorder)==(oo: dom(orders));
  List_Precondition(Machine(ordersys),todispatch)==(btrue);
  List_Precondition(Machine(ordersys),numberordered)==(pp: PARTS)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(ordersys),numberordered)==(pp: PARTS | nn:=SIGMA(zz).(zz: dom(orders) & orders(zz)'o_part = pp | orders(zz)'o_quant));
  Expanded_List_Substitution(Machine(ordersys),todispatch)==(btrue | oos:={oo | oo: dom(orders) & orders(oo)'o_disp = FALSE});
  Expanded_List_Substitution(Machine(ordersys),dispatchorder)==(oo: dom(orders) | orders:=orders<+{oo|->rec(o_cust>>orders(oo)'o_cust,o_part>>orders(oo)'o_part,o_quant>>orders(oo)'o_quant,o_disp>>TRUE)});
  Expanded_List_Substitution(Machine(ordersys),cancelorder)==(oo: dom(orders) | orders(oo)'o_disp = FALSE ==> orders:=orders-{oo|->orders(oo)} [] not(orders(oo)'o_disp = FALSE) ==> skip);
  Expanded_List_Substitution(Machine(ordersys),isvalidorder)==(oo: OID | oo/:dom(orders) ==> bb:=TRUE [] not(oo/:dom(orders)) ==> bb:=FALSE);
  Expanded_List_Substitution(Machine(ordersys),findorder)==(oo: dom(orders) | rr:=orders(oo));
  Expanded_List_Substitution(Machine(ordersys),addorder)==(cc: NAMES & pp: PARTS & nn: NAT1 & card(orders)<maxorders | @oid.(oid: OID-dom(orders) ==> orders:=orders\/{oid|->rec(o_cust>>cc,o_part>>pp,o_quant>>nn,o_disp>>FALSE)}));
  List_Substitution(Machine(ordersys),addorder)==(ANY oid WHERE oid: OID-dom(orders) THEN orders:=orders\/{oid|->rec(o_cust>>cc,o_part>>pp,o_quant>>nn,o_disp>>FALSE)} END);
  List_Substitution(Machine(ordersys),findorder)==(rr:=orders(oo));
  List_Substitution(Machine(ordersys),isvalidorder)==(IF oo/:dom(orders) THEN bb:=TRUE ELSE bb:=FALSE END);
  List_Substitution(Machine(ordersys),cancelorder)==(IF orders(oo)'o_disp = FALSE THEN orders:=orders-{oo|->orders(oo)} END);
  List_Substitution(Machine(ordersys),dispatchorder)==(orders(oo):=rec(o_cust>>orders(oo)'o_cust,o_part>>orders(oo)'o_part,o_quant>>orders(oo)'o_quant,o_disp>>TRUE));
  List_Substitution(Machine(ordersys),todispatch)==(oos:={oo | oo: dom(orders) & orders(oo)'o_disp = FALSE});
  List_Substitution(Machine(ordersys),numberordered)==(nn:=SIGMA(zz).(zz: dom(orders) & orders(zz)'o_part = pp | orders(zz)'o_quant))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(ordersys))==(maxorders);
  Inherited_List_Constants(Machine(ordersys))==(?);
  List_Constants(Machine(ordersys))==(maxorders)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(ordersys),OID)==(?);
  Context_List_Enumerated(Machine(ordersys))==(?);
  Context_List_Defered(Machine(ordersys))==(?);
  Context_List_Sets(Machine(ordersys))==(?);
  List_Valuable_Sets(Machine(ordersys))==(OID,PARTS,NAMES);
  Inherited_List_Enumerated(Machine(ordersys))==(?);
  Inherited_List_Defered(Machine(ordersys))==(?);
  Inherited_List_Sets(Machine(ordersys))==(?);
  List_Enumerated(Machine(ordersys))==(?);
  List_Defered(Machine(ordersys))==(OID,PARTS,NAMES);
  List_Sets(Machine(ordersys))==(OID,PARTS,NAMES);
  Set_Definition(Machine(ordersys),PARTS)==(?);
  Set_Definition(Machine(ordersys),NAMES)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(ordersys))==(?);
  Expanded_List_HiddenConstants(Machine(ordersys))==(?);
  List_HiddenConstants(Machine(ordersys))==(?);
  External_List_HiddenConstants(Machine(ordersys))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(ordersys))==(btrue);
  Context_List_Properties(Machine(ordersys))==(btrue);
  Inherited_List_Properties(Machine(ordersys))==(btrue);
  List_Properties(Machine(ordersys))==(maxorders: NAT1 & OID: FIN(INTEGER) & not(OID = {}) & PARTS: FIN(INTEGER) & not(PARTS = {}) & NAMES: FIN(INTEGER) & not(NAMES = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(ordersys),addorder)==(Var(oid) == atype(OID,?,?));
  List_ANY_Var(Machine(ordersys),findorder)==(?);
  List_ANY_Var(Machine(ordersys),isvalidorder)==(?);
  List_ANY_Var(Machine(ordersys),cancelorder)==(?);
  List_ANY_Var(Machine(ordersys),dispatchorder)==(?);
  List_ANY_Var(Machine(ordersys),todispatch)==(?);
  List_ANY_Var(Machine(ordersys),numberordered)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(ordersys)) == (maxorders,OID,PARTS,NAMES | ? | orders | ? | addorder,findorder,isvalidorder,cancelorder,dispatchorder,todispatch,numberordered | ? | ? | ? | ordersys);
  List_Of_HiddenCst_Ids(Machine(ordersys)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(ordersys)) == (maxorders);
  List_Of_VisibleVar_Ids(Machine(ordersys)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(ordersys)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(ordersys)) == (Type(OID) == Cst(SetOf(atype(OID,"[OID","]OID")));Type(PARTS) == Cst(SetOf(atype(PARTS,"[PARTS","]PARTS")));Type(NAMES) == Cst(SetOf(atype(NAMES,"[NAMES","]NAMES"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(ordersys)) == (Type(maxorders) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(ordersys)) == (Type(orders) == Mvl(SetOf(atype(OID,?,?)*rtype((((o_cust: atype(NAMES,?,?)),o_part: atype(PARTS,?,?)),o_quant: btype(INTEGER,?,?)),o_disp: btype(BOOL,?,?)))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(ordersys)) == (Type(numberordered) == Cst(btype(INTEGER,?,?),atype(PARTS,?,?));Type(todispatch) == Cst(SetOf(atype(OID,?,?)),No_type);Type(dispatchorder) == Cst(No_type,atype(OID,?,?));Type(cancelorder) == Cst(No_type,atype(OID,?,?));Type(isvalidorder) == Cst(btype(BOOL,?,?),atype(OID,?,?));Type(findorder) == Cst(rtype((((o_cust: atype(NAMES,?,?)),o_part: atype(PARTS,?,?)),o_quant: btype(INTEGER,?,?)),o_disp: btype(BOOL,?,?)),atype(OID,?,?));Type(addorder) == Cst(No_type,atype(NAMES,?,?)*atype(PARTS,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(ordersys)) == (Type(numberordered) == Cst(btype(INTEGER,?,?),atype(PARTS,?,?));Type(todispatch) == Cst(SetOf(atype(OID,?,?)),No_type);Type(isvalidorder) == Cst(btype(BOOL,?,?),atype(OID,?,?));Type(findorder) == Cst(rtype((((o_cust: atype(NAMES,?,?)),o_part: atype(PARTS,?,?)),o_quant: btype(INTEGER,?,?)),o_disp: btype(BOOL,?,?)),atype(OID,?,?)))
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
