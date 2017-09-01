unit URepositorioModelo;

interface

uses
    UModelo
  , UEntidade
  , URepositorioDB
  , SqlExpr
  ;

type
  TRepositorioModelo = class(TRepositorioDB<TMODELO>)
  public
    constructor Create;

    procedure AtribuiDBParaEntidade(const coMODELO: TMODELO); override;
    procedure AtribuiEntidadeParaDB(const coMODELO: TMODELO;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

uses
    UDM
  ;

{ TRepositorioModelo }

constructor TRepositorioModelo.Create;
begin
  Inherited Create(TMODELO, TBL_MODELO, FLD_ENTIDADE_ID, STR_MODELO);
end;

procedure TRepositorioModelo.AtribuiDBParaEntidade(const coMODELO: TMODELO);
begin
  inherited;
  with FSQLSelect do
  begin
    coMODELO.NOME  := FieldByName(FLD_MODELO_NOME).AsString;
    //coMODELO.MARCA := nil; To-Do
  end;
end;

procedure TRepositorioModelo.AtribuiEntidadeParaDB(const coMODELO: TMODELO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_MODELO_NOME    ).AsString  := coMODELO.NOME;
    ParamByName(FLD_MODELO_ID_MARCA).AsInteger := coMODELO.MARCA.ID;
  end;
end;

end.
