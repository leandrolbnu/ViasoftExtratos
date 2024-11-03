object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 439
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object lbValor: TLabel
    Left = 32
    Top = 107
    Width = 49
    Height = 28
    Caption = 'Valor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lbTipo: TLabel
    Left = 32
    Top = 189
    Width = 137
    Height = 23
    Caption = 'Tipo de opera'#231#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 88
    Top = 24
    Width = 322
    Height = 62
    Caption = 'Viasoft Extratos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -47
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lbxTransacoes: TListBox
    Left = 216
    Top = 107
    Width = 289
    Height = 302
    ItemHeight = 15
    TabOrder = 0
    OnDrawItem = lbxTransacoesDrawItem
  end
  object edValor: TEdit
    Left = 32
    Top = 141
    Width = 145
    Height = 23
    TabOrder = 1
  end
  object cbTipo: TComboBox
    Left = 32
    Top = 223
    Width = 145
    Height = 23
    TabOrder = 2
  end
  object btnAdicionar: TButton
    Left = 32
    Top = 280
    Width = 145
    Height = 33
    Caption = 'Adicionar'
    TabOrder = 3
    OnClick = btnAdicionarClick
  end
  object btnRemover: TButton
    Left = 32
    Top = 376
    Width = 145
    Height = 33
    Caption = 'Remover'
    TabOrder = 4
    OnClick = btnRemoverClick
  end
  object btnEditar: TButton
    Left = 32
    Top = 328
    Width = 145
    Height = 33
    Caption = 'Editar'
    TabOrder = 5
    OnClick = btnEditarClick
  end
end
