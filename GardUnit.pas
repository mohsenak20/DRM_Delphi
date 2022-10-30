unit GardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, DB, ADODB;

type
  TfrmGard = class(TForm)
    Label14: TLabel;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    Label9: TLabel;
    edtStartTime: TEdit;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    SP_Gard: TADOStoredProc;
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGard: TfrmGard;

implementation

uses DMUnit, qrGardUnit, ShareUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmGard.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmGard.BtnPrintClick(Sender: TObject);
begin
    SP_Gard.Close;
    SP_Gard.Parameters.ParamByName('@StartDate').Value:=edtStartDate.Text;
    SP_Gard.Parameters.ParamByName('@EndDate').Value:=edtEndDate.Text;
    SP_Gard.Parameters.ParamByName('@StartTime').Value:='14:00';
    SP_Gard.Prepared:=True;
    SP_Gard.Open;
    Application.CreateForm(TqrGard, qrGard);
    qrGard.lblCoName.Caption:=Parameter.CoName;
    qrGard.lblCurrentDate.Caption:=CurrentDate;
    qrGard.lblStartTime.Caption:=edtStartTime.Text;
    qrGard.lblStartDate.Caption:=edtStartDate.Text;
    qrGard.lblEndDate.Caption:=edtEndDate.Text;
    qrGard.Preview;
    FreeAndNil(qrGard);
end;

procedure TfrmGard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

end.
