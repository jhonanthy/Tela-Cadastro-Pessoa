unit uPessoaModel;

interface

uses
   System.SysUtils;

type
  TPessoa = class
  private
    FCodigoPessoa: Integer;
    FNome: string;
    FUsuario: string;
    FSenha: string;
    FDataInclusao: TDate;
    FDataAlteracao: TDate;
    FLogradouro: string;
    FBairro: string;
    FUF: string;
    FCEP: string;
    procedure SetCodigoPessoa(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetUsuario(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetDataInclusao(const Value: TDate);
    procedure SetDataAlteracao(const Value: TDate);
    procedure SetBairro(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetUF(const Value: string);
    { private declarations }
  public
    property CodigoPessoa: Integer read FCodigoPessoa write SetCodigoPessoa;
    property Nome: string read FNome write SetNome;
    property Usuario: string read FUsuario write SetUsuario;
    property Senha: string  read FSenha write SetSenha;
    property CEP: string read FCEP write SetCEP;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Bairro: string read FBairro write SetBairro;
    property UF: string read FUF write SetUF;
    property DataInclusao: TDate read FDataInclusao write SetDataInclusao;
    property DataAlteracao: TDate read FDataAlteracao write SetDataAlteracao;
  end;

implementation

{ TPessoa }

procedure TPessoa.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TPessoa.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TPessoa.SetCodigoPessoa(const Value: Integer);
begin
  FCodigoPessoa := Value;
end;

procedure TPessoa.SetDataAlteracao(const Value: TDate);
begin
  FDataAlteracao := Date;
end;

procedure TPessoa.SetDataInclusao(const Value: TDate);
begin
  FDataInclusao := Date;
end;

procedure TPessoa.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TPessoa.SetNome(const Value: string);
begin
  if Value = ''  then
  raise Exception.Create('Não foi informado um nome , por favor informar!');
  FNome := Value;
end;

procedure TPessoa.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TPessoa.SetUF(const Value: string);
begin
  FUF := Value;
end;

procedure TPessoa.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

end.
