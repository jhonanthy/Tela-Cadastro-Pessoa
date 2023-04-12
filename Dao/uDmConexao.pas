unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet,Vcl.Forms,Vcl.Dialogs,Winapi.Windows, Winapi.Messages;

type
  TDMConexao = class(TDataModule)
    FDQueryAutenticacao: TFDQuery;
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  function AutenticaEntrada(sLogin,sSenha: string):boolean;
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



{ TDMConexao }

function TDMConexao.AutenticaEntrada(sLogin, sSenha: string): boolean;
begin
 Result:= false;

  FDQueryAutenticacao.Close;
  FDQueryAutenticacao.sql.Clear;
  FDQueryAutenticacao.sql.add(' SELECT * FROM PESSOA WHERE USUARIO = :Usuario and SENHA = :Senha');
  FDQueryAutenticacao.ParamByName('Usuario').AsString:= sLogin;
  FDQueryAutenticacao.ParamByName('Senha').AsString:= sSenha;
  FDQueryAutenticacao.Open;

  if not FDQueryAutenticacao.IsEmpty then
      Result:= true;

end;

end.
