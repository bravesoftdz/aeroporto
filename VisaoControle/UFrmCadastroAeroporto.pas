unit UFrmCadastroAeroporto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, ExtCtrls
  , UAeroporto
  , UUtilitarios
  , URegraCRUDCidade
  , URegraCRUDAeroporto
  ;

type
  TFrmCadastroAeroporto = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    edNome: TLabeledEdit;
    edTamanhoPistaKM: TLabeledEdit;
    btnLocalizarCidade: TButton;
    edCidade: TEdit;
    lbCodigoCidade: TLabel;
    stNomeCidade: TStaticText;
    procedure btnLocalizarCidadeClick(Sender: TObject);
    procedure edCidadeExit(Sender: TObject);
  protected
    FAEROPORTO: TAEROPORTO;

    FRegraCRUDCidade: TRegraCRUDCidade;
    FregraCRUDAeroporto: TRegraCRUDAeroporto;

    procedure Inicializa; override;
    procedure Finaliza; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroAeroporto: TFrmCadastroAeroporto;

implementation

uses
    UOpcaoPesquisa
  , UEntidade
  , UFrmPesquisa
  , UCIdade
  , UDialogo
  ;

{$R *.dfm}

{ TFrmCadatroAeroporto }

procedure TFrmCadastroAeroporto.btnLocalizarCidadeClick(Sender: TObject);
begin
  edCidade.Text := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa
    .Create
    .DefineVisao(VW_CIDADE)
    .DefineNomeCampoRetorno(VW_CIDADE_ID)
    .DefineNomePesquisa(STR_CIDADE)
    .AdicionaFiltro(VW_CIDADE_NOME));

  if Trim(edCidade.Text) <> EmptyStr then
    edCidade.OnExit(btnLocalizarCidade);
end;

procedure TFrmCadastroAeroporto.edCidadeExit(Sender: TObject);
begin
  stNomeCidade.Caption := EmptyStr;
  if Trim(edCidade.Text) <> EmptyStr then
    try
      FRegraCRUDCidade.ValidaExistencia(StrToIntDef(edCidade.Text, 0));
      FAEROPORTO.CIDADE := TCIDADE(
        FRegraCRUDCidade.Retorna(StrToIntDef(edCidade.Text, 0)));

      stNomeCidade.Caption := FAEROPORTO.CIDADE.NOME;
    except
      on E: Exception do
        begin
          TDialogo.Excecao(E);
          edCidade.SetFocus;
        end;
    end;
end;

procedure TFrmCadastroAeroporto.Finaliza;
begin
  inherited;
  FreeAndNil(FRegraCRUDCidade);
end;

procedure TFrmCadastroAeroporto.HabilitaCampos(
  const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario In [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroAeroporto.Inicializa;
begin
  inherited;
  DefineEntidade(@FAEROPORTO, TAEROPORTO);
  DefineRegraCRUD(@FregraCRUDAeroporto, TRegraCRUDAeroporto);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa
    .Create
    .AdicionaFiltro(FLD_AEROPORTO_NOME)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .DefineNomePesquisa(STR_AEROPORTO)
    .DefineVisao(TBL_AEROPORTO));

  FRegraCRUDCidade := TRegraCRUDCidade.Create;
end;

procedure TFrmCadastroAeroporto.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroAeroporto.PreencheEntidade;
begin
  inherited;
  FAEROPORTO.NOME             := edNome.Text;
  FAEROPORTO.TAMANHO_PISTA_KM := StrToFloatDef(edTamanhoPistaKM.Text, 0);
end;

procedure TFrmCadastroAeroporto.PreencheFormulario;
begin
  inherited;
  edNome.Text           := FAEROPORTO.NOME;
  edTamanhoPistaKM.Text := FloatToStr(FAEROPORTO.TAMANHO_PISTA_KM);
  edCidade.Text         := IntToStr(FAEROPORTO.CIDADE.ID);
  stNomeCidade.Caption  := FAEROPORTO.CIDADE.NOME;
end;

end.
