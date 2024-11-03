unit ViasoftController;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Math,
  ViasoftModel,
  Transacao,
  ViasoftControllerInterface; // Importa a interface

type
  TViasoftController = class(TInterfacedObject, IViasoftController) // Implementa a interface
  private
    FModel: TViasoftModel;
    function ValidarIndice(Index: Integer; ATransacoes: TList<TTransacao>): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AdicionarTransacao(ATransacao: TTransacao; var ATransacoes: TList<TTransacao>);
    procedure EditarTransacao(Index: Integer; ATransacao: TTransacao; var ATransacoes: TList<TTransacao>);
    procedure RemoverTransacao(Index: Integer; var ATransacoes: TList<TTransacao>);
  end;

implementation

constructor TViasoftController.Create;
begin
  FModel := TViasoftModel.Create;
end;

destructor TViasoftController.Destroy;
begin
  FModel.Free;
  inherited;
end;

procedure TViasoftController.AdicionarTransacao(ATransacao: TTransacao; var ATransacoes: TList<TTransacao>);
begin
  FModel.AdicionarTransacao(ATransacao, ATransacoes);
end;

procedure TViasoftController.EditarTransacao(Index: Integer; ATransacao: TTransacao; var ATransacoes: TList<TTransacao>);
begin
  if not ValidarIndice(Index, ATransacoes) then
    raise Exception.Create('Índice inválido.');

  FModel.EditarTransacao(Index, ATransacao, ATransacoes);
end;

procedure TViasoftController.RemoverTransacao(Index: Integer; var ATransacoes: TList<TTransacao>);
begin
  if not ValidarIndice(Index, ATransacoes) then
    raise Exception.Create('Índice inválido.');

  FModel.RemoverTransacao(Index, ATransacoes);
end;

function TViasoftController.ValidarIndice(Index: Integer; ATransacoes: TList<TTransacao>): Boolean;
begin
  Result := (Index >= 0) and (Index < ATransacoes.Count);
end;

end.

