unit Model.Entities.Cliente;

interface

uses
  System.SysUtils;
  type
  TModelEntitiesCliente = class
    private
    FUF: string;
    FCodigo: integer;
    FNome: string;
    FCidade: string;
    procedure SetCidade(const Value: string);
    procedure SetCodigo(const Value: integer);
    procedure SetNome(const Value: string);
    procedure SetUF(const Value: string);
    function GetCidade: string;
    function GetCodigo: integer;
    function GetNome: string;
    function GetUF: string;
    public
    property Codigo:integer read GetCodigo write SetCodigo;
    property Nome:string read GetNome write SetNome;
    property Cidade:string read GetCidade write SetCidade;
    property UF:string read GetUF write SetUF;

  end;
implementation

{ TModelEntitiesCliente }

function TModelEntitiesCliente.GetCidade: string;
begin

end;

function TModelEntitiesCliente.GetCodigo: integer;
begin
  if FCodigo <= 0 then
    raise Exception.Create('Código do cliente não informado !');
end;

function TModelEntitiesCliente.GetNome: string;
begin

end;

function TModelEntitiesCliente.GetUF: string;
begin

end;

procedure TModelEntitiesCliente.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TModelEntitiesCliente.SetCodigo(const Value: integer);
begin
  if Value <= 0 then
    raise Exception.Create('Código do cliente não informado !');

  FCodigo := Value;
end;

procedure TModelEntitiesCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TModelEntitiesCliente.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
