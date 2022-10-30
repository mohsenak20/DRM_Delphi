unit PrePrintUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  TfrmPrePrint = class(TForm)
    edtSalon: TEdit;
    edtMiz: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label1: TLabel;
    edtNafar: TEdit;
    chbToll: TCheckBox;
    Label2: TLabel;
    edtEndSum: TEdit;
    Label3: TLabel;
    Label14: TLabel;
    edtFactorDate: TMaskEdit;
    lblFactorID: TLabel;
    btnPrint: TBitBtn;
    Label4: TLabel;
    edtCustomerName: TEdit;
    procedure btnReturnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrePrint: TfrmPrePrint;

implementation

{$R *.dfm}

procedure TfrmPrePrint.btnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPrePrint.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then
       FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmPrePrint.btnPrintClick(Sender: TObject);
begin
    Close;
end;

end.
