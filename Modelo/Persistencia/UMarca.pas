unit UMarca;

interface

uses
    UEntidade
  ;

type
  TMARCA = class(TENTIDADE)
  public
    NOME: String;
    FUNDACAO: TDate;
  end;

const
  TBL_MARCA          = 'MARCA';
  FLD_MARCA_NOME     = 'NOME';
  FLD_MARCA_FUNDACAO = 'FUNDACAO';

implementation

end.
