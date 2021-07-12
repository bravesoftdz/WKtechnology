unit Model.Entities.Order;

interface

uses
  System.SysUtils;
  type
  TModelEntitiesOrder = class
    private
    FNumero: integer;
    FValorTotal: Currency;
    FDataEmissao: TDate;
    FCodigoCliente: Integer;
    procedure SetCodigoCliente(const Value: Integer);
    procedure SetDataEmissao(const Value: TDate);
    procedure SetNumero(const Value: integer);
    procedure SetValorTotal(const Value: Currency);
    function GetCodigoCliente: Integer;
    function GetDataEmissao: TDate;
    function GetNumero: integer;
    function GetValorTotal: Currency;
    public
    constructor Create;
    destructor Destroy;override;
    property Numero:integer read GetNumero write SetNumero;
    property DataEmissao:TDate read GetDataEmissao write SetDataEmissao;
    property CodigoCliente:Integer read GetCodigoCliente write SetCodigoCliente;
    property ValorTotal:Currency read GetValorTotal write SetValorTotal;
  end;
implementation

{ TModelEntitiesOrder }

constructor TModelEntitiesOrder.Create;
begin

end;

destructor TModelEntitiesOrder.Destroy;
begin

  inherited;
end;

function TModelEntitiesOrder.GetCodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TModelEntitiesOrder.GetDataEmissao: TDate;
begin
  Result := FDataEmissao;
end;

function TModelEntitiesOrder.GetNumero: integer;
begin
  if (FNumero <= 0) then
    raise Exception.Create('Numero do pedido não informado !');

  Result := FNumero;
end;

function TModelEntitiesOrder.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

procedure TModelEntitiesOrder.SetCodigoCliente(const Value: Integer);
begin
  if Value <= 0 then
    raise Exception.Create('Código do cliente não informado !');

  FCodigoCliente := Value;
end;

procedure TModelEntitiesOrder.SetDataEmissao(const Value: TDate);
begin
  FDataEmissao := Value;
end;

procedure TModelEntitiesOrder.SetNumero(const Value: integer);
begin
  if Value <= 0 then
    raise Exception.Create('Numero do pedido invalido !');

  FNumero := Value;
end;

procedure TModelEntitiesOrder.SetValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

end.
