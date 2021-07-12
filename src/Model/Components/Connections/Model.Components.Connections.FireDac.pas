unit Model.Components.Connections.FireDac;

interface

uses Model.Components.Connections.interfaces, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
  type
  TModelComponentsConnectionsFireDac = class(TInterfacedObject,IModelComponentsConnectionsGeneric)
  private
  FDataSouce:TDataSource;
  FQuery:TFDQuery;
  FConnection:TFDConnection;
  public
    constructor Create;
    Destructor Destroy;override;
    class function New : IModelComponentsConnectionsGeneric;
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
implementation

{ TModelComponentsConnectionsFireDac }

function TModelComponentsConnectionsFireDac.Close: IModelComponentsConnectionsGeneric;
begin
  Result := Self;
  FQuery.Close;
end;

function TModelComponentsConnectionsFireDac.CommitTrasaction: IModelComponentsConnectionsGeneric;
begin
  FConnection.Commit;
end;

constructor TModelComponentsConnectionsFireDac.Create;
begin
  FConnection := TFDConnection.Create(nil);
  FConnection.Params.DriverID := 'MySQL';
  FConnection.Params.Database := 'wktechnology';
  FConnection.Params.UserName := 'root';
  FConnection.Params.Add('port=3306');
  FConnection.Params.Add('server=LOCALHOST');

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection;
end;

function TModelComponentsConnectionsFireDac.DataSet:TDataSet;
begin
  Result := FQuery;
  FQuery.RecordCount;
end;

destructor TModelComponentsConnectionsFireDac.Destroy;
begin
  FQuery.Free;
  FConnection.Free;
  inherited;
end;

function TModelComponentsConnectionsFireDac.ExecSQL: IModelComponentsConnectionsGeneric;
begin
  Result := Self;
  FQuery.ExecSQL;
end;

function TModelComponentsConnectionsFireDac.FielByName(aField: string): Variant;
begin
  Result := FQuery.FieldByName(aField).Value;
end;

class function TModelComponentsConnectionsFireDac.New: IModelComponentsConnectionsGeneric;
begin
  Result := Self.Create;
end;

function TModelComponentsConnectionsFireDac.Open: IModelComponentsConnectionsGeneric;
begin
  Result := Self;
  FQuery.Open();
end;

function TModelComponentsConnectionsFireDac.ParamByName(aParam: String;
  aValue: Variant): IModelComponentsConnectionsGeneric;
begin
  Result := Self;
  FQuery.ParamByName(aParam).Value := aValue;
end;

function TModelComponentsConnectionsFireDac.RollbackTrasaction: IModelComponentsConnectionsGeneric;
begin
  FConnection.RollbackRetaining;
end;

function TModelComponentsConnectionsFireDac.SQLAdd(
  aSQL: string): IModelComponentsConnectionsGeneric;
begin
  Result := Self;
  FQuery.SQL.Add(aSQL);
end;

function TModelComponentsConnectionsFireDac.SQLClear: IModelComponentsConnectionsGeneric;
begin
  Result := Self;
  FQuery.SQL.Clear;
end;

function TModelComponentsConnectionsFireDac.StartTransaction: IModelComponentsConnectionsGeneric;
begin
  FConnection.StartTransaction;
end;

end.
