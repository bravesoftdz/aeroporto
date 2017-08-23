program Aeroporto;

uses
  Forms,
  UFrmPrincipal in 'VisaoControle\UFrmPrincipal.pas' {FrmPrincipal},
  UFrmCRUD in 'VisaoControle\UFrmCRUD.pas' {FrmCRUD},
  UUtilitarios in 'Modelo\UUtilitarios.pas',
  UMensagens in 'Modelo\UMensagens.pas',
  UConstantes in 'Modelo\UConstantes.pas',
  UDialogo in 'Modelo\UDialogo.pas',
  UOpcaoPesquisa in 'Modelo\UOpcaoPesquisa.pas',
  UDM in 'Modelo\Persistencia\UDM.pas' {dmProway: TDataModule},
  UEntidade in 'Modelo\Persistencia\UEntidade.pas',
  URepositorio in 'Modelo\Persistencia\URepositorio.pas',
  URepositorioDB in 'Modelo\Persistencia\URepositorioDB.pas',
  URegraCRUD in 'Modelo\Regra\URegraCRUD.pas',
  UCidade in 'Modelo\Persistencia\UCidade.pas',
  UFrmCadastroCidade in 'VisaoControle\UFrmCadastroCidade.pas' {FrmCadastroCidade},
  URegraCRUDCidade in 'Modelo\Regra\URegraCRUDCidade.pas',
  URepositorioCidade in 'Modelo\Persistencia\URepositorioCidade.pas',
  UAeroporto in 'Modelo\Persistencia\UAeroporto.pas',
  URepositorioAeroporto in 'Modelo\Persistencia\URepositorioAeroporto.pas',
  UFrmCadastroAeroporto in 'VisaoControle\UFrmCadastroAeroporto.pas' {FrmCadastroAeroporto},
  URegraCRUDAeroporto in 'Modelo\Regra\URegraCRUDAeroporto.pas',
  URota in 'Modelo\Persistencia\URota.pas',
  UVoo in 'Modelo\Persistencia\UVoo.pas',
  UAeronave in 'Modelo\Persistencia\UAeronave.pas',
  UModelo in 'Modelo\Persistencia\UModelo.pas',
  UMarca in 'Modelo\Persistencia\UMarca.pas',
  UPassagem in 'Modelo\Persistencia\UPassagem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmProway, dmProway);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
