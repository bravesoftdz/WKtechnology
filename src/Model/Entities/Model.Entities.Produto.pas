unit Model.Entities.Produto;

interface
  type
  TModelEntitiesProduto = class
    private
    FPreco: Currency;
    FDescricao: string;
    FCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetPreco(const Value: Currency);
    public
    constructor Create;
    destructor Destroy;override;
    property Codigo:Integer read FCodigo write SetCodigo;
    property Descricao:string read FDescricao write SetDescricao;
    property Preco:Currency read FPreco write SetPreco;

  end;
implementation

{ TModelEntitiesProduto }

constructor TModelEntitiesProduto.Create;
begin

end;

destructor TModelEntitiesProduto.Destroy;
begin

  inherited;
end;

procedure TModelEntitiesProduto.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TModelEntitiesProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TModelEntitiesProduto.SetPreco(const Value: Currency);
begin
  FPreco := Value;
end;

end.
