unit BarCodeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RpBase, RpSystem, RpDefine, RpRave, Mask, DB,
  ADODB;

type
  TfrmBarCode = class(TForm)
    Label2: TLabel;
    edtStart: TEdit;
    BtnPrint: TBitBtn;
    BtnReturn: TBitBtn;
    Label1: TLabel;
    edtEnd: TEdit;
    RvProject: TRvProject;
    RvSystem: TRvSystem;
    Label14: TLabel;
    edtEndDate: TMaskEdit;
    Label3: TLabel;
    edtGroupNumber: TEdit;
    Label4: TLabel;
    chbPrintExpierDate: TCheckBox;
    QInsert: TADOQuery;
    GroupBox1: TGroupBox;
    edtCardID1: TEdit;
    Label5: TLabel;
    edtCardID2: TEdit;
    Label6: TLabel;
    edtCardID3: TEdit;
    Label7: TLabel;
    btn3BarcodePrint: TBitBtn;
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure btn3BarcodePrintClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBarCode: TfrmBarCode;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmBarCode.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmBarCode.BtnPrintClick(Sender: TObject);
var
i, intUp, intDown, k : integer;
begin
    RvProject.Open;
    intDown:=StrToIntDef(edtStart.Text, 0);
    intUp:=StrToIntDef(edtEnd.Text, 0);

    k:=StrToIntDef(edtGroupNumber.Text, 0) div 3;
    for i:=1 to Trunc((intUp-intDown)/3)+1 do
    begin
        if chbPrintExpierDate.Checked then
            RvProject.SetParam('ExpierDate', edtEndDate.Text)
        else
            RvProject.SetParam('ExpierDate', ' ');
        RvProject.SetParam('CardID1',IntToStr(intDown));
        intDown:=intDown+1;
        RvProject.SetParam('CardID2',IntToStr(intDown));
        intDown:=intDown+1;
        RvProject.SetParam('CardID3',IntToStr(intDown));
        intDown:=intDown+1;
        RvProject.ExecuteReport('MainBarCode');
        RvProject.Close;
        if (i mod k)=0 then
            ShowMessage('·ÿ›« »—«Ì «œ«„Â ò·ÌœÌ —« ›‘«— œÂÌœ');
    end;
    Close;

/////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
    {QInsert.Close;
    QInsert.Parameters.ParamByName('intDown').Value:=edtStart.Text;
    QInsert.Parameters.ParamByName('intUp').Value:=edtEnd.Text;
    QInsert.Parameters.ParamByName('ExpierDate').Value:=edtEndDate.Text;
    QInsert.ExecSQL;
    RvProject.Open;
    RvProject.ExecuteReport('dbBarCode');
    RvProject.Close;}




end;

procedure TfrmBarCode.btn3BarcodePrintClick(Sender: TObject);
begin
    RvProject.Open;
    if chbPrintExpierDate.Checked then
        RvProject.SetParam('ExpierDate', edtEndDate.Text)
    else
        RvProject.SetParam('ExpierDate', ' ');

    RvProject.SetParam('CardID1', edtCardID1.Text);
    RvProject.SetParam('CardID2',edtCardID2.Text);
    RvProject.SetParam('CardID3',edtCardID3.Text);
    RvProject.ExecuteReport('MainBarCode');
    RvProject.Close;
    edtCardID1.SetFocus;
end;

procedure TfrmBarCode.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

end.
