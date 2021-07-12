unit Model.Services.ProductOrder;

interface

uses Model.Services.Interfaces,
  Model.Entities.ProductOrder,
  Data.DB,
  Model.Components.Connections.interfaces,
  Model.Components.Connections,
  System.SysUtils;
  type
  TModelServicesProductOrder = class(TInterfacedObject,IModelServicesProductOrder<TModelEntitiesProductOrder>)
  private
  FConnection:IModelComponentsConnectionsGeneric;
  FDataSource:TDataSource;
  FDisplayAttValueTotal:TProc<Currency>;
  FDisplayClearFieldsProduct:TProc;
  FEntity:TModelEntitiesProductOrder;
  function CountValueTotal(DataSet:TDataSet):Currency;
  public
  constructor Create;
  destructor Destroy;override;
  class function New : IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function &Abort:IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function Add:IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function Cancel:IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function DataSource(aValue:TDataSource):IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function DisplayAttFieldsOrder(aDisplay: TProc): IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function DisplayAttValueTotal(aDisplay:TProc<Currency>):IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function DisplayClearFieldsProduct(aDisplay:TProc):IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function Get(aId:Integer):IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function Remove(aValue:Integer):IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function Save:IModelServicesProductOrder<TModelEntitiesProductOrder>;
  function This:TModelEntitiesProductOrder;
  function TotalOrder:Currency;
  function Update:IModelServicesProductOrder<TModelEntitiesProductOrder>;
  end;
implementation

{ TModelServicesOrder }

function TModelServicesProductOrder.Abort: IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self;
  FConnection.RollbackTrasaction;
end;

function TModelServicesProductOrder.Add : IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self;
//  if(FConnection.DataSet.RecordCount <= 0)then;
//    FConnection.StartTransaction;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('INSERT INTO PEDIDOS_PRODUTOS(NUMERO_PEDIDO,CODIGO_PRODUTO,QUANTIDADE,')
  .SQLAdd('VLR_UNITARIO,VLR_TOTAL)')
  .SQLAdd('VALUES(:NUMERO_PEDIDO,:CODIGO_PRODUTO,:QUANTIDADE,')
  .SQLAdd(':VLR_UNITARIO,:VLR_TOTAL)')
  .ParamByName('NUMERO_PEDIDO',FEntity.CodigoPedido)
  .ParamByName('CODIGO_PRODUTO',FEntity.CodigoProduto)
  .ParamByName('QUANTIDADE',FEntity.Quantidade)
  .ParamByName('VLR_UNITARIO',FEntity.ValorUnitario)
  .ParamByName('VLR_TOTAL',FEntity.ValorTotal)
  .ExecSQL;

end;

function TModelServicesProductOrder.Cancel: IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('DELETE FROM PEDIDOS_PRODUTOS ')
  .SQLAdd('WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO')
  .ParamByName('NUMERO_PEDIDO',FEntity.CodigoPedido)
  .ExecSQL;


end;

function TModelServicesProductOrder.CountValueTotal(DataSet:TDataSet):Currency;
var
  LValue:Currency;
begin
  LValue := 0;
  DataSet.First;
  while not(DataSet.Eof) do
  begin
    LValue := LValue + DataSet.FieldByName('VLR_TOTAL').AsCurrency;
    DataSet.Next;
  end;
  DataSet.First;
  Result := LValue;
end;

constructor TModelServicesProductOrder.Create;
begin
  if not Assigned(FConnection) then
    FConnection := TModelComponentsConnections.New.Connection;

  FEntity := TModelEntitiesProductOrder.Create;
end;

function TModelServicesProductOrder.DataSource(
  aValue: TDataSource): IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self;
  FDataSource := aValue;
  FDataSource.DataSet := FConnection.DataSet;
end;

destructor TModelServicesProductOrder.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TModelServicesProductOrder.DisplayAttFieldsOrder(
  aDisplay: TProc): IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin

end;

function TModelServicesProductOrder.DisplayAttValueTotal(
  aDisplay: TProc<Currency>): IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self;
  FDisplayAttValueTotal := aDisplay;
end;

function TModelServicesProductOrder.DisplayClearFieldsProduct(
  aDisplay: TProc): IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self;
  FDisplayClearFieldsProduct := aDisplay;
end;

function TModelServicesProductOrder.Get(
  aId: Integer): IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT PEDIDOS_PRODUTOS.CODIGO_PRODUTO,PRODUTOS.DESCRICAO,PEDIDOS_PRODUTOS.QUANTIDADE,')
  .SQLAdd('PEDIDOS_PRODUTOS.VLR_UNITARIO,PEDIDOS_PRODUTOS.VLR_TOTAL,AUTOINCREM FROM PEDIDOS_PRODUTOS')
  .SQLAdd('LEFT JOIN PRODUTOS ON PRODUTOS.CODIGO = PEDIDOS_PRODUTOS.CODIGO_PRODUTO')
  .SQLAdd('WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO')
  .ParamByName('NUMERO_PEDIDO',aId)
  .Open;

  if Assigned(FDisplayClearFieldsProduct)then
    FDisplayClearFieldsProduct();

  if Assigned(FDisplayAttValueTotal)then
    FDisplayAttValueTotal(CountValueTotal(FConnection.DataSet));
end;

class function TModelServicesProductOrder.New: IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self.Create;
end;

function TModelServicesProductOrder.Remove(
  aValue: Integer): IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('DELETE FROM PEDIDOS_PRODUTOS ')
  .SQLAdd('WHERE AUTOINCREM = :AUTOINCREM')
  .ParamByName('AUTOINCREM',aValue)
  .ExecSQL;
end;

function TModelServicesProductOrder.Save: IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self;
  FConnection.CommitTrasaction;
end;

function TModelServicesProductOrder.This: TModelEntitiesProductOrder;
begin
  Result := FEntity;
end;

function TModelServicesProductOrder.TotalOrder: Currency;
begin

end;

function TModelServicesProductOrder.Update: IModelServicesProductOrder<TModelEntitiesProductOrder>;
begin
  Result := Self;

  if(FConnection.DataSet.RecordCount <= 0)then;
    FConnection.StartTransaction;

  FConnection
  .Close
  .SQLClear
  .SQLAdd('UPDATE PEDIDOS_PRODUTOS SET QUANTIDADE = :QUANTIDADE,')
  .SQLAdd('VLR_UNITARIO = :VLR_UNITARIO,VLR_TOTAL = :VLR_TOTAL')
  .SQLAdd('WHERE AUTOINCREM = :AUTOINCREMNTO')
  .ParamByName('AUTOINCREMNTO',FEntity.Seq)
  .ParamByName('QUANTIDADE',FEntity.Quantidade)
  .ParamByName('VLR_UNITARIO',FEntity.ValorUnitario)
  .ParamByName('VLR_TOTAL',FEntity.ValorTotal)
  .ExecSQL;
end;

end.
