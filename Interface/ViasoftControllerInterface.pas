unit ViasoftControllerInterface;

interface

uses
  System.Generics.Collections,
  Transacao;

type
  IViasoftController = interface
    ['{D0B07A1C-CEAE-4D2C-9B7F-3C457D85D7D6}']
    procedure AdicionarTransacao(ATransacao: TTransacao; var ATransacoes: TList<TTransacao>);
    procedure EditarTransacao(Index: Integer; ATransacao: TTransacao; var ATransacoes: TList<TTransacao>);
    procedure RemoverTransacao(Index: Integer; var ATransacoes: TList<TTransacao>);
  end;

implementation

end.

