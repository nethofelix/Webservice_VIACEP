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
  if( lCep.Consultar(mskCEP.Text)) then
   begin
   edtCidade.Text     := lCEP.Retorno.Localidade;
   edtLogradouro.Text := lCEP.Retorno.Logradouro;
   edtBairro.Text     := lCEP.Retorno.Bairro;
   edtUf.Text         := lCEP.Retorno.Uf;
   edtIbge.Text       := lCEP.Retorno.Ibge;
   end
   else
   begin
   ShowMessage('Erro ao Localizar CEP');
   edtLogradouro.Clear;
   edtbairro.Clear;
   edtcidade.Clear;
   edtIBGE.Clear;
   edtUf.Clear;
   end;
  finally
   FreeAndNil(lCep);
  end;
end;

end.

