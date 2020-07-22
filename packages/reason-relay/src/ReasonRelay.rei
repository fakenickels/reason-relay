type arguments;
type allFieldsMasked = {.};

/**
 * Abstract helper type to signify something that could not be
 * generated in a type-safe way.
 */

type any;

/**
 * The type of the actual node that Relay uses for operations.
 */
type queryNode;
type fragmentNode;
type mutationNode;
type subscriptionNode;

/**
 * Helper to signify a wrapped fragment ref.
 */
type wrappedFragmentRef;

/**
 * The type of the id's Relay uses to identify records.
 */
type dataId;

/**
 * Helpers and types for various IDs.
 */
external dataIdToString: dataId => string = "%identity";
external makeDataId: string => dataId = "%identity";
external makeArguments: Js.t({..}) => arguments = "%identity";

[@bs.module "relay-runtime"]
external generateClientID:
  (~dataId: dataId, ~storageKey: string, ~index: int=?, unit) => dataId =
  "generateClientID";

[@bs.module "relay-runtime"]
external generateUniqueClientID: unit => dataId = "generateUniqueClientID";

[@bs.module "relay-runtime"]
external isClientID: dataId => bool = "isClientID";

/**
 * An abstract type representing all records in the store serialized to JSON in a way
 * that you can use to re-hydrate the store.
 */
type recordSourceRecords;

/**
 * Constants
 */ /**
 * The `dataId` for the Relay store's root.
 * Useful when for example referencing the `parentID` of a connection that's on the store root.
 * */
[@bs.module "relay-runtime"]
external storeRootId: dataId = "ROOT_ID";

/** The `type` for the Relay store's root `RecordProxy`. */
[@bs.module "relay-runtime"]
external storeRootType: string = "ROOT_TYPE";

let _cleanObjectFromUndefined: Js.t({..}) => Js.t({..});
let _cleanVariables: 'a => 'a;
let _convertObj:
  ('a, Js.Dict.t(Js.Dict.t(Js.Dict.t(string))), 'b, 'c) => 'd;

/**
 * Read the following section on working with the Relay store:
 * https://relay.dev/docs/en/relay-store
 */

module RecordProxy: {
  type t;

  type unsetValueType =
    | Null
    | Undefined;

  [@bs.send]
  external copyFieldsFrom: (t, ~sourceRecord: t) => unit = "copyFieldsFrom";

  [@bs.send] external getDataId: t => dataId = "getDataID";

  [@bs.send] [@bs.return nullable]
  external getLinkedRecord:
    (t, ~name: string, ~arguments: arguments=?, unit) => option(t) =
    "getLinkedRecord";

  let getLinkedRecords:
    (t, ~name: string, ~arguments: arguments=?, unit) =>
    option(array(option(t)));

  [@bs.send]
  external getOrCreateLinkedRecord:
    (t, ~name: string, ~typeName: string, ~arguments: arguments=?, unit) => t =
    "getOrCreateLinkedRecord";

  [@bs.send] external getType: t => string = "getType";

  [@bs.send] [@bs.return nullable]
  external getValueString:
    (t, ~name: string, ~arguments: arguments=?, unit) => option(string) =
    "getValue";

  let getValueStringArray:
    (t, ~name: string, ~arguments: arguments=?, unit) =>
    option(array(option(string)));

  [@bs.send] [@bs.return nullable]
  external getValueInt:
    (t, ~name: string, ~arguments: arguments=?, unit) => option(int) =
    "getValue";

  let getValueIntArray:
    (t, ~name: string, ~arguments: arguments=?, unit) =>
    option(array(option(int)));

  [@bs.send] [@bs.return nullable]
  external getValueFloat:
    (t, ~name: string, ~arguments: arguments=?, unit) => option(float) =
    "getValue";

  let getValueFloatArray:
    (t, ~name: string, ~arguments: arguments=?, unit) =>
    option(array(option(float)));

  [@bs.send] [@bs.return nullable]
  external getValueBool:
    (t, ~name: string, ~arguments: arguments=?, unit) => option(bool) =
    "getValue";

  let getValueBoolArray:
    (t, ~name: string, ~arguments: arguments=?, unit) =>
    option(array(option(bool)));

  [@bs.send]
  external setLinkedRecord:
    (t, ~record: t, ~name: string, ~arguments: arguments=?, unit) => t =
    "setLinkedRecord";

  [@bs.send]
  external setLinkedRecords:
    (
      t,
      ~records: array(option(t)),
      ~name: string,
      ~arguments: arguments=?,
      unit
    ) =>
    t =
    "setLinkedRecords";

  [@bs.send]
  external setValueString:
    (t, ~value: string, ~name: string, ~arguments: arguments=?, unit) => t =
    "setValue";

  [@bs.send]
  external setValueStringArray:
    (
      t,
      ~value: array(string),
      ~name: string,
      ~arguments: arguments=?,
      unit
    ) =>
    t =
    "setValue";

  [@bs.send]
  external setValueInt:
    (t, ~value: int, ~name: string, ~arguments: arguments=?, unit) => t =
    "setValue";

  [@bs.send]
  external setValueIntArray:
    (t, ~value: array(int), ~name: string, ~arguments: arguments=?, unit) => t =
    "setValue";

  [@bs.send]
  external setValueFloat:
    (t, ~value: float, ~name: string, ~arguments: arguments=?, unit) => t =
    "setValue";

  [@bs.send]
  external setValueFloatArray:
    (t, ~value: array(float), ~name: string, ~arguments: arguments=?, unit) =>
    t =
    "setValue";

  [@bs.send]
  external setValueBool:
    (t, ~value: bool, ~name: string, ~arguments: arguments=?, unit) => t =
    "setValue";

  [@bs.send]
  external setValueBoolArray:
    (t, ~value: array(bool), ~name: string, ~arguments: arguments=?, unit) =>
    t =
    "setValue";

  let unsetValue:
    (
      t,
      ~name: string,
      ~unsetValue: unsetValueType,
      ~arguments: arguments=?,
      unit
    ) =>
    t;

  let unsetLinkedRecord:
    (
      t,
      ~name: string,
      ~unsetValue: unsetValueType,
      ~arguments: arguments=?,
      unit
    ) =>
    t;

  let unsetLinkedRecords:
    (
      t,
      ~name: string,
      ~unsetValue: unsetValueType,
      ~arguments: arguments=?,
      unit
    ) =>
    t;

  let invalidateRecord: t => unit;
};

/**
 * RecordSourceSelectorProxy and RecordSourceProxy are the two
 * modules representing the store, with various capabilities.
 */
module RecordSourceSelectorProxy: {
  type t;

  [@bs.send]
  external create: (t, ~dataId: dataId, ~typeName: string) => RecordProxy.t =
    "create";

  [@bs.send] external delete: (t, ~dataId: dataId) => unit = "delete";

  [@bs.send] [@bs.return nullable]
  external get: (t, ~dataId: dataId) => option(RecordProxy.t) = "get";

  [@bs.send] external getRoot: t => RecordProxy.t = "getRoot";

  [@bs.send] [@bs.return nullable]
  external getRootField: (t, ~fieldName: string) => option(RecordProxy.t) =
    "getRootField";

  let getPluralRootField:
    (t, ~fieldName: string) => option(array(option(RecordProxy.t)));

  [@bs.send] external invalidateStore: t => unit = "invalidateStore";
};

module RecordSourceProxy: {
  type t;

  [@bs.send]
  external create: (t, ~dataId: dataId, ~typeName: string) => RecordProxy.t =
    "create";

  [@bs.send] external delete: (t, ~dataId: dataId) => unit = "delete";

  [@bs.send] [@bs.return nullable]
  external get: (t, ~dataId: dataId) => option(RecordProxy.t) = "get";

  [@bs.send] external getRoot: t => RecordProxy.t = "getRoot";

  [@bs.send] external invalidateStore: t => unit = "invalidateStore";
};

/**
 * https://relay.dev/docs/en/relay-store#connectionhandler
 */
module ConnectionHandler: {
  [@bs.module "relay-runtime"]
  [@bs.scope "ConnectionHandler"]
  [@bs.return nullable]
  external getConnection:
    (~record: RecordProxy.t, ~key: string, ~filters: arguments=?, unit) =>
    option(RecordProxy.t) =
    "getConnection";

  [@bs.module "relay-runtime"] [@bs.scope "ConnectionHandler"]
  external createEdge:
    (
      ~store: RecordSourceSelectorProxy.t,
      ~connection: RecordProxy.t,
      ~node: RecordProxy.t,
      ~edgeType: string
    ) =>
    RecordProxy.t =
    "createEdge";

  [@bs.module "relay-runtime"] [@bs.scope "ConnectionHandler"]
  external insertEdgeBefore:
    (
      ~connection: RecordProxy.t,
      ~newEdge: RecordProxy.t,
      ~cursor: string=?,
      unit
    ) =>
    unit =
    "insertEdgeBefore";

  [@bs.module "relay-runtime"] [@bs.scope "ConnectionHandler"]
  external insertEdgeAfter:
    (
      ~connection: RecordProxy.t,
      ~newEdge: RecordProxy.t,
      ~cursor: string=?,
      unit
    ) =>
    unit =
    "insertEdgeAfter";

  [@bs.module "relay-runtime"] [@bs.scope "ConnectionHandler"]
  external deleteNode: (~connection: RecordProxy.t, ~nodeId: dataId) => unit =
    "deleteNode";
};

/**
 * NETWORK
 */

type cacheConfig = {
  force: option(bool),
  poll: option(int),
  liveConfigId: option(string),
  transactionId: option(string),
};

/**
 * A Relay observable, used for subscriptions and a few other things.
 */
module Observable: {
  type t;

  type sink('t) = {
    next: 't => unit,
    error: Js.Exn.t => unit,
    complete: unit => unit,
    closed: bool,
  };

  type subscription = {
    unsubscribe: unit => unit,
    closed: bool,
  };

  type observer('t) = {
    start: option(subscription => unit),
    next: option('t => unit),
    error: option(Js.Exn.t => unit),
    complete: option(unit => unit),
    unsubscribe: option(subscription => unit),
  };

  let makeObserver:
    (
      ~start: subscription => unit=?,
      ~next: 't => unit=?,
      ~error: Js.Exn.t => unit=?,
      ~complete: unit => unit=?,
      ~unsubscribe: subscription => unit=?,
      unit
    ) =>
    observer('t);

  [@bs.module "relay-runtime"] [@bs.scope "Observable"]
  external make: (sink('t) => option(subscription)) => t = "create";

  [@bs.send]
  external subscribe: (t, observer('t)) => subscription = "subscribe";
};

/**
 * Represents the network layer.
 */
module Network: {
  type t;

  type operation = {
    text: string,
    name: string,
    operationKind: string,
  };

  type subscribeFn = (operation, Js.Json.t, cacheConfig) => Observable.t;

  type fetchFunctionPromise =
    (operation, Js.Json.t, cacheConfig) => Js.Promise.t(Js.Json.t);

  type fetchFunctionObservable =
    (operation, Js.Json.t, cacheConfig) => Observable.t;

  [@bs.module "relay-runtime"] [@bs.scope "Network"]
  external makePromiseBased:
    (
      ~fetchFunction: fetchFunctionPromise,
      ~subscriptionFunction: subscribeFn=?,
      unit
    ) =>
    t =
    "create";

  [@bs.module "relay-runtime"] [@bs.scope "Network"]
  external makeObservableBased:
    (
      ~observableFunction: fetchFunctionObservable,
      ~subscriptionFunction: subscribeFn=?,
      unit
    ) =>
    t =
    "create";
};

/**
 * RecordSource is the source of records used by the store.
 * Can be initiated with or without prior records; eg. hydrating
 * the store with prior data.
 */

module RecordSource: {
  type t;
  [@bs.module "relay-runtime"] [@bs.new]
  external make: (~records: recordSourceRecords=?, unit) => t = "RecordSource";
  [@bs.send] external toJSON: t => recordSourceRecords = "toJSON";
};

/**
 * The actual store module, with configuration for the store.
 */
module Store: {
  type t;
  let make: (~source: RecordSource.t, ~gcReleaseBufferSize: int=?, unit) => t;
  [@bs.send] external getSource: t => RecordSource.t = "getSource";
};

/**
 * renderPolicy controls if Relay is allowed to render partially available data or not.
 */
type renderPolicy =
  | Full // Always render the full result
  | Partial; // Allow rendering any fragments that already have the data needed

/**
 * Module representing the environment, which you'll need to use and
 * pass to various functions. Takes a few configuration options like store
 * and network layer.
 */
module Environment: {
  type t;

  let make:
    (
      ~network: Network.t,
      ~store: Store.t,
      ~getDataID: (
                    ~nodeObj: {
                                ..
                                "__typename": string,
                                "id": string,
                              } as 'a,
                    ~typeName: string
                  ) =>
                  string
                    =?,
      ~defaultRenderPolicy: renderPolicy=?,
      unit
    ) =>
    t;

  [@bs.send] external getStore: t => Store.t = "getStore";
};

/**
 * Disposable is a module you'll get back when issuing requests.
 * Disposable allow you to dispose of the request when/if you don't need
 * it anymore.
 */
module Disposable: {
  type t;
  [@bs.send] external dispose: t => unit = "dispose";
};

/**
 * fetchPolicy controls how you want Relay to resolve your data.
 */
type fetchPolicy =
  | StoreOnly // Resolve only from the store
  | StoreOrNetwork // Resolve from the store if all data is there, otherwise make a network request
  | StoreAndNetwork // Like StoreOrNetwork, but always make a request regardless of if the data was there initially or not
  | NetworkOnly; // Always make a request, discard what's in the store

let mapFetchPolicy: option(fetchPolicy) => option(string);

/**
 * Internally used functors and configs.
 * You won't need to know about these.
 */
module type MakeUseQueryConfig = {
  type responseRaw;
  type response;
  type variables;
  type preloadToken;
  let query: queryNode;
  let convertResponse: responseRaw => response;
  let convertVariables: variables => variables;
};

module MakeUseQuery:
  (C: MakeUseQueryConfig) =>
   {
    let use:
      (
        ~variables: C.variables,
        ~fetchPolicy: fetchPolicy=?,
        ~renderPolicy: renderPolicy=?,
        ~fetchKey: string=?,
        ~networkCacheConfig: cacheConfig=?,
        unit
      ) =>
      C.response;

    let fetch:
      (
        ~environment: Environment.t,
        ~variables: C.variables,
        ~onResult: Belt.Result.t(C.response, Js.Promise.error) => unit
      ) =>
      unit;

    let fetchPromised:
      (~environment: Environment.t, ~variables: C.variables) =>
      Promise.t(Belt.Result.t(C.response, Js.Promise.error));

    let usePreloaded:
      (~token: C.preloadToken, ~renderPolicy: renderPolicy=?, unit) =>
      C.response;
  };

module type MakePreloadQueryConfig = {
  type variables;
  type queryPreloadToken;
  let query: queryNode;
  let convertVariables: variables => variables;
};

module MakePreloadQuery:
  (C: MakePreloadQueryConfig) =>
   {
    let preload:
      (
        ~environment: Environment.t,
        ~variables: C.variables,
        ~fetchPolicy: fetchPolicy=?,
        ~fetchKey: string=?,
        ~networkCacheConfig: cacheConfig=?,
        unit
      ) =>
      C.queryPreloadToken;

    let preloadTokenToObservable: C.queryPreloadToken => option(Observable.t);
    let preloadTokenToPromise:
      C.queryPreloadToken => Promise.t(Belt.Result.t(unit, unit));
  };

/**
 * FRAGMENT
 */

module type MakeUseFragmentConfig = {
  type fragmentRaw;
  type fragment;
  type fragmentRef;
  let fragmentSpec: fragmentNode;
  let convertFragment: fragmentRaw => fragment;
};

module MakeUseFragment:
  (C: MakeUseFragmentConfig) =>
   {
    let use: C.fragmentRef => C.fragment;
    let useOpt: option(C.fragmentRef) => option(C.fragment);
  };

/** Refetchable */
type refetchFn('variables) =
  (
    ~variables: 'variables,
    ~fetchPolicy: fetchPolicy=?,
    ~renderPolicy: renderPolicy=?,
    ~onComplete: option(Js.Exn.t) => unit=?,
    unit
  ) =>
  unit;

module type MakeUseRefetchableFragmentConfig = {
  type fragmentRaw;
  type fragment;
  type variables;
  type fragmentRef;
  let fragmentSpec: fragmentNode;
  let convertFragment: fragmentRaw => fragment;
  let convertVariables: variables => variables;
};

module MakeUseRefetchableFragment:
  (C: MakeUseRefetchableFragmentConfig) =>
   {
    let useRefetchable:
      C.fragmentRef => (C.fragment, refetchFn(C.variables));
  };

/** Pagination */
module type MakeUsePaginationFragmentConfig = {
  type fragmentRaw;
  type fragment;
  type variables;
  type fragmentRef;
  let fragmentSpec: fragmentNode;
  let convertFragment: fragmentRaw => fragment;
  let convertVariables: variables => variables;
};

type paginationLoadMoreFn =
  (~count: int, ~onComplete: option(Js.Exn.t) => unit=?, unit) => Disposable.t;

type paginationBlockingFragmentReturn('fragmentData, 'variables) = {
  data: 'fragmentData,
  loadNext: paginationLoadMoreFn,
  loadPrevious: paginationLoadMoreFn,
  hasNext: bool,
  hasPrevious: bool,
  refetch: refetchFn('variables),
};

type paginationFragmentReturn('fragmentData, 'variables) = {
  data: 'fragmentData,
  loadNext: paginationLoadMoreFn,
  loadPrevious: paginationLoadMoreFn,
  hasNext: bool,
  hasPrevious: bool,
  isLoadingNext: bool,
  isLoadingPrevious: bool,
  refetch: refetchFn('variables),
};

module MakeUsePaginationFragment:
  (C: MakeUsePaginationFragmentConfig) =>
   {
    let useBlockingPagination:
      C.fragmentRef =>
      paginationBlockingFragmentReturn(C.fragment, C.variables);

    let usePagination:
      C.fragmentRef => paginationFragmentReturn(C.fragment, C.variables);
  };

/**
 * MUTATION
 */

module type MutationConfig = {
  type variables;
  type responseRaw;
  type response;
  type rawResponse;
  type rawResponseRaw;
  let node: mutationNode;
  let convertResponse: responseRaw => response;
  let wrapResponse: response => responseRaw;
  let convertRawResponse: rawResponseRaw => rawResponse;
  let wrapRawResponse: rawResponse => rawResponseRaw;
  let convertVariables: variables => variables;
};

type updaterFn('response) = (RecordSourceSelectorProxy.t, 'response) => unit;
type optimisticUpdaterFn = RecordSourceSelectorProxy.t => unit;

type mutationError = {message: string};

type useMutationConfig('response, 'rawResponse, 'variables) = {
  onError: option(mutationError => unit),
  onCompleted: option(('response, option(array(mutationError))) => unit),
  onUnsubscribe: option(unit => unit),
  optimisticResponse: option('rawResponse),
  optimisticUpdater: option(optimisticUpdaterFn),
  updater: option((RecordSourceSelectorProxy.t, 'response) => unit),
  variables: 'variables,
};

module MakeUseMutation:
  (C: MutationConfig) =>
   {
    let use:
      unit =>
      (
        (
          ~onError: mutationError => unit=?,
          ~onCompleted: (C.response, option(array(mutationError))) => unit=?,
          ~onUnsubscribe: unit => unit=?,
          ~optimisticResponse: C.rawResponse=?,
          ~optimisticUpdater: optimisticUpdaterFn=?,
          ~updater: (RecordSourceSelectorProxy.t, C.response) => unit=?,
          ~variables: C.variables,
          unit
        ) =>
        Disposable.t,
        bool,
      );
  };

/**
 * Context provider for the Relay environment.
 */
module Context: {
  type t;
  type contextShape = {. "environment": Environment.t};
  [@bs.module "react-relay"]
  external context: React.Context.t(option(contextShape)) =
    "ReactRelayContext";

  module Provider: {
    [@react.component]
    let make:
      (~environment: Environment.t, ~children: React.element) => React.element;
  };
};

exception EnvironmentNotFoundInContext;

/**
 * Hook for getting the current environment from context.
 */
let useEnvironmentFromContext: unit => Environment.t;

exception Mutation_failed(array(mutationError));

module MakeCommitMutation:
  (C: MutationConfig) =>
   {
    let commitMutation:
      (
        ~environment: Environment.t,
        ~variables: C.variables,
        ~optimisticUpdater: optimisticUpdaterFn=?,
        ~optimisticResponse: C.rawResponse=?,
        ~updater: (RecordSourceSelectorProxy.t, C.response) => unit=?,
        ~onCompleted: (C.response, option(array(mutationError))) => unit=?,
        ~onError: option(mutationError) => unit=?,
        unit
      ) =>
      Disposable.t;

    let commitMutationPromised:
      (
        ~environment: Environment.t,
        ~variables: C.variables,
        ~optimisticUpdater: optimisticUpdaterFn=?,
        ~optimisticResponse: C.rawResponse=?,
        ~updater: (RecordSourceSelectorProxy.t, C.response) => unit=?,
        unit
      ) =>
      Promise.t(
        Belt.Result.t(
          (C.response, option(array(mutationError))),
          option(mutationError),
        ),
      );
  };

/**
 * A way of committing a local update to the store.
 */
[@bs.module "relay-runtime"]
external commitLocalUpdate:
  (
    ~environment: Environment.t,
    ~updater: RecordSourceSelectorProxy.t => unit
  ) =>
  unit =
  "commitLocalUpdate";

/**
 * fetchQuery is used internally only.
 */
let fetchQuery:
  (Environment.t, queryNode, 'variables) => Js.Promise.t('response);

/**
 * SUBSCRIPTIONS
 */
module type SubscriptionConfig = {
  type variables;
  type responseRaw;
  type response;
  let node: subscriptionNode;
  let convertResponse: responseRaw => response;
  let convertVariables: variables => variables;
};

module MakeUseSubscription:
  (C: SubscriptionConfig) =>
   {
    let subscribe:
      (
        ~environment: Environment.t,
        ~variables: C.variables,
        ~onCompleted: unit => unit=?,
        ~onError: Js.Exn.t => unit=?,
        ~onNext: C.response => unit=?,
        ~updater: updaterFn(C.response)=?,
        unit
      ) =>
      Disposable.t;
  };
