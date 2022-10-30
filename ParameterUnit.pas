unit ParameterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB, Mask;

type
  TfrmParameter = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    tabPrice: TTabSheet;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCoName: TEdit;
    edtTel: TEdit;
    edtAddress: TEdit;
    edtPostCode: TEdit;
    edtEmail: TEdit;
    edtManager: TEdit;
    edtURL: TEdit;
    edtFax: TEdit;
    Panel1: TPanel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    Label9: TLabel;
    edtBozorgsal: TEdit;
    Label10: TLabel;
    edtKhordsal: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    TabSheet3: TTabSheet;
    Label13: TLabel;
    edtfactorMessage: TEdit;
    SP_Parameter: TADOStoredProc;
    TParameter: TADOTable;
    Label14: TLabel;
    edtExtraBasePrice: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtBaseTime: TEdit;
    TabSheet4: TTabSheet;
    Label17: TLabel;
    edtFontSize: TEdit;
    TabSheet5: TTabSheet;
    Label18: TLabel;
    edtFreeClosed: TEdit;
    Label19: TLabel;
    edtBasePriceForBargain: TEdit;
    Label20: TLabel;
    TabSheet6: TTabSheet;
    Label21: TLabel;
    edtSMS_Server: TEdit;
    Label22: TLabel;
    edtSMS_Server_Port: TEdit;
    TabSheet7: TTabSheet;
    edtEndTimeForDiscount: TMaskEdit;
    Label23: TLabel;
    Label24: TLabel;
    edtEndPrice: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    edtPreEndTimeForDiscount: TMaskEdit;
    Label27: TLabel;
    edtPreEndPrice: TEdit;
    chbActiveEndPrice: TCheckBox;
    chbActivePreEndPrice: TCheckBox;
    chbSetLockerToUser: TCheckBox;
    chbPermitionForExit: TCheckBox;
    chbCanIssueExitChangingRoom1: TCheckBox;
    chbCanIssueExitChangingRoomVIP: TCheckBox;
    chbCanIssueExitChangingRoomGroup: TCheckBox;
    chbCanIssueExitChangingRoom2: TCheckBox;
    QChangingRoom: TADOQuery;
    QReadChangingRoom: TADOQuery;
    Label29: TLabel;
    edtSMSMessage: TEdit;
    chbSMS: TCheckBox;
    chbCanIssueExitGeneralChangingRoomServiceCenter2: TCheckBox;
    chbCanIssueExitVIPlChangingRoomServiceCenter2: TCheckBox;
    chbCanIssueExitStaffRoomServiceCenter2: TCheckBox;
    TabSheet8: TTabSheet;
    gbFaz2: TGroupBox;
    gbfaz1: TGroupBox;
    rbFaz1OnePerson: TRadioButton;
    rbFaz1TwoPerson: TRadioButton;
    rbFaz2OnePerson: TRadioButton;
    rbFaz2TwoPerson: TRadioButton;
    QServiceCenters: TADOQuery;
    Label30: TLabel;
    edtPreEndPriceForChild: TEdit;
    Label31: TLabel;
    Label28: TLabel;
    Label32: TLabel;
    edtHotelTicketExpiredIn: TEdit;
    Label33: TLabel;
    TabSheet9: TTabSheet;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    edtHotelAdultPrice: TEdit;
    edtHotelChildPrice: TEdit;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edtHotelAdultCommission: TEdit;
    edtHotelChildCommission: TEdit;
    Label42: TLabel;
    Label43: TLabel;
    edtExtraBaseTime: TEdit;
    Label44: TLabel;
    chbSetEnterInReception: TCheckBox;
    TabSheet10: TTabSheet;
    Label45: TLabel;
    edtInternetGate: TEdit;
    Label46: TLabel;
    edtCenterCode: TEdit;
    TabSheet11: TTabSheet;
    chbAutoCreditInMenu: TCheckBox;
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure chbCanIssueExitChangingRoom1Click(Sender: TObject);
    procedure chbCanIssueExitChangingRoomVIPClick(Sender: TObject);
    procedure chbCanIssueExitChangingRoomGroupClick(Sender: TObject);
    procedure chbCanIssueExitChangingRoom2Click(Sender: TObject);
    procedure chbSMSClick(Sender: TObject);
    procedure chbCanIssueExitGeneralChangingRoomServiceCenter2Click(
      Sender: TObject);
    procedure chbCanIssueExitVIPlChangingRoomServiceCenter2Click(
      Sender: TObject);
    procedure chbCanIssueExitStaffRoomServiceCenter2Click(Sender: TObject);

  private
  protected
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParameter: TfrmParameter;

implementation

uses DMUnit, Math;

{$R *.dfm}

procedure TfrmParameter.BtnSaveClick(Sender: TObject);
begin
    SP_Parameter.Parameters.ParamByName('@Bozorgsal').Value:=edtBozorgsal.Text;
    SP_Parameter.Parameters.ParamByName('@Khordsal').Value:=edtKhordsal.Text;
    SP_Parameter.Parameters.ParamByName('@factorMessage').Value:=edtfactorMessage.Text;
    SP_Parameter.Parameters.ParamByName('@CoName').Value:=edtCoName.Text;
    SP_Parameter.Parameters.ParamByName('@CoAddress').Value:=edtAddress.Text;
    SP_Parameter.Parameters.ParamByName('@Tel').Value:=edtTel.Text;
    SP_Parameter.Parameters.ParamByName('@PostCode').Value:=edtPostCode.Text;
    SP_Parameter.Parameters.ParamByName('@Manager').Value:=edtManager.Text;
    SP_Parameter.Parameters.ParamByName('@Email').Value:=edtEmail.Text;
    SP_Parameter.Parameters.ParamByName('@URL').Value:=edtURL.Text;
    SP_Parameter.Parameters.ParamByName('@ExtraBaseTime').Value:=edtExtraBaseTime.Text;
    SP_Parameter.Parameters.ParamByName('@ExtraBasePrice').Value:=edtExtraBasePrice.Text;
    SP_Parameter.Parameters.ParamByName('@BaseTime').Value:=edtBaseTime.Text;
    SP_Parameter.Parameters.ParamByName('@MenuFont').Value:=edtFontSize.Text;
    SP_Parameter.Parameters.ParamByName('@FreeClosed').Value:=edtFreeClosed.Text;    
    SP_Parameter.Parameters.ParamByName('@SMS_Server').Value:=edtSMS_Server.Text;
    SP_Parameter.Parameters.ParamByName('@SMS_Server_Port').Value:=edtSMS_Server_Port.Text;
    SP_Parameter.Parameters.ParamByName('@EndTimeForDiscount').Value:=edtEndTimeForDiscount.Text;
    SP_Parameter.Parameters.ParamByName('@EndPrice').Value:=edtEndPrice.Text;
    SP_Parameter.Parameters.ParamByName('@PreEndPriceForChild').Value:=edtPreEndPriceForChild.Text;
    SP_Parameter.Parameters.ParamByName('@PreEndTimeForDiscount').Value:=edtPreEndTimeForDiscount.Text;
    SP_Parameter.Parameters.ParamByName('@PreEndPrice').Value:=edtPreEndPrice.Text;
    SP_Parameter.Parameters.ParamByName('@ActiveEndPrice').Value:= chbActiveEndPrice.Checked;
    SP_Parameter.Parameters.ParamByName('@ActivePreEndPrice').Value:= chbActivePreEndPrice.Checked;
    SP_Parameter.Parameters.ParamByName('@SetLockerToUser').Value:= chbSetLockerToUser.Checked;
    SP_Parameter.Parameters.ParamByName('@PermitionForExit').Value:= chbPermitionForExit.Checked;
    SP_Parameter.Parameters.ParamByName('@SMSMessage').Value:= edtSMSMessage.Text;
    SP_Parameter.Parameters.ParamByName('@hotelTicketExpiredIn').Value:= edtHotelTicketExpiredIn.Text;
    SP_Parameter.Parameters.ParamByName('@hotelAdultPrice').Value:= edtHotelAdultPrice.Text;
    SP_Parameter.Parameters.ParamByName('@hotelChildPrice').Value:= edtHotelChildPrice.Text;
    SP_Parameter.Parameters.ParamByName('@hotelAdultCommission').Value:= edtHotelAdultCommission.Text;
    SP_Parameter.Parameters.ParamByName('@hotelChildCommission').Value:= edtHotelChildCommission.Text;
    SP_Parameter.Parameters.ParamByName('@setEnterInReception').Value:= chbSetEnterInReception.Checked;
    SP_Parameter.Parameters.ParamByName('@internetGate').Value:= edtInternetGate.Text;
    SP_Parameter.Parameters.ParamByName('@centerCode').Value:= edtCenterCode.Text;
    SP_Parameter.Parameters.ParamByName('@autoCreditInMenu').Value:= chbAutoCreditInMenu.Checked;

    SP_Parameter.Parameters.ParamByName('@is_active_sms').Value:= chbSMS.Checked;
    if rbFaz1OnePerson.Checked then
        SP_Parameter.Parameters.ParamByName('@PersonInLocker').Value:= 1
    else
        SP_Parameter.Parameters.ParamByName('@PersonInLocker').Value:= 2;

    if rbFaz2OnePerson.Checked then
        SP_Parameter.Parameters.ParamByName('@PersonInLocker2').Value:= 1
    else
        SP_Parameter.Parameters.ParamByName('@PersonInLocker2').Value:= 2;

    SP_Parameter.ExecProc;
    ShowMessage('«ÿ·«⁄«  –ŒÌ—Â ê—œÌœ');
    Close;
end;

procedure TfrmParameter.FormCreate(Sender: TObject);
begin
    TParameter.Open;
    edtHotelTicketExpiredIn.Text := IntToStr(TParameter['hotelTicketExpiredIn']);
    edtHotelAdultPrice.Text := IntToStr(TParameter['hotelAdultPrice']);
    edtHotelChildPrice.Text := IntToStr(TParameter['hotelChildPrice']);
    edtHotelAdultCommission.Text := IntToStr(TParameter['hotelAdultCommission']);
    edtHotelChildCommission.Text := IntToStr(TParameter['hotelChildCommission']);
    if TParameter['Bozorgsal']<>Null then
        edtBozorgsal.Text:=TParameter['Bozorgsal'];
    if TParameter['Khordsal']<>Null then
        edtKhordsal.Text:=TParameter['Khordsal'];
    if TParameter['factorMessage']<>Null then
        edtfactorMessage.Text:=TParameter['factorMessage'];
    if TParameter['CoName']<>Null then
        edtCoName.Text:=TParameter['CoName'];
    if TParameter['CoAddress']<>Null then
        edtAddress.Text:=TParameter['CoAddress'];
    if TParameter['Tel']<>Null then
        edtTel.Text:=TParameter['Tel'];
    if TParameter['PostCode']<>Null then
        edtPostCode.Text:=TParameter['PostCode'];
    if TParameter['Manager']<>Null then
        edtManager.Text:=TParameter['Manager'];
    if TParameter['Email']<>Null then
        edtEmail.Text:=TParameter['Email'];
    if TParameter['URL']<>Null then
        edtURL.Text:=TParameter['URL'];
    if TParameter['ExtraBaseTime']<>Null then
        edtExtraBaseTime.Text:=TParameter['ExtraBaseTime'];
    if TParameter['ExtraBasePrice']<>Null then
        edtExtraBasePrice.Text:=TParameter['ExtraBasePrice'];
    if TParameter['BaseTime']<>Null then
        edtBaseTime.Text:=TParameter['BaseTime'];
    if TParameter['MenuFont']<>Null then
        edtFontSize.Text:=TParameter['MenuFont'];
    edtFreeClosed.Text:=TParameter['freeClosed'];
    if TParameter['BasePriceForBargain']<>Null then
        edtBasePriceForBargain.Text:=TParameter['BasePriceForBargain'];

    if TParameter['SMS_Server']<>Null then
        edtSMS_Server.Text:=TParameter['SMS_Server'];
    if TParameter['SMS_Server_Port']<>Null then
        edtSMS_Server_Port.Text:=TParameter['SMS_Server_Port'];
    if TParameter['EndTimeForDiscount']<>Null then
        edtEndTimeForDiscount.Text:=TParameter['EndTimeForDiscount'];
    if TParameter['EndPrice']<>Null then
        edtEndPrice.Text:=TParameter['EndPrice'];

    if TParameter['PreEndTimeForDiscount']<>Null then
        edtPreEndTimeForDiscount.Text:=TParameter['PreEndTimeForDiscount'];
    if TParameter['PreEndPrice']<>Null then
        edtPreEndPrice.Text:=TParameter['PreEndPrice'];

    if TParameter['PreEndPriceForChild']<>Null then
        edtPreEndPriceForChild.Text:=TParameter['PreEndPriceForChild'];

    if TParameter['ActiveEndPrice']<>Null then
        chbActiveEndPrice.Checked:=TParameter['ActiveEndPrice'];
    if TParameter['ActivePreEndPrice']<>Null then
        chbActivePreEndPrice.Checked:=TParameter['ActivePreEndPrice'];

    if TParameter['SetLockertoUser']<>Null then
        chbSetLockerToUser.Checked:=TParameter['SetLockertoUser'];

    if TParameter['PermitionForExit']<>null then
        chbPermitionForExit.Checked:=TParameter['PermitionForExit'];

    if TParameter['PersonInLocker'] = 1 then
        rbFaz1OnePerson.Checked := True
    else
        rbFaz1TwoPerson.Checked := True;

    edtInternetGate.Text := TParameter['internetGate'];

    if TParameter['PersonInLocker2'] = 1 then
        rbFaz2OnePerson.Checked := True
    else
        rbFaz2TwoPerson.Checked := True;

    chbSetEnterInReception.Checked := TParameter['setEnterInReception'];
    QReadChangingRoom.Close;
    QReadChangingRoom.Parameters.ParamByName('ID').Value := 1;
    QReadChangingRoom.Open;
    If QReadChangingRoom['CanIssueExit']<>null then
        chbCanIssueExitChangingRoom1.Checked :=QReadChangingRoom['CanIssueExit'];


    QReadChangingRoom.Close;
    QReadChangingRoom.Parameters.ParamByName('ID').Value := 2;
    QReadChangingRoom.Open;
    If QReadChangingRoom['CanIssueExit']<>null then
        chbCanIssueExitChangingRoomVIP.Checked :=QReadChangingRoom['CanIssueExit'];

    QReadChangingRoom.Close;
    QReadChangingRoom.Parameters.ParamByName('ID').Value := 3;
    QReadChangingRoom.Open;
    If QReadChangingRoom['CanIssueExit']<>null then
        chbCanIssueExitChangingRoomGroup.Checked :=QReadChangingRoom['CanIssueExit'];

    QReadChangingRoom.Close;
    QReadChangingRoom.Parameters.ParamByName('ID').Value := 4;
    QReadChangingRoom.Open;
    If QReadChangingRoom['CanIssueExit']<>null then
        chbCanIssueExitChangingRoom2.Checked :=QReadChangingRoom['CanIssueExit'];

    QReadChangingRoom.Close;
    QReadChangingRoom.Parameters.ParamByName('ID').Value := 5;
    QReadChangingRoom.Open;
    If QReadChangingRoom['CanIssueExit']<>null then
        chbCanIssueExitGeneralChangingRoomServiceCenter2.Checked :=QReadChangingRoom['CanIssueExit'];

    QReadChangingRoom.Close;
    QReadChangingRoom.Parameters.ParamByName('ID').Value := 6;
    QReadChangingRoom.Open;
    If QReadChangingRoom['CanIssueExit']<>null then
        chbCanIssueExitVIPlChangingRoomServiceCenter2.Checked :=QReadChangingRoom['CanIssueExit'];

    QReadChangingRoom.Close;
    QReadChangingRoom.Parameters.ParamByName('ID').Value := 7;
    QReadChangingRoom.Open;
    If QReadChangingRoom['CanIssueExit']<>null then
        chbCanIssueExitStaffRoomServiceCenter2.Checked :=QReadChangingRoom['CanIssueExit'];

    chbSMS.Checked :=  TParameter['is_active_sms'];
    if  TParameter['is_active_sms'] then
        edtSMSMessage.Enabled := True
    else
        edtSMSMessage.Enabled := False;

    edtSMSMessage.Text :=  TParameter['SMSMessage'];
    edtCenterCode.Text := TParameter['centerCode'];
    chbAutoCreditInMenu.Checked := TParameter['autoCreditInMenu'];
    QServiceCenters.Open;
    gbFaz1.Caption := QServiceCenters['title'];
    QServiceCenters.Next;
    gbFaz2.Caption := QServiceCenters['title'];
    QServiceCenters.Close;
    tabPrice.Show;

end;

procedure TfrmParameter.BtnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmParameter.chbCanIssueExitChangingRoom1Click(Sender: TObject);
begin
    QChangingRoom.Close;
    QChangingRoom.Parameters.ParamByName('CanIssueExit').Value:= chbCanIssueExitChangingRoom1.Checked;
    QChangingRoom.Parameters.ParamByName('ChangingRoomID').Value:= 1;
    QChangingRoom.ExecSQL;
end;

procedure TfrmParameter.chbCanIssueExitChangingRoomVIPClick(
  Sender: TObject);
begin
    QChangingRoom.Close;
    QChangingRoom.Parameters.ParamByName('CanIssueExit').Value:= chbCanIssueExitChangingRoomVIP.Checked;
    QChangingRoom.Parameters.ParamByName('ChangingRoomID').Value:= 2;
    QChangingRoom.ExecSQL;
end;

procedure TfrmParameter.chbCanIssueExitChangingRoomGroupClick(
  Sender: TObject);
begin
    QChangingRoom.Close;
    QChangingRoom.Parameters.ParamByName('CanIssueExit').Value:= chbCanIssueExitChangingRoomGroup.Checked;
    QChangingRoom.Parameters.ParamByName('ChangingRoomID').Value:= 3;
    QChangingRoom.ExecSQL;
end;

procedure TfrmParameter.chbCanIssueExitChangingRoom2Click(Sender: TObject);
begin
    QChangingRoom.Close;
    QChangingRoom.Parameters.ParamByName('CanIssueExit').Value:= chbCanIssueExitChangingRoom2.Checked;
    QChangingRoom.Parameters.ParamByName('ChangingRoomID').Value:= 4;
    QChangingRoom.ExecSQL;
end;

procedure TfrmParameter.chbSMSClick(Sender: TObject);
begin
    edtSMSMessage.Enabled := chbSMS.Checked;
end;

procedure TfrmParameter.chbCanIssueExitGeneralChangingRoomServiceCenter2Click(
  Sender: TObject);
begin
    QChangingRoom.Close;
    QChangingRoom.Parameters.ParamByName('CanIssueExit').Value:= chbCanIssueExitGeneralChangingRoomServiceCenter2.Checked;
    QChangingRoom.Parameters.ParamByName('ChangingRoomID').Value:= 5;
    QChangingRoom.ExecSQL;
end;

procedure TfrmParameter.chbCanIssueExitVIPlChangingRoomServiceCenter2Click(
  Sender: TObject);
begin
    QChangingRoom.Close;
    QChangingRoom.Parameters.ParamByName('CanIssueExit').Value:= chbCanIssueExitVIPlChangingRoomServiceCenter2.Checked;
    QChangingRoom.Parameters.ParamByName('ChangingRoomID').Value:= 6;
    QChangingRoom.ExecSQL;
end;

procedure TfrmParameter.chbCanIssueExitStaffRoomServiceCenter2Click(
  Sender: TObject);
begin
    QChangingRoom.Close;
    QChangingRoom.Parameters.ParamByName('CanIssueExit').Value:= chbCanIssueExitStaffRoomServiceCenter2.Checked;
    QChangingRoom.Parameters.ParamByName('ChangingRoomID').Value:= 7;
    QChangingRoom.ExecSQL;
end;

end.
