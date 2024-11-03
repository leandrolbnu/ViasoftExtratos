unit Transacao;

interface

type
  TTransacao = record
    Tipo: string;    // "Crédito" ou "Débito"
    Valor: Currency; // Valor da transação
  end;

implementation

end.

