unit ViasoftModel;

interface

uses
  System.Generics.Collections,
  Transacao;

type
  TViasoftModel = class
  public
    procedure AdicionarTransacao(ATransacao: TTransacao; ATransacoes: TList<TTransacao>);
    procedure EditarTransacao(Index: Integer; ATransacao: TTransacao; ATransacoes: TList<TTransacao>);
    procedure RemoverTransacao(Index: Integer; ATransacoes: TList<TTransacao>);
  end;

implementation

uses
  SysUtils,
  Math;

procedure TViasoftModel.AdicionarTransacao(ATransacao: TTransacao; ATransacoes: TList<TTransacao>);
begin
  ATransacoes.Add(ATransacao);
end;

procedure TViasoftModel.EditarTransacao(Index: Integer; ATransacao: TTransacao; ATransacoes: TList<TTransacao>);
var
  CopiaTransacao: TTransacao;
begin
  if (Index >= ZeroValue) and (Index < ATransacoes.Count) then
  begin
    CopiaTransacao := ATransacoes[Index];
    CopiaTransacao.Tipo := ATransacao.Tipo;
    CopiaTransacao.Valor := ATransacao.Valor;
    ATransacoes[Index] := CopiaTransacao;
  end;
end;

procedure TViasoftModel.RemoverTransacao(Index: Integer; ATransacoes: TList<TTransacao>);
begin
  if (Index >= Zerovalue) and (Index < ATransacoes.Count) then
    ATransacoes.Delete(Index);
end;

end.

