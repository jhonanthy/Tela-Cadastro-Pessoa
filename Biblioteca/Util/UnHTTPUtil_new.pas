unit UnHTTPUtil;

interface

uses
  UnBeanEnum, uLkJSON, IdHTTP, unFuncaoMaxyProt, UnRecord, UnBeanUtils, IfUtils,
  System.Classes, UnFileUtil;

type
  TEndereco = record
    cep: string;
    cidade: string;
    endereco: string;
    uf: string;
    bairro: string;


  end;

type
  THTTPUtil = class
  const
    PROP_URL_SUPORT                  = 'http://www.e-ticons.com.br/suporte/';
    PROP_URIPATH_SCRIPTS             = 'scriptsContabilidade';
    PROP_URIPATH_SCRIPTS_Folha       = 'scriptsFolha';
    PROP_URIPATH_SCRIPTS_Arrecadacao = 'scriptsArrecadacao';
    PROP_URIPATH_SCRIPTS_ArrecDiaria = 'scriptsArrecadacaoDiaria';
    class function Download(const URL, FileName: string): Boolean;
    class function GetText(const URL, URIPath, URIName: string): string; overload;
    class procedure SaveToFile(const URL, URIPath, URIName: string); overload;
    class procedure Get(AURL: string; AResponseContent: TStream); overload;
    class procedure SaveToFile(const URIName: string; const URIPath: string = PROP_URIPATH_SCRIPTS); overload;
    class function GetText(const URIName: string; const URIPath: string = PROP_URIPATH_SCRIPTS): string; overload;
    class function getCEP(cep: string): TEndereco;
  end;

type
  THTTPJSON = class
    class function TiposFontesRecursos(Exercicio: Integer; uf: EUF): string; overload; static;
    class function TiposFontesRecursos: string; overload; static;
    class function ObjetivosMilenio: string; overload; static;
    class function ObjetivosMilenio(const Exercicio: Integer): string; overload; static;
    class function ContasReceitas(Exercicio: Integer; uf: EUF): string; static;
    class function ContasReceitasTCE(Exercicio: Integer; uf: EUF): string; static;
    class function TipoObra(uf: EUF): string; overload; static;
    class function TipoObra: string; overload; static;
    class function CNAE: string; static;
    class function CBO: string; static;
    class function RDP: string; static;

    class function SubElementos(Exercicio: Integer; uf: EUF): string; static;
    class function PCASP(Exercicio: Integer; uf: EUF): string; overload; static;
    class function PCASP: string; overload; static;
    class function PCASPEvento(Exercicio: Integer; uf: EUF): string; overload; static;
    class function PCASPEvento: string; overload; static;
    class function Funcoes(Exercicio: Integer): string; overload; static;
    class function Funcoes: string; overload; static;
    class function SubFuncoes(Exercicio: Integer): string; overload; static;
    class function SubFuncoes: string; overload; static;
    class function TipoProgramas(Exercicio: Integer): string; overload; static;
    class function TipoProgramas: string; overload; static;
    class function NaturezasDespesas(Exercicio: Integer): string; overload; static;
    class function NaturezasDespesas: string; overload; static;
    class function NaturezasLeis: string; overload; static;
    class function MapDivida(Exercicio: Integer): string; overload; static;
    class function MapDivida: string; overload; static;
    class function PlanosContas(Exercicio: Integer): string; overload; static;
    class function PlanosContas: string; overload; static;
    class function FontesRecursos(Exercicio: Integer; uf: EUF): string; overload; static;
    class function FontesRecursos(): string; overload; static;
    class function Bancos: string; static;
    class function TipoNotaFiscal: string; static;
    class function TipoRetencao: string; overload; static;
    class function TipoRetencao(const uf: EUF): string; overload; static;
    class function Municipios: string; static;
    class function ReceitasSTN: string; static;
    class function ReceitaSIOPS: string; static;
    class function SIOPE: string; static;
    class function Script: string; static;
    class function ModalidadeLicitacao: string; overload; static;
    class function ModalidadeLicitacao(const UF: EUF): string; overload; static;
    class function FundamentoLegal(const UF: EUF): string; overload; static;
    class function FundamentoLegal: string; overload; static;
    class function DespesaControleInterno: string; static;
    class function ReceitaControleInterno: string; static;
    class function ReceitaLRFSaude: string; static;
    class function DespesaLRFSaude: string; static;
    class function ReceitaEducacaoRREO: string; static;
    class function ConvenioBoleto: string; static;
    class function ListaSINPAS: string; overload; static;
    class function ListaNFe: string; overload; static;
    class function DestinacaoRecurso: string; static;
    class function UnidadeMedida: string; overload; static;
    class function URLTipoContrato: string; static;
    class function URIAtualizacaoOrcamentaria(const Cnpj: string; const Exercicio, Mes: Integer): string;
    class function URIAgrupamentoFolhaPagamento(const UG, Exercicio, Mes: string): string;
    class function URIArrecadacaoDiaria(const UG, Exercicio, Mes, Dia: string): string;
    class function URIAgrupamentoVantagensDescontos(const UG, Exercicio, Mes: string): string;
    class function URIFolhaPagamento(const UG, Exercicio, Mes: string): string;
    class function DespesaEducacaoRREO: string; static;
    class function URINotaExplicativa(Exercicio: Integer): string; overload; static;
    class function URINotaExplicativa(): string; overload; static;
    class function URIObjetivosMilenio(Exercicio: Integer): string; overload; static;
    class function URIObjetivosMilenio(): string; overload; static;
    class function URIScript: string; overload; static;
    class function URIContasReceitasTCE(Exercicio: Integer; uf: EUF): string; overload; static;
    class function URIContasReceitas(Exercicio: Integer; uf: EUF): string; overload; static;
    class function URICNAE: string; static;
    class function URIFuncao(Exercicio: Integer): string; overload; static;
    class function URISubFuncao(Exercicio: Integer): string; overload; static;
    class function URITIPODOCUMENTODIVERSO: string; static;
    class function URITipoProgramas(Exercicio: Integer): string; overload; static;
    class function URIPlanoConta(Exercicio: Integer): string; overload; static;
    class function URINaturezaDespesa(Exercicio: Integer): string; overload; static;
    class function URIPCASP(Exercicio: Integer; uf: EUF): string; overload; static;
    class function URIPCASPEvento(Exercicio: Integer; uf: EUF): string; overload; static;
    class function URISubElemento(Exercicio: Integer; uf: EUF): string; overload; static;
    class function URITipoFonteRecurso(Exercicio: Integer; uf: EUF): string; overload; static;
    class function URIFonteRecurso(Exercicio: Integer; uf: EUF): string; overload; static;
    class function URIPPA(const Cnpj: string; const Exercicio: Integer): string; overload; static;
    class function URIPCASPLancto(const Cnpj: string; const Exercicio: Integer): string; overload; static;
    class function URIContasReceitas: string; overload; static;
    class function URIContasReceitasTCE: string; overload; static;
    class function URIFuncao: string; overload; static;
    class function URISubFuncao: string; overload; static;
    class function URITipoProgramas: string; overload; static;
    class function URINaturezaDespesa: string; overload; static;
    class function URICBO: string; static;
    class function URIRDP: string; static;
    class function URIPCASP: string; overload; static;
    class function URIPCASPEvento: string; overload; static;
    class function URISubElemento: string; overload; static;
    class function URITipoFonteRecurso: string; overload; static;
    class function URITipoFonteRecursoBR: string; overload; static;
    class function URIFonteRecurso: string; overload; static;
    class function URIPPA: string; overload; static;
    class function URIBANCO: string; overload; static;
    class function URIMUNICIPIO: string; overload; static;
    class function VersionJSON: TStrings; overload; static;
    class function VersionJSON(const cnpj: string; const Exercicio: Integer): TStrings; overload; static;
    class function URIRECEITASIOPS: string; static;
    class function URLDESPESACONTROLEINTERNO: string; static;
    class function URIDestinacaoRecursos: string; static;
    class function URIMODALIDADELICITACAO(uf: EUF): string; overload; static;
    class function URIMODALIDADELICITACAO: string; overload; static;
    class function URITIPORETENCAO(uf: EUF): string; overload; static;
    class function URITIPORETENCAO: string; overload; static;
    class function URLRECEITACONTROLEINTERNO: string; static;
    class function URLRECEITALRFSAUDE: string; static;
    class function URLDESPESALRFSAUDE: string; static;
    class function URLTipoDocumentoDiverso: string; static;
    class function URIPlanoConta: string; overload; static;

    class function URIVersion(const cnpj: string; const Exercicio: Integer): string; overload; static;
    class function URIRREORECEITAEducacao: string; static;
    class function URIRREODESPESAEducacao: string; static;

    class function URITIPOCONTRATO(const UF: EUF): string; overload; static;
    class function URITIPOCONTRATO(): string; overload; static;
    class function URIFUNDAMENTOLEGAL(const UF: EUF): string; overload; static;
    class function URIFUNDAMENTOLEGAL(): string; overload; static;
    class function URITipoNotaFiscal: string; overload; static;
    class function URITipoNotaFiscal(Exercicio: Integer; uf: EUF): string; overload; static;
    class function URITipoObra(uf: EUF): string; overload; static;
    class function URITipoObra(): string; overload; static;
    class function URIBoletoConvenio: string; overload; static;
    class function URIBoletoConvenio(const uf: EUF): string; overload; static;
    class function URIMapDivida: string; overload; static;
    class function URIMapDivida(Exercicio: Integer): string; overload; static;
    class function URLSIOPE: string; static;
    class function URIUnidadeMedida: string; overload; static;
    class function URIUnidadeMedida(const uf: EUF): string; overload; static;
    class function URINaturezaLei: string; static;

    class function NotaExplicativa(const Exercicio: Integer): string; overload; static;
    class function NotaExplicativa: string; overload; static;

  const
    URI_ATUALIZACAO_ORCAMENTARIA = 'AtualizacaoOrcamentaria/%14s-%.4d.%.2d.decreto.json.zip';
    URI_AGRUPAMENTO_FOLHA        = 'agrupamento/%6s%2s%4sCodigoAgrupamentoFolhaPagamento.txt';
    URI_ARRECADACAO_DIARIA       = '%.6s%.4s%.2s%.2sArrecadacao.txt';
    URI_PAGAMENTO_FOLHA          = 'agrupamento/%6s%2s%4sFolhaPagamento.txt';
    URI_VANTAGENSDESCONTOS_FOLHA = 'agrupamento/%6s%2s%4sCodigo_VantagensDescontos.txt';
    URI_DESTINACAORECURSO        = 'DestinacaoRecursos-%2s-%.4d.json';
    URI_FUNCAO                   = 'Funcoes-%.4d.json';
    URI_NATUREZASDESPESAS        = 'NaturezasDespesas-%.4d.json';
    URI_CBO                      = 'CBO.json';
    URI_RDP                      = 'RDP.ini';
    URI_NATUREZA_LEIS            = 'NaturezasLeis.json';
    URI_UNIDADE_MEDIDA           = 'UnidadeMedida-%s.json';
    URI_SUBFUNCAO                = 'SubFuncoes-%.4d.json';
    URI_PCASP                    = 'PCASP-%2s-%.4d.json';
    URI_PCASP_EVENTO             = 'PCASPEvento-%2s-%.4d.json';
    URI_NOTA_EXPLICATIVA         = 'NotaExplicativa-%.4d.json';
    URI_CONTAS_RECEITAS_STN      = 'receitasSTN.json';
    URI_SUBELEMENTO              = 'SubElementos-%s-%.4d.json';
    URI_TIPOSFONTESRECURSOS      = 'TiposFontesRecursos-%s-%.4d.json';
    URI_MODALIDADELICITACAO      = 'ModolidadeLicitacao-%s.json';

    URI_FONTESRECURSOS_2021 = '%SFontesRecursos.BR-%s-%.4d.json';

    URI_CONTAS_RECEITAS_TCE    = 'ContasReceitas-TCE%s-%.4d.json';
    URI_RECEITAS               = 'Receitas-%s-%4d.json';
    URI_PPA                    = 'PPA/PPA-%s-%d.json';
    URI_PCASPLANCTO            = 'Lancamento/%14s-%.4d.00.pcasp.json.zip';
    URI_BANCO                  = 'Bancos.json';
    URI_CNAE                   = 'CNAE.json';
    URI_MUNICIPIO              = 'Municipios.json';
    URI_RECEITASIOPS           = 'ReceitaSIOPS-%.4d.json';
    URI_SIOPE                  = 'ElementosSIOPE.json';
    URI_SCRIPT                 = 'script.sql.json';
    URI_DESPESACONTROLEINTERNO = 'DespesasControleInterno-%s-%.4d.json';
    URI_RECEITACONTROLEINTERNO = 'ReceitasControleInterno-%s-%.4d.json';
    URI_RECEITALRFSAUDE        = 'ReceitaLRFSaude-%s-%.4d.json';
    URI_DESPESALRFSAUDE        = 'DespesaLRFSaude-%s-%.4d.json';
    URI_RREORECEITAEducacao    = 'RREOReceitaEducacao-%s-%.4d.json';
    URI_RREODESPESAEducacao    = 'RREODespesaEducacao-%s-%.4d.json';
    URI_FUNDAMENTOLEGAL        = 'FundamentoLegal-%s.json';
    URI_PLANODECONTA           = 'PlanoDeConta-%.4d.json';
    URI_TIPODOCUMENTODIVERSO   = 'TipoDocumentoDiverso.json';
    URI_TIPOCONTRATO           = 'TipoContrato-%s.json';
    URI_TIPOPROGRAMAS          = 'TipoProgramas-%.4d.json';
    URI_TIPONOTAFISCAL         = 'TipoNotaFiscal-TCE%s-%.4d.json';
    URI_TIPORETENCAO           = 'TiposRetencoes-%s.json';
    URI_TIPOOBRA               = 'TipoObra-%s.json';
    URI_CONVENIOBOLETO         = 'BoletoConvenio-%s.json';
    URI_OBJETIVO_MILENIO       = 'ObjetivoMilenio-%.4d.json';
    URI_LISTA_SINPAS           = 'Arrecadacao_Codigo_SINPAS.json';
    URI_MAPDIVIDA              = 'MapDivida-%.4d.json';
  private

  end;

type
  THTTPEticonsComBrUtil = class
  private const
    PROP_USER = 'siscontabil';
    PROP_PW   = 'S15C0nt4Bil';
    PROP_URL  = 'http://www.e-ticons.com.br/';
    // PROP_URL                          = 'http://192.168.0.140:8080/';
    // PROP_URL                          = 'http://192.168.0.140:8080/'; Local
    PROP_FORMAT_CONTEXT_OBTER_SISTEMA = 'obterSistema.php?sistema=%d&formato=json';
    PROP_DOWNLOAD_SISTEMA             = 'arquivos/%s';
  public const
    PROP_URIPATH_SCRIPTS             = 'scriptsContabilidade/';
    PROP_URIPATH_SCRIPTS_FOLHA       = 'scriptsFolha/';
    PROP_URIPATH_SCRIPTS_ARRECDIARIA = 'Tributacao/ArrecadacaoDiaria/';
    PROP_URIPATH_SCRIPTS_RDP         = 'scriptsRDP/';
    PROP_URICLIENTEREST              = 'clientesrest/ws/api/v1/arquivos';
    DEFAULT_PATH_LANCTO              = PROP_URIPATH_SCRIPTS + 'Lancamento/';
    DEFAULT_PATH_CREDITO             = PROP_URIPATH_SCRIPTS + 'AtualizacaoOrcamentaria/';
    DEFAULT_PATH_LICITACAO           = PROP_URIPATH_SCRIPTS + 'Licitacao/';
  public
    class function InfoSystem(Sistema: TSisEticons): TInfoWeb;
    class function URLDownload(InfoWeb: TInfoWeb): string;
    class function SendFile(const FileName: string; const dir: string = PROP_URIPATH_SCRIPTS): string;
  end;

type
  THTTPSiteseticonsComBrUtil = class

  public const
    PROP_URL = 'https://siteseticons.com.br';
  private const
    // PROP_URL                         = 'http://192.168.0.29:8080';
    PROP_CONTEXT_LIBERACAO_CONSULTA  = '/liberacaorest/liberacao/consulta';
    PROP_CONTEXT_NOTAFISCAL          = '/liberacaorest/notafiscal';
    PROP_CONTEXT_NOTAFISCAL_CONSULTA = PROP_CONTEXT_NOTAFISCAL + '/consulta';
    PROP_CONTEXT_EMPRESA             = '/portalrest/ws/api/v1/empresa/';
    PROP_USER                        = 'eticons';
    PROP_PW                          = '624888a444';

    class function Response(Cnpj: string; Mes, Exercicio: Integer): string;
  public
    class function LiberarMes(Cnpj: string; Mes, Exercicio: Integer): string;
    class function NotaFiscalTributos(Cnpj: string; Exercicio, mes: string): string; static;
    class function DamNotaFiscalWEB(cnpj: string; Exercicio: string): string; static;
    class function NotaFiscal(CNPJ: string; Exercicio: integer): string; static;
    class function TomadorNFse(CNPJ: string): string; static;

    class function PrestadorNFSe(cnpjEmpresa: string): string; static;
    class function jsonEmpresa(const Cnpj: string): TlkJSONobject;

    class function LiberacaoNotaFiscal(id, numeroEmpenho, nexercicio, NumeroPagamento: Integer; dataPagto: TDateTime; Observacao: string): string;
  end;

const
  USER_AGENTE       = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36';
  CONTENT_TYPE_JSON = 'application/json';

  CONTENT_TYPE_FORCE_DOWNLOAD = 'application/force-download';
  REQUEST_ACCEPT              = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';

function CreateHTTP(const CreateSSL: Boolean): TIdHTTP; overload;
function CreateHTTP(Username, password, ContentType: string): TIdHTTP; overload;

implementation

uses
  IdSSL, IdSSLOpenSSL, IdSSLOpenSSLHeaders, IdCTypes, IdURI, UnBeanDAO, System.SysUtils, UnLog, UnStrUtil,
  UnDateUtil, Web.HTTPApp, IdMultipartFormData;

type
  TEtHTTP = class(TIdHTTP)
  public
    constructor Create(const AOwner: TComponent; const CreateSSL: Boolean);
  private
    procedure OnStatusInfoEx(ASender: TObject; const AsslSocket: PSSL; const AWhere, Aret: TIdC_INT; const AType, AMsg: string);
  end;

  { TEtHTTP }

constructor TEtHTTP.Create(const AOwner: TComponent; const CreateSSL: Boolean);
begin
  if CreateSSL then
    begin
      IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      with IOHandler as TIdSSLIOHandlerSocketOpenSSL do
        begin
          OnStatusInfoEx         := Self.OnStatusInfoEx;
          SSLOptions.Method      := sslvSSLv23;
          SSLOptions.SSLVersions := [sslvTLSv1_2, sslvTLSv1_1, sslvTLSv1];
        end;
    end;
  inherited Create(AOwner);
end;

procedure TEtHTTP.OnStatusInfoEx(ASender: TObject; const AsslSocket: PSSL; const AWhere, Aret: TIdC_INT; const AType, AMsg: string);
begin
  SSL_set_tlsext_host_name(AsslSocket, Request.Host);
end;
/// ///////////////

{ Functions }
function CreateHTTP(const CreateSSL: Boolean): TIdHTTP;

begin
  Result                     := TEtHTTP.Create(nil, CreateSSL);
  Result.Request.UserAgent   := USER_AGENTE;
  Result.Request.ContentType := CONTENT_TYPE_JSON;
  Result.Request.Accept      := REQUEST_ACCEPT;

end;

function CreateHTTP(Username, password, ContentType: string): TIdHTTP;
begin
  Result                             := CreateHTTP(true);
  result.ConnectTimeout              := 400000;
  result.ReadTimeout                 := 400000;
  Result.Request.UserAgent           := USER_AGENTE;
  Result.HTTPOptions                 := [hoInProcessAuth];
  Result.Request.BasicAuthentication := True;
  Result.Request.Username            := Username;
  Result.Request.password            := password;
  Result.Request.ContentType         := ContentType;
  Result.Request.Accept              := REQUEST_ACCEPT;
end;

{ TSitesEticonsConnectionUtil }

class function THTTPSiteseticonsComBrUtil.Response(Cnpj: string; Mes, Exercicio: Integer): string;
var
  Params: TStream;
  http:   TIdHTTP;
  // url_ENCODE: string;
begin
  http   := CreateHTTP(PROP_USER, PROP_PW, CONTENT_TYPE_JSON);
  Params := TStringStream.Create(Format('{"cnpj":"%s","exercicio":"%d","mes":"%.2d"}', [Cnpj, Exercicio, Mes]));
  try

    Result := http.Post(PROP_URL + PROP_CONTEXT_LIBERACAO_CONSULTA, Params);

  finally
    FreeAndNil(http);
    FreeAndNil(Params);
  end;
end;

class function THTTPSiteseticonsComBrUtil.TomadorNFse(CNPJ: string): string;
var
  Params: TStream;
  http:   TIdHTTP;
begin
  http := CreateHTTP('arrecadacao', '3Ticons16Sql12@Nv', CONTENT_TYPE_JSON);
  try

    Result := http.get('http://www.eticons.com/notafiscalrest/ws/v1/financeiro/tomadores/' + cnpj);

  finally
    FreeAndNil(http);
  end;

end;

class function THTTPSiteseticonsComBrUtil.LiberarMes(Cnpj: string; Mes, Exercicio: Integer): string;
begin
  Result := Response(Cnpj, Mes, Exercicio);
end;

class function THTTPSiteseticonsComBrUtil.DamNotaFiscalWEB(cnpj, Exercicio: string): string;
var
  Params: TStream;
  http:   TIdHTTP;
begin
  try
    http := CreateHTTP('arrecadacao', '3Ticons16Sql12@Nv', CONTENT_TYPE_JSON);
    try
      Result := http.get('http://www.eticons.com/notafiscalrest/ws/v1/financeiro/dam/' + cnpj + '/' + exercicio);
    finally
      FreeAndNil(http);
    end;
  except
    on E: Exception do
      result := 'erro ' + e.Message;
  end;
end;

class function THTTPSiteseticonsComBrUtil.jsonEmpresa(const Cnpj: string): TlkJSONobject;
var
  http:  TIdHTTP;
  jText: string;

begin
  http := CreateHTTP('siscontabil', '515c04taBil', CONTENT_TYPE_JSON);
  try

    jText  := UTF8Decode(http.Get(PROP_URL + PROP_CONTEXT_EMPRESA + Cnpj));
    Result := TlkJSON.ParseText(jText) as TlkJSONobject;
    WriteSendString(Result, 'JSON', jText);
  finally
    FreeAndNil(http);
  end;

end;

class function THTTPSiteseticonsComBrUtil.LiberacaoNotaFiscal(id, numeroEmpenho, nexercicio, NumeroPagamento: Integer; dataPagto: TDateTime;
   Observacao: string): string;
var
  Params: TStream;
  http:   TIdHTTP;
  // url_ENCODE: string;
  json: TlkJSONobject;
begin
  http := CreateHTTP(PROP_USER, PROP_PW, CONTENT_TYPE_JSON);
  json := TlkJSONobject.Create;
  json.Add('id', id);
  json.Add('numeroEmpenho', IntToStr(numeroEmpenho));
  json.Add('exercicioEmpenho', IntToStr(nexercicio));
  json.Add('parcelaEmpenho', NumeroPagamento);
  json.Add('dataPagamento', TDateUtil.DateToStr(dataPagto, 'yyyy-mm-dd'));
  json.Add('observacoes', Observacao);
  Params := TStringStream.Create(TlkJSON.GenerateText(json));

  try

    Result := http.Put(PROP_URL + PROP_CONTEXT_NOTAFISCAL, Params);

  finally
    FreeAndNil(http);
    FreeAndNil(Params);
    FreeAndNil(json);
  end;

end;

class function THTTPSiteseticonsComBrUtil.NotaFiscal(Cnpj: string; Exercicio: integer): string;
var
  Params: TStream;
  http:   TIdHTTP;
begin
  http   := CreateHTTP(PROP_USER, PROP_PW, CONTENT_TYPE_JSON);
  Params := TStringStream.Create(Format('{"cnpj":"%s","exercicio":"%d"}', [Cnpj, Exercicio]));
  try

    Result := http.Post(PROP_URL + PROP_CONTEXT_NOTAFISCAL_CONSULTA, Params);

  finally
    FreeAndNil(http);
    FreeAndNil(Params);
  end;

end;

class function THTTPSiteseticonsComBrUtil.NotaFiscalTributos(Cnpj, Exercicio, mes: string): string;

var
  Params: TStream;
  http:   TIdHTTP;
begin
  try
    http := CreateHTTP('arrecadacao', '3Ticons16Sql12@Nv', CONTENT_TYPE_JSON);
    try
      Result := http.get('http://www.eticons.com/notafiscalrest/ws/v1/financeiro/notas/' + cnpj + '/' + exercicio + '/' + Mes);
    finally
      FreeAndNil(http);
    end;
  except
    on E: Exception do
      result := 'erro ' + e.Message;

  end;
end;

class function THTTPSiteseticonsComBrUtil.PrestadorNFSe(cnpjEmpresa: string): string;
var
  Params: TStream;
  http:   TIdHTTP;
begin
  http := CreateHTTP('arrecadacao', '3Ticons16Sql12@Nv', CONTENT_TYPE_JSON);
  try

    Result := http.get('http://www.eticons.com/notafiscalrest/ws/v1/financeiro/prestadores/' + cnpjempresa);

  finally
    FreeAndNil(http);

  end;
end;

{ THTTPUtil }

class function THTTPUtil.Download(const URL, FileName: string): Boolean;
var
  myFile:      TFileStream;
  http:        TIdHTTP;
  path, sFile: string;
begin
  http := CreateHTTP(TStrUtil.StartsWithIgnoreCase('https://', URL));

  if TStrUtil.Contains(':', FileName) or (not TStrUtil.Contains(PROP_URIPATH_SCRIPTS, FileName)) then
    begin
      path  := ExtractFilePath(FileName);
      sFile := FileName;
    end
  else
    begin
      path  := TFileUtil.GetSpecialFolderLocation(sfAppDataUserProfile);
      sFile := path + '\' + FileName;
      path  := ExtractFileDir(sFile);
    end;

  if not DirectoryExists(path) then
    ForceDirectories(path);

  myFile := TFileStream.Create(sFile, fmCreate);
  try
    http.Get(URL, myFile);
    if FileExists(sFile) then
      Result := True
    else
      Result := false;
  finally
    myFile.free;
    http.free;
  end;

end;

class function THTTPUtil.GetText(const URL, URIPath, URIName: string): string;
var
  http: TIdHTTP;
begin
  http := CreateHTTP(TStrUtil.StartsWithIgnoreCase('https://', URL));
  try
    http.Response.ContentType := CONTENT_TYPE_JSON;
    Result                    := http.Get(URL + URIPath + '/' + URIName);

  finally
    FreeAndNil(http);
  end;
end;

class procedure THTTPUtil.Get(AURL: string; AResponseContent: TStream);
var
  http: TIdHTTP;
begin
  http := CreateHTTP(TStrUtil.StartsWithIgnoreCase('https://', AURL));;
  try
    http.Get(AURL, AResponseContent);
  finally
    FreeAndNil(http);
  end;
end;

class function THTTPUtil.getCEP(cep: string): TEndereco;
const
  URI_CEP = 'http://cep.republicavirtual.com.br/web_cep.php?cep=%s&formato=json';
var
  http: TIdHTTP;
  json: TlkJSONobject;
begin
  http := CreateHTTP(false);
  try
    try
      json            := TlkJSON.ParseText(http.Get(Format(URI_CEP, [cep]))) as TlkJSONobject;
      Result.endereco := UTF8Decode(json['tipo_logradouro'].Value + ' ' + json['logradouro'].Value);

      Result.cidade := UTF8Decode(json['cidade'].Value);
      Result.uf     := json['uf'].Value;
      Result.bairro := UTF8Decode(json['bairro'].Value);
    except
      Result.endereco := '';
      Result.cidade   := '';
      Result.uf       := '';
      Result.bairro   := '';
    end;

  finally

    http.free;
    json.free;
  end;

end;

class function THTTPUtil.GetText(const URIName, URIPath: string): string;
begin
  Result := GetText(PROP_URL_SUPORT, URIPath, URIName);
end;

class procedure THTTPUtil.SaveToFile(const URIName, URIPath: string);
begin
  THTTPUtil.SaveToFile(PROP_URL_SUPORT, URIPath, URIName);
end;

class procedure THTTPUtil.SaveToFile(const URL, URIPath, URIName: string);
begin

  Download(URL + URIPath + '/' + URIName, TStrUtil.ReplaceAll(URIPath + '\' + URIName, '/', '\'));
end;

{ TEticonsConnecionUtil }

class function THTTPEticonsComBrUtil.InfoSystem(Sistema: TSisEticons): TInfoWeb;
var
  IdHTTP:     TIdHTTP;
  json, URL:  string;
  jsonObject: TlkJSONbase;

begin
  Result.Nome       := '';
  Result.Descricao  := '';
  Result.Versao     := '';
  Result.Arquivo    := '';
  Result.Comentario := '';

  IdHTTP := CreateHTTP(false);
  URL    := Format(THTTPEticonsComBrUtil.PROP_URL + THTTPEticonsComBrUtil.PROP_FORMAT_CONTEXT_OBTER_SISTEMA, [ord(Sistema)]);
  try
    try

      json              := IdHTTP.Get(URL);
      jsonObject        := TlkJSON.ParseText(json);
      Result.Nome       := jsonObject.Field['nome'].Value;
      Result.Descricao  := jsonObject.Field['descricao'].Value;
      Result.Versao     := jsonObject.Field['versao'].Value;
      Result.Arquivo    := jsonObject.Field['arquivo'].Value;
      Result.Comentario := jsonObject.Field['comentario'].Value;

    except
      on E: Exception do
        begin
          WriteEventLog(IdHTTP, Format('Sender.ClassName: %s; URL: %s Response: %s', [Self.ClassName, URL, json]), 'UnDBEticonsControl', etERROR);
        end;
    end;
  finally
    FreeAndNil(IdHTTP);
    if Assigned(jsonObject) then
      FreeAndNil(jsonObject);
  end;
end;

class function THTTPEticonsComBrUtil.SendFile(const FileName, dir: string): string;
var
  IdHTTP: TIdHTTP;
  Params: TIdMultipartFormDataStream;
  Stream: TStringStream;
begin
  IdHTTP := CreateHTTP(PROP_USER, PROP_PW, CONTENT_TYPE_JSON);
  Params := TIdMultipartFormDataStream.Create;
  Stream := TStringStream.Create('');

  try
    Params.AddFormField('diretorio', dir);
    Params.AddFile('arquivo', FileName, 'application/octet-stream');

    IdHTTP.Post(THTTPEticonsComBrUtil.PROP_URL + THTTPEticonsComBrUtil.PROP_URICLIENTEREST, Params, Stream);
    Result := Stream.DataString;
  finally
    FreeAndNil(IdHTTP);
    FreeAndNil(Params);
    FreeAndNil(Stream);
  end;
end;

class function THTTPEticonsComBrUtil.URLDownload(InfoWeb: TInfoWeb): string;
begin
  Result := Format(THTTPEticonsComBrUtil.PROP_URL + THTTPEticonsComBrUtil.PROP_DOWNLOAD_SISTEMA, [InfoWeb.Arquivo]);;
end;

{ THTTPJSON }

class function THTTPJSON.SIOPE: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URI_SIOPE;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.ReceitaSIOPS: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIRECEITASIOPS;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.Bancos: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIBANCO;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.CBO: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URICBO;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;
 class function THTTPJSON.RDP: string;
 var
  URIName: string;
begin
  URIName := THTTPJSON.URIRDP;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT,THTTPEticonsComBrUtil.PROP_URIPATH_SCRIPTS_RDP, URIName);
end;

class function THTTPJSON.URLTipoContrato: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URITIPOCONTRATO;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.URLtipoDocumentoDiverso: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URITIPODOCUMENTODIVERSO;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.CNAE: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URICNAE;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.ContasReceitas(Exercicio: Integer; uf: EUF): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIContasReceitas(Exercicio, uf);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.ContasReceitasTCE(Exercicio: Integer; uf: EUF): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIContasReceitasTCE(Exercicio, uf);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.ConvenioBoleto: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIBoletoConvenio;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.DespesaLRFSaude: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URLDESPESALRFSAUDE;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.DestinacaoRecurso: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIDestinacaoRecursos;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.DespesaControleInterno: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URLDESPESACONTROLEINTERNO;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.ReceitaLRFSaude: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URLRECEITALRFSAUDE;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;


class function THTTPJSON.ReceitaControleInterno: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URLRECEITACONTROLEINTERNO;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.ReceitaEducacaoRREO: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIRREORECEITAEducacao;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.DespesaEducacaoRREO: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIRREODESPESAEducacao;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.Funcoes(Exercicio: Integer): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIFuncao(Exercicio);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.NaturezasDespesas(Exercicio: Integer): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URINaturezaDespesa(Exercicio);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.SubFuncoes(Exercicio: Integer): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URISubFuncao(Exercicio);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.TipoProgramas(Exercicio: Integer): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URITipoProgramas(Exercicio);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.TiposFontesRecursos: string;
begin
  Result := THTTPJSON.TiposFontesRecursos(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf);
end;

class function THTTPJSON.PCASP(Exercicio: Integer; uf: EUF): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIPCASP(Exercicio, uf);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.PCASP: string;
begin
  Result := THTTPJSON.PCASP(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.PCASPEvento: string;
begin
  Result := THTTPJSON.PCASPEvento(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.PlanosContas(Exercicio: Integer): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIPlanoConta(Exercicio);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.PlanosContas: string;
begin
  Result := THTTPJSON.PlanosContas(TBeanDAO.instance.Exercicio)
end;

class function THTTPJSON.PCASPEvento(Exercicio: Integer; uf: EUF): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIPCASPEvento(Exercicio, uf);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.ReceitasSTN: string;
var
  URIName: string;

begin
  URIName := URI_CONTAS_RECEITAS_STN;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.SubElementos(Exercicio: Integer; uf: EUF): string;
var
  URIName: string;
begin
  URIName := URISubElemento(Exercicio, uf);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.SubFuncoes: string;
begin
  Result := THTTPJSON.SubFuncoes(TBeanDAO.instance.Exercicio)
end;

class function THTTPJSON.TipoNotaFiscal: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URITipoNotaFiscal;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.TipoObra(uf: EUF): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URITipoObra(uf);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.TipoObra: string;
begin
  Result := THTTPJSON.TipoObra(TBeanDAO.instance.uf);
end;

class function THTTPJSON.TipoProgramas: string;
begin
  Result := THTTPJSON.TipoProgramas(TBeanDAO.instance.Exercicio)
end;

class function THTTPJSON.TipoRetencao(const uf: EUF): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URITIPORETENCAO(uf);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.TipoRetencao: string;
begin
  Result := THTTPJSON.TipoRetencao(TBeandao.Instance.UF)
end;

class function THTTPJSON.TiposFontesRecursos(Exercicio: Integer; uf: EUF): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URITipoFonteRecurso(Exercicio, uf);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.URIContasReceitas(Exercicio: Integer; uf: EUF): string;
begin
  Result := Format(URI_RECEITAS, [UFtoSigla(uf), IfThen(Exercicio < 2014, 0, Exercicio)]);
end;

class function THTTPJSON.URIContasReceitasTCE(Exercicio: Integer; uf: EUF): string;
begin
  Result := Format(URI_CONTAS_RECEITAS_TCE, [UFtoSigla(uf), IfThen(Exercicio < 2014, 0, Exercicio)]);
end;

class function THTTPJSON.URIFonteRecurso(Exercicio: Integer; uf: EUF): string;
var
  s: string;
begin
  s := TStrUtil.Left(ExtractFileName(ParamStr(0)), 1);

  Result := Format(THTTPJSON.URI_FONTESRECURSOS_2021, [s, UFtoSigla(uf), IfThen(Exercicio < 2014, 0, Exercicio)])
end;

class function THTTPJSON.URIFuncao(Exercicio: Integer): string;
begin
  Result := Format(URI_FUNCAO, [IfThen(Exercicio < 2014, 0, Exercicio)])
end;

class function THTTPJSON.URINaturezaDespesa(Exercicio: Integer): string;
begin
  Result := Format(URI_NATUREZASDESPESAS, [IfThen(Exercicio < 2014, 0, Exercicio)]);
end;

class function THTTPJSON.URIUnidadeMedida(const uf: EUF): string;
begin
  Result := Format(URI_UNIDADE_MEDIDA, [UFtoSigla(uf)]);
end;

class function THTTPJSON.URIPCASP(Exercicio: Integer; uf: EUF): string;
begin
  Result := Format(URI_PCASP, [UFtoSigla(uf), IfThen(Exercicio < 2013, 0, Exercicio)]);
end;

class function THTTPJSON.URISubElemento(Exercicio: Integer; uf: EUF): string;
begin
  Result := Format(URI_SUBELEMENTO, [UFtoSigla(uf), IfThen(Exercicio < 2014, 0, Exercicio)]);
end;

class function THTTPJSON.URISubFuncao(Exercicio: Integer): string;
begin
  Result := Format(THTTPJSON.URI_SUBFUNCAO, [Exercicio])
end;

class function THTTPJSON.URITipoProgramas(Exercicio: Integer): string;
begin
  Result := Format(THTTPJSON.URI_TIPOPROGRAMAS, [Exercicio]);
end;

class function THTTPJSON.URITipoFonteRecurso(Exercicio: Integer; uf: EUF): string;
begin
  Result := Format(THTTPJSON.URI_TIPOSFONTESRECURSOS, [UFtoSigla(uf), IfThen(Exercicio < 2014, 0, Exercicio)]);
end;

class function THTTPJSON.FontesRecursos(Exercicio: Integer; uf: EUF): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIFonteRecurso(Exercicio, uf);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.FontesRecursos: string;
begin
  Result := FontesRecursos(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.Funcoes: string;
begin
  Result := THTTPJSON.Funcoes(TBeanDAO.instance.Exercicio)
end;

class function THTTPJSON.FundamentoLegal: string;
begin
  Result := THTTPJSON.FundamentoLegal(TBeanDAO.instance.UF);
end;

class function THTTPJSON.URIFUNDAMENTOLEGAL(const UF: EUF): string;
begin
  Result := Format(THTTPJSON.URI_FUNDAMENTOLEGAL, [UFtoSigla(UF)]);
end;

class function THTTPJSON.ListaNFe: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URI_LISTA_SINPAS;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS_Arrecadacao, URIName);

end;

class function THTTPJSON.ListaSINPAS: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URI_LISTA_SINPAS;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS_Arrecadacao, URIName);

end;

class function THTTPJSON.FundamentoLegal(const UF: EUF): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIFUNDAMENTOLEGAL(uf);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.MapDivida(Exercicio: Integer): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIMapDivida(Exercicio);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.MapDivida: string;
begin
  Result := THTTPJSON.MapDivida(TBeanDAO.instance.Exercicio);
end;

class function THTTPJSON.ModalidadeLicitacao(const UF: EUF): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIMODALIDADELICITACAO(UF);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);

end;

class function THTTPJSON.ModalidadeLicitacao: string;
begin
  Result := ModalidadeLicitacao(TBeanDAO.instance.UF);
end;

class function THTTPJSON.Municipios: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIMUNICIPIO;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.NaturezasDespesas: string;
begin
  Result := THTTPJSON.NaturezasDespesas(TBeanDAO.instance.Exercicio);
end;

class function THTTPJSON.NaturezasLeis: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URINaturezaLei();
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.NotaExplicativa: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URINotaExplicativa(TBeanDAO.instance.Exercicio);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.ObjetivosMilenio: string;
begin
  Result := THTTPJSON.ObjetivosMilenio(TBeanDAO.instance.Exercicio);
end;

class function THTTPJSON.ObjetivosMilenio(const Exercicio: Integer): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIObjetivosMilenio(Exercicio);
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.Script(): string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIScript;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.NotaExplicativa(const Exercicio: Integer): string;
begin
  Result := THTTPJSON.NotaExplicativa(TBeanDAO.instance.Exercicio);
end;

class function THTTPJSON.URIContasReceitasTCE: string;
begin
  Result := THTTPJSON.URIContasReceitasTCE(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.URIDestinacaoRecursos: string;
begin
  if TBeanDAO.instance.Exercicio < 2020 then
    Result := Format(URI_DESTINACAORECURSO, [UFtoSigla(eBR), 0])
  else
    Result := Format(URI_DESTINACAORECURSO, [UFtoSigla(eBR), TBeanDAO.instance.Exercicio])
end;

class function THTTPJSON.URLSIOPE: string;
begin
  Result := URI_SIOPE;
end;



class function THTTPJSON.URIRECEITASIOPS: string;
begin
  Result := Format(URI_RECEITASIOPS, [TBeanDAO.instance.Exercicio]);
end;

class function THTTPJSON.URIAtualizacaoOrcamentaria(const Cnpj: string; const Exercicio, Mes: Integer): string;
begin
  Result := Format(URI_ATUALIZACAO_ORCAMENTARIA, [Cnpj, Exercicio, Mes]);
end;

class function THTTPJSON.UnidadeMedida: string;
var
  URIName: string;
begin
  URIName := THTTPJSON.URIUnidadeMedida;
  Result  := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIName);
end;

class function THTTPJSON.URIAgrupamentoFolhaPagamento(const UG, Exercicio, Mes: string): string;
begin
  Result := Format(URI_AGRUPAMENTO_FOLHA, [UG, Exercicio, Mes]);
end;

class function THTTPJSON.URIArrecadacaoDiaria(const UG, Exercicio, Mes, Dia: string): string;
begin
  Result := Format(URI_ARRECADACAO_DIARIA, [UG, Exercicio, Mes, Dia]);
end;

class function THTTPJSON.URIAgrupamentoVantagensDescontos(const UG, Exercicio, Mes: string): string;
begin
  Result := Format(URI_VANTAGENSDESCONTOS_FOLHA, [UG, Exercicio, Mes]);
end;

class function THTTPJSON.URIFolhaPagamento(const UG, Exercicio, Mes: string): string;
begin
  Result := Format(URI_PAGAMENTO_FOLHA, [UG, Exercicio, Mes]);
end;

class function THTTPJSON.URIBANCO: string;
begin
  Result := URI_BANCO
end;

class function THTTPJSON.URICBO: string;
begin
  Result := URI_CBO;
end;
class function THTTPJSON.URIRDP: string;
begin
  Result := URI_RDP;
end;

class function THTTPJSON.URITIPODOCUMENTODIVERSO: string;
begin
  Result := URI_TIPODOCUMENTODIVERSO;
end;

class function THTTPJSON.URICNAE: string;
begin
  Result := URI_CNAE
end;

class function THTTPJSON.URIBoletoConvenio: string;
begin
  Result := URIBoletoConvenio(TBeanDAO.instance.uf);
end;

class function THTTPJSON.URIBoletoConvenio(const uf: EUF): string;
begin
  Result := Format(URI_CONVENIOBOLETO, [UFtoSigla(uf)]);
end;

class function THTTPJSON.URIContasReceitas: string;
begin
  Result := THTTPJSON.URIContasReceitas(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.URIFonteRecurso: string;
begin
  Result := THTTPJSON.URIFonteRecurso(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.URIFuncao: string;
begin
  Result := THTTPJSON.URIFuncao(TBeanDAO.instance.Exercicio)
end;

class function THTTPJSON.URIFUNDAMENTOLEGAL: string;
begin
  Result := THTTPJSON.URIFUNDAMENTOLEGAL(TBeanDAO.instance.uf)
end;

class function THTTPJSON.URIMapDivida: string;
begin
  Result := THTTPJSON.URIMapDivida(TBeanDAO.instance.Exercicio);
end;

class function THTTPJSON.URIMapDivida(Exercicio: Integer): string;
begin
  Result := Format(THTTPJSON.URI_MAPDIVIDA, [IfThen(Exercicio < 2018, 0000, Exercicio)]);
end;

class function THTTPJSON.URIMODALIDADELICITACAO: string;
begin
  result := THTTPJSON.URIMODALIDADELICITACAO(Tbeandao.Instance.UF);
end;

class function THTTPJSON.URIMODALIDADELICITACAO(uf: EUF): string;
begin
  Result := Format(THTTPJSON.URI_MODALIDADELICITACAO, [UFtoSigla(UF)]);
end;

class function THTTPJSON.URIMUNICIPIO: string;
begin
  Result := THTTPJSON.URI_MUNICIPIO;
end;

class function THTTPJSON.URINaturezaDespesa: string;
begin
  Result := THTTPJSON.URINaturezaDespesa(TBeanDAO.instance.Exercicio)
end;

class function THTTPJSON.URIUnidadeMedida: string;
begin
  Result := THTTPJSON.URIUnidadeMedida(TBeanDAO.instance.UF)
end;

class function THTTPJSON.URINotaExplicativa: string;
begin
  Result := THTTPJSON.URINotaExplicativa(TBeanDAO.instance.Exercicio)
end;

class function THTTPJSON.URIObjetivosMilenio(Exercicio: Integer): string;
begin
  Result := Format(THTTPJSON.URI_OBJETIVO_MILENIO, [IfThen(Exercicio < 2018, 0000, Exercicio)]);
end;

class function THTTPJSON.URIObjetivosMilenio: string;
begin
  Result := THTTPJSON.URIObjetivosMilenio(TBeanDAO.instance.Exercicio)
end;

class function THTTPJSON.URINaturezaLei: string;
begin
  Result := Format(THTTPJSON.URI_NATUREZA_LEIS, []);
end;

class function THTTPJSON.URINotaExplicativa(Exercicio: Integer): string;
begin
  Result := Format(THTTPJSON.URI_NOTA_EXPLICATIVA, [IfThen(Exercicio < 2017, 2017, Exercicio)]);
end;

class function THTTPJSON.URIPCASP: string;
begin
  Result := THTTPJSON.URIPCASP(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.URIPCASPEvento: string;
begin
  Result := THTTPJSON.URIPCASPEvento(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.URIPCASPLancto(const Cnpj: string; const Exercicio: Integer): string;
begin
  Result := Format(THTTPJSON.URI_PCASPLANCTO, [Cnpj, Exercicio]);
end;

class function THTTPJSON.URIPlanoConta: string;
begin
  Result := THTTPJSON.URIPlanoConta(TBeanDAO.instance.Exercicio);
end;

class function THTTPJSON.URIPlanoConta(Exercicio: Integer): string;
begin
  Result := Format(THTTPJSON.URI_PLANODECONTA, [IfThen(Exercicio < 2013, 0, Exercicio)]);
end;

class function THTTPJSON.URIPCASPEvento(Exercicio: Integer; uf: EUF): string;
begin
  Result := Format(THTTPJSON.URI_PCASP_EVENTO, [UFtoSigla(uf), IfThen(Exercicio < 2013, 0, Exercicio)]);
end;

class function THTTPJSON.URIPPA(const Cnpj: string; const Exercicio: Integer): string;
var
  PPA: Integer;
begin
  PPA    := TBeanDAO.instance.Exercicio - ((TBeanDAO.instance.Exercicio - 2) mod 4);
  Result := Format(URI_PPA, [TBeanDAO.instance.Cnpj, PPA]);
end;

class function THTTPJSON.URIPPA: string;
begin
  Result := THTTPJSON.URIPPA(TBeanDAO.instance.Cnpj, TBeanDAO.instance.Exercicio);

end;

class function THTTPJSON.URIScript: string;
begin
  Result := URI_SCRIPT
end;

class function THTTPJSON.URISubElemento: string;
begin
  Result := THTTPJSON.URISubElemento(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.URISubFuncao: string;
begin
  Result := THTTPJSON.URISubFuncao(TBeanDAO.instance.Exercicio)
end;

class function THTTPJSON.URITipoProgramas: string;
begin
  Result := THTTPJSON.URITipoProgramas(TBeanDAO.instance.Exercicio)
end;

class function THTTPJSON.URITIPORETENCAO: string;
begin
  Result := URITIPORETENCAO(TBeanDAO.instance.UF)
end;

class function THTTPJSON.URITIPORETENCAO(uf: EUF): string;
begin
  Result := Format(THTTPJSON.URI_TIPORETENCAO, [UFtoSigla(uf)]);
end;

class function THTTPJSON.URIVersion(const cnpj: string; const Exercicio: Integer): string;
begin
  result := Format('Versao.%s_%.4d.property', [cnpj, Exercicio]);
end;

class function THTTPJSON.URITIPOCONTRATO: string;
begin
  Result := THTTPJSON.URITIPOCONTRATO(Tbeandao.Instance.UF);
end;

class function THTTPJSON.URITIPOCONTRATO(const UF: EUF): string;
begin
  Result := Format(THTTPJSON.URI_TIPOCONTRATO, [UFtoSigla(uf)]);
end;

class function THTTPJSON.URITipoFonteRecurso: string;
begin
  Result := THTTPJSON.URITipoFonteRecurso(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.URITipoFonteRecursoBR: string;
begin
  Result := THTTPJSON.URITipoFonteRecurso(TBeanDAO.instance.Exercicio, eBR);
end;

class function THTTPJSON.URITipoNotaFiscal(Exercicio: Integer; uf: EUF): string;
begin
  Result := Format(THTTPJSON.URI_TIPONOTAFISCAL, [UFtoSigla(uf), IfThen(Exercicio < 2017, 0, Exercicio)]);
end;

class function THTTPJSON.URITipoObra(uf: EUF): string;
begin
  Result := Format(URI_TIPOOBRA, [UFtoSigla(TBeanDAO.instance.uf)]);
end;

class function THTTPJSON.URITipoObra: string;
begin
  Result := THTTPJSON.URITipoObra(TBeanDAO.instance.uf);
end;

class function THTTPJSON.URITipoNotaFiscal: string;
begin
  Result := URITipoNotaFiscal(TBeanDAO.instance.Exercicio, TBeanDAO.instance.uf)
end;

class function THTTPJSON.URLDESPESACONTROLEINTERNO: string;
begin
  Result := Format(URI_DESPESACONTROLEINTERNO, [UFtoSigla(TBeanDAO.instance.uf), TBeanDAO.instance.Exercicio]);
end;

class function THTTPJSON.URLDESPESALRFSAUDE: string;
begin
  Result := Format(URI_DESPESALRFSAUDE, [UFtoSigla(TBeanDAO.instance.uf), TBeanDAO.instance.Exercicio]);
end;

class function THTTPJSON.URLRECEITACONTROLEINTERNO: string;
begin
  Result := Format(URI_RECEITACONTROLEINTERNO, [UFtoSigla(TBeanDAO.instance.uf), TBeanDAO.instance.Exercicio]);
end;

class function THTTPJSON.URIRREODESPESAEducacao: string;
begin
  Result := Format(URI_RREODESPESAEducacao, [UFtoSigla(TBeanDAO.instance.uf), TBeanDAO.instance.Exercicio]);

end;

class function THTTPJSON.URIRREORECEITAEducacao: string;
begin
  Result := Format(URI_RREORECEITAEducacao, [UFtoSigla(TBeanDAO.instance.uf), TBeanDAO.instance.Exercicio]);

end;

class function THTTPJSON.URLRECEITALRFSAUDE: string;
begin
  Result := Format(URI_RECEITALRFSAUDE, [UFtoSigla(TBeanDAO.instance.uf), TBeanDAO.instance.Exercicio]);
end;

class function THTTPJSON.VersionJSON: TStrings;
begin
  Result      := TStringList.Create;
  Result.Text := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, 'Versao.property');
end;

class function THTTPJSON.VersionJSON(const cnpj: string; const Exercicio: Integer): TStrings;
begin
  Result      := TStringList.Create;
  Result.Text := THTTPUtil.GetText(THTTPUtil.PROP_URL_SUPORT, THTTPUtil.PROP_URIPATH_SCRIPTS, URIVersion(cnpj, Exercicio));
  if result.Count > 1 then
    if TStrUtil.ContainsIgnoreCase('html', result[0] + result[1]) then
      result.Clear;

end;

end.
