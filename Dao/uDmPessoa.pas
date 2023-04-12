unit uDmPessoa;

interface

uses
  System.SysUtils,System.StrUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Data.DB, Datasnap.DBClient, uPessoaEnum, uDmConexao,
  uPessoaModel,Vcl.Forms,Vcl.Dialogs,Winapi.Windows, Winapi.Messages;

type
  TDMPessoa = class(TDataModule)
    FDQueryConsulta: TFDQuery;
    FDQueryCRUD: TFDQuery;
    FDQueryConsultaPES_CODIGO: TIntegerField;
    FDQueryConsultaPES_NOME: TStringField;
    FDQueryConsultaUSUARIO: TStringField;
    FDQueryConsultaSENHA: TStringField;
    FDQueryConsultaPES_CEP: TStringField;
    FDQueryConsultaPES_LOGRADOURO: TStringField;
    FDQueryConsultaPES_BAIRRO: TStringField;
    FDQueryConsultaPES_UF: TStringField;
  private
    { Private declarations }
  public
    Procedure CarregaControles(Pessoa :TPessoa; codigoPessoa: Integer);
    procedure ConsultaPessoa(TextoConsulta: string; TipoPesquisa: Integer);
    function  Inserir(Pessoa :TPessoa; out sErro: string):boolean;
    function  Alterar(Pessoa :TPessoa; out sErro: string):boolean;
    function  Excluir(codigoPessoa: Integer; out sErro: string): boolean;
    function  TestandoDuplicacao(Chave: string; Tabela: string): string;
end;

var
  DMPessoa: TDMPessoa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

{ TDMPessoa }

function TDMPessoa.Alterar(Pessoa: TPessoa; out sErro: string): boolean;
begin
 Result:= false;
 try
  FDQueryCRUD.Close;
  FDQueryCRUD.sql.Clear;
  FDQueryCRUD.ExecSQL('UPDATE PESSOA  set PES_NOME = :Nome,USUARIO = :Usuario ,SENHA = :Senha,PES_CEP = :Cep,PES_LOGRADOURO = :Logradouro,PES_BAIRRO = :Bairro, PES_UF = :UF  WHERE PES_CODIGO = :codigoPessoa',
    [Pessoa.Nome,Pessoa.Usuario,Pessoa.Senha,Pessoa.CEP,Pessoa.Logradouro,Pessoa.Bairro,Pessoa.UF, Pessoa.CodigoPessoa]);
  Result:= true;
 except on E: Exception do
  begin
    sErro := 'N�o foi possivel realizar a Opera��o de Altera��o no banco, verificar erro : '+sLineBreak+ E.Message +' !';
  end;

 end;
end;

procedure TDMPessoa.CarregaControles(Pessoa: TPessoa;codigoPessoa: integer);
begin

FDQueryConsulta.close;
 FDQueryConsulta.SQL.Clear;
 FDQueryConsulta.sql.Add('SELECT PES_CODIGO,PES_NOME,USUARIO,SENHA,PES_CEP,PES_LOGRADOURO,PES_BAIRRO,PES_UF FROM PESSOA WHERE PES_CODIGO = :codigo');
 FDQueryConsulta.ParamByName('codigo').AsInteger := codigoPessoa;
 FDQueryConsulta.Open;


 Pessoa.CodigoPessoa :=   FDQueryConsulta.FieldByName('PES_CODIGO').AsInteger;
 Pessoa.Nome         :=   FDQueryConsulta.FieldByName('PES_NOME').AsString;
 Pessoa.usuario      :=   FDQueryConsulta.FieldByName('USUARIO').AsString;
 Pessoa.Senha        :=   FDQueryConsulta.FieldByName('SENHA').AsString;
 Pessoa.CEP          :=   FDQueryConsulta.FieldByName('PES_CEP').AsString;
 Pessoa.Logradouro   :=   FDQueryConsulta.FieldByName('PES_LOGRADOURO').AsString;
 Pessoa.Bairro       :=   FDQueryConsulta.FieldByName('PES_BAIRRO').AsString;
 Pessoa.UF           :=   FDQueryConsulta.FieldByName('PES_UF').AsString;


end;

procedure TDMPessoa.ConsultaPessoa(TextoConsulta: string;
  TipoPesquisa: Integer);
var
  strComando: string;
begin
//  if trim(TextoConsulta) = '' then
//      Strcomando := Strcomando + '  ';

  FDQueryConsulta.close;
  FDQueryConsulta.SQL.Clear;
  strComando := ' SELECT * FROM PESSOA ';

  case TipoPesquisa of
    0:  //Codigo Pessoa
      begin
         strComando := strComando + ' WHERE PES_CODIGO = '+ trim(TextoConsulta);
      end;
    1:  // Nome da Pessoa
      begin
        strComando := strComando + '  WHERE upper(PES_NOME) LIKE '+quotedstr('%'+ uppercase(TextoConsulta)+'%');
      end;
    2:  //Todos os Registros
      begin
        strComando:= strComando + '  ';
      end;
  end;

  strComando:= strComando + '    order by PES_NOME ASC';


  FDQueryConsulta.sql.Add(strcomando);
  FDQueryConsulta.Open;

  if FDQueryConsulta.IsEmpty then
      application.MessageBox('Consulta n�o encontrada na Base!','Informa��o',MB_OK+MB_ICONINFORMATION);
end;

function TDMPessoa.Excluir(codigoPessoa: Integer; out sErro: string): boolean;
begin
  Result:= false;
 try
  FDQueryCRUD.Close;
  FDQueryCRUD.sql.Clear;
  FDQueryCRUD.sql.Add('DELETE FROM PESSOA WHERE PES_CODIGO = :codigoPessoa');
  FDQueryCRUD.ParamByName('codigoPessoa').AsInteger :=codigoPessoa;
  FDQueryCRUD.ExecSQL;
//  FDQueryCRUD.ExecSQL('DELETE FROM PESSOA WHERE PES_CODIGO = :codigoPessoa',
//    [codigoPessoa]);
  Result:= true;
 except on E: Exception do
  begin
    sErro := 'N�o foi possivel realizar a Opera��o de Delete no banco, verificar erro : '+sLineBreak+ E.Message +' !';
  end;

 end;
end;

function TDMPessoa.Inserir(Pessoa: TPessoa; out sErro: string): boolean;
begin
Result:= false;
 try
  FDQueryCRUD.Close;
  FDQueryCRUD.sql.Clear;
  FDQueryCRUD.ExecSQL('INSERT INTO PESSOA  (PES_CODIGO,PES_NOME,USUARIO,SENHA,PES_CEP,PES_LOGRADOURO,PES_BAIRRO,PES_UF) VALUES(:Codigo,:Nome,:Usuario,:Senha,:Cep,:Logradouro,:Bairro,:UF)',
    [Pessoa.CodigoPessoa,Pessoa.Nome,Pessoa.Usuario,Pessoa.Senha,Pessoa.CEP,Pessoa.Logradouro,Pessoa.Bairro,Pessoa.UF]);
  Result:= true;
 except on E: Exception do
  begin
    sErro := 'N�o foi possivel realizar a Opera��o de inser��o no banco, verificar erro : '+sLineBreak+ E.Message +' !';
  end;

 end;
end;

function TDMPessoa.TestandoDuplicacao(Chave, Tabela: string): string;
var
  strComando: string;
  NovoID, i : integer;
begin
    //rotina que evita duplicacao do campo chave

  with FDQueryCRUD do
  begin
      close;
      SQL.Clear;
      SQL.Add('select max('+chave+') as UltimoRegistro from '+Tabela);

      open;
      NovoID:=(FieldByName('UltimoRegistro').AsInteger)+1;  //encontrei o novo registro e vou incrementar
      for i:=1 to 10 do
        try
          result:=inttostr(NovoID);
          break;
        except
          NovoID:=NovoID+1;
        end;

  end;

end;

end.
