unit URota;

interface

uses
    UEntidade
  , UCidade
  ;

type
  TROTA = class(TENTIDADE)
  public
    CIDADE_ORIGEM : TCIDADE;
    CIDADE_DESTINO: TCIDADE;
    DISTANCIA_NM  : Integer;
    TEMPO_MINUTOS : Integer;

    constructor Create; override;
    destructor Destroy; override;
  end;

const
  TBL_ROTA                   = 'ROTA';
  FLD_ROTA_ID_CIDADE_ORIGEM  = 'ID_CIDADE_ORIGEM';
  FLD_ROTA_ID_CIDADE_DESTINO = 'ID_CIDADE_DESTINO';
  FLD_ROTA_DISTANCIA_NM      = 'DISTANCIA_NM';
  FLD_ROTA_TEMPO_MINUTOS     = 'TEMPO_MINUTOS';

resourcestring
  STR_ROTA = 'Rota';

implementation

uses
    SysUtils
  ;

{ TVOO }

constructor TROTA.Create;
begin
  inherited;
  CIDADE_ORIGEM  := TCIDADE.Create;
  CIDADE_DESTINO := TCIDADE.Create;
end;

destructor TROTA.Destroy;
begin
  FreeAndNil(CIDADE_ORIGEM);
  FreeAndNil(CIDADE_DESTINO);
  inherited;
end;

end.
