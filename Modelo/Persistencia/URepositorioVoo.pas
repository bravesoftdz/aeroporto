unit URepositorioVoo;

interface

uses
    UVoo
  , URepositorioDB
  , SQLExpr
  ;

type
  TRepositorioVoo = class(TRepositorioDB<TVOO>)
  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiDBParaEntidade(const coAERONAVE: TVOO); override;
    procedure AtribuiEntidadeParaDB(const coAERONAVE: TVOO;
                                    const coSQLQuery: TSQLQuery); override;
  end;

implementation

{ TRepositorioVoo }

procedure TRepositorioVoo.AtribuiDBParaEntidade(const coAERONAVE: TVOO);
begin
  inherited;

end;

procedure TRepositorioVoo.AtribuiEntidadeParaDB(const coAERONAVE: TVOO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;

end;

constructor TRepositorioVoo.Create;
begin

end;

destructor TRepositorioVoo.Destroy;
begin

  inherited;
end;

end.
