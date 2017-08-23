unit URegraCRUDCidade;

interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioCidade
  , UEntidade
  , UCidade
  ;

type
  TRegraCRUDCidade = class(TRegraCRUD)
  protected
    procedure ValidaInsercao(const coENTIDADE: TENTIDADE); override;
  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDCidade }

uses
    SysUtils
  , UUtilitarios
  , UMensagens
  , UConstantes
  ;

constructor TRegraCRUDCidade.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioCidade.Create);
end;

procedure TRegraCRUDCidade.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;

  if Trim(TCIDADE(coENTIDADE).NOME) = EmptyStr Then
    raise EValidacaoNegocio.Create(STR_CIDADE_NOME_NAO_INFORMADO);

  if TCIDADE(coENTIDADE).POPULACAO <= CNT_POPULACAO_MINIMA_CIDADE then
    raise EValidacaoNegocio.CreateFmt(STR_CIDADE_POPULACAO_INVALIDA,
                                      [CNT_POPULACAO_MINIMA_CIDADE]);
end;

end.
