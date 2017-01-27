Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Big_business))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Big_business))==(Machine(Big_business));
  Level(Machine(Big_business))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Big_business)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Big_business))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Big_business))==(Items)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Big_business))==(Orders,Warehouse);
  List_Includes(Machine(Big_business))==(Warehouse,Orders)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Big_business))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Big_business))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Big_business))==(?);
  Context_List_Variables(Machine(Big_business))==(?);
  Abstract_List_Variables(Machine(Big_business))==(?);
  Local_List_Variables(Machine(Big_business))==(?);
  List_Variables(Machine(Big_business))==(stock,orderamt,orderitem);
  External_List_Variables(Machine(Big_business))==(stock,orderamt,orderitem)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Big_business))==(?);
  Abstract_List_VisibleVariables(Machine(Big_business))==(?);
  External_List_VisibleVariables(Machine(Big_business))==(?);
  Expanded_List_VisibleVariables(Machine(Big_business))==(?);
  List_VisibleVariables(Machine(Big_business))==(?);
  Internal_List_VisibleVariables(Machine(Big_business))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Big_business))==(btrue);
  Gluing_List_Invariant(Machine(Big_business))==(btrue);
  Abstract_List_Invariant(Machine(Big_business))==(btrue);
  Expanded_List_Invariant(Machine(Big_business))==(stock: ITEM --> NAT & orderitem: OID +-> ITEM & orderamt: OID +-> NAT1 & dom(orderitem) = dom(orderamt));
  Context_List_Invariant(Machine(Big_business))==(btrue);
  List_Invariant(Machine(Big_business))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Big_business))==(btrue);
  Expanded_List_Assertions(Machine(Big_business))==(btrue);
  Context_List_Assertions(Machine(Big_business))==(btrue);
  List_Assertions(Machine(Big_business))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Big_business))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Big_business))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Big_business))==(stock:=ITEM*{0};orderitem,orderamt:={},{});
  Context_List_Initialisation(Machine(Big_business))==(skip);
  List_Initialisation(Machine(Big_business))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Big_business))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Big_business),Machine(Items))==(?);
  List_Instanciated_Parameters(Machine(Big_business),Machine(Warehouse))==(?);
  List_Instanciated_Parameters(Machine(Big_business),Machine(Orders))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Big_business),Machine(Orders))==(btrue);
  List_Context_Constraints(Machine(Big_business))==(btrue);
  List_Constraints(Machine(Big_business))==(btrue);
  List_Constraints(Machine(Big_business),Machine(Warehouse))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Big_business))==(dispatch,query_infeasible);
  List_Operations(Machine(Big_business))==(dispatch,query_infeasible)
END
&
THEORY ListInputX IS
  List_Input(Machine(Big_business),dispatch)==(oid);
  List_Input(Machine(Big_business),query_infeasible)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Big_business),dispatch)==(?);
  List_Output(Machine(Big_business),query_infeasible)==(infoos)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Big_business),dispatch)==(dispatch(oid));
  List_Header(Machine(Big_business),query_infeasible)==(infoos <-- query_infeasible)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Big_business),dispatch)==(oid: dom(orderitem));
  List_Precondition(Machine(Big_business),query_infeasible)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Big_business),query_infeasible)==(btrue | infoos:={oo | oo: dom(orderitem) & orderamt(oo)<stock(orderitem(oo))});
  Expanded_List_Substitution(Machine(Big_business),dispatch)==(oid: dom(orderitem) | orderamt(oid)<=stock(orderitem(oid)) ==> (oid: dom(orderitem) & orderitem(oid): ITEM & orderamt(oid): NAT | orderitem,orderamt:=orderitem-{oid|->orderitem(oid)},orderamt-{oid|->orderamt(oid)} || (orderamt(oid)<=stock(orderitem(oid)) ==> stock:=stock<+{orderitem(oid)|->stock(orderitem(oid))-orderamt(oid)} [] not(orderamt(oid)<=stock(orderitem(oid))) ==> skip)) [] not(orderamt(oid)<=stock(orderitem(oid))) ==> skip);
  List_Substitution(Machine(Big_business),dispatch)==(IF orderamt(oid)<=stock(orderitem(oid)) THEN service_order(oid) || remove_stock(orderitem(oid),orderamt(oid)) END);
  List_Substitution(Machine(Big_business),query_infeasible)==(infoos:={oo | oo: dom(orderitem) & orderamt(oo)<stock(orderitem(oo))})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Big_business))==(?);
  Inherited_List_Constants(Machine(Big_business))==(?);
  List_Constants(Machine(Big_business))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Big_business),OID)==(?);
  Context_List_Enumerated(Machine(Big_business))==(?);
  Context_List_Defered(Machine(Big_business))==(ITEM);
  Context_List_Sets(Machine(Big_business))==(ITEM);
  List_Valuable_Sets(Machine(Big_business))==(OID);
  Inherited_List_Enumerated(Machine(Big_business))==(?);
  Inherited_List_Defered(Machine(Big_business))==(OID);
  Inherited_List_Sets(Machine(Big_business))==(OID);
  List_Enumerated(Machine(Big_business))==(?);
  List_Defered(Machine(Big_business))==(?);
  List_Sets(Machine(Big_business))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Big_business))==(?);
  Expanded_List_HiddenConstants(Machine(Big_business))==(?);
  List_HiddenConstants(Machine(Big_business))==(?);
  External_List_HiddenConstants(Machine(Big_business))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Big_business))==(btrue);
  Context_List_Properties(Machine(Big_business))==(ITEM: FIN(INTEGER) & not(ITEM = {}));
  Inherited_List_Properties(Machine(Big_business))==(OID: FIN(INTEGER) & not(OID = {}));
  List_Properties(Machine(Big_business))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Big_business),dispatch)==(?);
  List_ANY_Var(Machine(Big_business),query_infeasible)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Big_business)) == (? | OID | ? | orderamt,orderitem,stock | dispatch,query_infeasible | ? | used(Machine(Items)),included(Machine(Warehouse)),included(Machine(Orders)) | ? | Big_business);
  List_Of_HiddenCst_Ids(Machine(Big_business)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Big_business)) == (?);
  List_Of_VisibleVar_Ids(Machine(Big_business)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Big_business)) == (seen(Machine(Items)): (ITEM | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(Orders)) == (OID | ? | orderamt,orderitem | ? | place_order,service_order | ? | seen(Machine(Items)) | ? | Orders);
  List_Of_HiddenCst_Ids(Machine(Orders)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Orders)) == (?);
  List_Of_VisibleVar_Ids(Machine(Orders)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Orders)) == (?: ?);
  List_Of_Ids(Machine(Items)) == (ITEM | ? | ? | ? | ? | ? | ? | ? | Items);
  List_Of_HiddenCst_Ids(Machine(Items)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Items)) == (?);
  List_Of_VisibleVar_Ids(Machine(Items)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Items)) == (?: ?);
  List_Of_Ids(Machine(Warehouse)) == (? | ? | stock | ? | add_stock,remove_stock,stock_query | ? | seen(Machine(Items)) | ? | Warehouse);
  List_Of_HiddenCst_Ids(Machine(Warehouse)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Warehouse)) == (?);
  List_Of_VisibleVar_Ids(Machine(Warehouse)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Warehouse)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Big_business)) == (Type(OID) == Cst(SetOf(atype(OID,"[OID","]OID"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Big_business)) == (Type(stock) == Mvl(SetOf(atype(ITEM,"[ITEM","]ITEM")*btype(INTEGER,0,MAXINT)));Type(orderitem) == Mvl(SetOf(atype(OID,?,?)*atype(ITEM,?,?)));Type(orderamt) == Mvl(SetOf(atype(OID,?,?)*btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Big_business)) == (Type(query_infeasible) == Cst(SetOf(atype(OID,?,?)),No_type);Type(dispatch) == Cst(No_type,atype(OID,?,?)));
  Observers(Machine(Big_business)) == (Type(query_infeasible) == Cst(SetOf(atype(OID,?,?)),No_type))
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
