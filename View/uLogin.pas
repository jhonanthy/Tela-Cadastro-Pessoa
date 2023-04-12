unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  uDmConexao, uCadastroPessoa;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    sbEntrar: TSpeedButton;
    sbsenha: TSpeedButton;
    procedure sbEntrarClick(Sender: TObject);
    procedure sbsenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.sbEntrarClick(Sender: TObject);
begin
  if not DMConexao.AutenticaEntrada(trim(edtLogin.Text),trim(edtSenha.Text)) then
  begin
     Application.MessageBox('Login ou Senha Incorreta , tente novamente','Informação',MB_OK + MB_ICONINFORMATION);
     exit;
  end;

 with TfrmCadastro.Create(self) do
 try
   showmodal;
 finally
   free;
   self.Close;
 end;


end;

procedure TfrmLogin.sbsenhaClick(Sender: TObject);
begin
if edtSenha.PasswordChar = '*' then
    edtSenha.PasswordChar := #0
  else
    edtSenha.PasswordChar := '*';
end;

end.
