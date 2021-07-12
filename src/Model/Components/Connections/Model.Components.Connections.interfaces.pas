unit Model.Components.Connections.interfaces;

interface
uses Data.DB;
  type
  IModelComponentsConnectionsGeneric = interface
    function Close:IModelComponentsConnectionsGeneric;
    function CommitTrasaction:IModelComponentsConnectionsGeneric;
    function DataSet:TDataSet;
    function ExecSQL:IModelComponentsConnectionsGeneric;
    function FielByName(aField:string):Variant;
    function Open:IModelComponentsConnectionsGeneric;
    function ParamByName(aParam:String;aValue:Variant):IModelComponentsConnectionsGeneric;
    function RollbackTrasaction:IModelComponentsConnectionsGeneric;
    function StartTransaction:IModelComponentsConnectionsGeneric;
    function SQLClear:IModelComponentsConnectionsGeneric;
    function SQLAdd(aSQL:string):IModelComponentsConnectionsGeneric;
  end;
  IModelComponentsConnectionsFactory = interface
    function Connection:IModelComponentsConnectionsGeneric;
  end;


implementation

end.
