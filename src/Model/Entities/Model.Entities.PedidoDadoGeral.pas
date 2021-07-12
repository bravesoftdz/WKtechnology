unit Model.Entities.PedidoDadoGeral;

interface
  type
  TModelEntitiesPedidoDadosGeral = class
    private
    FNumero: integer;
    FValorTotal: Currency;
    FDataEmissao: TDate;
    FCodigoCliente: integer;
    procedure SetCodigoCliente(const Value: integer);
    procedure SetDataEmissao(const Value: TDate);
    procedure SetNumero(const Value: integer);
    procedure SetValorTotal(const Value: Currency);
    public
    property Numero:integer read FNumero write SetNumero;
    property DataEmissao:TDate read FDataEmissao write SetDataEmissao;
    property CodigoCliente:integer read FCodigoCliente write SetCodigoCliente;
    property ValorTotal:Currency read FValorTotal write SetValorTotal;
  end;

implementation

{ TModelEntitiesPedidosDadosGerais }

procedure TModelEntitiesPedidoDadosGeral.SetCodigoCliente(
  const Value: integer);
begin
  FCodigoCliente := Value;
end;

procedure TModelEntitiesPedidoDadosGeral.SetDataEmissao(const Value: TDate);
begin
  FDataEmissao := Value;
end;

procedure TModelEntitiesPedidoDadosGeral.SetNumero(const Value: integer);
begin
  FNumero := Value;
end;

procedure TModelEntitiesPedidoDadosGeral.SetValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

end.
