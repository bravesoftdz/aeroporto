unit UFrmCadastroCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UCidade
  , URegraCRUDCidade
  , UUtilitarios
  ;

type
  TFrmCadastroCidade = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNome: TLabeledEdit;
    edPopulacao: TLabeledEdit;
  protected
    FCIDADE: TCIDADE;
    FRegraCRUDCidade: TRegraCRUDCidade;

    procedure Inicializa; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroCidade: TFrmCadastroCidade;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  ;

{$R *.dfm}

{ TFrmCadastroCidade }

procedure TFrmCadastroCidade.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := ceTipoOperacaoUsuario in [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroCidade.Inicializa;
begin
  inherited;
  DefineEntidade(@FCIDADE, TCIDADE);
  DefineRegraCRUD(@FRegraCRUDCidade, TRegraCRUDCidade);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_CIDADE)
    .DefineNomeCampoRetorno(VW_CIDADE_ID)
    .AdicionaFiltro(VW_CIDADE_NOME)
    .DefineNomePesquisa('Pesquisa Y'));

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(TBL_CIDADE)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .AdicionaFiltro(FLD_CIDADE_NOME)
    .DefineNomePesquisa('Pesquisa X'));
end;

procedure TFrmCadastroCidade.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroCidade.PreencheEntidade;
begin
  inherited;
  FCIDADE.NOME      := edNome.Text;
  FCIDADE.POPULACAO := StrToIntDef(edPopulacao.Text, 0);
end;

procedure TFrmCadastroCidade.PreencheFormulario;
begin
  inherited;
  edNome.Text      := FCIDADE.NOME;
  edPopulacao.Text := IntToStr(FCIDADE.POPULACAO);
end;

end.
