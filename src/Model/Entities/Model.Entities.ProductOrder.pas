unit Model.Entities.ProductOrder;

interface

uses
  System.SysUtils;
  type
  TModelEntitiesProductOrder = class
    private
    FDescricao: string;
    FCodigoProduto: Integer;
    FCodigoPedido: Integer;
    FValorUnitario: Currency;
    FQuantidade: Currency;
    FValorTotal: Currency;
    FSeq: Integer;
    procedure SetCodigoPedido(const Value: Integer);
    procedure SetCodigoProduto(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetQuantidade(const Value: Currency);
    procedure SetValorUnitario(const Value: Currency);
    procedure SetValorTotal(const Value: Currency);
    function GetCodigoProduto: Integer;
    function GetDescricao: string;
    function GetQuantidade: Currency;
    function GetValorTotal: Currency;
    function GetValorUnitario: Currency;
    procedure SetSeq(const Value: Integer);
    function GetSeq: Integer;
    public
    constructor Create;
    destructor Destroy;override;
    property CodigoPedido:Integer read FCodigoPedido write SetCodigoPedido;
    property Seq:Integer read GetSeq write SetSeq;
    property CodigoProduto:Integer read GetCodigoProduto write SetCodigoProduto;
    property Descricao:string read GetDescricao write SetDescricao;
    property Quantidade:Currency read GetQuantidade write SetQuantidade;
    property ValorUnitario:Currency read GetValorUnitario write SetValorUnitario;
    property ValorTotal:Currency read GetValorTotal write SetValorTotal;
  end;

implementation

{ TModelEntities }

constructor TModelEntitiesProductOrder.Create;
begin

end;

destructor TModelEntitiesProductOrder.Destroy;
begin

  inherited;
end;

function TModelEntitiesProductOrder.GetCodigoProduto: Integer;
begin
  Result := FCodigoProduto;
end;

function TModelEntitiesProductOrder.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TModelEntitiesProductOrder.GetQuantidade: Currency;
begin
  Result := FQuantidade;
end;

function TModelEntitiesProductOrder.GetSeq: Integer;
begin
  if FSeq <=0  then
    raise Exception.Create('Numero da sequencia do pedido não informado !');
  Result := FSeq;
end;

function TModelEntitiesProductOrder.GetValorTotal: Currency;
begin
  Result := (FQuantidade * FValorUnitario);
end;

function TModelEntitiesProductOrder.GetValorUnitario: Currency;
begin
  Result := FValorUnitario;
end;

procedure TModelEntitiesProductOrder.SetCodigoPedido(const Value: Integer);
begin
  FCodigoPedido := Value;
end;

procedure TModelEntitiesProductOrder.SetCodigoProduto(const Value: Integer);
begin
  FCodigoProduto := Value;
end;

procedure TModelEntitiesProductOrder.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TModelEntitiesProductOrder.SetQuantidade(const Value: Currency);
begin
  FQuantidade := Value;
end;

procedure TModelEntitiesProductOrder.SetSeq(const Value: Integer);
begin
  FSeq := Value;
end;

procedure TModelEntitiesProductOrder.SetValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

procedure TModelEntitiesProductOrder.SetValorUnitario(const Value: Currency);
begin
  FValorUnitario := Value;
end;

end.
