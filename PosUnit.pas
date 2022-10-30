unit PosUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, DB, ADODB, Mask, Buttons, ExtCtrls, Grids,
  DBGrids;

type
  TfrmPos = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    lblSum: TLabel;
    lblNumber: TLabel;
    Label4: TLabel;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    ExportToExcel: TBitBtn;
    btnGroup: TBitBtn;
    Panel2: TPanel;
    Label14: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    lblWebResellerID: TLabel;
    lblWebResellerName: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    btnReseller: TBitBtn;
    btnNewReseller: TBitBtn;
    dsWebReception: TDataSource;
    QWebReception: TADOQuery;
    PopupMenu1: TPopupMenu;
    QCancel: TADOQuery;
    btnWebReceptionInfo: TBitBtn;
    Label12: TLabel;
    lblWebReceptionID: TLabel;
    lblWebReceptionType: TLabel;
    btnWebReceptionNew: TBitBtn;
    mnuCancel: TMenuItem;
    Label5: TLabel;
    edtName: TEdit;
    Label2: TLabel;
    edtMobile: TEdit;
    btnNewDate: TBitBtn;
    Label7: TLabel;
    lblCancel: TLabel;
    lblMod: TLabel;
    Label10: TLabel;
    btnNewWebResellerGroup: TBitBtn;
    btnWebResellerGroup: TBitBtn;
    lblResellerGroup: TLabel;
    lblWebResellerGroupID: TLabel;
    lblWebResellerGroup: TLabel;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure mnuCancelClick(Sender: TObject);
    procedure btnResellerClick(Sender: TObject);
    procedure btnWebReceptionInfoClick(Sender: TObject);
    procedure btnNewResellerClick(Sender: TObject);
    procedure btnWebReceptionNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnNewDateClick(Sender: TObject);
    procedure btnWebResellerGroupClick(Sender: TObject);
    procedure btnNewWebResellerGroupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPos: TfrmPos;

implementation

uses PosResellerInfoUnit, PosReceptionInfoUnit, CalculatUnit,
  WebResellerGroupInfoUnit;

{$R *.dfm}

procedure TfrmPos.BBtnAcceptClick(Sender: TObject);
var
strFilter, ReceptionType : string;
begin
    strFilter:= 'TWebResellerGroup.id = 2';
    if UserInfo.UserID = 308 then
        strFilter := strFilter + ' and personid in (select id from TWebResellers where group_id = 2)'
    else
        if lblWebResellerGroupID.Caption <> '' then
            strFilter := strFilter + ' and personid in (select id from TWebResellers where group_id = '+lblWebResellerGroupID.Caption+')';
    if edtStartDate.Text <> '13  -  -  ' then
        strFilter := strFilter + ' and date >= ' + QuotedStr(edtStartDate.Text);

    if edtEndDate.Text <> '13  -  -  ' then
        if strFilter <> '' then
            strFilter := strFilter + ' and date <= '+QuotedStr(edtEndDate.Text);

    if lblWebReceptionID.Caption <> '' then
        strFilter:=strFilter+' and ticketType ='+QuotedStr(lblWebReceptionID.Caption);

    if edtName.Text <>'' then
        strFilter := strFilter + ' and Name like '+QuotedStr('%'+edtName.Text+'%');

    if edtMobile.Text <>'' then
        strFilter := strFilter + ' and mobile = '+QuotedStr(edtMobile.Text);

    if lblWebResellerID.Caption <> '' then
        strFilter := strFilter + ' and personID = '+lblWebResellerID.Caption;


    QWebReception.Close;
    QWebReception.SQL.Clear;
    QWebReception.SQL.Add('select tfactors.id, name, mobile, usedate, number, dt, trancCode, vahedPrice, price, amount, date, time, Used, isSuccess, ticketType, webReceptionType, ');
    QWebReception.SQL.Add(' child_amount, child_price, ');
    QWebReception.SQL.Add('(select sum(cast(number*vahedPrice as bigint)+(cast(child_amount*child_price as bigint))) from tfactors inner join TWebReception on tfactors.ticketType = TWebREception.id where isSuccess = 1 and '+strFilter+') sumPrice,');
    QWebReception.SQL.Add('(select sum(number+child_amount) from tfactors inner join TWebReception on tfactors.ticketType = TWebREception.id where '+strFilter+') sumNumber, ');
    QWebReception.SQL.Add('(select sum(number+child_amount) from tfactors inner join TWebReception on tfactors.ticketType = TWebREception.id where isSuccess = 0 and '+strFilter+') sumCancel, ');
    QWebReception.SQL.Add('(select sum(number+child_amount) from tfactors inner join TWebReception on tfactors.ticketType = TWebREception.id where isSuccess = 1 and '+strFilter+') sumMod');    
    QWebReception.SQL.Add(' from tfactors inner join TWebReception on tfactors.ticketType = TWebREception.id');
    QWebReception.SQL.Add(' inner join TWebResellerGroup on TWebREception.group_id = TWebResellerGroup.id');
    QWebReception.SQL.Add(' where '+strFilter);
    QWebReception.SQL.Add('order by tfactors.id');
    QWebReception.Open;
    if QWebReception['sumPrice'] <> null then lblSum.Caption := FormatFloat('#,', QWebReception['sumPrice']) else lblSum.Caption := '0';
    if QWebReception['sumNumber'] <> null then lblNumber.Caption := FormatFloat('#,', QWebReception['sumNumber']) else lblNumber.Caption := '0';
    if QWebReception['sumCancel'] <> null then lblCancel.Caption := FormatFloat('#,', QWebReception['sumCancel']) else lblCancel.Caption := '0';
    if QWebReception['sumMod'] <> null then lblMod.Caption := FormatFloat('#,', QWebReception['sumMod']) else lblMod.Caption := '0';

end;

procedure TfrmPos.mnuCancelClick(Sender: TObject);
begin
    if QWebReception['used'] = 1 then
    begin
      ShowMessage('„ÌÂ„«‰ „Ê—œ ‰Ÿ— «“ „Ã„Ê⁄Â «” ›«œÂ ‰„ÊœÂ «”  Ê «„ò«‰ ò‰”· ‰„Êœ‰ »·Ìÿ „ÂÌ« ‰„Ì »«‘œ.');
      Exit;
    end;

    if CurrentDate <> QWebReception['date']  then
    begin
        ShowMessage('‘„« „Ã«“ »Â ò‰”·Ì »Â €Ì— «“ —Ê“ Ã«—Ì ‰„Ì »«‘Ìœ');
        Exit;
    end;

    IF (MessageBox(Self.Handle,'¬Ì« «“ ò‰”· ò—œ‰ «Ì‰ „ÌÂ„«‰ „ÿ„∆‰ Â” Ìœø ', 'Õ–› —ﬂÊ—œ', MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QCancel.Parameters.ParamByName('id').Value := QWebReception['id'];
    QCancel.ExecSQL;
    BBtnAcceptClick(Sender);
end;

procedure TfrmPos.btnResellerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPosResellerInfo, frmPosResellerInfo);
    if lblWebResellerGroupID.Caption <> '' then
        frmPosResellerInfo.group_id := StrToInt(lblWebResellerGroupID.Caption)
    else
        frmPosResellerInfo.group_id := 2;
    frmPosResellerInfo.ShowModal;
    if frmPosResellerInfo.strKey='enter' then
    begin
        lblWebResellerID.Caption := frmPosResellerInfo.QWebResellers['id'];
        lblWebResellerName.Caption:=frmPosResellerInfo.QWebResellers['name'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmPosResellerInfo);
end;

procedure TfrmPos.btnWebReceptionInfoClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPosReceptionInfo, frmPosReceptionInfo);
    frmPosReceptionInfo.ShowModal;
    if frmPosReceptionInfo.strKey='enter' then
    begin
        lblWebReceptionID.Caption := frmPosReceptionInfo.QWebReception['id'];
        lblWebReceptionType.Caption:=frmPosReceptionInfo.QWebReception['WebReceptionType'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmPosReceptionInfo);
end;

procedure TfrmPos.btnNewResellerClick(Sender: TObject);
begin
    lblWebResellerID.Caption := '';
    lblWebResellerName.Caption := '';
end;

procedure TfrmPos.btnWebReceptionNewClick(Sender: TObject);
begin
    lblWebReceptionID.Caption := '';
    lblWebReceptionType.Caption := '';
end;

procedure TfrmPos.FormCreate(Sender: TObject);
begin
    lblWebResellerID.Caption := '';
    lblWebResellerName.Caption := '';
    lblWebReceptionID.Caption := '';
    lblWebReceptionType.Caption := '';
    lblSum.Caption := '';
    lblNumber.Caption := '';
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
    lblWebResellerGroupID.Caption := '';
    lblWebResellerGroup.Caption := '';
    if UserInfo.UserID = 308 then
    begin
        btnWebResellerGroup.Visible:= false;
        btnNewWebResellerGroup.Visible:= false;
        lblResellerGroup.Visible:= false;
        lblWebResellerGroupID.Visible:= false;
        lblWebResellerGroup.Visible:= false;
    end;
end;

procedure TfrmPos.DBGrid1TitleClick(Column: TColumn);
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

procedure TfrmPos.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    If QWebReception['Used']=False then
        DBGrid1.Canvas.Brush.Color:=clTeal;
    if QWebReception['isSuccess'] = 0 then
        DBGrid1.Canvas.Brush.Color:=clYellow;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmPos.btnNewDateClick(Sender: TObject);
begin
    edtStartDate.Clear;
    edtEndDate.Clear;
end;

procedure TfrmPos.btnWebResellerGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmWebResellerGroup, frmWebResellerGroup);
    frmWebResellerGroup.ShowModal;
    if frmWebResellerGroup.strKey='enter' then
    begin
        lblWebResellerGroupID.Caption := frmWebResellerGroup.QWebResellers['id'];
        lblWebResellerGroup.Caption:=frmWebResellerGroup.QWebResellers['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmWebResellerGroup);

end;

procedure TfrmPos.btnNewWebResellerGroupClick(Sender: TObject);
begin
    lblWebResellerGroupID.Caption := '';
    lblWebResellerGroup.Caption := '';
end;

end.
