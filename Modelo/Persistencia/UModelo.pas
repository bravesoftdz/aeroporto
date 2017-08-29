unit UModelo;

interface

uses
    UEntidade
  , UMarca
  ;

type
  TMODELO = class(TENTIDADE)
  public
    NOME : String;
    MARCA: TMARCA;

    constructor Create; override;
    destructor Destroy; override;
  end;

const
  TBL_MODELO          = 'MODELO';
  FLD_MODELO_NOME     = 'NOME';
  FLD_MODELO_ID_MARCA = 'ID_MARCA';

resourcestring
  STR_MODELO = 'Modelo da Aeronave';

implementation

uses
    SysUtils
  ;

{ TMODELO }

constructor TMODELO.Create;
begin
  inherited;
  MARCA := TMARCA.Create;
end;

destructor TMODELO.Destroy;
begin
  FreeAndNil(MARCA);
  inherited;
end;

end.
