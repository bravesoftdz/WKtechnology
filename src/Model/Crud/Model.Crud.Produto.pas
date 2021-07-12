unit Model.Crud.Produto;

interface

uses Model.Crud.interfaces, Model.Entities.Produto, Data.DB,
  Model.Components.Connections.interfaces, Model.Components.Connections;
  type
  TModelCrudProduto = class(TInterfacedObject,IModelCrudGeneric<TModelEntitiesProduto>)
  private
  FEntity:TModelEntitiesProduto;
  FDataSource:TDataSource;
  FConnection:IModelComponentsConnectionsGeneric;
  public
  constructor Create;
  destructor Destroy;override;
  class function New:IModelCrudGeneric<TModelEntitiesProduto>;
  function DataSource(aValue:TDataSource):IModelCrudGeneric<TModelEntitiesProduto>;
  function Delete:IModelCrudGeneric<TModelEntitiesProduto>;
  function GetAll:IModelCrudGeneric<TModelEntitiesProduto>;
  function GetId(aId:Integer):IModelCrudGeneric<TModelEntitiesProduto>;
  function Insert:IModelCrudGeneric<TModelEntitiesProduto>;
  function This:TModelEntitiesProduto;
  function Update:IModelCrudGeneric<TModelEntitiesProduto>;
  end;
implementation

{ TModelCrudProduto }

constructor TModelCrudProduto.Create;
begin
  if not Assigned(FConnection) then
    FConnection := TModelComponentsConnections.New.Connection;

  FEntity := TModelEntitiesProduto.Create;
end;

function TModelCrudProduto.DataSource(
  aValue: TDataSource): IModelCrudGeneric<TModelEntitiesProduto>;
begin
  Result := Self;
  FDataSource := aValue;
  aValue.DataSet := FConnection.DataSet;
end;

function TModelCrudProduto.Delete: IModelCrudGeneric<TModelEntitiesProduto>;
begin

end;

destructor TModelCrudProduto.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TModelCrudProduto.GetAll: IModelCrudGeneric<TModelEntitiesProduto>;
begin

end;

function TModelCrudProduto.GetId(aId: Integer): IModelCrudGeneric<TModelEntitiesProduto>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT * FROM PRODUTOS')
  .SQLAdd('WHERE CODIGO = :CODIGO')
  .ParamByName('CODIGO',aId)
  .Open;
end;

function TModelCrudProduto.Insert: IModelCrudGeneric<TModelEntitiesProduto>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('')
end;

class function TModelCrudProduto.New: IModelCrudGeneric<TModelEntitiesProduto>;
begin
  Result := Self.Create;
end;

function TModelCrudProduto.This: TModelEntitiesProduto;
begin
  Result := FEntity;
end;

function TModelCrudProduto.Update: IModelCrudGeneric<TModelEntitiesProduto>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('')

end;

end.
