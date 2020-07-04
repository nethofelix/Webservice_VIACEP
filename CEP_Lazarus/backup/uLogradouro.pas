unit uLogradouro;

interface

uses
  REST.Json.Types;

{$M+}

type
  TLogradouro = class
  private
    FBairro: string;
    FCep: string;
    FComplemento: string;
    FGia: string;
    FIbge: string;
    FLocalidade: string;
    FLogradouro: string;
    FUf: string;
    FUnidade: string;
  published
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property Complemento: string read FComplemento write FComplemento;
    property Gia: string read FGia write FGia;
    property Ibge: string read FIbge write FIbge;
    property Localidade: string read FLocalidade write FLocalidade;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Uf: string read FUf write FUf;
    property Unidade: string read FUnidade write FUnidade;
  end;

implementation

end.
