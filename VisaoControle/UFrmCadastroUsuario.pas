unit UFrmCadastroUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UUsuario
  , UPapel
  , URegraCRUDUsuario
  , UUtilitarios
  , URepositorioPapel
  ;

type
  TFrmCadastroUsuario = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNome: TLabeledEdit;
    edLogin: TLabeledEdit;
    edSenha: TLabeledEdit;
    edConfirmacaoSenha: TLabeledEdit;
    cbPapel: TComboBox;
    lbPerfil: TLabel;
    edSenhaAtual: TLabeledEdit;
    procedure VerificaSenhaExit(Sender: TObject);
  protected
    FUSUARIO: TUSUARIO;
    FRegraCRUDUsuario: TRegraCRUDUsuario;
    FRepositorioPapel: TRepositorioPapel;

    procedure Inicializa; override;
    procedure Finaliza; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroUsuario: TFrmCadastroUsuario;

implementation

{$R *.dfm}

uses
    UOpcaoPesquisa
  , StrUtils
  , UDialogo
  ;

resourcestring
  STR_NOVA_SENHA = 'Nova Senha';
  STR_SENHA      = 'Senha';

{ TFrmCadastroUsuario }

procedure TFrmCadastroUsuario.VerificaSenhaExit(Sender: TObject);
begin
  inherited;
  if  (Trim(edSenha.Text) <> EmptyStr)
  and (Trim(edConfirmacaoSenha.Text) <> EmptyStr) then
    try
      FRegraCRUDUsuario.ValidaSenha(edSenha.Text, edConfirmacaoSenha.Text);
    except
      on E: EValidacaoNegocio do
        begin
          TDialogo.Excecao(E);
          edSenha.Clear;
          edConfirmacaoSenha.Clear;
          edSenha.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroUsuario.Finaliza;
begin
  inherited;
  FreeAndNil(FRepositorioPapel);
end;

procedure TFrmCadastroUsuario.HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := ceTipoOperacaoUsuario in [touInsercao, touAtualizacao];
  edSenhaAtual.Visible  := ceTipoOperacaoUsuario = touAtualizacao;
  edLogin.Enabled       := ceTipoOperacaoUsuario = touInsercao;

  edSenha.EditLabel.Caption := IfThen(ceTipoOperacaoUsuario = touAtualizacao
                                    , STR_NOVA_SENHA
                                    , STR_SENHA);
end;

procedure TFrmCadastroUsuario.Inicializa;
var
  coPAPEL: TPAPEL;
begin
  inherited;

  DefineEntidade(@FUSUARIO, TUSUARIO);
  DefineRegraCRUD(@FRegraCRUDUsuario, TRegraCRUDUsuario);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_USUARIO)
    .DefineNomeCampoRetorno(VW_USUARIO_ID)
    .AdicionaFiltro(VW_USUARIO_NOME)
    .DefineNomePesquisa('Por Nome'));

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_USUARIO)
    .DefineNomeCampoRetorno(VW_USUARIO_ID)
    .AdicionaFiltro(VW_USUARIO_LOGIN)
    .DefineNomePesquisa('Por Login'));

  FRepositorioPapel := TRepositorioPapel.Create;

  for coPAPEL in FRepositorioPapel.RetornaTodos do
    cbPapel.Items.Add(coPAPEL.DESCRICAO);

  cbPapel.ItemIndex := 0;
end;

procedure TFrmCadastroUsuario.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus
end;

procedure TFrmCadastroUsuario.PreencheEntidade;
begin
  inherited;
  FUSUARIO.NOME  := edNome.Text;
  FUSUARIO.SENHA := edSenha.Text;
  FUSUARIO.LOGIN := edLogin.Text;
  FUSUARIO.PAPEL := TPapelUsuario(cbPapel.ItemIndex);

  FRegraCRUDUsuario.CONFIRMACAO_SENHA := edConfirmacaoSenha.Text;
  FRegraCRUDUsuario.SENHA_ATUAL       := edSenhaAtual.Text;
end;

procedure TFrmCadastroUsuario.PreencheFormulario;
begin
  inherited;
  edNome.Text       := FUSUARIO.NOME;
  edLogin.Text      := FUSUARIO.LOGIN;
  cbPapel.ItemIndex := Integer(FUSUARIO.PAPEL);
end;

end.
