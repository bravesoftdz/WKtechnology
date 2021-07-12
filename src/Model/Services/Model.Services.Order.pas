unit Model.Services.Order;

interface

uses Model.Services.Interfaces,
  Model.Entities.Order, Model.Components.Connections.interfaces,
  Model.Components.Connections, System.SysUtils, Data.DB;
  type
  TModelServicesOrder = class(TInterfacedObject,IModelServicesOrder<TModelEntitiesOrder>)
  private
  FConnection : IModelComponentsConnectionsGeneric;
  FDataSource:TDataSource;
  FDisplayAttFieldsOrder:TProc;
  FEntity:TModelEntitiesOrder;
  public
  constructor Create;
  destructor Destroy;override;
  class function New : IModelServicesOrder<TModelEntitiesOrder>;
  function &Abort: IModelServicesOrder<TModelEntitiesOrder>;
  function Add: IModelServicesOrder<TModelEntitiesOrder>;
  function Cancel: IModelServicesOrder<TModelEntitiesOrder>;
  function DataSource(aValue: TDataSource):IModelServicesOrder<TModelEntitiesOrder>;
  function DisplayAttFieldsOrder(aDisplay: TProc): IModelServicesOrder<TModelEntitiesOrder>;
  function Get: IModelServicesOrder<TModelEntitiesOrder>;
  function Save: IModelServicesOrder<TModelEntitiesOrder>;
  function This: TModelEntitiesOrder;
  end;
implementation

{ TModelServicesOrder }

function TModelServicesOrder.Abort: IModelServicesOrder<TModelEntitiesOrder>;
begin
  FConnection.RollbackTrasaction;
end;

function TModelServicesOrder.Add: IModelServicesOrder<TModelEntitiesOrder>;
begin
  Result := Self;

//  if(FConnection.DataSet.RecordCount <= 0)then;
//    FConnection.StartTransaction;

  FConnection
  .Close
  .SQLClear
  .SQLAdd('INSERT INTO PEDIDOS_DADOS_GERAIS(DATA_EMISSAO,CODIGO_CLIENTE,VALOR_TOTAL)')
  .SQLAdd('VALUES(:DATA_EMISSAO,:CODIGO_CLIENTE,:VALOR_TOTAL)')
  .ParamByName('CODIGO_CLIENTE',FEntity.CodigoCliente)
  .ParamByName('DATA_EMISSAO',FEntity.DataEmissao)
  .ParamByName('VALOR_TOTAL',FEntity.ValorTotal)
  .ExecSQL;

  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT MAX(NUMERO) NUMERO FROM PEDIDOS_DADOS_GERAIS')
  .Open;

  FEntity.Numero := FConnection.FielByName('NUMERO');
end;

function TModelServicesOrder.Cancel: IModelServicesOrder<TModelEntitiesOrder>;
begin
  Result := Self;

  FConnection.StartTransaction;

  FConnection
  .Close
  .SQLClear
  .SQLAdd('DELETE FROM PEDIDOS_DADOS_GERAIS')
  .SQLAdd('WHERE NUMERO = :NUMERO')
  .ParamByName('NUMERO',FEntity.Numero)
  .ExecSQL;

  FConnection.CommitTrasaction;

end;

constructor TModelServicesOrder.Create;
begin
  if not Assigned(FConnection) then
    FConnection := TModelComponentsConnections.New.Connection;

  FEntity := TModelEntitiesOrder.Create
end;

function TModelServicesOrder.DataSource(
  aValue: TDataSource): IModelServicesOrder<TModelEntitiesOrder>;
begin
  Result := Self;
  FDataSource := aValue;
  FDataSource.DataSet := FConnection.DataSet;
end;

destructor TModelServicesOrder.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TModelServicesOrder.DisplayAttFieldsOrder(
  aDisplay: TProc): IModelServicesOrder<TModelEntitiesOrder>;
begin
  Result := Self;
  FDisplayAttFieldsOrder := aDisplay;
end;

function TModelServicesOrder.Get: IModelServicesOrder<TModelEntitiesOrder>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT PEDIDOS_DADOS_GERAIS.*,CLIENTES.NOME FROM PEDIDOS_DADOS_GERAIS')
  .SQLAdd('LEFT JOIN CLIENTES ON CLIENTES.CODIGO = PEDIDOS_DADOS_GERAIS.CODIGO_CLIENTE')
  .SQLAdd('WHERE NUMERO = :NUMERO')
  .ParamByName('NUMERO',FEntity.Numero)
  .Open;

  if Assigned(FDisplayAttFieldsOrder) then
    FDisplayAttFieldsOrder();
end;

class function TModelServicesOrder.New: IModelServicesOrder<TModelEntitiesOrder>;
begin
  Result := Self.Create;
end;

function TModelServicesOrder.Save: IModelServicesOrder<TModelEntitiesOrder>;
begin
  Result := Self;
  FConnection.CommitTrasaction;
end;

function TModelServicesOrder.This: TModelEntitiesOrder;
begin
  Result := FEntity;
end;

end.
