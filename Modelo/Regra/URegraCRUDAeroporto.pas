{
  @author: Felipe Silvino Pereira
  @date: 01/08/2017
  @description: Classe base para implementação das regras de negócio a serem
                aplicadadas à uma entidade durante o CRUD.
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
  protected
    procedure ValidaInsercao(const coENTIDADE: TENTIDADE); override;

  public
    constructor Create; override;
  end;

implementation

uses
    UUsuarioLogado
  , UUtilitarios
  ;

resourcestring
  STR_USUARIO_NAO_POSSUI_PERMISSAO_INSERIR_AEROPORTO = 'Usuário %s não possui permissão para inserir um aeroporto';

{ TRegraCRUDAeroporto }

constructor TRegraCRUDAeroporto.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioAeroporto.Create);
end;

procedure TRegraCRUDAeroporto.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  if not TUsuarioLogado.PossuiPapel(tpluAdministrador) then
    raise EValidacaoNegocio.CreateFmt(STR_USUARIO_NAO_POSSUI_PERMISSAO_INSERIR_AEROPORTO
      , [TUsuarioLogado.USUARIO.LOGIN]);
end;

end.
