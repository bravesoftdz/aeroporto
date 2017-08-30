unit UUsuario;

interface

uses
    UEntidade
  ;

type
  TUSUARIO = class(TENTIDADE)
  public
    LOGIN: String;
    SENHA: String;
  end;

const
  TBL_USUARIO       = 'USUARIO';
  FLD_USUARIO_LOGIN = 'LOGIN';
  FLD_USUARIO_SENHA = 'SEnHA';

resourcestring
  STR_USUARIO = 'Usuário do Sistema';

implementation

{ TUSUARIO }

end.
