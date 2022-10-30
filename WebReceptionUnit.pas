unit WebReceptionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, DB, ADODB, StdCtrls, Mask, Buttons, ExtCtrls, Grids,
  DBGrids, Menus;

type
  TfrmWebReception = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    Panel2: TPanel;
    Label14: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    btnWebReceptionInfo: TBitBtn;
    dsWebReception: TDataSource;
    QWebReception: TADOQuery;
    lblWebReceptionType: TLabel;
    Label1: TLabel;
    lblSum: TLabel;
    lblNumber: TLabel;
    Label4: TLabel;
    ExportToExcel: TBitBtn;
    lblWebReceptionID: TLabel;
    PopupMenu1: TPopupMenu;
    mnuUsed: TMenuItem;
    mnuEdit: TMenuItem;
    gbName: TGroupBox;
    Label2: TLabel;
    edtName: TEdit;
    Label5: TLabel;
    edtMobile: TEdit;
    BtnNew: TBitBtn;
    btnGroup: TBitBtn;
    btnClosedInternet: TBitBtn;
    QClosedInternet: TADOQuery;
    mnuNotUsed: TMenuItem;
    mnuSendTo: TMenuItem;
    btnReseller: TBitBtn;
    Label6: TLabel;
    lblWebResellerID: TLabel;
    lblWebResellerName: TLabel;
    btnNewReseller: TBitBtn;
    chbwwl: TCheckBox;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    mnuChangeServiceCenter: TMenuItem;
    QServiceCenterTitle: TADOQuery;
    ADOQuery1: TADOQuery;
    QChangeServiceCenter: TADOQuery;
    btnCustomerUsaageDate: TBitBtn;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Label7: TLabel;
    edtService_center_id: TEdit;
    edtService_center: TEdit;
    btnService_center: TBitBtn;
    chbCustomerUsageDate: TCheckBox;
    Label8: TLabel;
    edtReceptionCode: TEdit;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnWebReceptionInfoClick(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtStartDateExit(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
    procedure mnuCancelClick(Sender: TObject);
    procedure mnuUsedClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure btnGroupClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure mnuNotUsedClick(Sender: TObject);
    procedure mnuSendToClick(Sender: TObject);
    procedure btnResellerClick(Sender: TObject);
    procedure btnNewResellerClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure QWebReceptionBeforeDelete(DataSet: TDataSet);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure mnuChangeServiceCenterClick(Sender: TObject);
    procedure btnService_centerClick(Sender: TObject);
    procedure btnCustomerUsaageDateClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWebReception: TfrmWebReception;

implementation

uses WebReceptionInfoUnit, UnitCompanyInfo, ShareUnit, CalculatUnit,
  DMUnit, WebGroupUnit, WebResellersInfoUnit, PosUnit,
  ServiceCenterInfoUnit, internetUsageDateUnit, UniMobileInternetReportt,
  webReceptionReportChartPerDayUnit;

{$R *.dfm}

procedure TfrmWebReception.BBtnAcceptClick(Sender: TObject);
var
strFilter, ReceptionType : string;
begin
    strFilter:= 'isSuccess = 1';
    if edtStartDate.Text <> '1   /  /  ' then
      if chbCustomerUsageDate.Checked then
        strFilter := strFilter + ' and customerUsageDate >= ' + QuotedStr(edtStartDate.Text)
      else
        strFilter := strFilter + ' and useDate >= ' + QuotedStr(edtStartDate.Text);

    if edtEndDate.Text <> '1   /  /  ' then
      if chbCustomerUsageDate.Checked then
        strFilter := strFilter + ' and customerUsageDate <= ' + QuotedStr(edtEndDate.Text)
      else
        strFilter := strFilter + ' and useDate <= '+QuotedStr(edtEndDate.Text);

    if lblWebReceptionID.Caption <> '' then
        strFilter:=strFilter+' and ticketType ='+QuotedStr(lblWebReceptionID.Caption);

    if edtName.Text <>'' then
        strFilter := strFilter + ' and Name like '+QuotedStr('%'+edtName.Text+'%');

    if edtMobile.Text <>'' then
        strFilter := strFilter + ' and mobile = '+QuotedStr(edtMobile.Text);

    if lblWebResellerID.Caption <> '' then
        strFilter := strFilter + ' and personID = '+lblWebResellerID.Caption;


    if chbwwl.Checked  then
        strFilter := strFilter + ' and personID not in (select id from TWebResellers) ';

    if edtService_center_id.Text <> '' then
        strFilter := strFilter + ' and service_center_id ='+edtService_center_id.Text;

    if edtReceptionCode.Text <> '' then
        strFilter := strFilter + ' and ReceptionCode='+ QuotedStr(sha512(edtReceptionCode.Text));

    QWebReception.Close;
    QWebReception.SQL.Clear;
    QWebReception.SQL.Add('select tfactors.id, name, usedate, number, dt, trancCode, vahedPrice, price, amount, date, time, mobile, Used, ticketType, webReceptionType, ');
    QWebReception.SQL.Add(' child_amount, child_price, service_center_id, title, ');
    QWebReception.SQL.Add('(select sum(cast(number*vahedPrice as bigint)+(cast(child_amount*child_price as bigint))) from tfactors where '+strFilter+') sumPrice,');
    QWebReception.SQL.Add('(select sum(number+child_amount) from tfactors where '+strFilter+') sumNumber');
    QWebReception.SQL.Add(' from tfactors inner join TWebReception on tfactors.ticketType = TWebREception.id');
    QWebReception.SQL.Add(' inner join service_centers on tfactors.service_center_id = service_centers.id');
    QWebReception.SQL.Add(' where '+strFilter);
    QWebReception.SQL.Add('order by tfactors.id desc');
    QWebReception.Open;
    if QWebReception['sumPrice'] <> null then
    begin
        lblSum.Caption := FormatFloat('#,', QWebReception['sumPrice']);
        lblNumber.Caption := FormatFloat('#,', QWebReception['sumNumber']);
    end
    else
    begin
        lblSum.Caption := '';
        lblNumber.Caption := '';

    end;
end;

procedure TfrmWebReception.btnWebReceptionInfoClick(Sender: TObject);
begin
    Application.CreateForm(TfrmWebReceptionInfo, frmWebReceptionInfo);
    frmWebReceptionInfo.ShowModal;
    if frmWebReceptionInfo.strKey='enter' then
    begin
        lblWebReceptionID.Caption := frmWebReceptionInfo.QWebReception['id'];
        lblWebReceptionType.Caption:=frmWebReceptionInfo.QWebReception['WebReceptionType'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmWebReceptionInfo);
end;

procedure TfrmWebReception.BtnReturnClick(Sender: TObject);
begin
    Close;    
end;

procedure TfrmWebReception.FormCreate(Sender: TObject);
begin
    lblWebReceptionType.Caption := '';
    lblWebReceptionID.Caption := '';
    lblSum.Caption := '';
    lblWebResellerID.Caption := '';
    lblWebResellerName.Caption := '';
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
    if (UserInfo.userType <> Admin) and (UserInfo.userType = Supervisour) and (UserInfo.userType <> IT) then
    begin
        mnuNotUsed.Visible := false;
        mnuUsed.Visible := False;
    end;
end;

procedure TfrmWebReception.edtStartDateExit(Sender: TObject);
begin
    edtEndDate.Text := edtStartDate.Text;
end;

procedure TfrmWebReception.ExportToExcelClick(Sender: TObject);
begin
    ExportToExl(QWebReception);
end;

procedure TfrmWebReception.mnuCancelClick(Sender: TObject);
var
  QCancel : TADOQuery;
begin
  IF ((QWebReception.RecNo<=0) OR (QWebReception.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
  QCancel := TADOQuery.Create(nil);
  QCancel.Connection := DM.ADOConnection;
  QCancel.SQL.Add('update tfactors set useDate = '+QuotedStr('0'));
  QCancel.SQL.Add('where id = '+IntToStr(QWebReception['id']));
  QCancel.ExecSQL;
  BBtnAcceptClick(Sender);
end;

procedure TfrmWebReception.mnuUsedClick(Sender: TObject);
var
  QUsed : TADOQuery;
begin
  IF ((QWebReception.RecNo<=0) OR (QWebReception.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« «Ì‰ »·Ìÿ «” ›«œÂ ‘œÂ «” ø','«” ›«œÂ ‘œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
  QUsed := TADOQuery.Create(nil);
  QUsed.Connection := DM.ADOConnection;
  QUsed.SQL.Add('update tfactors set used = '+QuotedStr('1'));
  QUsed.SQL.Add('where id = '+IntToStr(QWebReception['id']));
  QUsed.ExecSQL;
  BBtnAcceptClick(Sender);
end;

procedure TfrmWebReception.BtnNewClick(Sender: TObject);
begin
    edtStartDate.Clear;
    edtEndDate.Clear;
end;

procedure TfrmWebReception.btnGroupClick(Sender: TObject);
var
strFilter, ReceptionType : string;
begin
    strFilter:= 'isSuccess = 1';
    if edtStartDate.Text <> '1   /  /  ' then
        strFilter := strFilter + ' and useDate >= ' + QuotedStr(edtStartDate.Text);

    if edtEndDate.Text <> '1   /  /  ' then
        if strFilter <> '' then
            strFilter := strFilter + ' and useDate <= '+QuotedStr(edtEndDate.Text);

    if lblWebReceptionID.Caption <> '' then
        strFilter:=strFilter+' and ticketType ='+QuotedStr(lblWebReceptionID.Caption);

    if edtName.Text <>'' then
        strFilter := strFilter + ' and Name like '+QuotedStr('%'+edtName.Text+'%');

    if edtMobile.Text <>'' then
        strFilter := strFilter + ' and mobile = '+QuotedStr(edtMobile.Text);

    Application.CreateForm(TfrmWebGroup, frmWebGroup);
    frmWebGroup.QWebSales.Close;
    frmWebGroup.QWebSales.SQL.Clear;
    frmWebGroup.QWebSales.SQL.Add('select ticketType, usedate, sum(number+child_amount) number, VahedPrice, SUM((number*vahedPrice)+(child_amount*child_price)) price , webReceptionType');
    frmWebGroup.QWebSales.SQL.Add('from tfactors inner join TWebReception on tfactors.ticketType = TWebREception.id');
    frmWebGroup.QWebSales.SQL.Add('where '+strFilter);
    frmWebGroup.QWebSales.SQL.Add('group by ticketType, usedate, vahedPrice, webReceptionType');
    frmWebGroup.QWebSales.Open;
    frmWebGroup.ShowModal;
    FreeAndNil(frmWebGroup);
end;

procedure TfrmWebReception.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if (UserInfo.userType = IT) or (UserInfo.userType = Admin) or (UserInfo.userType = Supervisour) then
    begin
        If QWebReception['Used']=False then
            DBGrid1.Canvas.Brush.Color:=clTeal;
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmWebReception.DBGrid1TitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = 0;
{$J-}
begin

  if DBGrid1.DataSource.DataSet is TCustomADODataSet then
  with TCustomADODataSet(DBGrid1.DataSource.DataSet) do
  begin
    try
      DBGrid1.Columns[PreviousColumnIndex].title.Font.Style :=
      DBGrid1.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];

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

procedure TfrmWebReception.mnuNotUsedClick(Sender: TObject);
var
  QUsed : TADOQuery;
begin
  IF ((QWebReception.RecNo<=0) OR (QWebReception.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« «Ì‰ »·Ìÿ «” ›«œÂ ‰‘œÂ «” ø','«” ›«œÂ ‘œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
  QUsed := TADOQuery.Create(nil);
  QUsed.Connection := DM.ADOConnection;
  QUsed.SQL.Add('update tfactors set used = '+QuotedStr('0'));
  QUsed.SQL.Add('where id = '+IntToStr(QWebReception['id']));
  QUsed.ExecSQL;
  BBtnAcceptClick(Sender);
end;

procedure TfrmWebReception.mnuSendToClick(Sender: TObject);
var
  QUsed : TADOQuery;
  usedate :string;
begin
  IF ((QWebReception.RecNo<=0) OR (QWebReception.IsEmpty)) Or (MessageBox(Self.Handle,'«‰ ﬁ«· „Ê—œ  «ÌÌœ «” ø','«‰ ﬁ«· »Â',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
  usedate:=InputBox(' «—ÌŒ Å–Ì—‘', '·ÿ›«  «—ÌŒ Ã«—Ì —« Ê«—œ ‰„«ÌÌœ', CurrentDate);
  if usedate < CurrentDate then
  begin
      ShowMessage('·ÿ›«  «—ÌŒ —« ’ÕÌÕ Ê«—œ ‰„«ÌÌœ.');
      Exit;
  end;
  QUsed := TADOQuery.Create(nil);
  QUsed.Connection := DM.ADOConnection;
  QUsed.SQL.Add('update tfactors set usedate = '+QuotedStr(usedate));
  QUsed.SQL.Add('where id = '+IntToStr(QWebReception['id']));
  QUsed.ExecSQL;
  BBtnAcceptClick(Sender);

end;

procedure TfrmWebReception.btnResellerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmWebResellersInfo, frmWebResellersInfo);
    frmWebResellersInfo.ShowModal;
    if frmWebResellersInfo.strKey='enter' then
    begin
        lblWebResellerID.Caption := frmWebResellersInfo.QWebResellers['id'];
        lblWebResellerName.Caption:=frmWebResellersInfo.QWebResellers['name'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmWebResellersInfo);
end;

procedure TfrmWebReception.btnNewResellerClick(Sender: TObject);
begin
    lblWebResellerID.Caption := '';
    lblWebResellerName.Caption := '';
end;

procedure TfrmWebReception.N2Click(Sender: TObject);
begin
    Application.CreateForm(TfrmPos, frmPos);
    frmPos.ShowModal;
    FreeAndNil(frmPos);
end;

procedure TfrmWebReception.QWebReceptionBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

procedure TfrmWebReception.PopupMenu1Popup(Sender: TObject);
begin
    QServiceCenterTitle.Close;
    if QWebReception['service_center_id'] = 1 then
        QServiceCenterTitle.Parameters.ParamByName('id').Value := 2
    else
        QServiceCenterTitle.Parameters.ParamByName('id').Value := 1;
    QServiceCenterTitle.Open;
    If QServiceCenterTitle['title']<> null then
        mnuChangeServiceCenter.Caption := '«‰ ﬁ«· »Â „Ã„Ê⁄Â '+QServiceCenterTitle['title']
    else
        mnuChangeServiceCenter.Caption := '«‰ ﬁ«· ‰« „⁄ »—';

    if QWebReception['Used'] then
        mnuChangeServiceCenter.Enabled := False
    else
        mnuChangeServiceCenter.Enabled := True;
end;

procedure TfrmWebReception.mnuChangeServiceCenterClick(Sender: TObject);
var setTo, RowCount: integer;
begin
  IF (MessageBox(Self.Handle,'¬Ì« «Ì‰ «‰ ﬁ«· «‰Ã«„ êÌ—œø','«‰ ﬁ«·',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
  if QWebReception['service_center_id'] = 1 then
      setTo := 2
  else
      setTo := 1;

  QChangeServiceCenter.Close;
  QChangeServiceCenter.Parameters.ParamByName('service_center_id').Value := setTo;
  QChangeServiceCenter.Parameters.ParamByName('id').Value := QWebReception['id'];
  QChangeServiceCenter.ExecSQL;

   RowCount:=QWebReception.RecNo;
    QWebReception.Close;
    QWebReception.Open;
    QWebReception.MoveBy(RowCount-1);

end;

procedure TfrmWebReception.btnService_centerClick(Sender: TObject);
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

procedure TfrmWebReception.btnCustomerUsaageDateClick(Sender: TObject);
begin
    Application.CreateForm(TfrminternetUsageDate, frminternetUsageDate);
    frminternetUsageDate.ShowModal;
    FreeAndNil(frminternetUsageDate);
end;

procedure TfrmWebReception.N4Click(Sender: TObject);
begin
    Application.CreateForm(TfrminternetUsageDate, frminternetUsageDate);
    frminternetUsageDate.ShowModal;
    FreeAndNil(frminternetUsageDate);
end;

procedure TfrmWebReception.N5Click(Sender: TObject);
begin
    Application.CreateForm(TfrmInternetMobileReport, frmInternetMobileReport);
    frmInternetMobileReport.ShowModal;
    FreeAndNil(frmInternetMobileReport);
end;

procedure TfrmWebReception.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
  pt: TGridcoord;
begin
   pt:= DBGrid1.MouseCoord(x, y);

  if pt.y=0 then
    DBGrid1.Cursor:=crHandPoint
  else
    DBGrid1.Cursor:=crDefault;
end;

procedure TfrmWebReception.N6Click(Sender: TObject);
begin
    Application.CreateForm(TfrmWebReceptionReportChartPerDay, frmWebReceptionReportChartPerDay);
    frmWebReceptionReportChartPerDay.ShowModal;
    FreeAndNil(frmWebReceptionReportChartPerDay);
end;

end.
