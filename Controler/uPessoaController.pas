unit uPessoaController;

interface

uses 
  uPessoaModel, uDmPessoa,System.SysUtils;

type
  TPessoaController = class
  private
    { private declarations }
  
  public
    constructor Create;
    destructor Destroy; override;
    procedure ConsultaPessoa(TextoConsulta: string; TipoPesquisa: Integer);
    procedure CarregaControles(Pessoa: TPessoa; codigoPessoa: Integer);
    function Inserir(Pessoa: Tpessoa; var sErro: string ): boolean;
    function Alterar(Pessoa: Tpessoa; var sErro: string ): boolean;
    function Excluir(codigoPessoa: Integer; var sErro: string ): boolean;
    function TestandoDuplicacao(Chave: string; Tabela: string): string;
  end;

implementation



{ TPessoaController }

function TPessoaController.Alterar(Pessoa: Tpessoa; var sErro: string): boolean;
begin
  Result := DMPessoa.Alterar(Pessoa, sErro);
end;

procedure TPessoaController.CarregaControles(Pessoa: TPessoa;
  codigoPessoa: Integer);
begin
  DMPessoa.CarregaControles(Pessoa,codigoPessoa);
end;

procedure TPessoaController.ConsultaPessoa(TextoConsulta: string;
  TipoPesquisa: Integer);
begin
  DMPessoa.ConsultaPessoa(TextoConsulta,TipoPesquisa);
end;

constructor TPessoaController.Create;
begin
//  DMPessoa := DMPessoa.Create(nil);
end;

destructor TPessoaController.Destroy;
begin
//  FreeAndNil(DMPessoa);
  inherited;
end;

function TPessoaController.Excluir(codigoPessoa: Integer; var sErro: string): boolean;
begin
  Result := DMPessoa.Excluir(codigoPessoa, sErro);
end;

function TPessoaController.Inserir(Pessoa: Tpessoa; var sErro: string): boolean;
begin
  Result := DMPessoa.Inserir(Pessoa, sErro);
end;

function TPessoaController.TestandoDuplicacao(Chave, Tabela: string): string;
begin
    //rotina que evita duplicacao do campo chave
   Result := DMPessoa.TestandoDuplicacao(Chave, Tabela);
end;


end.
