unit HotelTicketingUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask, jpeg, Sockets;

type
  TfrmHotelTicketing = class(TForm)
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label2: TLabel;
    edtCustomerName: TEdit;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    MainMenuUnit: TMainMenu;
    MnuFile: TMenuItem;
    MnuInsert: TMenuItem;
    MnuEdit: TMenuItem;
    MnuDelete: TMenuItem;
    N2: TMenuItem;
    MnuReturn: TMenuItem;
    PopupMenuUnit: TPopupMenu;
    MnuPopEdit: TMenuItem;
    MnuPopNone1: TMenuItem;
    SP_HotelTickets: TADOStoredProc;
    dsHotelTickets: TDataSource;
    QHotelTickets: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Panel2: TPanel;
    Label14: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    edtSearchHotelID: TEdit;
    edtSearhHotelName: TEdit;
    btnSearchHotel: TBitBtn;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    Label5: TLabel;
    edtHotelId: TEdit;
    edtHotelName: TEdit;
    btnHotel: TBitBtn;
    Label7: TLabel;
    edtHotelReceptionId: TEdit;
    edtHotelReceptionName: TEdit;
    Label8: TLabel;
    edtMobile: TEdit;
    edtMenAdult: TEdit;
    edtMenChild: TEdit;
    Label11: TLabel;
    edtWomenAdult: TEdit;
    edtWomenChild: TEdit;
    Label12: TLabel;
    men: TImage;
    Image1: TImage;
    Label6: TLabel;
    edtDepositTransactionNumber1: TEdit;
    Label9: TLabel;
    edtWithdrawTransactionNumber: TEdit;
    QDelete: TADOQuery;
    TcpClient: TTcpClient;
    QServerInfo: TADOQuery;
    btnSendSMS: TBitBtn;
    QGetDate: TADOQuery;
    Label20: TLabel;
    edtDepositTransactionNumber2: TEdit;
    Label10: TLabel;
    lblPrice: TLabel;
    Label13: TLabel;
    QCheckCommission: TADOQuery;
    Label15: TLabel;
    edtHotelTicketTypeId: TEdit;
    edtHotelTicketTypeTitle: TEdit;
    btnHotelTicketType: TBitBtn;
    Label16: TLabel;
    edtSearchHotelTicketTypeId: TEdit;
    edtSearchHotelTicketTypeTitle: TEdit;
    btnSearchHotelTicketType: TBitBtn;
    QActive: TADOQuery;
    mnuTriggerActive: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure btnSearchHotelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUserClick(Sender: TObject);
    procedure btnHotelClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSendSMSClick(Sender: TObject);
    Function Price(): integer;
    procedure edtWomenAdultChange(Sender: TObject);
    procedure edtMobileExit(Sender: TObject);
    procedure btnHotelTicketTypeClick(Sender: TObject);
    procedure btnSearchHotelTicketTypeClick(Sender: TObject);
    procedure mnuTriggerActiveClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    smsType : integer;
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmHotelTicketing: TfrmHotelTicketing;
  StatusRecord:String;

implementation

uses DMUnit, CalculatUnit, HotelsInfoUnit, ServiceCenterInfoUnit,
  UserInfoUnit, UFarsiDate, ShareUnit, HOtelTicketTypeInfoUnit;

{$R *.dfm}

Function TfrmHotelTicketing.price():integer;
  var
    menAdult, menChild, womenAdult, womenChild: integer;
begin
    menAdult := StrToIntDef(edtMenAdult.Text, 0);
    menChild := StrToIntDef(edtMenChild.Text, 0);
    womenAdult := StrToIntDef(edtWomenAdult.Text, 0);
    womenChild := StrToIntDef(edtWomenChild.Text, 0);
    price := (menAdult+womenAdult) * Parameter.hotelAdultPrice + (menChild+womenChild) * Parameter.hotelChildPrice;
end;

procedure TfrmHotelTicketing.btnSearchHotelClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelsInfo, frmHotelsInfo);
    frmHotelsInfo.ShowModal;
    if frmHotelsInfo.strKey='enter' then
    begin
        edtSearchHotelID.Text:=frmHotelsInfo.QHotel['HotelID'];
        edtSearhHotelName.Text:=frmHotelsInfo.QHotel['HotelName'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmHotelsInfo);
end;

procedure TfrmHotelTicketing.SetEnabledDisable(BL:Boolean);
  var
    state : Boolean;
Begin
    Grid.Enabled:=BL;
    PanelButton.Enabled:=BL;
    MnuInsert.Enabled:=BL;
    MnuEdit.Enabled:=BL;
    MnuDelete.Enabled:=BL;
    MnuPopEdit.Enabled:=BL;
    GroupBox.Visible:=Not BL;
    if StatusRecord = 'Update' then
      state := True
    else
      state := True;
    edtMenAdult.Enabled := state;
    edtMenChild.Enabled := state;
    edtWomenAdult.Enabled := state;
    edtWomenChild.Enabled := state;
    //edtMobile.Enabled := state;
    edtCustomerName.Enabled := state;
    btnHotel.Enabled := state;
    edtHotelId.Enabled := state;
    edtHotelName.Enabled := state;
    edtHotelReceptionId.Enabled := state;
    edtHotelReceptionName.Enabled := state;

    IF Not BL Then
    Begin
        edtHotelId.Clear;
        edtHotelName.Clear;
        edtHotelReceptionId.Clear;
        edtHotelReceptionName.Clear;
        edtCustomerName.Clear;
        edtMobile.Clear;
        edtMenAdult.Text := '0' ;
        edtMenChild.Text := '0';
        edtWomenAdult.Text := '0';
        edtWomenChild.Text := '0';
        edtDepositTransactionNumber1.Clear;
        edtDepositTransactionNumber2.Clear;
        edtWithdrawTransactionNumber.Clear;
        lblPrice.Caption := '';
        if btnHotel.Enabled then
          btnHotel.SetFocus
        else
            edtWithdrawTransactionNumber.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmHotelTicketing.LoadSqlQuery;
Begin
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
    QHotelTickets.Parameters.ParamByName('startDate').Value := edtStartDate.Text;
    QHotelTickets.Parameters.ParamByName('endDate').Value := edtEndDate.Text;
    QHotelTickets.Parameters.ParamByName('userId').Value := UserInfo.UserID;
    QHotelTickets.Open;

End;

{*******************  GetValue  ***********************}
procedure TfrmHotelTicketing.GetValue;
begin
    edtHotelId.Text:=QHotelTickets.fieldByName('HotelId').Text;
    edtHotelName.Text:=QHotelTickets.fieldByName('HotelName').Text;
    edtHotelReceptionId.Text:=QHotelTickets.fieldByName('HotelReceptionId').Text;
    edtHotelReceptionName.Text:=QHotelTickets.fieldByName('ReceptionistName').Text;
    edtCustomerName.Text:=QHotelTickets.fieldByName('CustomerName').Text;
    edtMobile.Text:=QHotelTickets.fieldByName('Mobile').Text;
    edtMenAdult.Text:=QHotelTickets.fieldByName('MenAdult').Text;
    edtMenChild.Text:=QHotelTickets.fieldByName('menChild').Text;
    edtWomenAdult.Text:=QHotelTickets.fieldByName('womenAdult').Text;
    edtWomenChild.Text:=QHotelTickets.fieldByName('womenChild').Text;
    edtDepositTransactionNumber1.Text:=QHotelTickets.fieldByName('depositTransactionNumber1').Text;
    edtDepositTransactionNumber2.Text:=QHotelTickets.fieldByName('depositTransactionNumber2').Text;
    edtWithdrawTransactionNumber.Text:=QHotelTickets.fieldByName('withdrawTransactionNumber').Text;
    edtHotelTicketTypeId.Text:=QHotelTickets.fieldByName('typeId').Text;
    edtHotelTicketTypeTitle.Text:=QHotelTickets.fieldByName('hotelTicketTypeTitle').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmHotelTicketing.FormCreate(Sender: TObject);
begin
    smsType := 3;
    LoadSqlQuery;
    QServerInfo.Open;
    if QServerInfo['SMS_Server']<>null then
        TcpClient.RemoteHost := QServerInfo['SMS_Server']
    else
        TcpClient.RemoteHost := '';

    if QServerInfo['SMS_Server_Port']<>null then
        TcpClient.RemotePort := QServerInfo['SMS_Server_Port']
    else
        TcpClient.RemotePort := '';

    QGetDate.Parameters.ParamByName('ExpiredIn').Value := Parameter.hotelTicketExpiredIn;
    QGetDate.Open;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmHotelTicketing.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmHotelTicketing.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmHotelTicketing.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmHotelTicketing.BtnSaveClick(Sender: TObject);
var
RowCount : integer;
begin
    IF (edtHotelId.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        btnHotel.SetFocus;
        Exit;
    End;

    {if QHotelTickets['id'] <> null then
    begin
      QCheckCommission.Close;
      QCheckCommission.Parameters.ParamByName('status').Value := StatusRecord;
      QCheckCommission.Parameters.ParamByName('userId').Value := UserInfo.UserID;
      QCheckCommission.Open;
      if QCheckCommission['id'] <> null then
          if (QCheckCommission['withdrawTransactionNumber'] = '') or (QCheckCommission['withdrawTransactionNumber'] = Null) then
          begin
              ShowMessage('·ÿ›« «» œ« ¬Œ—Ì‰ òœ ÅÊ—”«‰  —« À»  ‰„«ÌÌœ');
              Exit;
          end;
    end; }
    SP_HotelTickets.Parameters.ParamByName('@id').Value := QHotelTickets['id'];
    SP_HotelTickets.Parameters.ParamByName('@hotelId').Value := edtHotelId.Text;
    SP_HotelTickets.Parameters.ParamByName('@receptionId').Value := edtHotelReceptionId.Text;
    SP_HotelTickets.Parameters.ParamByName('@customerName').Value := edtCustomerName.Text;
    SP_HotelTickets.Parameters.ParamByName('@mobile').Value:= edtMobile.Text;
    SP_HotelTickets.Parameters.ParamByName('@menAdult').Value := edtMenAdult.Text;
    SP_HotelTickets.Parameters.ParamByName('@menChild').Value := edtMenChild.Text;
    SP_HotelTickets.Parameters.ParamByName('@womenAdult').Value := edtWomenAdult.Text;
    SP_HotelTickets.Parameters.ParamByName('@womenChild').Value := edtWomenChild.Text;
    SP_HotelTickets.Parameters.ParamByName('@depositTransactionNumber1').Value := edtDepositTransactionNumber1.Text;
    SP_HotelTickets.Parameters.ParamByName('@depositTransactionNumber2').Value := edtDepositTransactionNumber2.Text;
    SP_HotelTickets.Parameters.ParamByName('@withdrawTransactionNumber').Value := edtWithdrawTransactionNumber.Text;
    SP_HotelTickets.Parameters.ParamByName('@userId').Value := UserInfo.UserID;
    SP_HotelTickets.Parameters.ParamByName('@issueDate').Value := CurrentDate;
    SP_HotelTickets.Parameters.ParamByName('@useDate').Value := TFarDate.MiladyToShamsistr(QGetDate['CurrentDate']);
    SP_HotelTickets.Parameters.ParamByName('@typeId').Value := edtHotelTicketTypeId.Text;

    IF StatusRecord='Insert' then
        SP_HotelTickets.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_HotelTickets.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_HotelTickets.ExecProc;

    {IF StatusRecord='Insert' then
    begin
      if TcpClient.Connect then
        TcpClient.Sendln(edtMobile.Text + '-' + CurrentDate + ',' + IntToStr(smsType));
      TcpClient.Disconnect;
    end;}
    SetEnabledDisable(True);
    RowCount:=QHotelTickets.RecNo;
    QHotelTickets.Close;
    QHotelTickets.Open;
    IF StatusRecord='Update' then
      QHotelTickets.MoveBy(RowCount-1);
    StatusRecord:='';
    Grid.SetFocus;
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmHotelTicketing.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmHotelTicketing.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmHotelTicketing.BtnEditClick(Sender: TObject);
begin
    IF (QHotelTickets.RecNo<=0) OR (QHotelTickets.IsEmpty) Then Exit;
    {if not((QHotelTickets['withdrawTransactionNumber'] = '')  or (QHotelTickets['withdrawTransactionNumber'] = null)) then
    begin
        ShowMessage('„—«Õ· ’œÊ— »·Ìÿ ÃÂ  «Ì‰ „ÌÂ„«‰ »Â Å«Ì«‰ —”ÌœÂ «”  Ê «„ò«‰ ÊÌ—«Ì‘ €Ì— ›⁄«· ê—œÌœÂ');
        Exit;
    end; }
    StatusRecord:='Update';
    SetEnabledDisable(False);
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmHotelTicketing.BtnDelClick(Sender: TObject);
begin
    {IF ((QHotelTickets.RecNo<=0) OR (QHotelTickets.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QHotelTickets['id'];
    QDelete.ExecSQL;
    QHotelTickets.Close;
    QHotelTickets.Open;
    Grid.SetFocus;}
end;

{*******************  Form Show  ***********************}
procedure TfrmHotelTicketing.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmHotelTicketing.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QHotelTickets.Close;
end;


procedure TfrmHotelTicketing.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

procedure TfrmHotelTicketing.btnHotelClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelsInfo, frmHotelsInfo);
    frmHotelsInfo.HotelReception := 1;
    frmHotelsInfo.ShowModal;
    if frmHotelsInfo.strKey='enter' then
    begin
        edtHotelId.Text := frmHotelsInfo.QHotel['HotelID'];
        edtHotelName.Text := frmHotelsInfo.QHotel['HotelName'];
        edtHotelReceptionId.Text := IntToStr(frmHotelsInfo.HotelReceptionID);
        edtHotelReceptionName.Text := frmHotelsInfo.ReceptionName;
    end;
    FreeAndNil(frmHotelsInfo);
    edtCustomerName.SetFocus;
end;

procedure TfrmHotelTicketing.btnSearchClick(Sender: TObject);
var
strFilter: string;
begin

  if UserInfo.userType = Normal then
      strFilter := 'userId = '+IntToStr(UserInfo.UserID)+' and issueDate >= '+QuotedStr(edtStartDate.Text)+ ' and issueDate <= '+QuotedStr(edtEndDate.Text)
  else
      strFilter := 'issueDate >= '+QuotedStr(edtStartDate.Text)+ ' and issueDate <= '+QuotedStr(edtEndDate.Text);
  if edtSearchHotelID.Text <> '' then
      strFilter := strFilter + ' and hotelTickets.hotelId = '+edtSearchHotelID.Text;

  if edtUserID.Text <> '' then
      strFilter := strFilter + ' and hotelTickets.userId = '+edtUserID.Text;

  if edtSearchHotelTicketTypeId.Text <> '' then
      strFilter := strFilter + ' and typeId = '+edtSearchHotelTicketTypeId.Text;


  QHotelTickets.Close;
  QHotelTickets.SQL.Clear;
  QHotelTickets.SQL.Add('select hotelTickets.id, THotel.HotelId, THotel.HotelName, THotelReception.HotelReceptionId,');
  QHotelTickets.SQL.Add('THotelReception.ReceptionistName, CustomerName, Mobile, MenAdult, menChild, typeId, title hotelTicketTypeTitle, isActive, used,');
  QHotelTickets.SQL.Add('womenAdult, womenChild, depositTransactionNumber1, depositTransactionNumber2, withdrawTransactionNumber, issueDate, useDate from HotelTickets');
  QHotelTickets.SQL.Add('inner join THotel on HotelTickets.hotelId = THotel.HotelId');
  QHotelTickets.SQL.Add('inner join THotelReception on HotelTickets.receptionId = THotelReception.HotelReceptionID');
  QHotelTickets.SQL.Add('inner join HotelTicketType on HotelTickets.typeId = HotelTicketType.id');
  QHotelTickets.SQL.Add('where '+strFilter);
  QHotelTickets.SQL.Add('order by id DESC');
  QHotelTickets.Open;
end;

procedure TfrmHotelTicketing.btnSendSMSClick(Sender: TObject);
begin
    if TcpClient.Connect then
      TcpClient.Sendln(QHotelTickets['mobile'] + '-' + CurrentDate + ',' + IntToStr(smsType));
    TcpClient.Disconnect;
    ShowMessage('ÅÌ«„ò òœ Å–Ì—‘ «—”«· ê—œÌœ');
end;

procedure TfrmHotelTicketing.edtWomenAdultChange(Sender: TObject);
begin
    lblPrice.Caption := FormatFloat( '#,', Price());
end;

procedure TfrmHotelTicketing.edtMobileExit(Sender: TObject);
begin
    if (Length(edtMobile.Text) <> 11) or (edtMobile.Text[1] <> '0') then
    begin
        ShowMessage('‘„«—Â „Ê»«Ì· «‘ »«Â „Ì »«‘œ');
    end;
end;

procedure TfrmHotelTicketing.btnHotelTicketTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelTicketTypeInfo, frmHotelTicketTypeInfo);
    frmHotelTicketTypeInfo.ShowModal;
    if frmHotelTicketTypeInfo.strKey='enter' then
    begin
        edtHotelTicketTypeId.Text:=frmHotelTicketTypeInfo.QHotelTicketType['id'];
        edtHotelTicketTypeTitle.Text:=frmHotelTicketTypeInfo.QHotelTicketType['title'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmHotelTicketTypeInfo);
end;

procedure TfrmHotelTicketing.btnSearchHotelTicketTypeClick(
  Sender: TObject);
begin
    Application.CreateForm(TfrmHotelTicketTypeInfo, frmHotelTicketTypeInfo);
    frmHotelTicketTypeInfo.ShowModal;
    if frmHotelTicketTypeInfo.strKey='enter' then
    begin
        edtSearchHotelTicketTypeId.Text:=frmHotelTicketTypeInfo.QHotelTicketType['id'];
        edtSearchHotelTicketTypeTitle.Text:=frmHotelTicketTypeInfo.QHotelTicketType['title'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmHotelTicketTypeInfo);
end;

procedure TfrmHotelTicketing.mnuTriggerActiveClick(Sender: TObject);
begin
    if QHotelTickets['used'] then
    begin
        ShowMessage('«„ò«‰  €ÌÌ— Õ«·  »—«Ì «Ì‰ Å–Ì—‘ ÊÃÊœ »Â œ·Ì· ’œÊ— »·Ìÿ ÊÃÊœ ‰œ«—œ');
        Exit;
    end;
    QActive.Close;
    QActive.Parameters.ParamByName('id').Value := QHotelTickets['id'];
    QActive.ExecSQL;
    QHotelTickets.Close;
    QHotelTickets.Open;
end;

procedure TfrmHotelTicketing.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if QHotelTickets['used'] = false then
      Grid.Canvas.Brush.Color:=clMoneyGreen;

    If QHotelTickets['isActive']=False then
      Grid.Canvas.Brush.Color:=clRed;

    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
