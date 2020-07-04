unit uRetorno;

interface


uses
  fphttpclient,uLogradouro,fpjson,jsonparser;
  const
 BaseUrl = '';
type

 { TRetorno }

 TRetorno = class
 ObjetoCep : TJSONObject;
 vParse    : TJSONParser;
 FRetornoCEP : TLogradouro;
 procedure SetRetorno(const Value: TLogradouro);
 private
 public
    destructor Destroy; override;
    property Retorno: TLogradouro read FRetornoCEP write SetRetorno;
    function Consultar(ACEP:string): Boolean;
  end;


implementation




{ TRetorno }

function TRetorno.Consultar(ACEP:string): Boolean;
var
  lRetorno  : String;
begin
  lRetorno  := TFPHTTPClient.SimpleGet('http://viacep.com.br/ws/'+ACep+'/json/');
  vParse    := TJSONParser.Create(lRetorno);
  ObjetoCep := (vParse.Parse as TJSONObject);


   FRetornoCEP             := TLogradouro.Create;
   FRetornoCEP.Cep         := ObjetoCep.Elements['cep'].AsString;
   FRetornoCEP.Bairro      := ObjetoCep.Elements['bairro'].AsString;
   FRetornoCEP.Complemento := ObjetoCep.Elements['complemento'].AsString;
   FRetornoCEP.Gia         := ObjetoCep.Elements['gia'].AsString;
   FRetornoCEP.Ibge        := ObjetoCep.Elements['ibge'].AsString;
   FRetornoCEP.Localidade  := ObjetoCep.Elements['localidade'].AsString;
   FRetornoCEP.Logradouro  := ObjetoCep.Elements['logradouro'].AsString;
   FRetornoCEP.Uf          := ObjetoCep.Elements['uf'].AsString;
   FRetornoCEP.Unidade     := ObjetoCep.Elements['unidade'].AsString;
   Result                  := True;

end;
destructor TRetorno.Destroy;
begin
  vParse.Free;
  ObjetoCep.Free;
  FRetornoCEP.Free;
  inherited;
end;

procedure TRetorno.SetRetorno(const Value: TLogradouro);
begin
   FRetornoCEP := Value;
end;

end.
