unit SellUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmSell = class(TForm)
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
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtFromNum: TEdit;
    edtToNum: TEdit;
    edtNumber: TEdit;
    edtVahedPrice: TEdit;
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
    SP_Sell: TADOStoredProc;
    DSSell: TDataSource;
    QSell: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    btnVisitor: TBitBtn;
    edtVisitorName: TEdit;
    edtVisitorID: TEdit;
    edtCustomerID: TEdit;
    edtCustomerName: TEdit;
    btnCustomer: TBitBtn;
    edtFishNum: TEdit;
    Label8: TLabel;
    edtFactorID: TEdit;
    QDelete: TADOQuery;
    Panel1: TPanel;
    Label9: TLabel;
    edtSCustomerID: TEdit;
    edtSCustomerName: TEdit;
    btnSCustomer: TBitBtn;
    Label10: TLabel;
    btnSVisitor: TBitBtn;
    edtSVisitorName: TEdit;
    edtSVisitorID: TEdit;
    Label11: TLabel;
    Label14: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    Label12: TLabel;
    edtDate: TMaskEdit;
    Label13: TLabel;
    lblSumCard: TLabel;
    Label15: TLabel;
    lblPrice: TLabel;
    Label16: TLabel;
    edtSNumber: TEdit;
    N1: TMenuItem;
    mnuDayReport: TMenuItem;
    QDayReport: TADOQuery;
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
    procedure btnCustomerClick(Sender: TObject);
    procedure btnVisitorClick(Sender: TObject);
    procedure btnSCustomerClick(Sender: TObject);
    procedure btnSVisitorClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure mnuDayReportClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmSell: TfrmSell;
  StatusRecord:String;
implementation

uses DMUnit, CalculatUnit, SectionInfoUnit, CustomerInfoUnit,
  VisitorInfoUnit, CardReportUnit, Math, qrSellUni, ShareUnit,
  qrDayReportUnit, UFarsiDate;
{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmSell.SetEnabledDisable(BL:Boolean);
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
        edtCustomerID.Clear;
        btnCustomer.SetFocus;
        edtCustomerName.Clear;
        edtVisitorID.Clear;
        edtVisitorName.Clear;
        edtVahedPrice.Clear;
        edtFromNum.Clear;
        edtToNum.Clear;
        edtNumber.Clear;
        edtFishNum.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmSell.LoadSqlQuery;
Begin
    btnSearchClick(self);
End;

{*******************  GetValue  ***********************}
procedure TfrmSell.GetValue;
begin
    edtFactorID.Text := QSell.fieldByName('FactorID').Text;
    edtCustomerID.Text:=QSell.fieldByName('CustomerID').Text;
    edtCustomerName.Text:=QSell.fieldByName('CustomerName').Text;
    edtVisitorID.Text:=QSell.fieldByName('VisitorID').Text;
    edtVisitorName.Text:=QSell.fieldByName('VisitorName').Text;
    edtVahedPrice.Text:=QSell.fieldByName('VahedPrice').Text;
    edtFromNum.Text:=QSell.fieldByName('FromNum').Text;
    edtToNum.Text:=QSell.fieldByName('ToNum').Text;
    edtNumber.Text:=QSell.fieldByName('Number').Text;
    edtFishNum.Text:=QSell.fieldByName('FishNum').Text;
    edtDate.Text:=QSell.fieldByName('Date').Text;

end;

{*******************  FormCreate  ***********************}
procedure TfrmSell.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmSell.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmSell.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmSell.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmSell.BtnSaveClick(Sender: TObject);
begin
    IF (edtCustomerName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtCustomerName.SetFocus;
        Exit;
    End;
    SP_Sell.Parameters.ParamByName('@FactorID').Value:=edtFactorID.Text;
    SP_Sell.Parameters.ParamByName('@Date').Value:=edtDate.Text;
    SP_Sell.Parameters.ParamByName('@CustomerID').Value:=edtCustomerID.Text;
    SP_Sell.Parameters.ParamByName('@VisitorID').Value:=edtVisitorID.Text;
    SP_Sell.Parameters.ParamByName('@VahedPrice').Value:=edtVahedPrice.Text;
    SP_Sell.Parameters.ParamByName('@FromNum').Value:=edtFromNum.Text;
    SP_Sell.Parameters.ParamByName('@ToNum').Value:=edtToNum.Text;
    SP_Sell.Parameters.ParamByName('@Number').Value:=edtNumber.Text;
    SP_Sell.Parameters.ParamByName('@FishNum').Value:=edtFishNum.Text;
    IF StatusRecord='Insert' then
        SP_Sell.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Sell.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Sell.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QSell.Close;
    QSell.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmSell.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmSell.BtnNewClick(Sender: TObject);
var
    QFactorID : TADOQuery;
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
    QFactorID := TADOQuery.Create(nil);
    QFactorID.Connection := DM.ADOConnection;
    QFactorID.SQL.Text := 'Select (case when Max(FactorID) is null then 1 else Max(FactorID)+1 end) as FactorID from TSell';
    QFactorID.Open;
    edtFactorID.Text := IntToStr(QFactorID['FactorID']);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmSell.BtnEditClick(Sender: TObject);
begin
    IF (QSell.RecNo<=0) OR (QSell.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmSell.BtnDelClick(Sender: TObject);
begin
    IF ((QSell.RecNo<=0) OR (QSell.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Close;
    QDelete.Parameters.ParamByName('FactorID').Value := QSell['FactorID'];
    QDelete.ExecSQL;
    QSell.Close;
    QSell.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmSell.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmSell.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QSell.Close;
end;

procedure TfrmSell.btnCustomerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCustomerInfo, frmCustomerInfo);
    frmCustomerInfo.ShowModal;
    if frmCustomerInfo.strKey='enter' then
    begin
        edtCustomerID.Text:=frmCustomerInfo.QCustomer['CustomerID'];
        edtCustomerName.Text:=frmCustomerInfo.QCustomer['CustomerName'];
        btnVisitor.SetFocus;
    end;
    FreeAndNil(frmCustomerInfo);
end;

procedure TfrmSell.btnVisitorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmVisitorInfo, frmVisitorInfo);
    frmVisitorInfo.ShowModal;
    if frmVisitorInfo.strKey='enter' then
    begin
        edtVisitorID.Text:=frmVisitorInfo.QVisitor['VisitorID'];
        edtVisitorName.Text:=frmVisitorInfo.QVisitor['VisitorName'];
        edtVahedPrice.SetFocus;
    end;
    FreeAndNil(frmVisitorInfo);
end;

procedure TfrmSell.btnSCustomerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCustomerInfo, frmCustomerInfo);
    frmCustomerInfo.ShowModal;
    if frmCustomerInfo.strKey='enter' then
    begin
        edtSCustomerID.Text:=frmCustomerInfo.QCustomer['CustomerID'];
        edtSCustomerName.Text:=frmCustomerInfo.QCustomer['CustomerName'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmCustomerInfo);
end;

procedure TfrmSell.btnSVisitorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmVisitorInfo, frmVisitorInfo);
    frmVisitorInfo.ShowModal;
    if frmVisitorInfo.strKey='enter' then
    begin
        edtSVisitorID.Text:=frmVisitorInfo.QVisitor['VisitorID'];
        edtSVisitorName.Text:=frmVisitorInfo.QVisitor['VisitorName'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmVisitorInfo);
end;

procedure TfrmSell.btnSearchClick(Sender: TObject);
var
    strFilter : String;
    QSum : TADOQuery;
begin
    if (UserInfo.UserID <> 5) and (UserInfo.UserID <> 29) then
    begin
        strFilter := ' Date >='+QuotedStr(DateDefint(CurrentDate, 2));
    end;
    If edtSCustomerID.Text <> '' then
        strFilter := ' TSell.CustomerID = '+edtSCustomerID.Text;

    if edtSVisitorID.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + 'and TSell.VisitorID ='+edtSVisitorID.Text
        else
            strFilter := 'TSell.VisitorID ='+edtSVisitorID.Text;


    if edtStartDate.Text <> '1   /  /  ' then
        if strFilter <> '' then
            strFilter := strFilter + 'and Date >= '+QuotedStr(edtStartDate.Text)
        else
            strFilter := 'Date >= '+ QuotedStr(edtStartDate.Text);

    if edtEndDate.Text <> '1   /  /  ' then
        if strFilter <> '' then
            strFilter := strFilter + 'and Date <= '+ QuotedStr(edtEndDate.Text)
        else
            strFilter := 'Date >= '+ QuotedStr(edtEndDate.Text);

    if edtSNumber.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and FromNum <='+edtSNumber.Text+' and ToNum >= '+edtSNumber.Text
        else
            strFilter := ' FromNum <='+edtSNumber.Text+' and ToNum >= '+edtSNumber.Text;

    QSell.Close;
    QSell.SQL.Clear;
    QSell.SQL.Add('select FactorID, Date, TSell.CustomerID, CustomerName,');
    QSell.SQL.Add('TSell.VisitorID, VisitorName, Number, VahedPrice, FromNum, ToNum, FishNum, TCustomer.Address');
    QSell.SQL.Add('from TSell inner join TCustomer on TCustomer.CustomerID=TSell.CustomerID');
    QSell.SQL.Add('inner join TVisitor on TVisitor.VisitorID=TSell.VisitorID');
    if strFilter <> '' then
        QSell.SQL.Add('where '+strFilter);
    QSell.SQL.Add(' Order by Date, FactorID');
    QSell.Open;

    QSum := TADOQuery.Create(nil);
    QSum.Connection := DM.ADOConnection;
    QSum.SQL.Add('select sum(number) sumCard, Sum(CAST(Number AS Bigint) * CAST(VahedPrice as bigint)) Price from TSell');
    if strFilter <> '' then
        QSum.SQL.Add('where '+strFilter);

    QSum.Open;

    if QSum['SumCard']<>null then
        lblSumCard.Caption := FormatFloat('###,', QSum['SumCard'])
    else
        lblSumCard.Caption := '0';

    
    if QSum['Price']<>null then
        lblPrice.Caption := FormatFloat('###,', QSum['Price'])
    else
        lblPrice.Caption := '0';



end;

procedure TfrmSell.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrSell, qrSell);
    qrSell.lblCurrentDate.Caption := CurrentDate;
    qrSell.lblCoName.Caption := Parameter.CoName;
    QrSell.lblNumber.Caption := lblSumCard.Caption;
    QrSell.lblPrice.Caption :=  lblPrice.Caption;
    qrSell.Preview;
    FreeAndNil(qrSell);
end;

procedure TfrmSell.mnuDayReportClick(Sender: TObject);
var
    strFilter : String;
begin
    If edtSCustomerID.Text <> '' then
        strFilter := ' TSell.CustomerID = '+edtSCustomerID.Text;

    if edtSVisitorID.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + 'and TSell.VisitorID ='+edtSVisitorID.Text
        else
            strFilter := 'TSell.VisitorID ='+edtSVisitorID.Text;


    if edtStartDate.Text <> '1   /  /  ' then
        if strFilter <> '' then
            strFilter := strFilter + 'and Date >= '+QuotedStr(edtStartDate.Text)
        else
            strFilter := 'Date >= '+ QuotedStr(edtStartDate.Text);

    if edtEndDate.Text <> '1   /  /  ' then
        if strFilter <> '' then
            strFilter := strFilter + 'and Date <= '+ QuotedStr(edtEndDate.Text)
        else
            strFilter := 'Date >= '+ QuotedStr(edtEndDate.Text);

    if edtSNumber.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and FromNum <='+edtSNumber.Text+' and ToNum >= '+edtSNumber.Text
        else
            strFilter := ' FromNum <='+edtSNumber.Text+' and ToNum >= '+edtSNumber.Text;

    QDayReport.Close;
    QDayReport.SQL.Clear;
    QDayReport.SQL.Add('select Date, TSell.VisitorID, VisitorName, sum(Number) number, sum(Number*VahedPrice) price');
    QDayReport.SQL.Add('from TSell inner join TVisitor on TVisitor.VisitorID=TSell.VisitorID');
    if strFilter<>'' then
        QDayReport.SQL.Add('where '+strFilter);
    QDayReport.SQL.Add('group by Date, TSell.VisitorID, VisitorName');
    QDayReport.SQL.Add('order by Date');
    QDayReport.Open;


    Application.CreateForm(TqrDayReport, qrDayReport);
    qrDayReport.lblCurrentDate.Caption := CurrentDate;
    qrDayReport.lblCoName.Caption := Parameter.CoName;
    qrDayReport.lblNumber.Caption := lblSumCard.Caption;
    qrDayReport.lblSum.Caption := lblPrice.Caption;
    qrDayReport.Preview;
    FreeAndNil(qrDayReport);
end;

end.
