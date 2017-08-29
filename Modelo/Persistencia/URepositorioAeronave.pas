unit URepositorioAeronave;

interface

uses
    UAeronave
  , UModelo
  , UEntidade
  , URepositorioDB
  , SQLExpr
  , URepositorioModelo
  ;

type
  TRepositorioAeronave = class(TRepositorioDB<TAERONAVE>)
  private
    FRepositorioModelo: TRepositorioModelo;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coAERONAVE: TAERONAVE); override;
    procedure AtribuiEntidadeParaDB(const coAERONAVE: TAERONAVE;
                                    const coSQLQuery: TSQLQuery); override;
  end;


implementation

uses
    UDM
  , SysUtils
  , URepositorioVoo
  ;

{ TRepositorioAeronave }

constructor TRepositorioAeronave.Create;
begin
  Inherited Create(TAERONAVE, TBL_AERONAVE, FLD_ENTIDADE_ID, STR_AERONAVE);
  FRepositorioModelo := TRepositorioModelo.Create;
end;

destructor TRepositorioAeronave.Destroy;
begin
  inherited;
  FreeAndNil(FRepositorioModelo);
end;

procedure TRepositorioAeronave.AtribuiDBParaEntidade(
  const coAERONAVE: TAERONAVE);
begin
  inherited;
  with dmProway.SQLSelect do
  begin
    coAERONAVE.PREFIXO              := FieldByName(FLD_AERONAVE_PREFIXO).AsString;
    coAERONAVE.AUTOMONIA_VOO_NM     := FieldByName(FLD_AERONAVE_AUTOMONIA_VOO_NM).AsInteger;
    coAERONAVE.ASSENTOS             := FieldByName(FLD_AERONAVE_ASSENTOS).AsInteger;
    coAERONAVE.PISTA_NECESSARIA_KM  := FieldByName(FLD_AERONAVE_PISTA_NECESSARIA_KM).AsFloat;

    coAERONAVE.MODELO := TMODELO(
      FRepositorioModelo.Retorna(FieldByName(FLD_AERONAVE_ID_MODELO).AsInteger));
  end;
end;

procedure TRepositorioAeronave.AtribuiEntidadeParaDB(
  const coAERONAVE: TAERONAVE; const coSQLQuery: TSQLQuery);
begin
  inherited;
  with coSQLQuery do
  begin
    ParamByName(FLD_AERONAVE_PREFIXO            ).AsString  := coAERONAVE.PREFIXO;
    ParamByName(FLD_AERONAVE_AUTOMONIA_VOO_NM   ).AsInteger := coAERONAVE.AUTOMONIA_VOO_NM;
    ParamByName(FLD_AERONAVE_ASSENTOS           ).AsInteger := coAERONAVE.ASSENTOS;
    ParamByName(FLD_AERONAVE_PISTA_NECESSARIA_KM).AsFloat   := coAERONAVE.PISTA_NECESSARIA_KM;
    ParamByName(FLD_AERONAVE_ID_MODELO          ).AsInteger := coAERONAVE.MODELO.ID;
  end;
end;

end.
