unit Transacao;

interface

type
  TTransacao = record
    Tipo: string;    // "Cr�dito" ou "D�bito"
    Valor: Currency; // Valor da transa��o
  end;

implementation

end.

