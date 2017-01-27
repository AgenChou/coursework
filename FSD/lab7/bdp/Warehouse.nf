Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Warehouse))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Warehouse))==(Machine(Warehouse));
  Level(Machine(Warehouse))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Warehouse)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Warehouse))==(Items)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Warehouse))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Warehouse))==(?);
  List_Includes(Machine(Warehouse))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Warehouse))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Warehouse))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Warehouse))==(?);
  Context_List_Variables(Machine(Warehouse))==(?);
  Abstract_List_Variables(Machine(Warehouse))==(?);
  Local_List_Variables(Machine(Warehouse))==(stock);
  List_Variables(Machine(Warehouse))==(stock);
  External_List_Variables(Machine(Warehouse))==(stock)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Warehouse))==(?);
  Abstract_List_VisibleVariables(Machine(Warehouse))==(?);
  External_List_VisibleVariables(Machine(Warehouse))==(?);
  Expanded_List_VisibleVariables(Machine(Warehouse))==(?);
  List_VisibleVariables(Machine(Warehouse))==(?);
  Internal_List_VisibleVariables(Machine(Warehouse))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Warehouse))==(btrue);
  Gluing_List_Invariant(Machine(Warehouse))==(btrue);
  Expanded_List_Invariant(Machine(Warehouse))==(btrue);
  Abstract_List_Invariant(Machine(Warehouse))==(btrue);
  Context_List_Invariant(Machine(Warehouse))==(btrue);
  List_Invariant(Machine(Warehouse))==(stock: ITEM --> NAT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Warehouse))==(btrue);
  Abstract_List_Assertions(Machine(Warehouse))==(btrue);
  Context_List_Assertions(Machine(Warehouse))==(btrue);
  List_Assertions(Machine(Warehouse))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Warehouse))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Warehouse))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Warehouse))==(stock:=ITEM*{0});
  Context_List_Initialisation(Machine(Warehouse))==(skip);
  List_Initialisation(Machine(Warehouse))==(stock:=ITEM*{0})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Warehouse))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Warehouse),Machine(Items))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Warehouse))==(btrue);
  List_Constraints(Machine(Warehouse))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Warehouse))==(add_stock,remove_stock,stock_query);
  List_Operations(Machine(Warehouse))==(add_stock,remove_stock,stock_query)
END
&
THEORY ListInputX IS
  List_Input(Machine(Warehouse),add_stock)==(ii,nn);
  List_Input(Machine(Warehouse),remove_stock)==(ii,nn);
  List_Input(Machine(Warehouse),stock_query)==(ii,nn)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Warehouse),add_stock)==(?);
  List_Output(Machine(Warehouse),remove_stock)==(?);
  List_Output(Machine(Warehouse),stock_query)==(bb)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Warehouse),add_stock)==(add_stock(ii,nn));
  List_Header(Machine(Warehouse),remove_stock)==(remove_stock(ii,nn));
  List_Header(Machine(Warehouse),stock_query)==(bb <-- stock_query(ii,nn))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Warehouse),add_stock)==(ii: ITEM & nn: NAT);
  List_Precondition(Machine(Warehouse),remove_stock)==(ii: ITEM & nn: NAT);
  List_Precondition(Machine(Warehouse),stock_query)==(ii: ITEM & nn: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Warehouse),stock_query)==(ii: ITEM & nn: NAT | nn<=stock(ii) ==> bb:=TRUE [] not(nn<=stock(ii)) ==> bb:=FALSE);
  Expanded_List_Substitution(Machine(Warehouse),remove_stock)==(ii: ITEM & nn: NAT | nn<=stock(ii) ==> stock:=stock<+{ii|->stock(ii)-nn} [] not(nn<=stock(ii)) ==> skip);
  Expanded_List_Substitution(Machine(Warehouse),add_stock)==(ii: ITEM & nn: NAT | stock:=stock<+{ii|->nn});
  List_Substitution(Machine(Warehouse),add_stock)==(stock:=stock<+{ii|->nn});
  List_Substitution(Machine(Warehouse),remove_stock)==(IF nn<=stock(ii) THEN stock(ii):=stock(ii)-nn END);
  List_Substitution(Machine(Warehouse),stock_query)==(IF nn<=stock(ii) THEN bb:=TRUE ELSE bb:=FALSE END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Warehouse))==(?);
  Inherited_List_Constants(Machine(Warehouse))==(?);
  List_Constants(Machine(Warehouse))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Warehouse))==(?);
  Context_List_Defered(Machine(Warehouse))==(ITEM);
  Context_List_Sets(Machine(Warehouse))==(ITEM);
  List_Valuable_Sets(Machine(Warehouse))==(?);
  Inherited_List_Enumerated(Machine(Warehouse))==(?);
  Inherited_List_Defered(Machine(Warehouse))==(?);
  Inherited_List_Sets(Machine(Warehouse))==(?);
  List_Enumerated(Machine(Warehouse))==(?);
  List_Defered(Machine(Warehouse))==(?);
  List_Sets(Machine(Warehouse))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Warehouse))==(?);
  Expanded_List_HiddenConstants(Machine(Warehouse))==(?);
  List_HiddenConstants(Machine(Warehouse))==(?);
  External_List_HiddenConstants(Machine(Warehouse))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Warehouse))==(btrue);
  Context_List_Properties(Machine(Warehouse))==(ITEM: FIN(INTEGER) & not(ITEM = {}));
  Inherited_List_Properties(Machine(Warehouse))==(btrue);
  List_Properties(Machine(Warehouse))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Warehouse),Machine(Items))==(?);
  Seen_Context_List_Enumerated(Machine(Warehouse))==(?);
  Seen_Context_List_Invariant(Machine(Warehouse))==(btrue);
  Seen_Context_List_Assertions(Machine(Warehouse))==(btrue);
  Seen_Context_List_Properties(Machine(Warehouse))==(btrue);
  Seen_List_Constraints(Machine(Warehouse))==(btrue);
  Seen_List_Operations(Machine(Warehouse),Machine(Items))==(?);
  Seen_Expanded_List_Invariant(Machine(Warehouse),Machine(Items))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Warehouse),add_stock)==(?);
  List_ANY_Var(Machine(Warehouse),remove_stock)==(?);
  List_ANY_Var(Machine(Warehouse),stock_query)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Warehouse)) == (? | ? | stock | ? | add_stock,remove_stock,stock_query | ? | seen(Machine(Items)) | ? | Warehouse);
  List_Of_HiddenCst_Ids(Machine(Warehouse)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Warehouse)) == (?);
  List_Of_VisibleVar_Ids(Machine(Warehouse)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Warehouse)) == (?: ?);
  List_Of_Ids(Machine(Items)) == (ITEM | ? | ? | ? | ? | ? | ? | ? | Items);
  List_Of_HiddenCst_Ids(Machine(Items)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Items)) == (?);
  List_Of_VisibleVar_Ids(Machine(Items)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Items)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Warehouse)) == (Type(stock) == Mvl(SetOf(atype(ITEM,"[ITEM","]ITEM")*btype(INTEGER,0,MAXINT))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Warehouse)) == (Type(stock_query) == Cst(btype(BOOL,?,?),atype(ITEM,?,?)*btype(INTEGER,?,?));Type(remove_stock) == Cst(No_type,atype(ITEM,?,?)*btype(INTEGER,?,?));Type(add_stock) == Cst(No_type,atype(ITEM,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(Warehouse)) == (Type(stock_query) == Cst(btype(BOOL,?,?),atype(ITEM,?,?)*btype(INTEGER,?,?)))
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
