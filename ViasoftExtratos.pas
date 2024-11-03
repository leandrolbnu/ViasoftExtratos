unit ViasoftExtratos;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Generics.Collections,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Math,
  Transacao,
  ViasoftController;

type
  TForm1 = class(TForm)
    lbxTransacoes: TListBox;
    edValor: TEdit;
    cbTipo: TComboBox;
    btnAdicionar: TButton;
    btnRemover: TButton;
    btnEditar: TButton;
    lbValor: TLabel;
    lbTipo: TLabel;
    Label1: TLabel;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbxTransacoesDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FController: TViasoftController;
    procedure AtualizarLista;
    function NumeroValido(Input: string): Boolean;
    function ExtrairDetalhesTransacoes(const Texto: string; out TipoTransacao : string; out ValorTransacao: string): Boolean;
    procedure DefineCorTransacao(const TipoTransacao : string);
    function ValidaIndice(Index: Integer): Boolean;
  public
    { Public declarations }
    FTransacoes: TList<TTransacao>;
  end;

const
  AVISO_VALOR_INVALIDO = 'Digite um valor válido';
  CREDITO_TEXTO = 'Crédito: ';
  DEBITO_TEXTO = 'Débito: ';

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FController := TViasoftController.Create;
  FTransacoes := TList<TTransacao>.Create;

  cbTipo.Items.Add('Crédito');
  cbTipo.Items.Add('Débito');
  cbTipo.ItemIndex := ZeroValue;

  lbxTransacoes.Style := lbOwnerDrawFixed;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FTransacoes.Free;
  FreeAndNil(FController);
end;

procedure TForm1.btnAdicionarClick(Sender: TObject);
var
  Transacao: TTransacao;
begin
  Transacao.Tipo := cbTipo.Text;

  if NumeroValido(edValor.Text) then
  begin
    Transacao.Valor := StrToCurr(edValor.Text);
    FController.AdicionarTransacao(Transacao, FTransacoes);
    AtualizarLista;
  end
  else
    MessageDlg(AVISO_VALOR_INVALIDO, TMsgDlgType.mtInformation, [mbOk], ZeroValue);
end;

procedure TForm1.btnEditarClick(Sender: TObject);
var
  Transacao: TTransacao;
begin
  if ValidaIndice(lbxTransacoes.ItemIndex) then
  begin
    Transacao := FTransacoes[lbxTransacoes.ItemIndex];
    Transacao.Tipo := cbTipo.Text;
    
    if NumeroValido(edValor.Text) then
    begin
      Transacao.Valor := StrToCurr(edValor.Text);
      FController.EditarTransacao(lbxTransacoes.ItemIndex, Transacao, FTransacoes);
      AtualizarLista;
    end
    else
      MessageDlg(AVISO_VALOR_INVALIDO, TMsgDlgType.mtInformation, [mbOk], ZeroValue);
  end;
end;

procedure TForm1.btnRemoverClick(Sender: TObject);
var
  Index: Integer;
begin
  if ValidaIndice(lbxTransacoes.ItemIndex) then
  begin
    Index := lbxTransacoes.ItemIndex;
    FController.RemoverTransacao(Index, FTransacoes);
    AtualizarLista;
  end;
end;

procedure TForm1.AtualizarLista;
var
  Transacao: TTransacao;
begin
  lbxTransacoes.Items.Clear;
  for Transacao in FTransacoes do
  begin
    lbxTransacoes.Items.Add(Format('%s: %.2f', [Transacao.Tipo, Transacao.Valor]));
  end;
  lbxTransacoes.Repaint;
end;

function TForm1.NumeroValido(Input: string): Boolean;
var
  Value: Integer;
begin
  Result := TryStrToInt(Input, Value);

  if Result then
    Result := Value > ZeroValue;  
end;

function TForm1.ValidaIndice(Index: Integer): Boolean;
begin
  Result := Index >= ZeroValue;
end;

procedure TForm1.lbxTransacoesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  ListBox: TListBox;
  ItemText: string;
  Palavra: string;
  Value: string;
begin
  ListBox := TListBox(lbxTransacoes);
  ItemText := ListBox.Items[Index];
  ListBox.Canvas.FillRect(Rect);

  if not ExtrairDetalhesTransacoes(ItemText, Palavra, Value) then
  begin
    // Caso nenhum tipo válido, desenha tudo em preto
    ListBox.Canvas.Font.Color := clBlack;
    ListBox.Canvas.TextOut(Rect.Left, Rect.Top, ItemText);
    Exit;
  end;

  DefineCorTransacao(Palavra);
  
  // Desenhar a palavra
  ListBox.Canvas.TextOut(Rect.Left, Rect.Top, Palavra);

  // Desenhar o restante do texto (valor)
  ListBox.Canvas.Font.Color := clBlack;
  ListBox.Canvas.TextOut(Rect.Left + ListBox.Canvas.TextWidth(Palavra), Rect.Top, Value);
end;

procedure TForm1.DefineCorTransacao(const TipoTransacao : string);
begin
  if TipoTransacao  = CREDITO_TEXTO then
    lbxTransacoes.Canvas.Font.Color := clGreen
  else if TipoTransacao  = DEBITO_TEXTO then
    lbxTransacoes.Canvas.Font.Color := clRed
  else
    lbxTransacoes.Canvas.Font.Color := clBlack;
end;

function TForm1.ExtrairDetalhesTransacoes(const Texto: string; out TipoTransacao , ValorTransacao: string): Boolean;
begin
  Result := False;
  if Pos(CREDITO_TEXTO, Texto) > ZeroValue then
  begin
    TipoTransacao  := CREDITO_TEXTO;
    ValorTransacao := Copy(Texto, Length(TipoTransacao ) + 1, MaxInt);
    Result := True;
  end
  else if Pos(DEBITO_TEXTO, Texto) > ZeroValue then
  begin
    TipoTransacao  := DEBITO_TEXTO;
    ValorTransacao := Copy(Texto, Length(TipoTransacao ) + 1, MaxInt);
    Result := True;
  end;
end;

end.
