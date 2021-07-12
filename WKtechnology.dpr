program WKtechnology;

uses
  Vcl.Forms,
  View.Pages.PedidoVenda in 'src\View\Pages\View.Pages.PedidoVenda.pas' {frmPedido},
  Model.Entities.Cliente in 'src\Model\Entities\Model.Entities.Cliente.pas',
  Model.Entities.PedidoDadoGeral in 'src\Model\Entities\Model.Entities.PedidoDadoGeral.pas',
  Model.Components.Connections.interfaces in 'src\Model\Components\Connections\Model.Components.Connections.interfaces.pas',
  Model.Components.Connections.FireDac in 'src\Model\Components\Connections\Model.Components.Connections.FireDac.pas',
  Model.Crud.interfaces in 'src\Model\Crud\Model.Crud.interfaces.pas',
  Model.Crud.Cliente in 'src\Model\Crud\Model.Crud.Cliente.pas',
  Model.Components.Connections in 'src\Model\Components\Connections\Model.Components.Connections.pas',
  Model.Helpers.Edit in 'src\Model\Helpers\Model.Helpers.Edit.pas',
  Model.Crud.Produto in 'src\Model\Crud\Model.Crud.Produto.pas',
  Model.Entities.Produto in 'src\Model\Entities\Model.Entities.Produto.pas',
  Model.Services.ProductOrder in 'src\Model\Services\Model.Services.ProductOrder.pas',
  Model.Services.Interfaces in 'src\Model\Services\Model.Services.Interfaces.pas',
  Model.Entities.ProductOrder in 'src\Model\Entities\Model.Entities.ProductOrder.pas',
  Model.Components.Grid.Events in 'src\Model\Components\Grid\Model.Components.Grid.Events.pas',
  Model.Components.Grid.Interfaces in 'src\Model\Components\Grid\Model.Components.Grid.Interfaces.pas',
  Model.Entities.Order in 'src\Model\Entities\Model.Entities.Order.pas',
  Model.Services.Order in 'src\Model\Services\Model.Services.Order.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedido, frmPedido);
  Application.Run;
end.
