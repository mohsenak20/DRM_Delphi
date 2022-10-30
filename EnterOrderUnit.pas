unit EnterOrderUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmEnterOrder = class(TForm)
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
    edtComment: TEdit;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    MainMenuUnit: TMainMenu;
    MnuFile: TMenuItem;
    MnuInsert: TMenuItem;
    MnuEdit: TMenuItem;
    MnuDelete: TMenuItem;
    N2: TMenuItem;
    MnuReturn: TMenuItem;
    PopupMenuUnit: TPopupMenu;
    MnuPopInsert: TMenuItem;
    MnuPopEdit: TMenuItem;
    MnuPopNone1: TMenuItem;
    MnuPopDelete: TMenuItem;
    SP_Order: TADOStoredProc;
    dsOrder: TDataSource;
    QOrder: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    edtPersonOrder: TEdit;
    Label1: TLabel;
    edtAdult: TEdit;
    Label4: TLabel;
    edtChild: TEdit;
    Label5: TLabel;
    edtAdultDiscount: TEdit;
    Label6: TLabel;
    pnlSearch: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    Label9: TLabel;
    edtSCustomerName: TEdit;
    Label10: TLabel;
    edtSDiscount: TEdit;
    Label11: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    Label12: TLabel;
    edtChildDiscount: TEdit;
    gbSummery: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblAdult: TLabel;
    lblChild: TLabel;
    lblDiscount: TLabel;
    QDelete: TADOQuery;
    QReceptionOrder: TADOQuery;
    Label16: TLabel;
    edtAdultPrice: TEdit;
    edtChildPrice: TEdit;
    Label17: TLabel;
    btnExportFactor: TBitBtn;
    btnCustomer: TBitBtn;
    edtCustomerName: TEdit;
    edtID: TEdit;
    Label3: TLabel;
    btnPrintAll: TBitBtn;
    N1: TMenuItem;
    mnuHotel: TMenuItem;
    QAdultPrice: TADOQuery;
    Label18: TLabel;
    btnOrderType: TBitBtn;
    edtOrderType: TEdit;
    edtOrderTypeID: TEdit;
    Label19: TLabel;
    edtService_center_id: TEdit;
    edtService_center: TEdit;
    btnService_center: TBitBtn;
    Label20: TLabel;
    btnSearchOrderType: TBitBtn;
    edtSearchOrderType: TEdit;
    edtSearchOrderTypeId: TEdit;
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
    procedure BtnPrintClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExportFactorClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnPrintAllClick(Sender: TObject);
    procedure mnuHotelClick(Sender: TObject);
    procedure btnOrderTypeClick(Sender: TObject);
    procedure btnService_centerClick(Sender: TObject);
    procedure btnSearchOrderTypeClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmEnterOrder: TfrmEnterOrder;
  StatusRecord:String;

implementation

uses DMUnit, CalculatUnit, ShareUnit, qrEnterOrderUnit, UserInfoUnit,
  CardListUnit, ExportFactorUnit, OrderCustomerUnit,
  HotelReceptionReportUnit, OrderTypeInfoUnit, ServiceCenterInfoUnit;

{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmEnterOrder.SetEnabledDisable(BL:Boolean);
Begin
    Grid.Enabled:=BL;
    PanelButton.Enabled:=BL;
    MnuInsert.Enabled:=BL;
    MnuEdit.Enabled:=BL;
    MnuDelete.Enabled:=BL;
    MnuPopInsert.Enabled:=BL;
    MnuPopEdit.Enabled:=BL;
    MnuPopDelete.Enabled:=BL;
    GroupBox.Visible:=Not BL;
    IF Not BL Then
    Begin
        edtPersonOrder.Clear;
        edtPersonOrder.SetFocus;
        edtCustomerName.Clear;
        edtID.Text := '-1';
        edtAdult.Clear;
        edtChild.Clear;
        edtAdultDiscount.Text := '0';
        edtChildDiscount.Text := '0';
        edtComment.Clear;
        QAdultPrice.Close;
        QAdultPrice.Open;
        if QAdultPrice['Bozorgsal']<>null then
            Parameter.Bozorgsal:= QAdultPrice['Bozorgsal'];
        edtAdultPrice.Text := IntToStr(Parameter.Bozorgsal);
        edtChildPrice.Text := IntToStr(Parameter.khordsal);
        //edtOrderTypeID.Text := '1';
        //edtOrderType.Text := '⁄«œÌ';
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmEnterOrder.LoadSqlQuery;
Begin
    QOrder.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmEnterOrder.GetValue;
begin
    edtPersonOrder.Text := QOrder.fieldByName('PersonOrder').Text;
    edtCustomerName.Text := QOrder.fieldByName('CustomerName').Text;
    edtAdult.Text := QOrder.fieldByName('Adult').Text;
    edtChild.Text := QOrder.fieldByName('Child').Text;
    edtAdultDiscount.Text := QOrder.fieldByName('AdultDiscount').Text;
    edtChildDiscount.Text := QOrder.fieldByName('ChildDiscount').Text;
    edtComment.Text := QOrder.fieldByName('Comment').Text;
    edtAdultPrice.Text := QOrder.fieldByName('AdultPrice').Text;
    edtChildPrice.Text := QOrder.fieldByName('ChildPrice').Text;
    edtAdultDiscount.Enabled := False;
    edtChildDiscount.Enabled := False;
    edtID.Text := QOrder.fieldByName('CustomerID').Text;
    edtOrderTypeID.Text := QOrder.fieldByName('OrderTypeID').Text;
    edtOrderType.Text := QOrder.fieldByName('OrderType').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmEnterOrder.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmEnterOrder.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmEnterOrder.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmEnterOrder.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmEnterOrder.BtnSaveClick(Sender: TObject);
begin
    IF (edtPersonOrder.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtPersonOrder.SetFocus;
        Exit;
    End;
    if StrToInt(edtAdultDiscount.Text) > StrToInt(edtAdultPrice.Text) then
    begin
        ShowMessage(' Œ›Ì› Ê«—œ ‘œÂ „⁄ »— ‰„Ì »«‘œ');
        Exit;
    end;
    SP_Order.Parameters.ParamByName('@OrderID').Value:=QOrder['OrderID'];
    SP_Order.Parameters.ParamByName('@PersonOrder').Value:=edtPersonOrder.Text;
    SP_Order.Parameters.ParamByName('@CustomerName').Value:=edtCustomerName.Text;
    SP_Order.Parameters.ParamByName('@Adult').Value:=edtAdult.Text;
    SP_Order.Parameters.ParamByName('@Child').Value:=edtChild.Text;
    SP_Order.Parameters.ParamByName('@AdultDiscount').Value:=edtAdultDiscount.Text;
    SP_Order.Parameters.ParamByName('@ChildDiscount').Value:=edtChildDiscount.Text;
    SP_Order.Parameters.ParamByName('@Comment').Value:=edtComment.Text;
    SP_Order.Parameters.ParamByName('@OrderDate').Value:=CurrentDate;
    SP_Order.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;

    SP_Order.Parameters.ParamByName('@ChildPrice').Value:=edtChildPrice.Text;
    SP_Order.Parameters.ParamByName('@CustomerID').Value:=edtID.Text;
    SP_Order.Parameters.ParamByName('@OrderType').Value:=edtOrderTypeID.Text;

    IF StatusRecord='Insert' then
    begin
        SP_Order.Parameters.ParamByName('@Action').Value:='Insert';
        QAdultPrice.Close;
        QAdultPrice.Open;
        if QAdultPrice['Bozorgsal']<>null then
            SP_Order.Parameters.ParamByName('@AdultPrice').Value:=QAdultPrice['Bozorgsal']
        else
        Begin
            ShowMessage('Œÿ« œ— À»  «ÿ·«⁄« ');
            Exit;
        end;
    end
    Else
    IF StatusRecord='Update' then Begin
        SP_Order.Parameters.ParamByName('@Action').Value:='Update';
        SP_Order.Parameters.ParamByName('@AdultPrice').Value:=edtAdultPrice.Text;
    End;
    SP_Order.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QOrder.Close;
    QOrder.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmEnterOrder.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmEnterOrder.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
    edtAdultDiscount.Enabled := True;
    edtChildDiscount.Enabled := True;
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmEnterOrder.BtnEditClick(Sender: TObject);
begin
    IF (QOrder.RecNo<=0) OR (QOrder.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmEnterOrder.BtnDelClick(Sender: TObject);
begin
    IF ((QOrder.RecNo<=0) OR (QOrder.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Close;
    QDelete.Parameters.ParamByName('OrderID').Value := QOrder['OrderID'];
    QDelete.Open;
    if QOrder['OrderID'] <> -1 then
    begin
        QOrder.Close;
        Qorder.Open;
    end;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmEnterOrder.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmEnterOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QOrder.Close;
end;

procedure TfrmEnterOrder.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrEnterOrder, qrEnterOrder);
    qrEnterOrder.lblOrderID.Caption := QOrder['OrderID'];
    qrEnterOrder.lblPersonOrder.Caption := QOrder['PersonOrder'];
    qrEnterOrder.lblCustomerName.Caption := QOrder['CustomerName'];
    qrEnterOrder.lblAdult.Caption := QOrder['Adult'];
    qrEnterOrder.lblChild.Caption := QOrder['Child'];
    qrEnterOrder.lblAdultDiscount.Caption := FormatFloat('###,',QOrder['AdultDiscount']);
    qrEnterOrder.lblChildDiscount.Caption := FormatFloat('###,',QOrder['ChildDiscount']);
    qrEnterOrder.lblDiscount.Caption := FormatFloat('###,',QOrder['Discount']);
    if QOrder['Price'] > 0 then
        qrEnterOrder.lblPrice.Caption := FormatFloat('###,',QOrder['Price'])
    else
        qrEnterOrder.lblPrice.Caption := '0';
    qrEnterOrder.lblUser.Caption := QOrder['UserName'];
    qrEnterOrder.lblComment.Caption := QOrder['Comment'];
    qrEnterOrder.lblDate.Caption := CurrentDate;
    qrEnterOrder.lblTime.Caption := QOrder['OrderTime'];
    //qrEnterOrder.lblAdultPrice.Caption := FormatFloat('###,',QOrder['AdultPrice']);
    //qrEnterOrder.lblChildPrice.Caption := FormatFloat('###,',QOrder['ChildPrice']);
    qrEnterOrder.Preview;
    FreeAndNil(qrEnterOrder);
end;

procedure TfrmEnterOrder.btnUserClick(Sender: TObject);
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

procedure TfrmEnterOrder.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
  QSum : TADOQuery;
begin
    if edtUserID.Text <> '' then
        if strFilter<>'' then
            strFilter := strFilter + ' and TOrder.UserID = '+edtUserID.Text
        else
            strFilter := ' TOrder.UserID = '+edtUserID.Text;

    if edtSCustomerName.Text <> '' then
        if strFilter<>'' then
            strFilter := strFilter + ' and CustomerName like '+QuotedStr('%'+edtSCustomerName.Text+'%')
        else
            strFilter := ' CustomerName like '+QuotedStr('%'+edtSCustomerName.Text+'%');


    if edtSDiscount.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and AddultDiscount = '+edtSDiscount.Text
        else
            strFilter := ' AddultDiscount = '+edtSDiscount.Text;

    if edtService_center_id.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and TUser.Service_center_id = '+edtService_center_id.Text
        else
            strFilter := ' TUser.Service_center_id = '+edtService_center_id.Text;

    if edtSearchOrderTypeId.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and TOrder.OrderType = '+edtSearchOrderTypeId.Text
        else
            strFilter := ' TOrder.OrderType = '+edtSearchOrderTypeId.Text;

    QOrder.Close;
    QOrder.SQL.Clear;
    QOrder.SQL.Add('declare @minOrderID int, @maxOrderID int');
    QOrder.SQL.Add('select @minOrderID=min(orderID), @maxOrderID=MAX(OrderID) from TOrder where ');
    QOrder.SQL.Add('OrderDate >= '+QuotedStr(edtStartDate.Text)+' and OrderDate <= '+QuotedStr(edtEndDate.Text));
    QOrder.SQL.Add('Select OrderID, PersonOrder, CustomerName, Adult, Child, AdultDiscount,');
    QOrder.SQL.Add('ChildDiscount, Comment, TOrder.UserName DomainUser, Hostname, NetAddress, ');
    QOrder.SQL.Add('OrderTime, OrderDate, TOrder.UserID, TUser.UserName, TOrderType.OrderType, TOrderType.id OrderTypeID,');
    QOrder.SQL.Add('Adult*cast(AdultDiscount as bigint) AdultsDiscount, CustomerID,');
    QOrder.SQL.Add('Child*cast(ChildDiscount as Bigint) ChildsDiscount, AdultPrice, ChildPrice,');
    QOrder.SQL.Add('(AdultPrice-AdultDiscount)*CAST(Adult AS BIGINT) AdultPrice1,');
    QOrder.SQL.Add('(ChildPrice-ChildDiscount)*cast(Child as bigint) ChildPrice1,');
    QOrder.SQL.Add('Adult*cast(AdultDiscount as bigint)+ Child*CAST(ChildDiscount as bigint) Discount,');
    QOrder.SQL.Add('((AdultPrice-AdultDiscount)*cast(Adult as Bigint))+ ((ChildPrice-ChildDiscount)*cast(Child as bigint)) Price,');
    QOrder.SQL.Add('(select Sum(NumberOfAdult) Adult from TReception');
    QOrder.SQL.Add(' where OrderNumber = OrderID) as Recipt, TUser.UserName, ');
    QOrder.SQL.Add('(select Sum(NumberOfChild) Adult from TReception  where OrderNumber = OrderID) as ReciptChild');
    QOrder.SQL.Add('from TOrder inner join TUser on TOrder.UserID = TUser.UserID inner join TOrderType on TOrder.OrderType = TOrderType.id');
    QOrder.SQL.Add('where OrderID >=@minOrderID and OrderID <=@maxOrderID');
    if strFilter <> '' then
        QOrder.SQL.Add(' and '+ strFilter);
    QOrder.SQL.Add('order by OrderID');
    QOrder.Open;
    QSum := TADOQuery.Create(nil);
    QSum.Connection := DM.ADOConnection;
    QSum.SQL.Add('declare @minOrderID int, @maxOrderID int');
    QSum.SQL.Add('select @minOrderID=min(orderID), @maxOrderID=MAX(OrderID) from TOrder where ');
    QSum.SQL.Add('OrderDate >= '+QuotedStr(edtStartDate.Text)+' and OrderDate <= '+QuotedStr(edtEndDate.Text));
    QSum.SQL.Add('select sum(Adult) sumAdult, sum(Child) sumChild,');
    QSum.SQL.Add(' sum(Adult*AdultDiscount)+ sum(Child*ChildDiscount) sumDiscount from TOrder inner join Tuser on TOrder.UserID = TUser.UserID');
    QSum.SQL.Add('where OrderID >=@minOrderID and OrderID <=@maxOrderID');
    if strFilter <> '' then
        QSum.SQL.Add(' and '+strFilter);
    QSum.Open;

    if QSum['sumAdult'] <> null then
        lblAdult.Caption := IntToStr(QSum['sumAdult'])
    else
        lblAdult.Caption := '0';

    if QSum['sumChild'] <> null then
        lblChild.Caption := IntToStr(QSum['sumChild'])
    else
        lblChild.Caption := '0';

    if QSum['sumDiscount'] <> null then
        lblDiscount.Caption := FormatFloat('###,', QSum['sumDiscount'])
    else
        lblDiscount.Caption := '0';

end;

procedure TfrmEnterOrder.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if QOrder['OrderID'] = null then Exit;
    If (QOrder['Adult']<>QOrder['Recipt']) then
            Grid.Canvas.Brush.Color:=clGreen;

    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmEnterOrder.btnExportFactorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmExportFactor, frmExportFactor);
    frmExportFactor.BtnNewClick(Sender);
    frmExportFactor.edtTo.Text := QOrder['CustomerName'];
    frmExportFactor.edtNumberOfAdult.Text := IntToStr(QOrder['Adult']);
    frmExportFactor.edtAdultPrice.Text := IntToStr(QOrder['AdultPrice']-QOrder['AdultDiscount']);
    frmExportFactor.edtCredit.Text :=  InputBox('‘«—é „’—›Ì', '·ÿ›« „»·€ ‘«—é —« Ê«—œ ‰„«ÌÌœ', '0');
    frmExportFactor.BtnSaveClick(Sender);
    frmExportFactor.QFactor.Last;

    //frmExportFactor.ShowModal;
    FreeAndNil(frmExportFactor);
end;

procedure TfrmEnterOrder.btnCustomerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmOrderCustomer, frmOrderCustomer);
    frmOrderCustomer.ShowModal;
    if frmOrderCustomer.strKey='enter' then
    begin
        edtID.Text:=frmOrderCustomer.QOrderCustomer['ID'];
        edtCustomerName.Text:=frmOrderCustomer.QOrderCustomer['Title'];
        edtAdult.SetFocus;
    end;
    FreeAndNil(frmOrderCustomer);

end;

procedure TfrmEnterOrder.btnPrintAllClick(Sender: TObject);
begin
    QOrder.First;
    while not QOrder.Eof do
    begin
        BtnPrintClick(Sender);
        QOrder.Next;
    end;
end;

procedure TfrmEnterOrder.mnuHotelClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelReceptionReport, frmHotelReceptionReport);
    frmHotelReceptionReport.edtStartDate.Text := CurrentDate;
    frmHotelReceptionReport.edtEndDate.Text := CurrentDate;
    frmHotelReceptionReport.edtUserID.Text := IntToStr(UserInfo.UserID);
    frmHotelReceptionReport.Panel2.Visible := False;
    frmHotelReceptionReport.BtnPrint.Visible := False;
    frmHotelReceptionReport.ExportToExcel.Visible := False;
    frmHotelReceptionReport.BBtnAcceptClick(Sender);
    frmHotelReceptionReport.ShowModal;
    FreeAndNil(frmHotelReceptionReport);
end;

procedure TfrmEnterOrder.btnOrderTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmOrderTypeInfo, frmOrderTypeInfo);
    frmOrderTypeInfo.ShowModal;
    if frmOrderTypeInfo.strKey='enter' then
    begin
        edtOrderTypeID.Text:=frmOrderTypeInfo.QOrderType['ID'];
        edtOrderType.Text:=frmOrderTypeInfo.QOrderType['OrderType'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmOrderTypeInfo);
end;

procedure TfrmEnterOrder.btnService_centerClick(Sender: TObject);
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

procedure TfrmEnterOrder.btnSearchOrderTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmOrderTypeInfo, frmOrderTypeInfo);
    frmOrderTypeInfo.ShowModal;
    if frmOrderTypeInfo.strKey='enter' then
    begin
        edtSearchOrderTypeId.Text:=frmOrderTypeInfo.QOrderType['ID'];
        edtSearchOrderType.Text:=frmOrderTypeInfo.QOrderType['OrderType'];
    end;
    FreeAndNil(frmOrderTypeInfo);
end;

end.
