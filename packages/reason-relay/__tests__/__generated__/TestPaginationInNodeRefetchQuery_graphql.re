/* @generated */

type enum_OnlineStatus = [
  | `Idle
  | `Offline
  | `Online
  | `FutureAddedValue(string)
];

let unwrap_enum_OnlineStatus: string => enum_OnlineStatus =
  fun
  | "Idle" => `Idle
  | "Offline" => `Offline
  | "Online" => `Online
  | v => `FutureAddedValue(v);

let wrap_enum_OnlineStatus: enum_OnlineStatus => string =
  fun
  | `Idle => "Idle"
  | `Offline => "Offline"
  | `Online => "Online"
  | `FutureAddedValue(v) => v;

module Types = {
  type response_node = {
    getFragmentRef_TestPaginationInNode_query:
      unit => TestPaginationInNode_query_graphql.t,
  };

  type response = {node: option(response_node)};
  type rawResponse = response;
  type refetchVariables = {
    onlineStatuses:
      option(
        array([ | `Idle | `Offline | `Online | `FutureAddedValue(string)]),
      ),
    count: option(int),
    cursor: option(string),
    id: option(string),
  };
  let makeRefetchVariables =
      (~onlineStatuses=?, ~count=?, ~cursor=?, ~id=?, ()): refetchVariables => {
    onlineStatuses,
    count,
    cursor,
    id,
  };
  type variables = {
    onlineStatuses:
      option(
        array([ | `Idle | `Offline | `Online | `FutureAddedValue(string)]),
      ),
    count: option(int),
    cursor: option(string),
    id: string,
  };
};

module Internal = {
  type responseRaw;
  let responseConverter: Js.Dict.t(Js.Dict.t(Js.Dict.t(string))) = [%raw
    {json| {"__root":{"node":{"n":"","f":"TestPaginationInNode_query"}}} |json}
  ];
  let responseConverterMap = ();
  let convertResponse = v =>
    v
    ->ReasonRelay._convertObj(
        responseConverter,
        responseConverterMap,
        Js.undefined,
      );

  type rawResponseRaw = responseRaw;
  let convertRawResponse = convertResponse;

  let variablesConverter: Js.Dict.t(Js.Dict.t(Js.Dict.t(string))) = [%raw
    {json| {"__root":{"onlineStatuses":{"n":"","e":"enum_OnlineStatus"},"count":{"n":""},"cursor":{"n":""}}} |json}
  ];
  let variablesConverterMap = {"enum_OnlineStatus": wrap_enum_OnlineStatus};
  let convertVariables = v =>
    v
    ->ReasonRelay._convertObj(
        variablesConverter,
        variablesConverterMap,
        Js.undefined,
      );
};

type preloadToken;

module Utils = {
  open Types;
  let makeVariables =
      (~onlineStatuses=?, ~count=?, ~cursor=?, ~id, ()): variables => {
    onlineStatuses,
    count,
    cursor,
    id,
  };
};

type operationType = ReasonRelay.queryNode;

let node: operationType = [%raw
  {json| (function(){
var v0 = [
  {
    "kind": "LocalArgument",
    "name": "onlineStatuses",
    "type": "[OnlineStatus!]",
    "defaultValue": null
  },
  {
    "kind": "LocalArgument",
    "name": "count",
    "type": "Int",
    "defaultValue": 2
  },
  {
    "kind": "LocalArgument",
    "name": "cursor",
    "type": "String",
    "defaultValue": ""
  },
  {
    "kind": "LocalArgument",
    "name": "id",
    "type": "ID!",
    "defaultValue": null
  }
],
v1 = [
  {
    "kind": "Variable",
    "name": "id",
    "variableName": "id"
  }
],
v2 = {
  "kind": "ScalarField",
  "alias": null,
  "name": "__typename",
  "args": null,
  "storageKey": null
},
v3 = {
  "kind": "ScalarField",
  "alias": null,
  "name": "id",
  "args": null,
  "storageKey": null
},
v4 = [
  {
    "kind": "Variable",
    "name": "after",
    "variableName": "cursor"
  },
  {
    "kind": "Variable",
    "name": "first",
    "variableName": "count"
  },
  {
    "kind": "Variable",
    "name": "statuses",
    "variableName": "onlineStatuses"
  }
];
return {
  "kind": "Request",
  "fragment": {
    "kind": "Fragment",
    "name": "TestPaginationInNodeRefetchQuery",
    "type": "Query",
    "metadata": null,
    "argumentDefinitions": (v0/*: any*/),
    "selections": [
      {
        "kind": "LinkedField",
        "alias": null,
        "name": "node",
        "storageKey": null,
        "args": (v1/*: any*/),
        "concreteType": null,
        "plural": false,
        "selections": [
          {
            "kind": "FragmentSpread",
            "name": "TestPaginationInNode_query",
            "args": [
              {
                "kind": "Variable",
                "name": "count",
                "variableName": "count"
              },
              {
                "kind": "Variable",
                "name": "cursor",
                "variableName": "cursor"
              },
              {
                "kind": "Variable",
                "name": "onlineStatuses",
                "variableName": "onlineStatuses"
              }
            ]
          }
        ]
      }
    ]
  },
  "operation": {
    "kind": "Operation",
    "name": "TestPaginationInNodeRefetchQuery",
    "argumentDefinitions": (v0/*: any*/),
    "selections": [
      {
        "kind": "LinkedField",
        "alias": null,
        "name": "node",
        "storageKey": null,
        "args": (v1/*: any*/),
        "concreteType": null,
        "plural": false,
        "selections": [
          (v2/*: any*/),
          (v3/*: any*/),
          {
            "kind": "InlineFragment",
            "type": "User",
            "selections": [
              {
                "kind": "LinkedField",
                "alias": null,
                "name": "friendsConnection",
                "storageKey": null,
                "args": (v4/*: any*/),
                "concreteType": "UserConnection",
                "plural": false,
                "selections": [
                  {
                    "kind": "LinkedField",
                    "alias": null,
                    "name": "edges",
                    "storageKey": null,
                    "args": null,
                    "concreteType": "UserEdge",
                    "plural": true,
                    "selections": [
                      {
                        "kind": "LinkedField",
                        "alias": null,
                        "name": "node",
                        "storageKey": null,
                        "args": null,
                        "concreteType": "User",
                        "plural": false,
                        "selections": [
                          (v3/*: any*/),
                          {
                            "kind": "ScalarField",
                            "alias": null,
                            "name": "firstName",
                            "args": null,
                            "storageKey": null
                          },
                          {
                            "kind": "LinkedField",
                            "alias": null,
                            "name": "friendsConnection",
                            "storageKey": "friendsConnection(first:1)",
                            "args": [
                              {
                                "kind": "Literal",
                                "name": "first",
                                "value": 1
                              }
                            ],
                            "concreteType": "UserConnection",
                            "plural": false,
                            "selections": [
                              {
                                "kind": "ScalarField",
                                "alias": null,
                                "name": "totalCount",
                                "args": null,
                                "storageKey": null
                              }
                            ]
                          },
                          (v2/*: any*/)
                        ]
                      },
                      {
                        "kind": "ScalarField",
                        "alias": null,
                        "name": "cursor",
                        "args": null,
                        "storageKey": null
                      }
                    ]
                  },
                  {
                    "kind": "LinkedField",
                    "alias": null,
                    "name": "pageInfo",
                    "storageKey": null,
                    "args": null,
                    "concreteType": "PageInfo",
                    "plural": false,
                    "selections": [
                      {
                        "kind": "ScalarField",
                        "alias": null,
                        "name": "endCursor",
                        "args": null,
                        "storageKey": null
                      },
                      {
                        "kind": "ScalarField",
                        "alias": null,
                        "name": "hasNextPage",
                        "args": null,
                        "storageKey": null
                      }
                    ]
                  }
                ]
              },
              {
                "kind": "LinkedHandle",
                "alias": null,
                "name": "friendsConnection",
                "args": (v4/*: any*/),
                "handle": "connection",
                "key": "TestPaginationInNode_friendsConnection",
                "filters": [
                  "statuses"
                ]
              }
            ]
          }
        ]
      }
    ]
  },
  "params": {
    "operationKind": "query",
    "name": "TestPaginationInNodeRefetchQuery",
    "id": null,
    "text": "query TestPaginationInNodeRefetchQuery(\n  $onlineStatuses: [OnlineStatus!]\n  $count: Int = 2\n  $cursor: String = \"\"\n  $id: ID!\n) {\n  node(id: $id) {\n    __typename\n    ...TestPaginationInNode_query_MDTzn\n    id\n  }\n}\n\nfragment TestPaginationInNode_query_MDTzn on User {\n  friendsConnection(statuses: $onlineStatuses, first: $count, after: $cursor) {\n    edges {\n      node {\n        id\n        ...TestPaginationInNode_user\n        __typename\n      }\n      cursor\n    }\n    pageInfo {\n      endCursor\n      hasNextPage\n    }\n  }\n  id\n}\n\nfragment TestPaginationInNode_user on User {\n  id\n  firstName\n  friendsConnection(first: 1) {\n    totalCount\n  }\n}\n",
    "metadata": {
      "derivedFrom": "TestPaginationInNode_query",
      "isRefetchableQuery": true
    }
  }
};
})() |json}
];

include ReasonRelay.MakePreloadQuery({
  type variables = Types.variables;
  type queryPreloadToken = preloadToken;
  let query = node;
  let convertVariables = Internal.convertVariables;
});