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
    sbPrincipal: TStatusBar;
    miCadastro: TMenuItem;
    miCidades: TMenuItem;
    miAeroporto: TMenuItem;
    procedure miSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miCidadesClick(Sender: TObject);
    procedure miAeroportoClick(Sender: TObject);
  private
    { Private declaration }
  public
    { Public declarations }
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
    'Banco de Dados: ' + dmProway.SQLConnection.Params.Values[CNT_DATA_BASE];
end;

end.
