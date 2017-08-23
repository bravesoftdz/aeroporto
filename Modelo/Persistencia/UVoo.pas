unit UVoo;

interface

uses
    UEntidade
  , URota
  , UAeronave
  ;

type
  TVOO = class(TENTIDADE)
  public
    ROTA    : TROTA;
    AERONAVE: TAERONAVE;
    PARTIDA : TDateTime;
    CHEDADA : TDateTime;

    constructor Create; override;
    destructor Destroy; override;
  end;

const
  TBL_VOO             = 'VOO';
  FLD_VOO_ID_AERONAVE = 'ID_AERONAVE';
  FLD_VOO_ID_ROTA     = 'ID_ROTA';
  FLD_VOO_PARTIDA     = 'PARTIDA';
  FLD_VOO_CHEGADA     = 'CHEGADA';

implementation

uses
    SysUtils
  ;

{ TVOO }

constructor TVOO.Create;
begin
  ROTA     := TROTA.Create;
  AERONAVE := TAERONAVE.Create;
end;

destructor TVOO.Destroy;
begin
  FreeAndNil(ROTA);
  FreeAndNil(AERONAVE);
  inherited;
end;

end.
