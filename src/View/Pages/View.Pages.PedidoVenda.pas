unit View.Pages.PedidoVenda;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Model.Crud.interfaces,
  Model.Entities.Cliente,
  Model.Crud.Cliente,
  Model.Helpers.Edit,
  Model.Entities.Produto,
  Model.Crud.Produto,
  Model.Services.Interfaces,
  Model.Entities.ProductOrder,
  Model.Services.ProductOrder,
  Model.Entities.Order,
  Model.Services.Order;

type
  TfrmPedido = class(TForm)
    edProduto: TEdit;
    edDescricaoProduto: TEdit;
    edQuantidade: TEdit;
    edValorUnit: TEdit;
    pnProduto: TPanel;
    dbgPedido: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnInserirProduto: TButton;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edCliente: TEdit;
    edNomeCliente: TEdit;
    btnInserirCliente: TButton;
    dsCliente: TDataSource;
    dsProduto: TDataSource;
    dsProductOrder: TDataSource;
    btnGravar: TButton;
    Panel3: TPanel;
    Label7: TLabel;
    edPedido: TEdit;
    Panel4: TPanel;
    Label8: TLabel;
    edValorTotalPedido: TEdit;
    btnRequestOrder: TButton;
    btnCancelarPedido: TButton;
    dsOrder: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edClienteExit(Sender: TObject);
    procedure edProdutoExit(Sender: TObject);
    procedure btnInserirProdutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure dbgPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edClienteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClienteClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure btnRequestOrderClick(Sender: TObject);
  private
    vInAlterando:Boolean;
    // Faltou fazer a implementação da camada model
    FControllerCliente:IModelCrudGeneric<TModelEntitiesCliente>;
    FControllerProduto:IModelCrudGeneric<TModelEntitiesProduto>;
    FControllerOrder:IModelServicesOrder<TModelEntitiesOrder>;
    FControllerProductOrder:IModelServicesProductOrder<TModelEntitiesProductOrder>;

    procedure pClearFieldsProduct;
    procedure pAttValueTotal(aValue:Currency);
    procedure pAttFieldsOrder();
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

procedure TfrmPedido.btnCancelarPedidoClick(Sender: TObject);
begin
  if MessageDlg('Deseja mesmo cancelar esse o pedido '+edPedido.Text+' ?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
    FControllerOrder.This.Numero := edPedido.ToInteger;
    FControllerOrder.Cancel;
    FControllerProductOrder.This.CodigoPedido := FControllerOrder.This.Numero;
    FControllerProductOrder.Cancel;
  end;

end;

procedure TfrmPedido.btnGravarClick(Sender: TObject);
begin
  FControllerOrder.Save;
  FControllerProductOrder.Save;
end;

procedure TfrmPedido.btnInserirClienteClick(Sender: TObject);
begin
  FControllerOrder.This.DataEmissao := Date;
  FControllerOrder.This.CodigoCliente := edCliente.ToInteger;
  FControllerOrder.This.ValorTotal := edValorTotalPedido.ToCurrency;
  FControllerOrder.Add;
  edPedido.TextInteger(FControllerOrder.This.Numero);
  edProduto.SetFocus;
end;

procedure TfrmPedido.btnInserirProdutoClick(Sender: TObject);
begin
  FControllerProductOrder.This.CodigoPedido := edPedido.ToInteger;
  FControllerProductOrder.This.CodigoProduto := edProduto.ToInteger;
  FControllerProductOrder.This.Descricao := edDescricaoProduto.Text;
  FControllerProductOrder.This.Quantidade := edQuantidade.ToCurrency;
  FControllerProductOrder.This.ValorUnitario := edValorUnit.ToCurrency;

  if vInAlterando then
    FControllerProductOrder.Update.Get(FControllerProductOrder.This.CodigoPedido)
  else
    FControllerProductOrder.Add.Get(FControllerProductOrder.This.CodigoPedido);

  vInAlterando := False;

  edProduto.SetFocus;
end;

procedure TfrmPedido.btnRequestOrderClick(Sender: TObject);
begin
  FControllerOrder.This.Numero := edPedido.ToInteger;
  FControllerOrder.Get;
  FControllerProductOrder.Get(edPedido.ToInteger);
end;

procedure TfrmPedido.dbgPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Passar para uma classe
  if Key = VK_RETURN then
  begin
    vInAlterando                     := true;
    edProduto.Text                   := dsProductOrder.DataSet.FieldByName('CODIGO_PRODUTO').AsString;
    edDescricaoProduto.Text          := dsProductOrder.DataSet.FieldByName('DESCRICAO').AsString;
    edQuantidade.Text                := dsProductOrder.DataSet.FieldByName('QUANTIDADE').AsString;
    edValorUnit.Text                 := dsProductOrder.DataSet.FieldByName('VLR_UNITARIO').AsString;
    FControllerProductOrder.This.Seq := dsProductOrder.DataSet.FieldByName('AUTOINCREM').AsInteger;
    edQuantidade.SetFocus;
    Key := 0;
  end
  else if (Key = VK_DELETE) then
  begin
    if MessageDlg('Deseja realemnte apagar o produto "'+dsProductOrder.DataSet.FieldByName('DESCRICAO').AsString+'" ?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
    begin
      FControllerProductOrder.Remove(dsProductOrder.DataSet.FieldByName('AUTOINCREM').AsInteger)
        .Get(edPedido.ToInteger);
      edProduto.SetFocus;
    end;
  end;
end;

procedure TfrmPedido.edClienteChange(Sender: TObject);
begin
  btnRequestOrder.Visible := (edCliente.IsEmpty);
  btnCancelarPedido.Visible := not(edCliente.IsEmpty);
end;

procedure TfrmPedido.edClienteExit(Sender: TObject);
begin
  FControllerCliente.GetId(edCliente.ToInteger);
  edNomeCliente.Text := dsCliente.DataSet.FieldByName('NOME').AsString;
end;

procedure TfrmPedido.edProdutoExit(Sender: TObject);
begin
  FControllerProduto.GetId(edProduto.ToInteger);
  edDescricaoProduto.Text := dsProduto.DataSet.FieldByName('DESCRICAO').AsString;
  edValorUnit.TextCurrency(dsProduto.DataSet.FieldByName('PRECO_VENDA').AsString);
  edQuantidade.TextCurrency(1);
  vInAlterando := False;
end;

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FControllerOrder.Abort;
  FControllerProductOrder.Abort;
end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  FControllerCliente := TModelCrudCliente.New.DataSource(dsCliente);
  FControllerProduto := TModelCrudProduto.New.DataSource(dsProduto);
  FControllerOrder := TModelServicesOrder.New.DataSource(dsOrder)
    .DisplayAttFieldsOrder(pAttFieldsOrder);

  FControllerProductOrder := TModelServicesProductOrder.New
    .DataSource(dsProductOrder)
      .DisplayAttValueTotal(pAttValueTotal)
        .DisplayClearFieldsProduct(pClearFieldsProduct);
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  edPedido.SetFocus;
end;

procedure TfrmPedido.pAttFieldsOrder;
begin
  edCliente.Text := dsOrder.DataSet.FieldByName('CODIGO_CLIENTE').AsString;
  edNomeCliente.Text := dsOrder.DataSet.FieldByName('NOME').AsString;
  edValorTotalPedido.TextCurrency(dsOrder.DataSet.FieldByName('VALOR_TOTAL').AsCurrency);
end;

procedure TfrmPedido.pAttValueTotal(aValue: Currency);
begin
  edValorTotalPedido.TextCurrency(aValue);
end;

procedure TfrmPedido.pClearFieldsProduct;
begin
  edProduto.Clear;
  edDescricaoProduto.Clear;
  edValorUnit.TextCurrency(0);
  edQuantidade.TextCurrency(1);
  edValorTotalPedido.TextCurrency(0);
end;

end.
