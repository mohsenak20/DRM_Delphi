unit TuitionPayUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmTuitionPay = class(TForm)
    btnPay: TBitBtn;
    BtnReturn: TBitBtn;
    Label6: TLabel;
    edtPay: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lblLessonCode: TLabel;
    lblEnrollmentId: TLabel;
    lblLessonTitle: TLabel;
    lblPrice: TLabel;
    lblPayed: TLabel;
    lblMustPay: TLabel;
    SP_PaymentEnrollment: TADOStoredProc;
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
  frmTuitionPay: TfrmTuitionPay;

implementation

uses DMUnit, ShareUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmTuitionPay.BtnReturnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTuitionPay.btnPayClick(Sender: TObject);
begin
    IF (MessageBox(Self.Handle,'¬Ì« Â“Ì‰Â œÊ—Â ¬„Ê“‘Ì Å—œ«Œ  ê—œÌœø','Å—œ«Œ  ‘Â—ÌÂ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrYes)  Then
    begin
      SP_PaymentEnrollment.Parameters.ParamByName('@id').Value:=-1;
      SP_PaymentEnrollment.Parameters.ParamByName('@enrollmentId').Value:=lblEnrollmentId.Caption;
      SP_PaymentEnrollment.Parameters.ParamByName('@price').Value:=edtPay.Text;
      SP_PaymentEnrollment.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;
      SP_PaymentEnrollment.Parameters.ParamByName('@paymentDate').Value:=CurrentDate;
      SP_PaymentEnrollment.Parameters.ParamByName('@Action').Value:='Insert';
      SP_PaymentEnrollment.ExecProc;
      ShowMessage('À»  ‘Â—ÌÂ »« „Ê›ﬁÌ  «‰Ã«„ ê—œÌœ');
      Close;
    end;
end;

procedure TfrmTuitionPay.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmTuitionPay.FormShow(Sender: TObject);
begin
    edtPay.SetFocus;
end;

end.
