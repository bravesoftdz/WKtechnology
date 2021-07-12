unit Model.Crud.Cliente;

interface

uses Model.Crud.interfaces,
  Model.Entities.Cliente,
  Model.Components.Connections,
  Model.Components.Connections.interfaces, Data.DB;
  type
  TModelCrudCliente = class(TInterfacedObject,IModelCrudGeneric<TModelEntitiesCliente>)
  private
    FEntity:TModelEntitiesCliente;
    FDataSource:TDataSource;
    FConnection:IModelComponentsConnectionsGeneric;
  public
  constructor Create;
  destructor Destroy;override;
  class function New : IModelCrudGeneric<TModelEntitiesCliente>;
  function DataSource(aValue:TDataSource):IModelCrudGeneric<TModelEntitiesCliente>;
  function Delete:IModelCrudGeneric<TModelEntitiesCliente>;
  function GetAll:IModelCrudGeneric<TModelEntitiesCliente>;
  function GetId(aId:Integer):IModelCrudGeneric<TModelEntitiesCliente>;
  function Insert:IModelCrudGeneric<TModelEntitiesCliente>;
  function This:TModelEntitiesCliente;
  function Update:IModelCrudGeneric<TModelEntitiesCliente>;
  end;
implementation

{ TModelCrudCliente }

constructor TModelCrudCliente.Create;
begin
  if not Assigned(FConnection) then
    FConnection := TModelComponentsConnections.New.Connection;

  FEntity := TModelEntitiesCliente.Create;
end;

function TModelCrudCliente.DataSource(
  aValue: TDataSource): IModelCrudGeneric<TModelEntitiesCliente>;
begin
  Result := Self;
  FDataSource := aValue;
  FDataSource.DataSet := FConnection.DataSet;
end;

function TModelCrudCliente.Delete: IModelCrudGeneric<TModelEntitiesCliente>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('')
  .Open;
end;

destructor TModelCrudCliente.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TModelCrudCliente.GetAll: IModelCrudGeneric<TModelEntitiesCliente>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT * FROM CLIENTES')
  .Open;
  FConnection.DataSet.RecordCount;
end;

function TModelCrudCliente.GetId(
  aId: Integer): IModelCrudGeneric<TModelEntitiesCliente>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT * FROM CLIENTES')
  .SQLAdd('WHERE CODIGO = :CODIGO')
  .ParamByName('CODIGO',aId)
  .Open;
end;

function TModelCrudCliente.Insert: IModelCrudGeneric<TModelEntitiesCliente>;
begin

end;

class function TModelCrudCliente.New: IModelCrudGeneric<TModelEntitiesCliente>;
begin
  Result := Self.Create;
end;

function TModelCrudCliente.This: TModelEntitiesCliente;
begin
  Result := FEntity;
end;

function TModelCrudCliente.Update:IModelCrudGeneric<TModelEntitiesCliente>;
begin

end;

end.
