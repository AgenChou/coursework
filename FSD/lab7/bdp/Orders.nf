Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Orders))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Orders))==(Machine(Orders));
  Level(Machine(Orders))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Orders)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Orders))==(Items)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Orders))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Orders))==(?);
  List_Includes(Machine(Orders))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Orders))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Orders))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Orders))==(?);
  Context_List_Variables(Machine(Orders))==(?);
  Abstract_List_Variables(Machine(Orders))==(?);
  Local_List_Variables(Machine(Orders))==(orderamt,orderitem);
  List_Variables(Machine(Orders))==(orderamt,orderitem);
  External_List_Variables(Machine(Orders))==(orderamt,orderitem)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Orders))==(?);
  Abstract_List_VisibleVariables(Machine(Orders))==(?);
  External_List_VisibleVariables(Machine(Orders))==(?);
  Expanded_List_VisibleVariables(Machine(Orders))==(?);
  List_VisibleVariables(Machine(Orders))==(?);
  Internal_List_VisibleVariables(Machine(Orders))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Orders))==(btrue);
  Gluing_List_Invariant(Machine(Orders))==(btrue);
  Expanded_List_Invariant(Machine(Orders))==(btrue);
  Abstract_List_Invariant(Machine(Orders))==(btrue);
  Context_List_Invariant(Machine(Orders))==(btrue);
  List_Invariant(Machine(Orders))==(orderitem: OID +-> ITEM & orderamt: OID +-> NAT1 & dom(orderitem) = dom(orderamt))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Orders))==(btrue);
  Abstract_List_Assertions(Machine(Orders))==(btrue);
  Context_List_Assertions(Machine(Orders))==(btrue);
  List_Assertions(Machine(Orders))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Orders))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Orders))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Orders))==(orderitem,orderamt:={},{});
  Context_List_Initialisation(Machine(Orders))==(skip);
  List_Initialisation(Machine(Orders))==(orderitem:={} || orderamt:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Orders))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Orders),Machine(Items))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Orders))==(btrue);
  List_Constraints(Machine(Orders))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Orders))==(place_order,service_order);
  List_Operations(Machine(Orders))==(place_order,service_order)
END
&
THEORY ListInputX IS
  List_Input(Machine(Orders),place_order)==(ii,nn);
  List_Input(Machine(Orders),service_order)==(oo)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Orders),place_order)==(?);
  List_Output(Machine(Orders),service_order)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Orders),place_order)==(place_order(ii,nn));
  List_Header(Machine(Orders),service_order)==(service_order(oo))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Orders),place_order)==(ii: ITEM & nn: NAT1);
  List_Precondition(Machine(Orders),service_order)==(oo: dom(orderitem))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Orders),service_order)==(oo: dom(orderitem) | orderitem,orderamt:=orderitem-{oo|->orderitem(oo)},orderamt-{oo|->orderamt(oo)});
  Expanded_List_Substitution(Machine(Orders),place_order)==(ii: ITEM & nn: NAT1 | @oid.(oid: OID-dom(orderitem) ==> orderitem,orderamt:=orderitem\/{oid|->ii},orderamt\/{oid|->nn}));
  List_Substitution(Machine(Orders),place_order)==(ANY oid WHERE oid: OID-dom(orderitem) THEN orderitem:=orderitem\/{oid|->ii} || orderamt:=orderamt\/{oid|->nn} END);
  List_Substitution(Machine(Orders),service_order)==(orderitem:=orderitem-{oo|->orderitem(oo)} || orderamt:=orderamt-{oo|->orderamt(oo)})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Orders))==(?);
  Inherited_List_Constants(Machine(Orders))==(?);
  List_Constants(Machine(Orders))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Orders),OID)==(?);
  Context_List_Enumerated(Machine(Orders))==(?);
  Context_List_Defered(Machine(Orders))==(ITEM);
  Context_List_Sets(Machine(Orders))==(ITEM);
  List_Valuable_Sets(Machine(Orders))==(OID);
  Inherited_List_Enumerated(Machine(Orders))==(?);
  Inherited_List_Defered(Machine(Orders))==(?);
  Inherited_List_Sets(Machine(Orders))==(?);
  List_Enumerated(Machine(Orders))==(?);
  List_Defered(Machine(Orders))==(OID);
  List_Sets(Machine(Orders))==(OID)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Orders))==(?);
  Expanded_List_HiddenConstants(Machine(Orders))==(?);
  List_HiddenConstants(Machine(Orders))==(?);
  External_List_HiddenConstants(Machine(Orders))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Orders))==(btrue);
  Context_List_Properties(Machine(Orders))==(ITEM: FIN(INTEGER) & not(ITEM = {}));
  Inherited_List_Properties(Machine(Orders))==(btrue);
  List_Properties(Machine(Orders))==(OID: FIN(INTEGER) & not(OID = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Orders),Machine(Items))==(?);
  Seen_Context_List_Enumerated(Machine(Orders))==(?);
  Seen_Context_List_Invariant(Machine(Orders))==(btrue);
  Seen_Context_List_Assertions(Machine(Orders))==(btrue);
  Seen_Context_List_Properties(Machine(Orders))==(btrue);
  Seen_List_Constraints(Machine(Orders))==(btrue);
  Seen_List_Operations(Machine(Orders),Machine(Items))==(?);
  Seen_Expanded_List_Invariant(Machine(Orders),Machine(Items))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Orders),place_order)==(Var(oid) == atype(OID,?,?));
  List_ANY_Var(Machine(Orders),service_order)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Orders)) == (OID | ? | orderamt,orderitem | ? | place_order,service_order | ? | seen(Machine(Items)) | ? | Orders);
  List_Of_HiddenCst_Ids(Machine(Orders)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Orders)) == (?);
  List_Of_VisibleVar_Ids(Machine(Orders)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Orders)) == (?: ?);
  List_Of_Ids(Machine(Items)) == (ITEM | ? | ? | ? | ? | ? | ? | ? | Items);
  List_Of_HiddenCst_Ids(Machine(Items)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Items)) == (?);
  List_Of_VisibleVar_Ids(Machine(Items)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Items)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Orders)) == (Type(OID) == Cst(SetOf(atype(OID,"[OID","]OID"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Orders)) == (Type(orderamt) == Mvl(SetOf(atype(OID,?,?)*btype(INTEGER,?,?)));Type(orderitem) == Mvl(SetOf(atype(OID,?,?)*atype(ITEM,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Orders)) == (Type(service_order) == Cst(No_type,atype(OID,?,?));Type(place_order) == Cst(No_type,atype(ITEM,?,?)*btype(INTEGER,?,?)))
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
