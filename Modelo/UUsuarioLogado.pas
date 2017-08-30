unit UUsuarioLogado;

interface

uses
    UUsuario
  , URepositorioUsuario
  ;

type
  TUsuarioLogado = class
  private
    FUSUARIO: TUSUARIO;
    FRepositorioUsuario: TRepositorioUsuario;

  public
    constructor Create;
    destructor Destroy; override;

    procedure RealizaLogin(const csLogin: String;const csSenha: String);
    procedure Logoff;

    function USUARIO: TUSUARIO;

    class function Unico: TUsuarioLogado;
  end;

implementation

uses
    SysUtils
  , UUtilitarios
  , IdHashMessageDigest
  ;

var
  UsuarioLogado: TUsuarioLogado = nil;

{ TUsuarioLogado }

constructor TUsuarioLogado.Create;
begin
  FRepositorioUsuario := TRepositorioUsuario.Create;
end;

destructor TUsuarioLogado.Destroy;
begin
  FreeAndNil(FRepositorioUsuario);
  inherited;
end;

procedure TUsuarioLogado.Logoff;
begin
  if Assigned(FUSUARIO) then
    FreeAndNil(FUSUARIO);
end;

procedure TUsuarioLogado.RealizaLogin(const csLogin, csSenha: String);
var
  HashMessageDigest5: TIdHashMessageDigest5;
  SenhaCriptografada: String;
begin
  FUSUARIO := FRepositorioUsuario.RetornaPeloLogin(csLogin);

  if not Assigned(FUSUARIO) then
    raise EValidacaoNegocio.Create('Usuário ou Senha são inválidos');

  HashMessageDigest5 := TIdHashMessageDigest5.Create;
  try
    SenhaCriptografada := HashMessageDigest5.HashStringAsHex(csSenha);
    if FUSUARIO.SENHA <> SenhaCriptografada then
      raise EValidacaoNegocio.Create('Usuário ou Senha são inválidos');
  finally
    FreeAndNil(HashMessageDigest5);
  end;
end;

class function TUsuarioLogado.Unico: TUsuarioLogado;
begin
  if not Assigned(UsuarioLogado) then
    UsuarioLogado := TUsuarioLogado.Create;

  Result := UsuarioLogado;
end;

function TUsuarioLogado.USUARIO: TUSUARIO;
begin
  Result := FUSUARIO;
end;

end.
