object frmPedido: TfrmPedido
  Left = 0
  Top = 0
  Caption = 'Pedido'
  ClientHeight = 326
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnProduto: TPanel
    Left = 0
    Top = 98
    Width = 704
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 5
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 81
      Top = 5
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 367
      Top = 5
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label4: TLabel
      Left = 445
      Top = 5
      Width = 50
      Height = 13
      Caption = 'Valor Unit.'
    end
    object edProduto: TEdit
      Left = 4
      Top = 23
      Width = 73
      Height = 21
      TabOrder = 0
      OnExit = edProdutoExit
    end
    object edDescricaoProduto: TEdit
      Left = 81
      Top = 23
      Width = 282
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object edQuantidade: TEdit
      Left = 367
      Top = 23
      Width = 73
      Height = 21
      TabOrder = 2
    end
    object edValorUnit: TEdit
      Left = 443
      Top = 23
      Width = 64
      Height = 21
      TabOrder = 3
    end
    object btnInserirProduto: TButton
      Left = 517
      Top = 19
      Width = 85
      Height = 25
      Caption = 'Inserir Produto'
      TabOrder = 4
      OnClick = btnInserirProdutoClick
    end
    object btnGravar: TButton
      Left = 614
      Top = 19
      Width = 82
      Height = 25
      Caption = 'Gravar Pedido'
      TabOrder = 5
      OnClick = btnGravarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 147
    Width = 704
    Height = 130
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object dbgPedido: TDBGrid
      Left = 1
      Top = 1
      Width = 702
      Height = 128
      Align = alClient
      DataSource = dsProductOrder
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = dbgPedidoKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO_PRODUTO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_UNITARIO'
          Title.Caption = 'Vl. Unit.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLR_TOTAL'
          Title.Caption = 'Vl. Total'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 704
    Height = 49
    Align = alTop
    TabOrder = 2
    object Label5: TLabel
      Left = 4
      Top = 5
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label6: TLabel
      Left = 81
      Top = 5
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object edCliente: TEdit
      Left = 4
      Top = 23
      Width = 73
      Height = 21
      TabOrder = 0
      OnChange = edClienteChange
      OnExit = edClienteExit
    end
    object edNomeCliente: TEdit
      Left = 81
      Top = 23
      Width = 282
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object btnInserirCliente: TButton
      Left = 367
      Top = 18
      Width = 85
      Height = 25
      Caption = 'Criar Pedido'
      TabOrder = 2
      OnClick = btnInserirClienteClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 49
    Align = alTop
    TabOrder = 3
    object Label7: TLabel
      Left = 4
      Top = 5
      Width = 32
      Height = 13
      Caption = 'Pedido'
    end
    object edPedido: TEdit
      Left = 4
      Top = 23
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object btnRequestOrder: TButton
      Left = 101
      Top = 18
      Width = 84
      Height = 25
      Caption = 'Buscar Pedido'
      TabOrder = 1
      OnClick = btnRequestOrderClick
    end
    object btnCancelarPedido: TButton
      Left = 205
      Top = 18
      Width = 84
      Height = 25
      Caption = 'Cancelar Pedido'
      TabOrder = 2
      Visible = False
      OnClick = btnCancelarPedidoClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 277
    Width = 704
    Height = 49
    Align = alBottom
    TabOrder = 4
    object Label8: TLabel
      Left = 595
      Top = 5
      Width = 59
      Height = 13
      Caption = 'Total Pedido'
    end
    object edValorTotalPedido: TEdit
      Left = 592
      Top = 23
      Width = 73
      Height = 21
      TabOrder = 0
      OnExit = edClienteExit
    end
  end
  object dsCliente: TDataSource
    Left = 424
    Top = 2
  end
  object dsProduto: TDataSource
    Left = 480
    Top = 2
  end
  object dsProductOrder: TDataSource
    Left = 592
    Top = 2
  end
  object dsOrder: TDataSource
    Left = 656
    Top = 3
  end
end
