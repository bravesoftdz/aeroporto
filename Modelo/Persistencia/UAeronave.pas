unit UAeronave;

interface

uses
    UEntidade
  , UModelo
  ;

type
  TAERONAVE = class(TENTIDADE)
  public
    PREFIXO            : String;
    MODELO             : TMODELO;
    AUTOMONIA_VOO_NM   : Integer;
    ASSENTOS           : Integer;
    PISTA_NECESSARIA_KM: Double;

    constructor Create; override;
    destructor Destroy; override;
  end;

const
  TBL_AERONAVE                     = 'AERONAVE';
  FLD_AERONAVE_ID_MODELO           = 'ID_MODELO';
  FLD_AERONAVE_AUTOMONIA_VOO_NM    = 'AUTOMONIA_VOO_NM';
  FLD_AERONAVE_ASSENTOS            = 'ASSENTOS';
  FLD_AERONAVE_PISTA_NECESSARIA_KM = 'PISTA_NECESSARIA_KM';

implementation

uses
    SysUtils
  ;

{ TAERONAVE }

constructor TAERONAVE.Create;
begin
  MODELO := TMODELO.Create;
end;

destructor TAERONAVE.Destroy;
begin
  FreeAndNil(MODELO);
end;

end.
