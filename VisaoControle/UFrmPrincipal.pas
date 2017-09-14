unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus
  , StdCtrls, ComCtrls
  ;

type
  TFrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    miSair: TMenuItem;
    miCadastro: TMenuItem;
    miCidades: TMenuItem;
    miAeroporto: TMenuItem;
    sbPrincipal: TStatusBar;
    miPassagem: TMenuItem;
    miCheckIn: TMenuItem;
    miEmbarque: TMenuItem;
    miLogoff: TMenuItem;
    miEncerrarAplicacao: TMenuItem;
    miUsuario: TMenuItem;
    procedure miCidadesClick(Sender: TObject);
    procedure miAeroportoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miLogoffClick(Sender: TObject);
    procedure miEncerrarAplicacaoClick(Sender: TObject);
    procedure miUsuarioClick(Sender: TObject);
  private
    procedure AtivaMenus;
    procedure AtualizaUsuarioLogado;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
    UDM
  , DB
  , UFrmCadastroCidade
  , UFrmCadastroAeroporto
  , UFrmCadastroUsuario
  , UFrmLogin
  , UCidade
  , UAeroporto
  , UUsuarioLogado
  , UUtilitarios
  ;

{$R *.dfm}

procedure TFrmPrincipal.miAeroportoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroAeroporto, FrmCadastroAeroporto);
end;

procedure TFrmPrincipal.miCidadesClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroCidade, FrmCadastroCidade);
end;

procedure TFrmPrincipal.miEncerrarAplicacaoClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.miLogoffClick(Sender: TObject);
begin
  TUsuarioLogado.Logoff;
  Application.CreateForm(TFrmLogin, FrmLogin);
  if FrmLogin.ShowModal = mrYes then
    begin
      FreeAndNil(FrmLogin);
      AtivaMenus;
      AtualizaUsuarioLogado;
    end
  else
    Close;
end;

procedure TFrmPrincipal.miUsuarioClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastroUsuario, FrmCadastroUsuario);
end;

procedure TFrmPrincipal.AtivaMenus;
begin
  miCidades.Visible   := TUsuarioLogado.PossuiPapel(tpluAdministrador);
  miAeroporto.Visible := TUsuarioLogado.PossuiPapel(tpluAdministrador);
  miUsuario.Visible   := TUsuarioLogado.PossuiPapel(tpluAdministrador);
  miCadastro.Visible  := miCidades.Visible
                      or miAeroporto.Visible
                      or miUsuario.Visible;

  miCheckIn.Visible   := TUsuarioLogado.PossuiPermissoes([tpruRealizarCheckIn]);
  miEmbarque.Visible  := TUsuarioLogado.PossuiAoMenosUmaDasPermissoes(
    [tpruConfirmarEmbarque, tpruAlterarHorarioEmbarque]);
  miPassagem.Visible  := miCheckIn.Visible
                      or miEmbarque.Visible;
end;

procedure TFrmPrincipal.AtualizaUsuarioLogado;
begin
  sbPrincipal.Panels[1].Text :=
    'Usuário: ' + TUsuarioLogado.USUARIO.NOME;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text :=
    'Banco de Dados: ' + dmEntra21.SQLConnection.Params.Values[CNT_DATA_BASE];

  AtivaMenus;
  AtualizaUsuarioLogado;
end;

end.
