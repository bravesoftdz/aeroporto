{
  @author: Felipe Silvino Pereira
  @date: 01/08/2017
  @description: Classe base para implementa��o das regras de neg�cio a serem
                aplicadadas � uma entidade durante o CRUD.
}

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
