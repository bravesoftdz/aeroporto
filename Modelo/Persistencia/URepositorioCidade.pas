unit URepositorioCidade;

interface

uses
    UCidade
  , UEntidade
  , URepositorioDB
  , SqlExpr
  ;

type
  TRepositorioCidade = class(TRepositorioDB<TCIDADE>)
  public
    constructor Create;

    procedure AtribuiDBParaEntidade(const coCIDADE: TCIDADE); override;
    procedure AtribuiEntidadeParaDB(const coCIDADE: TCIDADE;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

uses
    UDM
  ;

{ TRepositorioCidade }

constructor TRepositorioCidade.Create;
begin
  Inherited Create(TCIDADE, TBL_CIDADE, FLD_ENTIDADE_ID, STR_CIDADE);
end;

procedure TRepositorioCidade.AtribuiDBParaEntidade(const coCIDADE: TCIDADE);
begin
  inherited;
  with FSQLSelect do
  begin
    coCIDADE.NOME      := FieldByName(FLD_CIDADE_NOME).AsString;
    coCIDADE.POPULACAO := FieldByName(FLD_CIDADE_POPULACAO).AsInteger;
  end;
end;

procedure TRepositorioCidade.AtribuiEntidadeParaDB(const coCIDADE: TCIDADE;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_CIDADE_NOME).AsString       := coCIDADE.NOME;
    ParamByName(FLD_CIDADE_POPULACAO).AsInteger := coCIDADE.POPULACAO;
  end;
end;

end.
