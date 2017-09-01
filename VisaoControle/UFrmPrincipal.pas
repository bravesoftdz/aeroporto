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
    procedure miSairClick(Sender: TObject);
    procedure miCidadesClick(Sender: TObject);
    procedure miAeroportoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
    UDM
  , DB
  , UFrmCadastroCidade
  , UFrmCadastroAeroporto
  , UCidade
  , UAeroporto
  , UUsuarioLogado
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

procedure TFrmPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  sbPrincipal.Panels[0].Text :=
    'Banco de Dados: ' + dmEntra21.SQLConnection.Params.Values[CNT_DATA_BASE];

  sbPrincipal.Panels[1].Text :=
    'Usuário: ' + TUsuarioLogado.Unico.USUARIO.LOGIN;
end;

end.
