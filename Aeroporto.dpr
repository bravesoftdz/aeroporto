program Aeroporto;

uses
  Forms,
  SysUtils,
  Controls,
  UFrmPrincipal in 'VisaoControle\UFrmPrincipal.pas' {FrmPrincipal},
  UFrmCRUD in 'VisaoControle\UFrmCRUD.pas' {FrmCRUD},
  UUtilitarios in 'Modelo\UUtilitarios.pas',
  UMensagens in 'Modelo\UMensagens.pas',
  UConstantes in 'Modelo\UConstantes.pas',
  UDialogo in 'Modelo\UDialogo.pas',
  UOpcaoPesquisa in 'Modelo\UOpcaoPesquisa.pas',
  UDM in 'Modelo\Persistencia\UDM.pas' {dmProway: TDataModule},
  UEntidade in 'Modelo\Persistencia\UEntidade.pas',
  URepositorio in 'Modelo\Persistencia\URepositorio.pas',
  URepositorioDB in 'Modelo\Persistencia\URepositorioDB.pas',
  URegraCRUD in 'Modelo\Regra\URegraCRUD.pas',
  UCidade in 'Modelo\Persistencia\UCidade.pas',
  UFrmCadastroCidade in 'VisaoControle\UFrmCadastroCidade.pas' {FrmCadastroCidade},
  URegraCRUDCidade in 'Modelo\Regra\URegraCRUDCidade.pas',
  URepositorioCidade in 'Modelo\Persistencia\URepositorioCidade.pas',
  UAeroporto in 'Modelo\Persistencia\UAeroporto.pas',
  URepositorioRota in 'Modelo\Persistencia\URepositorioRota.pas',
  UFrmCadastroAeroporto in 'VisaoControle\UFrmCadastroAeroporto.pas' {FrmCadastroAeroporto},
  URegraCRUDAeroporto in 'Modelo\Regra\URegraCRUDAeroporto.pas',
  URota in 'Modelo\Persistencia\URota.pas',
  UVoo in 'Modelo\Persistencia\UVoo.pas',
  UAeronave in 'Modelo\Persistencia\UAeronave.pas',
  UModelo in 'Modelo\Persistencia\UModelo.pas',
  UMarca in 'Modelo\Persistencia\UMarca.pas',
  UPassagem in 'Modelo\Persistencia\UPassagem.pas',
  URepositorioAeroporto in 'Modelo\Persistencia\URepositorioAeroporto.pas',
  URepositorioAeronave in 'Modelo\Persistencia\URepositorioAeronave.pas',
  URepositorioVoo in 'Modelo\Persistencia\URepositorioVoo.pas',
  URepositorioModelo in 'Modelo\Persistencia\URepositorioModelo.pas',
  UFrmLogin in 'VisaoControle\UFrmLogin.pas' {FrmLogin},
  UUsuario in 'Modelo\Persistencia\UUsuario.pas',
  URepositorioUsuario in 'Modelo\Persistencia\URepositorioUsuario.pas',
  UUsuarioLogado in 'Modelo\UUsuarioLogado.pas',
  URepositorioPapelPermissao in 'Modelo\Persistencia\URepositorioPapelPermissao.pas',
  UFrmCadastroUsuario in 'VisaoControle\UFrmCadastroUsuario.pas' {FrmCadastroUsuario},
  UPapel in 'Modelo\Persistencia\UPapel.pas',
  URepositorioPapel in 'Modelo\Persistencia\URepositorioPapel.pas',
  URegraCRUDUsuario in 'Modelo\Regra\URegraCRUDUsuario.pas';

{$R *.res}

begin
  {$DEFINE DESENV}
  Application.Initialize;
  Application.CreateForm(TdmEntra21, dmEntra21);
  {$IFDEF PROD}
  FrmLogin := TFrmLogin.Create(nil);
  if FrmLogin.ShowModal = mrYes then
    begin
      FreeAndNil(FrmLogin);
      Application.CreateForm(TFrmPrincipal, FrmPrincipal);
      Application.Run;
    end
  else
    begin
      Application.Run;
      Application.Terminate;
    end;
  {$ELSE}
  TUsuarioLogado.Unico.RealizaLogin('admin', 'admin');
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
  {$ENDIF}
end.
