object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 486
  Width = 768
  object FDQueryAutenticacao: TFDQuery
    Connection = FDConnection1
    Left = 208
    Top = 80
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\jhona\Documents\Embarcadero\Studio\Projects\Si' +
        'sPessoaCad\Base_dados\DB_SISCADASTROPESSOA.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 29
    Top = 74
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 109
    Top = 82
  end
end
