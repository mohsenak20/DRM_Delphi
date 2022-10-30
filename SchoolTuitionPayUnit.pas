unit SchoolTuitionPayUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons;

type
  TfrmSchoolTuitionPay = class(TForm)
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lblStudentName: TLabel;
    lblStudentId: TLabel;
    lblPoolTitle: TLabel;
    lblPrice: TLabel;
    lblPayed: TLabel;
    lblMustPay: TLabel;
    btnPay: TBitBtn;
    BtnReturn: TBitBtn;
    edtPay: TEdit;
    SP_Payment: TADOStoredProc;
    Label8: TLabel;
    lblTermTitle: TLabel;
    Label9: TLabel;
    lblstudentEnrollmentId: TLabel;
    procedure BtnReturnClick(Sender: TObject);
    procedure btnPayClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSchoolTuitionPay: TfrmSchoolTuitionPay;

implementation
uses DMUnit, ShareUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmSchoolTuitionPay.BtnReturnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSchoolTuitionPay.btnPayClick(Sender: TObject);
begin
    IF (MessageBox(Self.Handle,'¬Ì« Â“Ì‰Â œÊ—Â ¬„Ê“‘Ì Å—œ«Œ  ê—œÌœø','Å—œ«Œ  ‘Â—ÌÂ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrYes)  Then
    begin
      SP_Payment.Parameters.ParamByName('@id').Value:=-1;
      SP_Payment.Parameters.ParamByName('@studentEnrollmentId').Value:=lblstudentEnrollmentId.Caption;
      SP_Payment.Parameters.ParamByName('@price').Value:=edtPay.Text;
      SP_Payment.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;
      SP_Payment.Parameters.ParamByName('@paymentDate').Value:=CurrentDate;
      SP_Payment.Parameters.ParamByName('@Action').Value:='Insert';
      SP_Payment.ExecProc;
      ShowMessage('À»  ‘Â—ÌÂ »« „Ê›ﬁÌ  «‰Ã«„ ê—œÌœ');
      Close;
    end;
end;

procedure TfrmSchoolTuitionPay.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmSchoolTuitionPay.FormShow(Sender: TObject);
begin
    edtPay.SetFocus;
end;

end.
