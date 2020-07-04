unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, MaskEdit,
  ExtCtrls,uRetorno;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnPesquisar: TButton;
    Label1: TLabel;
    edtLogradouro: TLabeledEdit;
    edtbairro: TLabeledEdit;
    edtcidade: TLabeledEdit;
    edtUf: TLabeledEdit;
    edtIBGE: TLabeledEdit;
    mskCEP: TMaskEdit;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.btnPesquisarClick(Sender: TObject);
var
 lCep:TRetorno;
begin
  lCep := TRetorno.Create;
  try
   lCep.Consultar(mskCEP.Text);
   edtCidade.Text     := lCEP.Retorno.Localidade;
   edtLogradouro.Text := lCEP.Retorno.Logradouro;
   edtBairro.Text     := lCEP.Retorno.Bairro;
   edtUf.Text         := lCEP.Retorno.Uf;
   edtIbge.Text       := lCEP.Retorno.Ibge;
  finally
   FreeAndNil(lCep);
  end;
end;

end.

