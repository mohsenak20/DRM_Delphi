unit FinacialObligationUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmFinacialObligation = class(TForm)
    Label5: TLabel;
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label16: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtStudentId: TEdit;
    edtStudentName: TEdit;
    btnStudent: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BBtnAccept: TBitBtn;
    edtSPrice: TEdit;
    edtSNumber: TEdit;
    edtSStudentId: TEdit;
    edtSStudentName: TEdit;
    btnSStudent: TBitBtn;
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
    SP_FinacialObligation: TADOStoredProc;
    dsFinacialObligation: TDataSource;
    QFinacialObligation: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDelete: TADOQuery;
    Label4: TLabel;
    edtPrice: TEdit;
    lblStartDate: TLabel;
    edtDueDate: TMaskEdit;
    Label6: TLabel;
    edtNumber: TEdit;
    Label15: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    edtDueStartDate: TMaskEdit;
    edtDueEndDate: TMaskEdit;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    Label8: TLabel;
    chbPayed: TCheckBox;
    chbReject: TCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    edtStartIssueDate: TMaskEdit;
    edtEndIssueDate: TMaskEdit;
    Panel2: TPanel;
    Panel3: TPanel;
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
    procedure btnStudentClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnSStudentClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;

var
  frmFinacialObligation: TfrmFinacialObligation;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, StudentInfoUnit, UserInfoUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmFinacialObligation.SetEnabledDisable(BL:Boolean);
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
        edtStudentId.Clear;
        edtStudentName.Clear;
        edtPrice.Clear;
        edtDueDate.Clear;
        edtNumber.Clear;
        btnStudent.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmFinacialObligation.LoadSqlQuery;
Begin
    QFinacialObligation.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmFinacialObligation.GetValue;
begin
    edtStudentId.Text:=QFinacialObligation['studentId'];
    edtStudentName.Text:=QFinacialObligation['studentName'];
    edtPrice.Text:=QFinacialObligation['price'];
    edtDueDate.Text:=QFinacialObligation['dueDate'];
    edtNumber.Text:=QFinacialObligation['number'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmFinacialObligation.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmFinacialObligation.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmFinacialObligation.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmFinacialObligation.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmFinacialObligation.BtnSaveClick(Sender: TObject);
begin
    IF (edtStudentId.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        btnStudent.SetFocus;
        Exit;
    End;
    SP_FinacialObligation.Parameters.ParamByName('@id').Value:=QFinacialObligation['id'];
    SP_FinacialObligation.Parameters.ParamByName('@studentId').Value:=edtStudentId.Text;
    SP_FinacialObligation.Parameters.ParamByName('@price').Value:=edtPrice.Text;
    SP_FinacialObligation.Parameters.ParamByName('@dueDate').Value:=edtDueDate.Text;
    SP_FinacialObligation.Parameters.ParamByName('@issueDate').Value:=CurrentDate;
    SP_FinacialObligation.Parameters.ParamByName('@number').Value:=edtNumber.Text;
    SP_FinacialObligation.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;
    SP_FinacialObligation.Parameters.ParamByName('@isPayed').Value:=chbPayed.Checked;
    SP_FinacialObligation.Parameters.ParamByName('@reject').Value:=chbReject.Checked;
    IF StatusRecord='Insert' then
        SP_FinacialObligation.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_FinacialObligation.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_FinacialObligation.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QFinacialObligation.Close;
    QFinacialObligation.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmFinacialObligation.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmFinacialObligation.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmFinacialObligation.BtnEditClick(Sender: TObject);
begin
    IF (QFinacialObligation.RecNo<=0) OR (QFinacialObligation.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmFinacialObligation.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QFinacialObligation.RecNo<=0) OR (QFinacialObligation.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QFinacialObligation['id'];
    QDelete.ExecSQL;
    QFinacialObligation.Close;
    QFinacialObligation.Open;
    Grid.SetFocus;
  except
   ShowMessage('Œÿ« œ— Õ–› «ÿ·«⁄« ');
  end;    
end;

{*******************  Form Show  ***********************}
procedure TfrmFinacialObligation.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmFinacialObligation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QFinacialObligation.Close;
end;


procedure TfrmFinacialObligation.btnStudentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStudentInfo, frmStudentInfo);
    frmStudentInfo.ShowModal;
    if frmStudentInfo.strKey='enter' then
    begin
        edtStudentId.Text:=frmStudentInfo.QStudent['id'];
        edtStudentName.Text:=frmStudentInfo.QStudent['name']+' '+frmStudentInfo.QStudent['family'];
        edtPrice.SetFocus;
    end;
    FreeAndNil(frmStudentInfo);
end;

procedure TfrmFinacialObligation.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
begin

  if edtSStudentId.Text <> '' then
      strFilter := 'TStudent.id='+edtSStudentId.Text;

  if edtUserID.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TFinancialObligation.UserId='+edtUserID.Text
    else
      strFilter := 'TFinancialObligation.UserId='+edtUserID.Text;

  if edtPrice.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TFinancialObligation.price='+edtPrice.Text
    else
      strFilter := 'TFinancialObligation.price='+edtPrice.Text;

  if edtNumber.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TFinancialObligation.number='+edtNumber.Text
    else
      strFilter := 'TFinancialObligation.number='+edtNumber.Text;


  if edtDueStartDate.Text <> '1   /  /  ' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TFinancialObligation.dueDate>='+QuotedStr(edtDueStartDate.Text)
    else
      strFilter := 'TFinancialObligation.dueDate>='+QuotedStr(edtDueStartDate.Text);


  if edtDueEndDate.Text <> '1   /  /  ' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TFinancialObligation.dueDate<='+QuotedStr(edtDueEndDate.Text)
    else
      strFilter := 'TFinancialObligation.dueDate<='+QuotedStr(edtDueEndDate.Text);

  if edtStartIssueDate.Text <> '1   /  /  ' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TFinancialObligation.issueDate>='+QuotedStr(edtStartIssueDate.Text)
    else
      strFilter := 'TFinancialObligation.issueDate>='+QuotedStr(edtStartIssueDate.Text);


  if edtEndIssueDate.Text <> '1   /  /  ' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TFinancialObligation.issueDate<='+QuotedStr(edtEndIssueDate.Text)
    else
      strFilter := 'TFinancialObligation.issueDate<='+QuotedStr(edtEndIssueDate.Text);


  QFinacialObligation.Close;
  QFinacialObligation.SQL.Clear;
  QFinacialObligation.SQL.Add('select TFinancialObligation.*, name+'' ''+family studentName from TFinancialObligation');
  QFinacialObligation.SQL.Add('inner join TStudent on TFinancialObligation.studentId = TStudent.id');
  if strFilter <> '' then
    QFinacialObligation.SQL.Add('where '+strFilter);
  QFinacialObligation.Open;
end;

procedure TfrmFinacialObligation.btnSStudentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStudentInfo, frmStudentInfo);
    frmStudentInfo.ShowModal;
    if frmStudentInfo.strKey='enter' then
    begin
        edtSStudentId.Text:=frmStudentInfo.QStudent['id'];
        edtSStudentName.Text:=frmStudentInfo.QStudent['name']+' '+frmStudentInfo.QStudent['family'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmStudentInfo);
end;

procedure TfrmFinacialObligation.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['userId'];
        edtUserName.Text:=frmUserInfo.QUser['userName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmUserInfo);

end;

procedure TfrmFinacialObligation.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If QFinacialObligation['isPayed']<> null then
      If QFinacialObligation['isPayed'] then
        Grid.Canvas.Brush.Color:=clTeal;
    If QFinacialObligation['reject'] <> null then
      If QFinacialObligation['reject'] then
        Grid.Canvas.Brush.Color:=clOlive;

    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
