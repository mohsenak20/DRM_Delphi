unit ViewReceptionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask, RpBase, RpSystem, RpDefine, RpRave, RpDevice;

type
  TfrmViewReception = class(TForm)
    PanelButton: TPanel;
    BtnActive: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    MainMenuUnit: TMainMenu;
    MnuFile: TMenuItem;
    MnuEdit: TMenuItem;
    N2: TMenuItem;
    MnuReturn: TMenuItem;
    PopupMenuUnit: TPopupMenu;
    MnuPopEdit: TMenuItem;
    SP_UpdateActiveREception: TADOStoredProc;
    dsReception: TDataSource;
    QReception: TADOQuery;
    Label1: TLabel;
    rbActive: TRadioButton;
    rbNotActive: TRadioButton;
    Panel1: TPanel;
    edtStartDate: TMaskEdit;
    lblStartDate: TLabel;
    edtEndDate: TMaskEdit;
    lblEndDate: TLabel;
    Label4: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    Label5: TLabel;
    edtKeyNumber: TEdit;
    Label6: TLabel;
    edtReceptionID: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtStartTime1: TEdit;
    edtStartTime2: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtEndTime1: TEdit;
    edtEndTime2: TEdit;
    BBtnAccept: TBitBtn;
    Label11: TLabel;
    edtCustomerName: TEdit;
    rbBozorgsal: TRadioButton;
    rbKhordSal: TRadioButton;
    rbAll: TRadioButton;
    Label12: TLabel;
    edtReceptionTypeID: TEdit;
    edtReceptionType: TEdit;
    btnReceptionType: TBitBtn;
    lblReceptionCaption: TLabel;
    Label15: TLabel;
    lblPaymentCaption: TLabel;
    lblModCashCaption: TLabel;
    lblSumReception: TLabel;
    lblsumCredit: TLabel;
    lblPayment: TLabel;
    lblModCash: TLabel;
    QSum: TADOQuery;
    lblBozorgsalCaption: TLabel;
    lblBozorgsal: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    lblKhordsalCaption: TLabel;
    lblKhordsal: TLabel;
    Label24: TLabel;
    lblTB: TLabel;
    Label26: TLabel;
    lblTK: TLabel;
    mnuReport: TMenuItem;
    mnuDailyReport: TMenuItem;
    SP_GetCurrentCredit: TADOStoredProc;
    Label19: TLabel;
    lblCardCount: TLabel;
    BitBtn1: TBitBtn;
    QCardPrint: TADOQuery;
    mnuCreditMod: TMenuItem;
    GroupBox1: TGroupBox;
    rbCard: TRadioButton;
    rbNormal: TRadioButton;
    lblCardAndNormal: TRadioButton;
    btnEdit: TBitBtn;
    BtnDel: TBitBtn;
    QDelete: TADOQuery;
    Label23: TLabel;
    lblBK: TLabel;
    lblSafarKartCaption: TLabel;
    lblTravelCard: TLabel;
    Label27: TLabel;
    edtCardID: TEdit;
    Label2: TLabel;
    lblDelete: TLabel;
    QDeleteInfo: TADOQuery;
    btnDeleteInfo: TBitBtn;
    mnuGard: TMenuItem;
    btnReceptionCard: TBitBtn;
    qReceptionWithCard: TADOQuery;
    mnuPrint: TMenuItem;
    QPrint: TADOQuery;
    RvProject1: TRvProject;
    QCredit: TADOQuery;
    RvSystem1: TRvSystem;
    mnuChengeLocker: TMenuItem;
    mnuSendChargeToAnotherLocker: TMenuItem;
    mnuReturnFromExit: TMenuItem;
    mnuGroup: TMenuItem;
    mnuChangeCharge: TMenuItem;
    N1: TMenuItem;
    mnuOrderDiscount: TMenuItem;
    mnuAllTicketPrint: TMenuItem;
    RvSystem: TRvSystem;
    RvProject: TRvProject;
    N3: TMenuItem;
    mnuReceptionUser: TMenuItem;
    N4: TMenuItem;
    mnuCancel: TMenuItem;
    ActionList1: TActionList;
    EnableButton: TAction;
    QMinMaxReceptionID: TADOQuery;
    N5: TMenuItem;
    mnuSendCharge: TMenuItem;
    N6: TMenuItem;
    mnuHotelReception: TMenuItem;
    QOrderHotel: TADOQuery;
    mnuOrderHotelDaily: TMenuItem;
    QOrderHotelDaily: TADOQuery;
    mnuSalesCard: TMenuItem;
    N9: TMenuItem;
    mnuLocker: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    mnuLockerRoom1: TMenuItem;
    N8: TMenuItem;
    mnuSpecialLocker1: TMenuItem;
    SP_Start: TADOStoredProc;
    mnuNotEnter: TMenuItem;
    lblAfternoon: TLabel;
    Label16: TLabel;
    QAfternoon: TADOQuery;
    Label13: TLabel;
    lblVIPCardCount: TLabel;
    GroupBox2: TGroupBox;
    rbNoneWebReception: TRadioButton;
    rbWebReception: TRadioButton;
    N7: TMenuItem;
    mnuWebReception: TMenuItem;
    lblShift3: TLabel;
    Label18: TLabel;
    RadioButton2: TRadioButton;
    Label17: TLabel;
    lblNewsPaper: TLabel;
    QExitUserName: TADOQuery;
    N12: TMenuItem;
    mnuExitUserName: TMenuItem;
    N13: TMenuItem;
    mnuShift3: TMenuItem;
    QShift3: TADOQuery;
    mnuCreditCharge: TMenuItem;
    QTypeOfReception: TADOQuery;
    mnuCreditCardDiscount: TMenuItem;
    rbVoucher: TRadioButton;
    rbCreditCard: TRadioButton;
    N14: TMenuItem;
    N15: TMenuItem;
    rbOrder: TRadioButton;
    QIntMod: TADOQuery;
    mnuSpecialGuests: TMenuItem;
    mnuSpecialGuestCredit: TMenuItem;
    N16: TMenuItem;
    mnuChangeTo: TMenuItem;
    Label3: TLabel;
    edtService_center_id: TEdit;
    edtService_center: TEdit;
    btnService_center: TBitBtn;
    QServiceCenter: TADOQuery;
    mnuChangeServiceCenter: TMenuItem;
    QServiceCenterTitle: TADOQuery;
    QChangeKey: TADOQuery;
    QSelectReception: TADOQuery;
    PrinterSetupDialog: TPrinterSetupDialog;
    PrintDialog: TPrintDialog;
    Label14: TLabel;
    edtOrderID: TEdit;
    mnuInternetReception: TMenuItem;
    mnuHotelTicketSummary: TMenuItem;
    N17: TMenuItem;
    mnuShowBargainInfo: TMenuItem;
    Label22: TLabel;
    edtMobile: TEdit;
    N18: TMenuItem;
    mnuPosTrans: TMenuItem;
    lblDakhelTitle: TLabel;
    lblDakhel: TLabel;
    mnuShops: TMenuItem;
    mnuLockerManagment: TMenuItem;
    Label25: TLabel;
    edtShiftTitle: TEdit;
    btnShift: TBitBtn;
    edtShiftId: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnActiveClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure mnuDailyReportClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mnuCreditModClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteInfoClick(Sender: TObject);
    procedure mnuGardClick(Sender: TObject);
    procedure btnReceptionCardClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure mnuPrintClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mnuChengeLockerClick(Sender: TObject);
    procedure mnuSendChargeToAnotherLockerClick(Sender: TObject);
    procedure mnuGroupClick(Sender: TObject);
    procedure mnuChangeChargeClick(Sender: TObject);
    procedure mnuOrderDiscountClick(Sender: TObject);
    procedure mnuAllTicketPrintClick(Sender: TObject);
    procedure mnuReceptionUserClick(Sender: TObject);
    procedure EnableBEditExecute(Sender: TObject);
    procedure EnableButtonExecute(Sender: TObject);
    procedure mnuHotelReceptionClick(Sender: TObject);
    procedure GridTitleClick(Column: TColumn);
    procedure GridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mnuSalesCardClick(Sender: TObject);
    procedure mnuLockerRoom1Click(Sender: TObject);
    procedure mnuActiveLockerClick(Sender: TObject);
    procedure mnuSpecialLocker1Click(Sender: TObject);
    procedure mnuNotEnterClick(Sender: TObject);
    procedure mnuWebReceptionClick(Sender: TObject);
    procedure btnReceptionTypeClick(Sender: TObject);
    procedure mnuExitUserNameClick(Sender: TObject);
    procedure mnuShift3Click(Sender: TObject);
    procedure mnuCreditChargeClick(Sender: TObject);
    procedure mnuCreditCardDiscountClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure mnuSpecialGuestCreditClick(Sender: TObject);
    procedure mnuChangeToClick(Sender: TObject);
    procedure btnService_centerClick(Sender: TObject);
    procedure mnuSpecialLocker2Click(Sender: TObject);
    procedure PopupMenuUnitPopup(Sender: TObject);
    procedure mnuChangeServiceCenterClick(Sender: TObject);
    procedure QReceptionBeforeDelete(DataSet: TDataSet);
    procedure mnuInternetReceptionClick(Sender: TObject);
    procedure mnuHotelTicketSummaryClick(Sender: TObject);
    procedure mnuShowBargainInfoClick(Sender: TObject);
    procedure mnuPosTransClick(Sender: TObject);
    procedure mnu4000Click(Sender: TObject);
    procedure mnuShopsClick(Sender: TObject);
    procedure mnuLockerManagmentClick(Sender: TObject);
    procedure mnu4001Click(Sender: TObject);
    procedure btnShiftClick(Sender: TObject);



  private
    EnableEdit: Boolean;
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;

  public
  published
    property Enabled;
    { Public declarations }
  end;

var
  frmViewReception: TfrmViewReception;

implementation

uses ShareUnit, CalculatUnit, Math, UserInfoUnit, DMUnit, DailyReportUnit,
  SabegheMoshtariUnit, qrCardGroupUnit, CreditModUnit, EdtReceptionUnit,
  DeleteInfoUnit, GardUnit, ReceptionCardUnit, qrReceptionWithCard,
  ManagerUnit, ReceptionGroupUnit, ChargeManagerUnit, OrderDiscountUnit,
  ActiveUserUnit, HotelsInfoUnit, ReceptionCardPriceUnit, LockerMapUnit,
  ChangingRoom2Unit, GroupUnit, VIPUnit, ActiveLockerUnit,
  NotIssueExitUnit, WebReceptionInfoUnit, WebReceptionUnit,
  CreditCardChargeReportUnit, CreditCardDiscountUnit, GetAccessToLoginUnit,
  SpecialGuestCreditUnit, ChangeToUnit, ServiceCenterInfoUnit,
  qrChangeLockerUnit, InternetReceptionUnit, HotelReceptionSummeryUnit,
  showBargainInfoUnit, PosTransactionsUnit, ShopsReportUnit,
  ManageLockersUnit, ShiftInfoUnit;

{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmViewReception.SetEnabledDisable(BL:Boolean);
Begin
    Grid.Enabled:=BL;
    PanelButton.Enabled:=BL;
    MnuEdit.Enabled:=BL;
    MnuPopEdit.Enabled:=BL;
    GroupBox.Visible:=Not BL;
    IF Not BL Then
    Begin
        //edtCredit.Clear;
        //edtCredit.SetFocus;
        rbActive.Checked:=True;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmViewReception.LoadSqlQuery;
Begin
            lblDakhel.Caption := '' ;
    lblAfternoon.Caption := '';
    edtStartDate.Text:=CurrentDate;
    edtEndDate.Text:=CurrentDate;
    lblSumReception.Caption:='';
    lblBozorgsal.Caption:='';
    lblKhordsal.Caption:='';
    lblTB.Caption:='';
    lblTK.Caption:='';
    lblBK.Caption:='';
    lblsumCredit.Caption:='';
    lblPayment.Caption:='';
    lblModCash.Caption:='';
    lblCardCount.Caption:='';
    lblTravelCard.Caption:='';
    lblNewsPaper.Caption := '';
    lblVIPCardCount.Caption := '';
    MnuPopEdit.Enabled := False;
    mnuChengeLocker.Enabled := False;
    mnuSendChargeToAnotherLocker.Enabled := False;
    mnuChangeCharge.Enabled := False;
    mnuReturnFromExit.Enabled := False;
    if (UserInfo.userType = Admin) or (UserInfo.userType=Supervisour) then
    begin
        BtnDel.Enabled:=True;
        BtnActive.Enabled:=True;
        btnEdit.Enabled:=True;
        mnuChengeLocker.Enabled := True;
        mnuSendChargeToAnotherLocker.Enabled := True;
        mnuChangeCharge.Enabled := True;
        mnuReturnFromExit.Enabled := True;
        BitBtn1.Enabled := True;
        BtnPrint.Enabled :=True;
        btnReceptionCard.Enabled := True;
        mnuLocker.Visible := True;
    end;
    if UserInfo.userType = Supervisour then
    begin
        //edtStartDate.Enabled:=False;
        //edtEndDate.Enabled:=False;
        mnuReport.Visible:=False;
        BtnActive.Enabled:=True;
        //btnEdit.Enabled:=True;
        lblSumReception.Visible:=True;
        lblBozorgsal.Visible:=True;
        lblKhordsal.Visible:=True;
        lblTB.Visible:=True;
        lblTK.Visible:=True;
        lblsumCredit.Visible:=True;
        lblPayment.Visible:=True;
        lblModCash.Visible:=True;
        lblCardCount.Visible:=True;
        lblTravelCard.Visible:=True;
        //lblNewsPaper.Visible := False;
        mnuChengeLocker.Enabled := True;
        mnuSendChargeToAnotherLocker.Enabled := True;
        mnuChangeCharge.Enabled := True;
        mnuReturnFromExit.Enabled := True;
        mnuLocker.Visible := True;
    end;

    if UserInfo.userType = Supervisour then
    begin
        lblDakhelTitle.Visible := True;
        lblDakhel.Visible := True;
        BitBtn1.Visible:=False;
        BtnActive.Visible:=False;
        btnEdit.Visible:=False;
        BtnPrint.Visible:=False;
        BtnDel.Visible:=False;
        btnDeleteInfo.Visible:=False;
        //Label15.Visible:=False;
        //lblsumCredit.Visible:=False;
        edtStartDate.Text := CurrentDate;
        edtEndDate.Text := CurrentDate;
        edtStartDate.Visible := False;
        edtEndDate.Visible := False;
        lblStartDate.Visible := False;
        lblEndDate.Visible := False;
        lblReceptionCaption.Visible:=False;
        lblBozorgsalCaption.Visible:=False;
        lblKhordsalCaption.Visible:=False;
        lblSafarKartCaption.Visible:=False;
        lblSafarKartCaption.Visible:= False;
        Label16.Visible := False;
        Label13.Visible := False;
        Label18.Visible := False;
        lblAfternoon.Visible := False;
        lblVIPCardCount.Visible := False;
        lblShift3.Visible := False;
        //lblPaymentCaption.Visible:=False;
        //lblModCashCaption.Visible:=False;
        GroupBox1.Visible:=False;
        rbBozorgsal.Visible:=False;
        rbKhordSal.Visible:=False;
        rbAll.Visible:=False;
        Label19.Visible := False;
        lblCardCount.Visible := False;
        mnuReport.Visible:=False;
    end;
    {if  UserInfo.WorkSectionID = 1 then
    begin
        lblSumReception.Visible:=False;
        lblBozorgsal.Visible:=False;
        lblKhordsal.Visible:=False;
        lblTB.Visible:=False;
        lblTK.Visible:=False;
        lblsumCredit.Visible:=False;
        lblPayment.Visible:=False;
        lblBK.Visible := False;
    end; }

    QServiceCenter.Open;
    mnuSpecialLocker1.Caption := 'ò„œ ÊÌéÂ ÃÂ  ‘«—é ' + QServiceCenter['title'];
    QServiceCenter.Close;

    if not Parameter.isHotelAllowed then
    begin
        mnuOrderHotelDaily.Visible := False;
        mnuHotelReception.Visible := False;
        mnuHotelTicketSummary.Visible := False;
    end;

    if parameter.isPool then
    begin
        mnuSpecialLocker1.Visible := False;
        mnuShift3.Visible := False;
    end;

End;

{*******************  GetValue  ***********************}
procedure TfrmViewReception.GetValue;
begin
    //edtCredit.Text:=QReception.fieldByName('Credit').Text;
    if QReception['Active'] then
        rbActive.Checked:=True
    else
        rbNotActive.Checked:=True;
end;

{*******************  FormCreate  ***********************}
procedure TfrmViewReception.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmViewReception.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then
        IF NOT BBtnAccept.Focused THEN
            BBtnAccept.SetFocus;
        //FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmViewReception.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmViewReception.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmViewReception.BtnSaveClick(Sender: TObject);
begin

    SP_UpdateActiveREception.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
    if rbActive.Checked then
        SP_UpdateActiveREception.Parameters.ParamByName('@Active').Value:=True
    else
        SP_UpdateActiveREception.Parameters.ParamByName('@Active').Value:=False;
    SP_UpdateActiveREception.ExecProc;
    SetEnabledDisable(True);
    Refresh_Query(QReception);
    Grid.SetFocus;
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmViewReception.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmViewReception.BtnNewClick(Sender: TObject);
begin
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmViewReception.BtnActiveClick(Sender: TObject);
begin
    IF (QReception.RecNo<=0) OR (QReception.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmViewReception.BtnDelClick(Sender: TObject);
begin
    IF ((QReception.RecNo<=0) OR (QReception.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    IF (QReception['ReceptionDate'] < CurrentDate) and (UserInfo.UserID<>5) then
    begin
        ShowMessage('‘„« „Ã«“ »Â Õ–› «Ì‰ —òÊ—œ ‰„Ì »«‘Ìœ');
        Exit;
    end;
    if (QReception['EndTime']<>'99:99') then
        IF (MessageBox(Self.Handle,'„‘ —Ì „Ê—œ ‰Ÿ— «“ „Ã„Ê⁄Â Œ«—Ã ‘œÂ «”  ¬Ì« „Ì ŒÊ«ÂÌœ «Ê —« Õ–› ò‰Ìœø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;

    QDelete.Close;
    QDelete.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
    QDelete.ExecSQL;
    ShowMessage('—òÊ—œ „Ê—œ ‰Ÿ— Õ–› ê—œÌœ');
    QReception.Close;
    QReception.Open;
end;

{*******************  Form Show  ***********************}
procedure TfrmViewReception.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmViewReception.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QReception.Close;
end;


procedure TfrmViewReception.BBtnAcceptClick(Sender: TObject);
var
strFilter : string;
SumCreditForSales, sumFactor, sumReception, sumCredit : LONGLONG;
CardCount, TK, intMod : integer;
begin

    strFilter:='';
    CardCount:=0;
    {if edtStartDate.Text<>'1   /  /  ' then
        if edtEndDate.Text<>'1   /  /  ' then
            if strFilter='' then
                strFilter:=' TReception.ReceptionID >= @startReceptionID and TReception.ReceptionID <= @endReceptionID'
            else
                strFilter:=strFilter+' and TReception.ReceptionID >= @startReceptionID and TReception.ReceptionID <= @endReceptionID'
        else
            if strFilter='' then
                strFilter:=' TReception.ReceptionID >= @startReceptionID'
            else
                strFilter:=strFilter+' and TReception.ReceptionID >= @startReceptionID'
    else
        if edtEndDate.Text<>'1   /  /  ' then
            if strFilter='' then
                strFilter:=' TReception.ReceptionID <= @endReceptionID'
            else
                strFilter:=strFilter+' and TReception.ReceptionID <= @endReceptionID';}



    QMinMaxReceptionID.Close;
    QMinMaxReceptionID.Parameters.ParamByName('StartDate').Value:= edtStartDate.Text;
    QMinMaxReceptionID.Parameters.ParamByName('EndDate').Value:= edtEndDate.Text;
    QMinMaxReceptionID.Open;
    if QMinMaxReceptionID['StartReceptionID'] = null then
    begin
        ShowMessage('·ÿ›« œ— «‰ Œ«» ›Ì· — „‰«”» œﬁ  ‰„«ÌÌœ.');
        Exit;

    end;

    strFilter:='TReception.ReceptionID >= '+IntToStr(QMinMaxReceptionID['StartReceptionID'])+' and TReception.ReceptionID <= '+IntToStr(QMinMaxReceptionID['EndReceptionID']);
    if edtMobile.Text <> '' then
        strFilter := strFilter + ' and TReception.mobile_number = '+QuotedStr(edtMobile.Text);
    if edtStartTime1.Text<>'' then
        if edtEndTime1.Text<>'' then
            if strFilter='' then
                strFilter:=' StartTime >= '+QuotedStr(edtStartTime1.Text)+' and StartTime <= '+QuotedStr(edtEndTime1.Text)
            else
                strFilter:=strFilter+' and StartTime >= '+QuotedStr(edtStartTime1.Text)+' and StartTime <= '+QuotedStr(edtEndTime1.Text)
        else
            if strFilter='' then
                strFilter:=' StartTime >= '+QuotedStr(edtStartTime1.Text)
            else
                strFilter:=strFilter+' and StartTime >= '+QuotedStr(edtStartTime1.Text)
    else
        if edtEndTime1.Text<>'' then
            if strFilter='' then
                strFilter:=' StartTime <= '+QuotedStr(edtEndTime1.Text)
            else
                strFilter:=strFilter+' and StartTime <= '+QuotedStr(edtEndTime1.Text);
  if edtShiftId.Text <> '' then
      strFilter := strFilter + ' and shiftId='+edtShiftId.Text;

   if edtCardID.Text<>'' then
      if strFilter<>'' then
          strFilter:=strFilter+' and ((TReception.CardID='+edtCardID.Text+') or (TReception.CardID2='+edtCardID.Text+') or (TReception.CardID3='+edtCardID.Text+'))'
      else
          strFilter:='  ((TReception.CardID='+edtCardID.Text+') or (TReception.CardID2='+edtCardID.Text+') or (TReception.CardID3='+edtCardID.Text+'))';

   if edtService_center_id.Text<>'' then
      strFilter:=strFilter+' and TReception.service_center_id='+edtService_center_id.Text;

    if edtStartTime2.Text<>'' then
        if edtEndTime2.Text<>'' then
            if strFilter='' then
                strFilter:=' EndTime >= '+QuotedStr(edtStartTime2.Text)+' and EndTime <= '+QuotedStr(edtEndTime2.Text)
            else
                strFilter:=strFilter+' and EndTime >= '+QuotedStr(edtStartTime2.Text)+' and EndTime <= '+QuotedStr(edtEndTime2.Text)
        else
            if strFilter='' then
                strFilter:=' EndTime >= '+QuotedStr(edtStartTime2.Text)
            else
                strFilter:=strFilter+' and EndTime >= '+QuotedStr(edtStartTime2.Text)
    else
        if edtEndTime2.Text<>'' then
            if strFilter='' then
                strFilter:=' EndTime <= '+QuotedStr(edtEndTime2.Text)
            else
                strFilter:=strFilter+' and EndTime <= '+QuotedStr(edtEndTime2.Text);


    




    if edtReceptionID.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and TReception.ReceptionID='+edtReceptionID.Text
        else
            strFilter:='TReception.ReceptionID='+edtReceptionID.Text;

    if edtKeyNumber.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and TReception.ClosedID='+edtKeyNumber.Text
        else
            strFilter:='TReception.ClosedID='+edtKeyNumber.Text;

    if edtOrderID.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and TReception.order_id='+edtOrderID.Text
        else
            strFilter:='TReception.order_id='+edtOrderID.Text;
    {if edtUserID.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and UserID='+edtUserID.Text
        else
            strFilter:='UserID='+edtUserID.Text;}


    if (trim(edtCustomerName.Text)<>'') then
        If strFilter<>'' then
            strFilter:=strFilter+' and CustomerName like '+QuotedStr('%'+edtCustomerName.Text+'%')
        else
            strFilter:='CustomerName like '+QuotedStr('%'+edtCustomerName.Text+'%');


        if rbBozorgsal.Checked then
            if strFilter<>'' then
                strFilter:=strFilter+' and CustomerType=1'
            else
                strFilter:='CustomerType=1'
        else
            if rbKhordSal.Checked then
                if strFilter<>'' then
                    strFilter:=strFilter+' and CustomerType=2'
                else
                    strFilter:='CustomerType=2';

        if rbCard.Checked then
            if strFilter<>'' then
                strFilter:=strFilter+' and TReception.CardID<>1'
            else
                strFilter:='TReception.CardID<>1'
        else
            if rbNormal.Checked then
                if strFilter<>'' then
                    strFilter:=strFilter+' and TReception.CardID=1'
                else
                    strFilter:='TReception.CardID=1';
        QIntMod.Close;
        QIntMod.Open;
        if QIntMod['intMod']<>null then
            intMod := QIntMod['intMod']
        else
            intMod := 3;
        

        if UserInfo.WorkSectionID=16 then
            if strFilter<>'' then
                strFilter:= strFilter+' and TReception.ReceptionID%'+IntToStr(intMod)+'=0  and ReceptionDate not between '+QuotedStr('1386/10/17')+' and '+QuotedStr('1386/11/17')
            else
                strFilter:= strFilter+' and TReception.ReceptionID%'+IntToStr(intMod)+'=0 not between '+QuotedStr('1386/10/17')+' and '+QuotedStr('1386/11/17');

        if edtReceptionTypeID.Text <> '' then
            if strFilter <> '' then
                strFilter := strFilter + ' and TicketType = '+edtReceptionTypeID.Text
            else
                strFilter := ' TicketType = '+edtReceptionTypeID.Text;

        if rbNoneWebReception.Checked then
            if strFilter<> '' then
                strFilter := strFilter + ' and ReceptionType = 1'
            else
                strFilter := ' ReceptionType = 1';

        if rbWebReception.Checked then
            if strFilter<> '' then
                strFilter := strFilter + ' and ReceptionType = 3'
            else
                strFilter := ' ReceptionType = 3';

        if rbVoucher.Checked then
            if strFilter<> '' then
                strFilter := strFilter + ' and ReceptionType = 2'
            else
                strFilter := ' ReceptionType = 2';

        if rbCreditCard.Checked then
            if strFilter<> '' then
                strFilter := strFilter + ' and ReceptionType = 5'
            else
                strFilter := ' ReceptionType = 5';

        if rbOrder.Checked then
            if strFilter<> '' then
                strFilter := strFilter + ' and ReceptionType = 4'
            else
                strFilter := ' ReceptionType = 4';


        if UserInfo.userType = Special then
            strFilter := strFilter + ' and (TReception.ReceptionID % 3 <> 0 or TReception.ReceptionType = 5)';

        QReception.Close;
        QReception.SQL.Clear;


        QReception.SQL.Add('select TReception.ReceptionID, CustomerName, mobile_number, service_centers.title serviceCenterTitle, service_centers.shortTitle serviceCenterShortTitle, (case TReception.CardID when 4 then '+QuotedStr('”›—ò«— ')+' else CompanyName end) as CompanyName, CustomerType, ReceptionDate, ReceptionType, Shift, TReception.Active, TReception.ClosedID, ');
        QReception.SQL.Add(' KeyNumber, TReception.ClosedID, StartTime, EndTime, mobile , Pool, Saat, AngoshtarPlak, Sooeech, Asnad, Pakhsh, KeefPool, Samsonet, Other, TReception.Price, TReception.CardID, TReception.CardID2, TReception.CardID3, TReception.UserID, Enter, ExitUserID');
        QReception.SQL.Add(', NumberOfAdult, NumberOfChild, Sum(TCredit.Credit) as Credit, EnterTime, TUser.UserName, NumberOfAdult+NumberOfChild as NumberOfCustomer, ReceptionDiscount, OrderNumber, TicketType, TReception.service_center_id, ');
        QReception.SQL.Add(' case when mobile=1 then ''*'' end as strmobile , case when pool=1 then ''*'' end as strpool, case when saat=1 then ''*'' end as strsaat, ' );
        QReception.SQL.Add(' case when AngoshtarPlak=1 then ''*'' end as strAngoshtarPlak , case when Sooeech=1 then ''*'' end as strSooeech, case when Asnad=1 then ''*'' end as strAsnad, ' );
        QReception.SQL.Add(' case when Pakhsh=1 then ''*'' end as strPakhsh , case when KeefPool=1 then ''*'' end as strKeefPool, case when Samsonet=1 then ''*'' end as strSamsonet ' );
        QReception.SQL.Add(' from TReception inner join TClosed on TReception.ClosedID=TClosed.KeyNumber');
        QReception.SQL.Add(' inner join TCard on TReception.CardID=TCard.CardID ');
        QReception.SQL.Add(' inner join TBargain on TCard.BargainID=TBargain.BargainID');
        QReception.SQL.Add(' inner join TCompany on TBargain.CompanyID=TCompany.CompanyID ');
        QReception.SQL.Add(' inner join TUser on TReception.UserID = TUser.UserID');
        QReception.SQL.Add(' inner join service_centers on TReception.service_center_id = service_centers.id');
        QReception.SQL.Add('left outer join TCredit on TReception.ReceptionID=TCredit.ReceptionID');
        if strFilter<>'' then
            if edtUserID.Text<>'' then
                QReception.SQL.Add('where '+strFilter+' and TReception.UserID='+edtUserID.Text)
            else
                QReception.SQL.Add('where '+strFilter);



        QReception.SQL.Add('Group by ');
        QReception.SQL.Add('TReception.ReceptionID, CustomerName, mobile_number, service_centers.title, service_centers.shortTitle, ');
        QReception.SQL.Add('TReception.CardID, CompanyName,');
        QReception.SQL.Add('CustomerType, ReceptionDate, ReceptionType, Shift, TReception.Active, TReception.ClosedID, KeyNumber, ');
        QReception.SQL.Add('TReception.ClosedID, StartTime, EndTime, mobile , Pool, Saat, AngoshtarPlak, Sooeech, Asnad, Pakhsh, KeefPool, Samsonet, Other, TUser.UserName,');
        QReception.SQL.Add('TReception.Price, TReception.CardID, TReception.CardID2, TReception.CardID3, TReception.UserID, Enter, ExitUserID,');
        QReception.SQL.Add('NumberOfAdult, NumberOfChild,');
        QReception.SQL.Add('mobile, pool, saat, AngoshtarPlak, Sooeech, Asnad, Pakhsh, KeefPool, Samsonet, EnterTime,  ReceptionDiscount, OrderNumber, TicketType, TReception.service_center_id');
        QReception.SQL.Add('Order by TReception.ReceptionID');
        QReception.Open;

        QSum.Close;
        QSum.SQL.Clear;

        if edtUserID.Text<>'' then
        begin
            QSum.SQL.Add('select Sum(cast(Price as Bigint)) sumReception, (select Sum(cast(TCredit.Credit as Bigint))from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID inner join TCredit on TReception.ReceptionID=TCredit.ReceptionID where '+strFilter+' and TCredit.UserID='+edtUserID.Text+')  as sumCredit ,');
            QSum.SQL.Add('(select sum(cast(Number*TSubFactor.VahedPrice as Bigint)) from TReception inner join TClosed on TReception.ClosedID=TClosed.KeyNumber');
            QSum.SQL.Add('inner join TFactor on TReception.ReceptionID=TFactor.ReceptionID');
            QSum.SQL.Add('inner join TSubFactor on TFactor.FactorID=TSubFactor.FactorID where '+strFilter+' and TReception.ExitUserID='+edtUserID.Text+') AS SumFactor,');
            QSum.SQL.Add('(select Sum(cast(TCredit.Credit as bigint)) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID inner join TCredit');
            QSum.SQL.Add('on TReception.ReceptionID=TCredit.ReceptionID where '+strFilter+' and ExitUserID= '+edtUserID.Text+') as sumCreditForSales,');
            QSum.SQL.Add('(select sum(NumberOfAdult) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where  '+strFilter+' and UserID='+edtUserID.Text+') as TB,');
            QSum.SQL.Add('(select sum(NumberOfChild) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where  '+strFilter+' and UserID='+edtUserID.Text+') as TK,');
            QSum.SQL.Add('(select Sum(NumberOfAdult)+Sum(NumberOfChild) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and UserID='+edtUserID.Text+') as TBK,');
            QSum.SQL.Add('(select sum(NumberOfAdult+NumberOfChild) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and UserID='+edtUserID.Text+' and ReceptionType=4) as TTravelCard,');
            QSum.SQL.Add('(select sum(NumberOfAdult) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and UserID='+edtUserID.Text+' and CardID = 5) as NewsPaper,');
            QSum.SQL.Add('(select Sum(cast(Price as Bigint)) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where CustomerType=1 and '+strFilter+' and UserID='+edtUserID.Text+') as Bozorgsal,');
            QSum.SQL.Add('(select Sum(cast(Price as Bigint)) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where CustomerType=2 and '+strFilter+' and UserID='+edtUserID.Text+') as Khordsal,');
            QSum.SQL.Add('(select Count(ReceptionID) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and UserID='+edtUserID.Text+' and CardID<>1 and CardID<>4  and CardID<>5) as CardCount1, ');
            QSum.SQL.Add('(select Count(ReceptionID) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and UserID='+edtUserID.Text+' and CardID2<>1 and CardID2<>4 and CardID<>5) as CardCount2,');
            QSum.SQL.Add('(select Count(ReceptionID) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and UserID='+edtUserID.Text+' and CardID3<>1 and CardID3<>4 and CardID<>5) as CardCount3,');
            QSum.SQL.Add('(select Count(ReceptionID) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and UserID='+edtUserID.Text+' and ReceptionType=5 and TicketType = 2) as VIPCard, ');
            QSum.SQL.Add('(select Count(ReceptionID) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and TicketType = 3) as shift3');
            QSum.SQL.Add('from TReception  inner join TClosed on TReception.ClosedID=TClosed.ClosedID');
            QSum.SQL.Add('where '+strFilter+' and UserID='+edtUserID.Text);
        end
        else
        begin
            QSum.SQL.Add('select Sum(cast(Price as Bigint)) sumReception, (select Sum(cast(TCredit.Credit as bigint))from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID inner join TCredit on TReception.ReceptionID=TCredit.ReceptionID where '+strFilter+')  as sumCredit ,');
            QSum.SQL.Add('(select sum(cast(Number*TSubFactor.VahedPrice as Bigint)) from TReception inner join TClosed on TReception.ClosedID=TClosed.KeyNumber');
            QSum.SQL.Add('inner join TFactor on TReception.ReceptionID=TFactor.ReceptionID');
            QSum.SQL.Add('inner join TSubFactor on TFactor.FactorID=TSubFactor.FactorID where '+strFilter+' ) AS SumFactor,');
            QSum.SQL.Add('(select Sum(cast(TCredit.Credit as bigint)) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID inner join TCredit');
            QSum.SQL.Add('on TReception.ReceptionID=TCredit.ReceptionID where '+strFilter+') as sumCreditForSales,');
            QSum.SQL.Add('(select sum(NumberOfAdult) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+') as TB,');
            QSum.SQL.Add('(select sum(NumberOfChild) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+') as TK,');
            QSum.SQL.Add('(select sum(NumberOfAdult)+sum(NumberOfChild) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+') as TBK,');
            QSum.SQL.Add('(select sum(NumberOfAdult+NumberOfChild) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and ReceptionType=4) as TTravelCard,');
            QSum.SQL.Add('(select sum(NumberOfAdult) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and CardID = 5) as NewsPaper,');
            QSum.SQL.Add('(select Sum(cast(Price as bigint)) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where CustomerType=1 and '+strFilter+') as Bozorgsal,');
            QSum.SQL.Add('(select Sum(cast(Price as bigint)) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where CustomerType=2 and '+strFilter+') as Khordsal,');
            QSum.SQL.Add('(select Count(ReceptionID) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and CardID<>1 and CardID<>4 and CardID<>5) as CardCount1,');
            QSum.SQL.Add('(select Count(ReceptionID) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and CardID2<>1 and CardID2<>4 and CardID<>5) as CardCount2,');
            QSum.SQL.Add('(select Count(ReceptionID) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and CardID3<>1 and CardID3<>4 and CardID<>5) as CardCount3,');
            QSum.SQL.Add('(select Count(ReceptionID) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and ReceptionType=5 and TicketType = 2) as VIPCard, ');
            QSum.SQL.Add('(select Count(ReceptionID) from TReception inner join TClosed on TReception.ClosedID=TClosed.ClosedID where '+strFilter+' and TicketType = 3) as shift3');
            QSum.SQL.Add('from TReception  inner join TClosed on TReception.ClosedID=TClosed.ClosedID');
            QSum.SQL.Add('where '+strFilter);
            QSum.Open;
        end;




        QSum.Open;
        if QSum['sumReception']<>null then
        begin
            lblSumReception.Caption:=FormatFloat('###,', QSum['sumReception']);
            sumReception:=QSum['sumReception'];
        end
        else
        begin
            lblSumReception.Caption:='0';
            sumReception:=0;
        end;

        if QSum['Bozorgsal']<>null then
            lblBozorgsal.Caption:=FormatFloat('###,', QSum['Bozorgsal'])
        else
            lblBozorgsal.Caption:='0';

        if QSum['Khordsal']<>null then
            lblKhordsal.Caption:=FormatFloat('###,', QSum['Khordsal'])
        else
            lblKhordsal.Caption:='0';

        if QSum['TB']<>null then
            lblTB.Caption:=FormatFloat('###,', QSum['TB'])
        else
            lblTB.Caption:='0';

        if QSum['TK']<>null then
            lblTK.Caption:=FormatFloat('###,', QSum['TK'])
        else
            lblTK.Caption:='0';


        if QSum['TBK']<>null then
            lblBK.Caption:=FormatFloat('###,', QSum['TBK'])
        else
            lblBK.Caption:='0';

        if QSum['TTravelCard']<>null then
            lblTravelCard.Caption:=FormatFloat('###,', QSum['TTravelCard'])
        else
            lblTravelCard.Caption:='0';

        if QSum['NewsPaper']<>null then
            lblNewsPaper.Caption:=FormatFloat('###,', QSum['NewsPaper'])
        else
            lblNewsPaper.Caption:='0';

        if QSum['CardCount1']<>null then
            CardCount:=QSum['CardCount1'];

        if QSum['CardCount2']<>null then
            CardCount:=CardCount+QSum['CardCount2'];

        if QSum['CardCount3']<>null then
            CardCount:=CardCount+QSum['CardCount3'];

        if QSum['VIPCard']<>null then
            lblVIPCardCount.Caption:=QSum['VIPCard']
        else
            lblVIPCardCount.Caption:='0';

        if QSum['shift3']<>null then
            lblShift3.Caption:=QSum['shift3']
        else
            lblShift3.Caption:='0';

        QAfternoon.Close;
        QAfternoon.Parameters.ParamByName('ReceptionDate').Value := edtStartDate.Text;
        QAfternoon.Open;

        if QAfternoon['SpecialForAfternoon'] <> null then
            lblAfternoon.Caption := QAfternoon['SpecialForAfternoon']
        else
            lblAfternoon.Caption := '0';

        if UserInfo.WorkSectionID=16 then
        begin
            if (edtStartDate.Text>='1387/07/01') and (edtStartDate.Text<='1387/09/15') and (edtEndDate.Text<='1387/12/29') and (edtEndDate.Text>'1387/09/15') then
            begin
                if QSum['TBK']<>null then
                begin
                    if QSum['TK']<>null then
                    begin
                        TK:=QSum['TK']+600;
                        lblTK.Caption:=FormatFloat('###,', QSum['TK']+1000);
                    end
                    else
                        TK:=QSum['TK'];
                    lblKhordsal.Caption:=FormatFloat('###,',TK*100000);
                end
                else
                begin
                    lblKhordsal.Caption:=FormatFloat('###,', Tk*100000);
                end;



            end;
            lblDakhel.Caption := IntToStr(round(StrToInt(QSum['TBK'])*57/100));
            lblCardCount.Caption:=IntToStr(round(StrToInt(QSum['TBK'])*68/100));
            lblBozorgsal.Caption:=FormatFloat('###,',(QSum['TBk']-StrToIntDef(lblCardCount.Caption, 0)-Tk)*150000);
            lblSumReception.Caption:=FormatFloat('###,',(((QSum['TBk']-StrToIntDef(lblCardCount.Caption, 0)-Tk)*150000)+Tk*100000));
            //lblReceptionCaption.Visible:=False;
            //lblBozorgsalCaption.Visible:=False;
            //lblKhordsalCaption.Visible:=False;
            lblSafarKartCaption.Visible:=False;
            lblSumReception.Visible:=False;
            //lblBozorgsal.Visible:=False;
            //lblKhordsal.Visible:=False;
            lblTravelCard.Visible:=False;
            //lblPaymentCaption.Visible:=False;
            //lblModCashCaption.Visible:=False;
            //lblPayment.Visible:=False;
            //lblModCash.Visible:=False;
            lblReceptionCaption.Visible := False;
            lblBozorgsalCaption.Visible := False;
            lblKhordsalCaption.Visible := False;
            lblSafarKartCaption.Visible := False;
            lblSumReception.Visible := False;
            lblBozorgsal.Visible := False;
            lblKhordsal.Visible := False;

        end
        else
        begin
            if CardCount>0 then
                lblCardCount.Caption:=FormatFloat('###,', CardCount)
            else
                lblCardCount.Caption:='0';
        end;

        if QSum['sumCredit']<>null then
        begin
            lblsumCredit.Caption:=FormatFloat('###,', QSum['sumCredit']);
            sumCredit:=QSum['sumCredit'];
        end
        else
        begin
            lblsumCredit.Caption:='0';
            sumCredit:=0;
        end;

        if QSum['sumFactor']<>null then
            sumFactor:=QSum['sumFactor']
        else
            sumFactor:=0;

        if QSum['sumCreditForSales']<>null then
            SumCreditForSales:=QSum['sumCreditForSales']
        else
            SumCreditForSales:=0;

        lblPayment.Caption:=FormatFloat('###,', SumCreditForSales-sumFactor);

        lblModCash.Caption:=FormatFloat('###,', sumReception+sumCredit-(SumCreditForSales-sumFactor));

        if ((UserInfo.WorkSectionID = 1) and (Trim(edtCustomerName.Text)<> '')) and (Length(edtCustomerName.Text) > 3) and (StrToInt(lblBK.Caption) >= 15) then
            lblBK.Visible := True;

end;

procedure TfrmViewReception.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

procedure TfrmViewReception.mnuDailyReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmDailyReport, frmDailyReport);
    frmDailyReport.ShowModal;
    FreeAndNil(frmDailyReport);
end;
procedure TfrmViewReception.GridDblClick(Sender: TObject);
begin
        if (UserInfo.userType = IT) or (UserInfo.userType = Admin) or (UserInfo.userType = Supervisour) then
        begin
            Application.CreateForm(TfrmSabegheMoshtari, frmSabegheMoshtari);

            if QReception['ReceptionID']=Null then Exit;
            if QReception['ExitUserID'] <> null  then
                frmSabegheMoshtari.ExitUserID := QReception['ReceptionID']
            else
                frmSabegheMoshtari.ExitUserID := -1;
            frmSabegheMoshtari.lblReceptionID.Caption:=QReception['ReceptionID'];
            frmSabegheMoshtari.lblKeyNumber.Caption:=QReception['KeyNumber'];
            frmSabegheMoshtari.lblCustomerName.Caption:=QReception['CustomerName'];
            frmSabegheMoshtari.lblNumber.Caption:=QReception['NumberOfAdult']+QReception['NumberOfChild'];
            SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
            SP_GetCurrentCredit.ExecProc;
            frmSabegheMoshtari.lblCredit.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
            frmSabegheMoshtari.chbMobile.Checked:=QReception['Mobile'];
            frmSabegheMoshtari.chbPool.Checked:=QReception['Pool'];
            frmSabegheMoshtari.chbSaat.Checked:=QReception['Saat'];
            frmSabegheMoshtari.chbSooeech.Checked:=QReception['Sooeech'];
            frmSabegheMoshtari.chbAngoshtar.Checked:=QReception['AngoshtarPlak'];
            frmSabegheMoshtari.chbAsnad.Checked:=QReception['Asnad'];
            frmSabegheMoshtari.chbPakhsh.Checked:=QReception['Pakhsh'];
            frmSabegheMoshtari.chbSamsonet.Checked:=QReception['Samsonet'];
            frmSabegheMoshtari.chbKeefPool.Checked:=QReception['KeefPool'];
            frmSabegheMoshtari.edtOther.Text:=QReception['Other'];
            frmSabegheMoshtari.lblStartTime.Caption:=QReception['StartTime'];
            frmSabegheMoshtari.QFactor.Close;
            frmSabegheMoshtari.QFactor.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
            frmSabegheMoshtari.QFactor.Open;
            frmSabegheMoshtari.QCredit.Close;
            frmSabegheMoshtari.QCredit.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
            frmSabegheMoshtari.QCredit.Open;

            frmSabegheMoshtari.ShowModal;
            FreeAndNil(frmSabegheMoshtari);
        end;
end;

procedure TfrmViewReception.BitBtn1Click(Sender: TObject);
var
strFilter : string;
begin
    strFilter:='';

    if edtStartDate.Text<>'1   /  /  ' then
        if edtEndDate.Text<>'1   /  /  ' then
            if strFilter='' then
                strFilter:=' ReceptionDate >= '+QuotedStr(edtStartDate.Text)+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text)
            else
                strFilter:=strFilter+' and ReceptionDate >= '+QuotedStr(edtStartDate.Text)+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text)
        else
            if strFilter='' then
                strFilter:=' ReceptionDate >= '+QuotedStr(edtStartDate.Text)
            else
                strFilter:=strFilter+' and ReceptionDate >= '+QuotedStr(edtStartDate.Text)
    else
        if edtEndDate.Text<>'1   /  /  ' then
            if strFilter='' then
                strFilter:=' ReceptionDate <= '+QuotedStr(edtEndDate.Text)
            else
                strFilter:=strFilter+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text);

    if edtReceptionID.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and TReception.ReceptionID='+edtReceptionID.Text
        else
            strFilter:='TReception.ReceptionID='+edtReceptionID.Text;

    if edtKeyNumber.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and TReception.ClosedID='+edtKeyNumber.Text
        else
            strFilter:='TReception.ClosedID='+edtKeyNumber.Text;

    if edtUserID.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and UserID='+edtUserID.Text
        else
            strFilter:='UserID='+edtUserID.Text;

    if edtReceptionTypeID.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and ReceptionType='+edtReceptionTypeID.Text
        else
            strFilter:='ReceptionType='+edtReceptionTypeID.Text;

    if edtCustomerName.Text<>'' then
        If strFilter<>'' then
            strFilter:=strFilter+' and CustomerName like '+QuotedStr('%'+edtCustomerName.Text+'%')
        else
            strFilter:='CustomerName like '+QuotedStr('%'+edtCustomerName.Text+'%');


        if rbBozorgsal.Checked then
            if strFilter<>'' then
                strFilter:=strFilter+' and CustomerType=1'
            else
                strFilter:='CustomerType=1'
        else
            if rbKhordSal.Checked then
                if strFilter<>'' then
                    strFilter:=strFilter+' and CustomerType=2'
                else
                    strFilter:='CustomerType=2';
    strFilter:=strFilter+' and TReception.CardID<>1';
    Application.CreateForm(TqrCardGroup, qrCardGroup);
    qrCardGroup.QCardPrint.Close;
    qrCardGroup.QCardPrint.SQL.Clear;
    qrCardGroup.QCardPrint.SQL.Add('select CompanyName, TBargain.BargainID, TBargain.BargainNumber, Count(ReceptionID) as CardCount from TReception');
    qrCardGroup.QCardPrint.SQL.Add('inner join TCard on TReception.CardID=TCard.CardID');
    qrCardGroup.QCardPrint.SQL.Add('inner join TBargain on TCard.BargainID=TBargain.BargainID');
    qrCardGroup.QCardPrint.SQL.Add('inner join TCompany on TBargain.CompanyID=TCompany.CompanyID');
    qrCardGroup.QCardPrint.SQL.Add('where '+strFilter);
    qrCardGroup.QCardPrint.SQL.Add('group by CompanyName, TBargain.BargainID, TBargain.BargainNumber');
    qrCardGroup.QCardPrint.Open;

    qrCardGroup.lblCoName.Caption:=Parameter.CoName;
    qrCardGroup.lblStartDate.Caption:=edtStartDate.Text;
    qrCardGroup.lblEndDate.Caption:=edtEndDate.Text;
    qrCardGroup.lblCurrentDate.Caption:=CurrentDate;
    qrCardGroup.lblUserName.Caption:=edtUserName.Text;
    qrCardGroup.Preview;
    FreeAndNil(qrCardGroup);
end;

procedure TfrmViewReception.mnuCreditModClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditMod, frmCreditMod);
    frmCreditMod.edtDate.Text := CurrentDate;
    frmCreditMod.edtDate.Enabled:= False;
    frmCreditMod.ShowModal;
    FreeAndNil(frmCreditMod);
end;

procedure TfrmViewReception.btnEditClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEdtReception, frmEdtReception);
    frmEdtReception.ShowModal;
    FreeAndNil(frmEdtReception);
end;

procedure TfrmViewReception.btnDeleteInfoClick(Sender: TObject);
begin
    Application.CreateForm(TfrmDeleteInfo, frmDeleteInfo);
    frmDeleteInfo.QDeleteInfo.Close;
    frmDeleteInfo.QDeleteInfo.SQL.Clear;
    frmDeleteInfo.QDeleteInfo.SQL.Add('select ReceptionID, CustomerName, ReceptionDate, ReceptionType, ClosedID, StartTime,');
    frmDeleteInfo.QDeleteInfo.SQL.Add('EndTime, Price, CardID, TDelReception.UserID, Enter, ExitUserID, NumberOfAdult, NumberOfChild, CardID2, ');
    frmDeleteInfo.QDeleteInfo.SQL.Add('CardID3, TUser.UserName, HostName, NetAddress, DelTime from TDelReception inner join TUser');
    frmDeleteInfo.QDeleteInfo.SQL.Add('on TDelReception.UserID=TUser.UserID');
    frmDeleteInfo.QDeleteInfo.SQL.Add(' where ReceptionDate>='+QuotedStr(edtStartDate.Text)+' and ReceptionDate<='+QuotedStr(edtEndDate.Text));
    if edtUserID.Text<>'' then
    begin
        frmDeleteInfo.QDeleteInfo.SQL.Add(' and TDelReception.UserID='+edtUserID.Text);
        frmDeleteInfo.lblUserName.Caption:=edtUserName.Text;
    end
    else
        frmDeleteInfo.lblUserName.Caption:='';

    if edtService_center_id.Text <> '' then
        frmDeleteInfo.QDeleteInfo.SQL.Add(' and TDelReception.service_center_id='+edtService_center_id.Text);
    frmDeleteInfo.QDeleteInfo.Open;
    frmDeleteInfo.ShowModal;
    FreeAndNil(frmDeleteInfo);
end;

procedure TfrmViewReception.mnuGardClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGard, frmGard);
    frmGard.ShowModal;
    FreeAndNil(frmGard);
end;

procedure TfrmViewReception.btnReceptionCardClick(Sender: TObject);
begin
    Application.CreateForm(TfrmReceptionCard, frmReceptionCard);
    frmReceptionCard.QReceptionCard.Close;
    frmReceptionCard.QReceptionCard.Parameters.ParamByName('StartReceptionDate').Value:=edtStartDate.Text;
    frmReceptionCard.QReceptionCard.Parameters.ParamByName('EndReceptionDate').Value:=edtEndDate.Text;
    if edtUserID.Text<>'' then
        frmReceptionCard.QReceptionCard.Parameters.ParamByName('UserID').Value:=edtUserID.Text
    else
        frmReceptionCard.QReceptionCard.Parameters.ParamByName('UserID').Value:=1;
    frmReceptionCard.QReceptionCard.Open;
    frmReceptionCard.ShowModal;
    FreeAndNil(frmReceptionCard);
end;

procedure TfrmViewReception.BtnPrintClick(Sender: TObject);
begin
    if edtStartDate.Text<>'1   /  /  ' then
    begin
        Application.CreateForm(TreReceptionWithCard, reReceptionWithCard);
        reReceptionWithCard.lblCurrentDate.Caption:=CurrentDate;
        reReceptionWithCard.qReceptionWithCard.Close;
        reReceptionWithCard.qReceptionWithCard.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
        reReceptionWithCard.qReceptionWithCard.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
        if edtUserID.Text<>'' then
            reReceptionWithCard.qReceptionWithCard.Parameters.ParamByName('UserID').Value:=edtUserID.Text
        else
            reReceptionWithCard.qReceptionWithCard.Parameters.ParamByName('UserID').Value:=-1;
        reReceptionWithCard.qReceptionWithCard.Open;
        reReceptionWithCard.Preview;
        FreeAndNil(reReceptionWithCard);
    end;
end;

procedure TfrmViewReception.mnuPrintClick(Sender: TObject);
var
Amanat, CustomerType, ReceptionType, TicketType, sPrinterName : string;
begin
    //RpDev.PrinterSetupDialog;
    //sPrinterName := RpDev.Device;
    //RpDev.SelectPrinter(sPrinterName, False);
    {PrintDialog.Execute;
    sPrinterName := PrintDialog.;
    ShowMessage(sPrinterName);
    RpDev.SelectPrinter( sPrinterName, False );}
    CustomerType:='';
    ReceptionType:='';
    QPrint.Close;
    QPrint.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
    QPrint.Open;

    RvProject.Open;
    RvProject.SetParam('PrintType','«·„À‰Ì');
    RvProject.SetParam('ReceptionDate',QPrint['ReceptionDate']);
    RvProject.SetParam('StartTime',QPrint['StartTime']);
    RvProject.SetParam('KeyNumber',QPrint['KeyNumber']);
    RvProject.SetParam('ReceptionID',QPrint['ReceptionID']);
    RvProject.SetParam('CustomerName',QPrint['CustomerName']);
    RvProject.SetParam('ServiceCenter',QReception['serviceCenterShortTitle']);
    if QPrint['NumberOfAdult']=1 then
        CustomerType:='»“—ê”«·'
    else
        if QPrint['NumberOfAdult']=2 then
            CustomerType:='»“—ê”«·'+'+'+'»“—ê”«·'
        else
            if QPrint['NumberOfAdult']=3 then
                CustomerType:='»“—ê”«·'+'+'+'»“—ê”«·'+'+'+'»“—ê”«·';


    if QPrint['NumberOfChild']=1 then
        if CustomerType<>'' then
            CustomerType:=CustomerType+'+'+'Œ—œ”«·'
        else
            CustomerType:='Œ—œ”«·'
    else
        if QPrint['NumberOfChild']=2 then
            if CustomerType<>'' then
                CustomerType:=CustomerType+'+'+'Œ—œ”«·'+'+'+'Œ—œ”«·'
            else
                CustomerType:='Œ—œ”«·'+'+'+'Œ—œ”«·'
        else
            if QPrint['NumberOfChild']=3 then
                CustomerType:='Œ—œ”«·'+'+'+'Œ—œ”«·'+'+'+'Œ—œ”«·';


    RvProject.SetParam('CustomerType',CustomerType);
    if QPrint['NumberOfChild']+QPrint['NumberOfAdult']=1 then
    begin
        if QPrint['CardID']=1  then ReceptionType:=' ⁄«œÌ '                else ReceptionType:='ò«— Ì';
    end
    else
        if QPrint['NumberOfChild']+QPrint['NumberOfAdult']=2 then
        begin
            if QPrint['CardID']=1  then ReceptionType:=' ⁄«œÌ '                else ReceptionType:='ò«— Ì';
            if QPrint['CardID2']=1 then ReceptionType:=ReceptionType+' ⁄«œÌ '  else ReceptionType:=ReceptionType+' ò«— Ì ';
        end
        else
            if QPrint['NumberOfChild']+QPrint['NumberOfAdult']=3 then
            begin
                if QPrint['CardID']=1  then ReceptionType:=' ⁄«œÌ '                else ReceptionType:='ò«— Ì';
                if QPrint['CardID2']=1 then ReceptionType:=ReceptionType+' ⁄«œÌ '  else ReceptionType:=ReceptionType+' ò«— Ì ';
                if QPrint['CardID3']=1 then ReceptionType:=ReceptionType+' ⁄«œÌ '  else ReceptionType:=ReceptionType+' ò«— Ì ';
            end;
    RvProject.SetParam('orderNumber',QPrint['OrderNumber']);
    RvProject.SetParam('ReceptionType',ReceptionType);
    QCredit.Close;
    QCredit.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
    QCredit.Open;
    if QCredit['Credit']<>Null then
        RvProject.SetParam('Credit',QCredit['Credit'])
    else
        RvProject.SetParam('Credit','0');

    if QPrint['CardID']<>1 then
    begin
        RvProject.SetParam('CardNumber', IntToStr(QPrint['CardID'])+','+IntToStr(QPrint['CardID2'])+','+IntToStr(QPrint['CardID3']));
        RvProject.SetParam('CompanyName', QPrint['CompanyName']);
    end
    else
    begin
        RvProject.SetParam('CardNumber','');
        RvProject.SetParam('CompanyName','');
    end;
    RvProject.SetParam('UserName',QPrint['UserName']);
    RvProject.SetParam('NumberOfCustomer',QPrint['NumberOfAdult']+QPrint['NumberOfChild']);
    if QPrint['Mobile']         then Amanat:='„Ê»«Ì·';
    if QPrint['Pool']           then Amanat:=Amanat+' °'+'ÅÊ·';
    if QPrint['Saat']           then Amanat:=Amanat+' °'+'”«⁄ ';
    if QPrint['AngoshtarPlak']  then Amanat:=Amanat+' °'+'«‰ê‘ — Ê Å·«ﬂ';
    if QPrint['Sooeech']        then Amanat:=Amanat+' °'+'”Ê∆Ìç';
    if QPrint['Asnad']          then Amanat:=Amanat+' °'+'«”‰«œ';
    if QPrint['Pakhsh']         then Amanat:=Amanat+' °'+'ÅŒ‘ « Ê„»Ì·';
    if QPrint['KeefPool']       then Amanat:=Amanat+' °'+'ﬂÌ› ÅÊ·';
    if QPrint['Samsonet']       then Amanat:=Amanat+' °'+'”«„”Ê‰ ';
    if QPrint['Other']<>'' then
        if Amanat<>'' then
            Amanat:=Amanat+' °'+QPrint['Other']
        else
            Amanat:=QPrint['Other'];
    if Amanat<>'' then
        RvProject.SetParam('Amanat',Amanat)
    else
        RvProject.SetParam('Amanat','«„«‰  ‰œ«—„');
    if QPrint['ReceptionType'] = 3 then
    begin
        QTypeOfReception.Close;
        QTypeOfReception.Parameters.ParamByName('id').Value := QPrint['other'];
        QTypeOfReception.Open;
        TicketType := QTypeOfReception['webReceptionType'];
    end
    else
        TicketType := '⁄«œÌ';
    RvProject.SetParam('ReceptionType','«Ì‰ —‰ Ì'+' -'+TicketType);


    RvProject.ExecuteReport('EnterReport');
    RvProject.Close;
end;

procedure TfrmViewReception.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If QReception['Enter']=False then
        if Time()-StrToTime(QReception['StartTime']) > StrToTime('1:00') then
            Grid.Canvas.Brush.Color:=clRed
        else
            Grid.Canvas.Brush.Color:=clTeal;

    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmViewReception.mnuChengeLockerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmManager, frmManager);
    frmManager.edtReceptionID.Text := QReception['ReceptionID'];
    frmManager.btnSearchClick(Sender);
    frmManager.ShowModal;
    FreeAndNil(frmManager);
end;

procedure TfrmViewReception.mnuSendChargeToAnotherLockerClick(
  Sender: TObject);
begin
    if QReception['ExitUserID'] <> null then
    begin
        ShowMessage('„ÌÂ„«‰ „Ê—œ ‰Ÿ— «“ „Ã„Ê⁄Â Œ«—Ã ‘œÂ «” ');
        Exit;
    end;
        
    Application.CreateForm(TfrmManager, frmManager);
    frmManager.lblSourceReceptionID.Caption := QReception['ReceptionID'];
    frmManager.lblSourceCustomerName.Caption := QReception['CustomerName'];
    frmManager.lblSourceClosedID.Caption := QReception['ClosedID'];
    SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
    SP_GetCurrentCredit.ExecProc;
    frmManager.lblSourceModCharge.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    frmManager.ShowModal;
    FreeAndNil(frmManager);
end;

procedure TfrmViewReception.mnuGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmReceptionGroup, frmReceptionGroup);
    frmReceptionGroup.QGroup.Parameters.ParamByName('ReceptionDate').Value :=edtStartDate.Text;
    frmReceptionGroup.QGroup.Parameters.ParamByName('UserID').Value :=edtUserID.Text;
    frmReceptionGroup.QGroup.Open;
    frmReceptionGroup.ShowModal;
    FreeAndNil(frmReceptionGroup);
end;

procedure TfrmViewReception.mnuChangeChargeClick(Sender: TObject);
begin
    if QReception['EndTime']<>'99:99' then
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— «“ „Ã„Ê⁄Â Œ«—Ã ‘œÂ «”  Ê ‘„« „Ã«“ »Â  €ÌÌ— ‘«—é «Ì‘«‰ ‰„Ì »«‘Ìœ');
        Exit;
    end;
    Application.CreateForm(TfrmChargeManager, frmChargeManager);
    frmChargeManager.lblCustomerName.Caption:=QReception['CustomerName'];
    frmChargeManager.lblLocker.Caption:=QReception['ClosedID'];
    frmChargeManager.QCharge.Close;
    frmChargeManager.QCharge.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
    frmChargeManager.QCharge.Open;
    if frmChargeManager.QCharge['CreditID']<>null then
        frmChargeManager.ShowModal;
    FreeAndNil(frmChargeManager);

end;

procedure TfrmViewReception.mnuOrderDiscountClick(Sender: TObject);
begin
    Application.CreateForm(TfrmOrderDiscount, frmOrderDiscount);
    frmOrderDiscount.ShowModal;
    FreeAndNil(frmOrderDiscount);
end;

procedure TfrmViewReception.mnuAllTicketPrintClick(Sender: TObject);
begin
    QReception.First;
    while not QReception.Eof do
    begin
        mnuPrintClick(Sender);
        QReception.Next;
    end;

end;

procedure TfrmViewReception.mnuReceptionUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmActiveUser, frmActiveUser);
    frmActiveUser.QActiveUser.Parameters.ParamByName('StartDate').Value := edtStartDate.Text;
    frmActiveUser.QActiveUser.Parameters.ParamByName('EndDate').Value := edtEndDate.Text;
    frmActiveUser.QActiveUser.Open;
    frmActiveUser.ShowModal;
    FreeAndNil(frmActiveUser);
end;

procedure TfrmViewReception.EnableBEditExecute(Sender: TObject);
begin
    if EnableEdit then
        EnableEdit := False
    else
        EnableEdit :=True;
end;

procedure TfrmViewReception.EnableButtonExecute(Sender: TObject);
begin
    if EnableEdit = True then
        btnEdit.Enabled := True
    else
        btnEdit.Enabled := False;
end;

procedure TfrmViewReception.mnuHotelReceptionClick(Sender: TObject);
var
  HotelReceptionID : integer;
begin
    Application.CreateForm(TfrmHotelsInfo, frmHotelsInfo);
    frmHotelsInfo.HotelReception := 1;
    frmHotelsInfo.ShowModal;
    if frmHotelsInfo.strKey='enter' then
        HotelReceptionID := frmHotelsInfo.HotelReceptionID;

    IF (MessageBox(Self.Handle,'¬Ì«  €ÌÌ—«  À»  ê—œœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrYes)  Then
    begin
        QOrderHotel.Close;
        QOrderHotel.Parameters.ParamByName('ReceptionID').Value:= QReception['ReceptionID'];
        QOrderHotel.Parameters.ParamByName('HotelReceptionID').Value:= HotelReceptionID;
        QOrderHotel.ExecSQL;
        ShowMessage('«ÿ·«⁄«  „Ê—œ ‰Ÿ— –ŒÌ—Â ê—œÌœ');
    end;
    FreeAndNil(frmHotelsInfo);
end;

procedure TfrmViewReception.GridTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = 0;
{$J-}
begin

  if Grid.DataSource.DataSet is TCustomADODataSet then
  with TCustomADODataSet(Grid.DataSource.DataSet) do
  begin
    try
      Grid.Columns[PreviousColumnIndex].title.Font.Style :=
      Grid.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];

    except
  end;

    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];
    PreviousColumnIndex := Column.Index;

    if (Pos(Column.Field.FieldName, Sort) = 1)
    and (Pos(' DESC', Sort)= 0) then
      Sort := Column.Field.FieldName + ' DESC'
    else
      Sort := Column.Field.FieldName + ' ASC';
  end;
end;

procedure TfrmViewReception.GridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
  pt: TGridcoord;
begin
   pt:= Grid.MouseCoord(x, y);

  if pt.y=0 then
    Grid.Cursor:=crHandPoint
  else
    Grid.Cursor:=crDefault;
end;

procedure TfrmViewReception.mnuSalesCardClick(Sender: TObject);
begin
    Application.CreateForm(TfrmREceptionCardPrice, frmREceptionCardPrice);
    frmREceptionCardPrice.ShowModal;
    FreeAndNil(frmREceptionCardPrice);
end;

procedure TfrmViewReception.mnuLockerRoom1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmLockerMap, frmLockerMap);
    frmLockerMap.ShowModal;
    FreeAndNil(frmLockerMap);
end;

procedure TfrmViewReception.mnuActiveLockerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmActiveLocker, frmActiveLocker);
    frmActiveLocker.ShowModal;
    FreeAndNil(frmActiveLocker);
end;

procedure TfrmViewReception.mnuSpecialLocker1Click(Sender: TObject);
begin
    SP_Start.Close;
    SP_Start.Parameters.ParamByName('@CustomerName').Value:=Parameter.CoName;
    SP_Start.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
    SP_Start.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Start.Parameters.ParamByName('@ClosedID').Value:=0;
    SP_Start.Parameters.ParamByName('@service_center_id').Value:=1;
    SP_Start.ExecProc;
    ShowMessage('«ÌÃ«œ ò„œ »« „Ê›ﬁÌ  «‰Ã«„ ê—œÌœ');
end;

procedure TfrmViewReception.mnuNotEnterClick(Sender: TObject);
begin
    Application.CreateForm(TqrNotIssueExit, qrNotIssueExit);
    qrNotIssueExit.QReception.Close;
    qrNotIssueExit.QReception.Parameters.ParamByName('ReceptionDate').Value := edtStartDate.Text;
    if edtService_center_id.Text <> '' then
        qrNotIssueExit.QReception.Parameters.ParamByName('service_center_id').Value := edtService_center_id.Text
    else
        qrNotIssueExit.QReception.Parameters.ParamByName('service_center_id').Value := 0;
    qrNotIssueExit.QReception.Open;
    qrNotIssueExit.lblCoName.Caption := Parameter.CoName;
    qrNotIssueExit.lblCurrentDate.Caption := edtStartDate.Text;
    qrNotIssueExit.Preview;
    FreeAndNil(qrNotIssueExit);
end;

procedure TfrmViewReception.mnuWebReceptionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmWebReception, frmWebReception);
    frmWebReception.ShowModal;
    FreeAndNil(frmWebReception);
end;

procedure TfrmViewReception.btnReceptionTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmWebReceptionInfo, frmWebReceptionInfo);
    frmWebReceptionInfo.ShowModal;
    if frmWebReceptionInfo.strKey='enter' then
    begin
        edtReceptionTypeID.Text:=frmWebReceptionInfo.QWebReception['id'];
        edtReceptionType.Text:=frmWebReceptionInfo.QWebReception['WebReceptionType'];
        rbWebReception.Checked := True;
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmWebReceptionInfo);
end;

procedure TfrmViewReception.mnuExitUserNameClick(Sender: TObject);
begin
    QExitUserName.Close;
    QExitUserName.Parameters.ParamByName('ReceptionID').Value := QReception['ReceptionID'];
    QExitUserName.Open;
    if QExitUserName['UserName']<>null then
        ShowMessage(QExitUserName['UserName'])
    else
        ShowMessage('Œ—ÊÃÌ À»  ‰ê—œÌœÂ «” ');
    QExitUserName.Close;
end;

procedure TfrmViewReception.mnuShift3Click(Sender: TObject);
begin
    QShift3.Close;
    QShift3.SQL.Clear;
    QShift3.SQL.Add('select sum(NumberOfAdult+NumberOfChild) as NumberOfCustomer from TReception where ');
    QShift3.SQL.Add(' UserID='+edtUserID.Text+' and Other = '+QuotedStr('1'));
    QShift3.SQL.Add(' and ReceptionDate >= '+QuotedStr(edtStartDate.Text)+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text));
    QShift3.Open;
    if QShift3['NumberOfCustomer']<> null then
        ShowMessage(IntToStr(QShift3['NumberOfCustomer']))
    else
        ShowMessage('0');
end;

procedure TfrmViewReception.mnuCreditChargeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardChargeReport, frmCreditCardChargeReport);
    frmCreditCardChargeReport.ShowModal;
    FreeAndNil(frmCreditCardChargeReport);
end;

procedure TfrmViewReception.mnuCreditCardDiscountClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCard_Discount, frmCreditCard_Discount);
    frmCreditCard_Discount.ShowModal;
    FreeAndNil(frmCreditCard_Discount);
end;

procedure TfrmViewReception.N15Click(Sender: TObject);
begin
    Application.CreateForm(TfrmGetAccessToLogin, frmGetAccessToLogin);
    frmGetAccessToLogin.ShowModal;
    FreeAndNil(frmGetAccessToLogin);
end;

procedure TfrmViewReception.mnuSpecialGuestCreditClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSpecialGuestCredit, frmSpecialGuestCredit);
    frmSpecialGuestCredit.ShowModal;
    FreeAndNil(frmSpecialGuestCredit);
end;

procedure TfrmViewReception.mnuChangeToClick(Sender: TObject);
begin

    IF QReception['ExitUserID'] <> Null Then
    begin
        ShowMessage('„ÌÂ„«‰ „Ê—œ ‰Ÿ— «“ „Ã„Ê⁄Â Œ«—Ã ‘œÂ «” .');
        Exit;
    end;
    Application.CreateForm(TfrmChangeTo, frmChangeTo);
    frmChangeTo.edtKeyNumber.Text := QReception['closedID'];
    frmChangeTo.btnSearch.Click;
    frmChangeTo.showModal;
    FreeAndNil(frmChangeTo);
end;

procedure TfrmViewReception.btnService_centerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmService_center_info, frmService_center_info);
    frmService_center_info.ShowModal;
    if frmService_center_info.strKey='enter' then
    begin
        edtService_center_id.Text:=frmService_center_info.QService_center['id'];
        edtService_center.Text:=frmService_center_info.QService_center['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmService_center_info);
end;

procedure TfrmViewReception.mnuSpecialLocker2Click(Sender: TObject);
begin
    SP_Start.Close;
    SP_Start.Parameters.ParamByName('@CustomerName').Value:='„ÊÃÂ«Ì ¬»Ì';
    SP_Start.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
    SP_Start.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Start.Parameters.ParamByName('@ClosedID').Value:=5000;
    SP_Start.Parameters.ParamByName('@service_center_id').Value:=2;
    SP_Start.ExecProc;
    ShowMessage('«ÌÃ«œ ò„œ »« „Ê›ﬁÌ  «‰Ã«„ ê—œÌœ');
end;

procedure TfrmViewReception.PopupMenuUnitPopup(Sender: TObject);
begin
    QServiceCenterTitle.Close;
    if QReception['service_center_id'] = 1 then
        QServiceCenterTitle.Parameters.ParamByName('id').Value := 2
    else
        QServiceCenterTitle.Parameters.ParamByName('id').Value := 1;
    QServiceCenterTitle.Open;
    If QServiceCenterTitle['title']<> null then
        mnuChangeServiceCenter.Caption := '«‰ ﬁ«· »Â „Ã„Ê⁄Â '+QServiceCenterTitle['title']
    else
        mnuChangeServiceCenter.Caption := '«‰ ﬁ«· ‰« „⁄ »—';
end;

procedure TfrmViewReception.mnuChangeServiceCenterClick(Sender: TObject);
begin
    if MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ «‰ ﬁ«· «‰Ã«„ ‘Êœ ø','«‰ ﬁ«· ò„œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo  then Exit;
    QChangeKey.Close;
    QChangeKey.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
    QChangeKey.Parameters.ParamByName('UserID').Value:=QReception['UserID'];
    QChangeKey.Open;

    QSelectReception.Close;
    QSelectReception.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
    QSelectReception.Open;


    //Application.CreateForm(TqrChangeLocker, qrChangeLocker);
    //qrChangeLocker.Preview;
    //FreeAndNil(qrChangeLocker);
end;

procedure TfrmViewReception.QReceptionBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

procedure TfrmViewReception.mnuInternetReceptionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmInternetReception, frmInternetReception);
    frmInternetReception.ShowModal;
    FreeAndNil(frmInternetReception);
end;

procedure TfrmViewReception.mnuHotelTicketSummaryClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelTicketSummery, frmHotelTicketSummery);
    frmHotelTicketSummery.ShowModal;
    FreeAndNil(frmHotelTicketSummery);
end;

procedure TfrmViewReception.mnuShowBargainInfoClick(Sender: TObject);
begin
    Application.CreateForm(TfrmShowBargainInfo, frmShowBargainInfo);
    frmShowBargainInfo.ShowModal;
    FreeAndNil(frmShowBargainInfo);
end;

procedure TfrmViewReception.mnuPosTransClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPosTransactions, frmPosTransactions);
    frmPosTransactions.ShowModal;
    FreeAndNil(frmPosTransactions);
end;

procedure TfrmViewReception.mnu4000Click(Sender: TObject);
begin
    SP_Start.Close;
    SP_Start.Parameters.ParamByName('@CustomerName').Value:='„ÊÃÂ«Ì ¬»Ì';
    SP_Start.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
    SP_Start.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Start.Parameters.ParamByName('@ClosedID').Value:=4000;
    SP_Start.Parameters.ParamByName('@service_center_id').Value:=1;
    SP_Start.ExecProc;
    ShowMessage('«ÌÃ«œ ò„œ »« „Ê›ﬁÌ  «‰Ã«„ ê—œÌœ');
end;

procedure TfrmViewReception.mnuShopsClick(Sender: TObject);
begin
    Application.CreateForm(TfrmShopsReport, frmShopsReport);
    frmShopsReport.ShowModal;
    FreeAndNil(frmShopsReport);
end;

procedure TfrmViewReception.mnuLockerManagmentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmManageLockers, frmManageLockers);
    frmManageLockers.ShowModal;
    FreeAndNil(frmManageLockers);
end;

procedure TfrmViewReception.mnu4001Click(Sender: TObject);
begin
    SP_Start.Close;
    SP_Start.Parameters.ParamByName('@CustomerName').Value:='„ÊÃÂ«Ì ¬»Ì - ⁄ò«”Ì';
    SP_Start.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
    SP_Start.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Start.Parameters.ParamByName('@ClosedID').Value:=4001;
    SP_Start.Parameters.ParamByName('@service_center_id').Value:=1;
    SP_Start.ExecProc;
    ShowMessage('«ÌÃ«œ ò„œ »« „Ê›ﬁÌ  «‰Ã«„ ê—œÌœ');
end;

procedure TfrmViewReception.btnShiftClick(Sender: TObject);
begin
    Application.CreateForm(TfrmShiftInfo, frmShiftInfo);
    frmShiftInfo.ShowModal;
    if frmShiftInfo.strKey='enter' then
    begin
        edtShiftId.Text:=frmShiftInfo.QShift['id'];
        edtShiftTitle.Text:=frmShiftInfo.QShift['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmShiftInfo);
end;

end.
