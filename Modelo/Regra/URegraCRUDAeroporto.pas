unit URegraCRUDAeroporto;

interface

uses
    URegraCRUD
  , URepositorioDB
  , URepositorioAeroporto
  , UEntidade
  ;

type
  TRegraCRUDAeroporto = class(TRegraCRUD)
  public
    constructor Create; override;
  end;

implementation

{ TRegraCRUDAeroporto }

constructor TRegraCRUDAeroporto.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioAeroporto.Create);
end;

end.
