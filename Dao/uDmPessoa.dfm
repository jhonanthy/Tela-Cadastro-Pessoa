object DMPessoa: TDMPessoa
  OldCreateOrder = False
  Height = 410
  Width = 752
  object FDQueryConsulta: TFDQuery
    Connection = DMConexao.FDConnection1
    SQL.Strings = (
      'SELECT * FROM PESSOA '
      'ORDER BY PES_NOME ASC')
    Left = 176
    Top = 176
    object FDQueryConsultaPES_CODIGO: TIntegerField
      FieldName = 'PES_CODIGO'
      Origin = 'PES_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryConsultaPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Origin = 'PES_NOME'
      Size = 50
    end
    object FDQueryConsultaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 50
    end
    object FDQueryConsultaSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 10
    end
    object FDQueryConsultaPES_CEP: TStringField
      FieldName = 'PES_CEP'
      Origin = 'PES_CEP'
      Size = 10
    end
    object FDQueryConsultaPES_LOGRADOURO: TStringField
      FieldName = 'PES_LOGRADOURO'
      Origin = 'PES_LOGRADOURO'
      Size = 100
    end
    object FDQueryConsultaPES_BAIRRO: TStringField
      FieldName = 'PES_BAIRRO'
      Origin = 'PES_BAIRRO'
      Size = 50
    end
    object FDQueryConsultaPES_UF: TStringField
      FieldName = 'PES_UF'
      Origin = 'PES_UF'
      Size = 2
    end
  end
  object FDQueryCRUD: TFDQuery
    Connection = DMConexao.FDConnection1
    Left = 80
    Top = 176
  end
end
