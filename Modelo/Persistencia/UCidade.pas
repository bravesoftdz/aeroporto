unit UCidade;

interface

uses
    UEntidade
  ;

type
  TCIDADE = class(TENTIDADE)
  public
    NOME: String;
    POPULACAO: Integer;
  end;

const
  TBL_CIDADE           = 'CIDADE';
  FLD_CIDADE_NOME      = 'NOME';
  FLD_CIDADE_POPULACAO = 'POPULACAO';

  VW_CIDADE      = 'VW_CIDADE';
  VW_CIDADE_NOME = 'Nome';
  VW_CIDADE_ID   = 'C�d.';

resourcestring
  STR_CIDADE = 'Cidade';

implementation

{ TCIDADE }

end.
