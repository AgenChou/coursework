Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(example1))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(example1))==(Machine(example1));
  Level(Machine(example1))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(example1)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(example1))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(example1))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(example1))==(?);
  List_Includes(Machine(example1))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(example1))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(example1))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(example1))==(?);
  Context_List_Variables(Machine(example1))==(?);
  Abstract_List_Variables(Machine(example1))==(?);
  Local_List_Variables(Machine(example1))==(numset);
  List_Variables(Machine(example1))==(numset);
  External_List_Variables(Machine(example1))==(numset)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(example1))==(?);
  Abstract_List_VisibleVariables(Machine(example1))==(?);
  External_List_VisibleVariables(Machine(example1))==(?);
  Expanded_List_VisibleVariables(Machine(example1))==(?);
  List_VisibleVariables(Machine(example1))==(?);
  Internal_List_VisibleVariables(Machine(example1))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(example1))==(btrue);
  Gluing_List_Invariant(Machine(example1))==(btrue);
  Expanded_List_Invariant(Machine(example1))==(btrue);
  Abstract_List_Invariant(Machine(example1))==(btrue);
  Context_List_Invariant(Machine(example1))==(btrue);
  List_Invariant(Machine(example1))==(numset <: NAT1)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(example1))==(btrue);
  Abstract_List_Assertions(Machine(example1))==(btrue);
  Context_List_Assertions(Machine(example1))==(btrue);
  List_Assertions(Machine(example1))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(example1))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(example1))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(example1))==(numset:={});
  Context_List_Initialisation(Machine(example1))==(skip);
  List_Initialisation(Machine(example1))==(numset:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(example1))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(example1))==(btrue);
  List_Constraints(Machine(example1))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(example1))==(enter,remove,maximum,minimum,setsize,numberinset,is_empty,average);
  List_Operations(Machine(example1))==(enter,remove,maximum,minimum,setsize,numberinset,is_empty,average)
END
&
THEORY ListInputX IS
  List_Input(Machine(example1),enter)==(new);
  List_Input(Machine(example1),remove)==(new);
  List_Input(Machine(example1),maximum)==(?);
  List_Input(Machine(example1),minimum)==(?);
  List_Input(Machine(example1),setsize)==(?);
  List_Input(Machine(example1),numberinset)==(num);
  List_Input(Machine(example1),is_empty)==(?);
  List_Input(Machine(example1),average)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(example1),enter)==(?);
  List_Output(Machine(example1),remove)==(?);
  List_Output(Machine(example1),maximum)==(mx);
  List_Output(Machine(example1),minimum)==(mn);
  List_Output(Machine(example1),setsize)==(ssize);
  List_Output(Machine(example1),numberinset)==(is_in);
  List_Output(Machine(example1),is_empty)==(setempty);
  List_Output(Machine(example1),average)==(av)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(example1),enter)==(enter(new));
  List_Header(Machine(example1),remove)==(remove(new));
  List_Header(Machine(example1),maximum)==(mx <-- maximum);
  List_Header(Machine(example1),minimum)==(mn <-- minimum);
  List_Header(Machine(example1),setsize)==(ssize <-- setsize);
  List_Header(Machine(example1),numberinset)==(is_in <-- numberinset(num));
  List_Header(Machine(example1),is_empty)==(setempty <-- is_empty);
  List_Header(Machine(example1),average)==(av <-- average)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(example1),enter)==(new: NAT1 & new<=max_val);
  List_Precondition(Machine(example1),remove)==(new: NAT);
  List_Precondition(Machine(example1),maximum)==(numset/={});
  List_Precondition(Machine(example1),minimum)==(numset/={});
  List_Precondition(Machine(example1),setsize)==(btrue);
  List_Precondition(Machine(example1),numberinset)==(num: NAT1);
  List_Precondition(Machine(example1),is_empty)==(btrue);
  List_Precondition(Machine(example1),average)==(card(numset)>0)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(example1),average)==(card(numset)>0 | av:=SIGMA(xx).(xx: numset | xx)/card(numset));
  Expanded_List_Substitution(Machine(example1),is_empty)==(btrue | card(numset) = 0 ==> setempty:=yes [] not(card(numset) = 0) ==> setempty:=no);
  Expanded_List_Substitution(Machine(example1),numberinset)==(num: NAT1 | numset/\{num}/={} ==> is_in:=yes [] not(numset/\{num}/={}) ==> is_in:=no);
  Expanded_List_Substitution(Machine(example1),setsize)==(btrue | ssize:=card(numset));
  Expanded_List_Substitution(Machine(example1),minimum)==(numset/={} | mn:=min(numset));
  Expanded_List_Substitution(Machine(example1),maximum)==(numset/={} | mx:=max(numset));
  Expanded_List_Substitution(Machine(example1),remove)==(new: NAT | numset:=numset-{new});
  Expanded_List_Substitution(Machine(example1),enter)==(new: NAT1 & new<=max_val | numset:=numset\/{new});
  List_Substitution(Machine(example1),enter)==(numset:=numset\/{new});
  List_Substitution(Machine(example1),remove)==(numset:=numset-{new});
  List_Substitution(Machine(example1),maximum)==(mx:=max(numset));
  List_Substitution(Machine(example1),minimum)==(mn:=min(numset));
  List_Substitution(Machine(example1),setsize)==(ssize:=card(numset));
  List_Substitution(Machine(example1),numberinset)==(IF numset/\{num}/={} THEN is_in:=yes ELSE is_in:=no END);
  List_Substitution(Machine(example1),is_empty)==(IF card(numset) = 0 THEN setempty:=yes ELSE setempty:=no END);
  List_Substitution(Machine(example1),average)==(av:=SIGMA(xx).(xx: numset | xx)/card(numset))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(example1))==(max_val);
  Inherited_List_Constants(Machine(example1))==(?);
  List_Constants(Machine(example1))==(max_val)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(example1),response)==({yes,no});
  Context_List_Enumerated(Machine(example1))==(?);
  Context_List_Defered(Machine(example1))==(?);
  Context_List_Sets(Machine(example1))==(?);
  List_Valuable_Sets(Machine(example1))==(?);
  Inherited_List_Enumerated(Machine(example1))==(?);
  Inherited_List_Defered(Machine(example1))==(?);
  Inherited_List_Sets(Machine(example1))==(?);
  List_Enumerated(Machine(example1))==(response);
  List_Defered(Machine(example1))==(?);
  List_Sets(Machine(example1))==(response)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(example1))==(?);
  Expanded_List_HiddenConstants(Machine(example1))==(?);
  List_HiddenConstants(Machine(example1))==(?);
  External_List_HiddenConstants(Machine(example1))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(example1))==(btrue);
  Context_List_Properties(Machine(example1))==(btrue);
  Inherited_List_Properties(Machine(example1))==(btrue);
  List_Properties(Machine(example1))==(max_val = 99999 & response: FIN(INTEGER) & not(response = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(example1),enter)==(?);
  List_ANY_Var(Machine(example1),remove)==(?);
  List_ANY_Var(Machine(example1),maximum)==(?);
  List_ANY_Var(Machine(example1),minimum)==(?);
  List_ANY_Var(Machine(example1),setsize)==(?);
  List_ANY_Var(Machine(example1),numberinset)==(?);
  List_ANY_Var(Machine(example1),is_empty)==(?);
  List_ANY_Var(Machine(example1),average)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(example1)) == (max_val,response,yes,no | ? | numset | ? | enter,remove,maximum,minimum,setsize,numberinset,is_empty,average | ? | ? | ? | example1);
  List_Of_HiddenCst_Ids(Machine(example1)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(example1)) == (max_val);
  List_Of_VisibleVar_Ids(Machine(example1)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(example1)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(example1)) == (Type(response) == Cst(SetOf(etype(response,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(example1)) == (Type(yes) == Cst(etype(response,0,1));Type(no) == Cst(etype(response,0,1));Type(max_val) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(example1)) == (Type(numset) == Mvl(SetOf(btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(example1)) == (Type(average) == Cst(btype(INTEGER,?,?),No_type);Type(is_empty) == Cst(etype(response,?,?),No_type);Type(numberinset) == Cst(etype(response,?,?),btype(INTEGER,?,?));Type(setsize) == Cst(btype(INTEGER,?,?),No_type);Type(minimum) == Cst(btype(INTEGER,?,?),No_type);Type(maximum) == Cst(btype(INTEGER,?,?),No_type);Type(remove) == Cst(No_type,btype(INTEGER,?,?));Type(enter) == Cst(No_type,btype(INTEGER,?,?)));
  Observers(Machine(example1)) == (Type(average) == Cst(btype(INTEGER,?,?),No_type);Type(is_empty) == Cst(etype(response,?,?),No_type);Type(numberinset) == Cst(etype(response,?,?),btype(INTEGER,?,?));Type(setsize) == Cst(btype(INTEGER,?,?),No_type);Type(minimum) == Cst(btype(INTEGER,?,?),No_type);Type(maximum) == Cst(btype(INTEGER,?,?),No_type))
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
