@ocaml.doc("Tries to return a record from a nested path of linked records.")
let resolveNestedRecord: (
  ~rootRecord: option<ReasonRelay.RecordProxy.t>,
  ~path: list<string>,
) => option<ReasonRelay.RecordProxy.t>

@ocaml.doc(
  "Tries to return a record from a nested path of linked records, starting from the root. "
)
let resolveNestedRecordFromRoot: (
  ~store: ReasonRelay.RecordSourceSelectorProxy.t,
  ~path: list<string>,
) => option<ReasonRelay.RecordProxy.t>

@ocaml.doc("Helpers for handling connections. ")
type insertAt =
  | Start
  | End

type connectionConfig = {
  parentID: ReasonRelay.dataId,
  key: string,
  filters: option<ReasonRelay.arguments>,
}

let removeNodeFromConnections: (
  ~store: ReasonRelay.RecordSourceSelectorProxy.t,
  ~node: ReasonRelay.RecordProxy.t,
  ~connections: list<connectionConfig>,
) => unit

let createAndAddEdgeToConnections: (
  ~store: ReasonRelay.RecordSourceSelectorProxy.t,
  ~node: ReasonRelay.RecordProxy.t,
  ~connections: list<connectionConfig>,
  ~edgeName: string,
  ~insertAt: insertAt,
) => unit
