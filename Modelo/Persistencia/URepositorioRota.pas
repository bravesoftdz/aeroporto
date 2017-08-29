unit URepositorioRota;

interface

uses
    UEntidade
  , UCidade
  , URota
  , URepositorioDB
  , URepositorioCidade
  , SqlExpr
  ;

type
  TRepositorioRota = class(TRepositorioDB<TROTA>)
  private
    FRepositorioCidade: TRepositorioCidade;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coROTA: TROTA); override;
    procedure AtribuiEntidadeParaDB(const coROTA: TROTA;
                                    const coSQLQuery: TSQLQuery); override;
  end;


implementation

uses
    UDM
  , SysUtils
  ;

{ TRepositorioRota }

constructor TRepositorioRota.Create;
begin
  Inherited Create(TROTA, TBL_ROTA, FLD_ENTIDADE_ID, STR_ROTA);
  FRepositorioCidade := TRepositorioCidade.Create;
end;

destructor TRepositorioRota.Destroy;
begin
  FreeAndNil(FRepositorioCidade);
  inherited;
end;

procedure TRepositorioRota.AtribuiDBParaEntidade(
  const coROTA: TROTA);
begin
  inherited;
  with dmProway.SQLSelect do
  begin
    coROTA.DISTANCIA_NM   := FieldByName(FLD_ROTA_DISTANCIA_NM).AsInteger;
    coROTA.TEMPO_MINUTOS  := FieldByName(FLD_ROTA_TEMPO_MINUTOS).AsInteger;
    coROTA.CIDADE_ORIGEM  := TCIDADE(
      FRepositorioCidade.Retorna(FieldByName(FLD_ROTA_ID_CIDADE_ORIGEM).AsInteger));
    coROTA.CIDADE_DESTINO := TCIDADE(
      FRepositorioCidade.Retorna(FieldByName(FLD_ROTA_ID_CIDADE_DESTINO).AsInteger));
  end;
end;

procedure TRepositorioRota.AtribuiEntidadeParaDB(
  const coROTA: TROTA; const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_ROTA_DISTANCIA_NM     ).AsInteger := coROTA.DISTANCIA_NM;
    ParamByName(FLD_ROTA_TEMPO_MINUTOS    ).AsInteger := coROTA.TEMPO_MINUTOS;
    ParamByName(FLD_ROTA_ID_CIDADE_ORIGEM ).AsInteger := coROTA.CIDADE_ORIGEM.ID;
    ParamByName(FLD_ROTA_ID_CIDADE_DESTINO).AsInteger := coROTA.CIDADE_DESTINO.ID;
  end;
end;

end.
