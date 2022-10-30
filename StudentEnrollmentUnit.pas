unit StudentEnrollmentUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ActnList, ADODB, DB, Menus, Grids, DBGrids,
  ComCtrls, Buttons, ExtCtrls;

type
  TfrmStudentEnrollment = class(TForm)
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
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
    SP_StudentEnrollment: TADOStoredProc;
    dsStudentEnrollment: TDataSource;
    QStudentEnrollment: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label5: TLabel;
    QDelete: TADOQuery;
    Label16: TLabel;
    edtStudentId: TEdit;
    edtStudentName: TEdit;
    btnStudent: TBitBtn;
    Label3: TLabel;
    edtTermId: TEdit;
    edtTermTitle: TEdit;
    btnTerm: TBitBtn;
    btnPay: TBitBtn;
    Panel1: TPanel;
    BBtnAccept: TBitBtn;
    Label1: TLabel;
    edtSTermId: TEdit;
    edtSTermTitle: TEdit;
    btnSTerm: TBitBtn;
    Label2: TLabel;
    edtSStudentId: TEdit;
    edtSStudentName: TEdit;
    btnSStudent: TBitBtn;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edtSStartDate: TMaskEdit;
    edtSEndDate: TMaskEdit;
    edtSStartTime: TMaskEdit;
    edtSEndTime: TMaskEdit;
    Label7: TLabel;
    edtSPoolId: TEdit;
    edtSPoolTitle: TEdit;
    btnSPool: TBitBtn;
    Label8: TLabel;
    edtSRentPoolId: TEdit;
    edtSRentPoolTitle: TEdit;
    btnRentPool: TBitBtn;
    Panel2: TPanel;
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
    procedure btnTermClick(Sender: TObject);
    procedure btnPayClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnSStudentClick(Sender: TObject);
    procedure btnSTermClick(Sender: TObject);
    procedure btnSPoolClick(Sender: TObject);
    procedure btnRentPoolClick(Sender: TObject);
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
  frmStudentEnrollment: TfrmStudentEnrollment;
  StatusRecord:String;
implementation
uses DMUnit, CalculatUnit, StudentInfoUnit, RentPoolInfoUnit, TermInfoUnit,
  SchoolTuitionPayUnit, PoolInfoUnit;
{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmStudentEnrollment.SetEnabledDisable(BL:Boolean);
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
        edtTermId.Clear;
        edtTermTitle.Clear;
        btnStudent.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmStudentEnrollment.LoadSqlQuery;
Begin
    QStudentEnrollment.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmStudentEnrollment.GetValue;
begin
    edtStudentId.Text:=QStudentEnrollment['studentId'];
    edtStudentName.Text:=QStudentEnrollment['studentName'];
    edtTermId.Text:=QStudentEnrollment['termId'];
    edtTermTitle.Text:=QStudentEnrollment['termTitle'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmStudentEnrollment.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
    edtSStartDate.Text := CurrentDate;
    edtSEndDate.Text := CurrentDate;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmStudentEnrollment.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmStudentEnrollment.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmStudentEnrollment.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmStudentEnrollment.BtnSaveClick(Sender: TObject);
begin
    IF (edtStudentId.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        btnStudent.SetFocus;
        Exit;
    End;
    SP_StudentEnrollment.Parameters.ParamByName('@id').Value:=QStudentEnrollment['id'];
    SP_StudentEnrollment.Parameters.ParamByName('@studentId').Value:=edtStudentId.Text;
    SP_StudentEnrollment.Parameters.ParamByName('@termId').Value:=edtTermId.Text;
    SP_StudentEnrollment.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;
    SP_StudentEnrollment.Parameters.ParamByName('@enrollmentDate').Value:=CurrentDate;

    IF StatusRecord='Insert' then
        SP_StudentEnrollment.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_StudentEnrollment.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_StudentEnrollment.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QStudentEnrollment.Close;
    QStudentEnrollment.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmStudentEnrollment.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmStudentEnrollment.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmStudentEnrollment.BtnEditClick(Sender: TObject);
begin
    IF (QStudentEnrollment.RecNo<=0) OR (QStudentEnrollment.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmStudentEnrollment.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QStudentEnrollment.RecNo<=0) OR (QStudentEnrollment.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QStudentEnrollment['id'];
    QDelete.ExecSQL;
    QStudentEnrollment.Close;
    QStudentEnrollment.Open;
    Grid.SetFocus;
  except
   ShowMessage('Œÿ« œ— Õ–› «ÿ·«⁄« ');
  end;    
end;

{*******************  Form Show  ***********************}
procedure TfrmStudentEnrollment.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmStudentEnrollment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QStudentEnrollment.Close;
end;


procedure TfrmStudentEnrollment.btnStudentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStudentInfo, frmStudentInfo);
    frmStudentInfo.ShowModal;
    if frmStudentInfo.strKey='enter' then
    begin
        edtStudentId.Text:=frmStudentInfo.QStudent['id'];
        edtStudentName.Text:=frmStudentInfo.QStudent['name']+' '+frmStudentInfo.QStudent['family'];
        btnTerm.SetFocus;
    end;
    FreeAndNil(frmStudentInfo);
end;

procedure TfrmStudentEnrollment.btnTermClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTermInfo, frmTermInfo);
    frmTermInfo.ShowModal;
    if frmTermInfo.strKey='enter' then
    begin
        edtTermId.Text:=frmTermInfo.QTerm['id'];
        edtTermTitle.Text:=frmTermInfo.QTerm['title'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmTermInfo);
end;

procedure TfrmStudentEnrollment.btnPayClick(Sender: TObject);
begin
   If QStudentEnrollment['enrollmentPrice'] > QStudentEnrollment['payment'] then
   begin
     Application.CreateForm(TfrmSchoolTuitionPay, frmSchoolTuitionPay);
     frmSchoolTuitionPay.lblstudentEnrollmentId.Caption := IntToStr(QStudentEnrollment['id']);
     frmSchoolTuitionPay.lblStudentId.Caption := IntToStr(QStudentEnrollment['studentId']);
     frmSchoolTuitionPay.lblStudentName.Caption := QStudentEnrollment['studentName'];
     frmSchoolTuitionPay.lblPoolTitle.Caption := QStudentEnrollment['poolTitle'];
     frmSchoolTuitionPay.lblTermTitle.Caption := QStudentEnrollment['termTitle'];
     frmSchoolTuitionPay.lblPrice.Caption := IntToStr(QStudentEnrollment['enrollmentPrice']);
     frmSchoolTuitionPay.lblPayed.Caption := IntToStr(QStudentEnrollment['payment']);
     frmSchoolTuitionPay.lblMustPay.Caption := IntToStr(QStudentEnrollment['enrollmentPrice'] - QStudentEnrollment['payment']);
     frmSchoolTuitionPay.edtPay.Text := IntToStr(QStudentEnrollment['enrollmentPrice'] - QStudentEnrollment['payment']);
     frmSchoolTuitionPay.ShowModal;
     FreeAndNil(frmSchoolTuitionPay);
     QStudentEnrollment.Close;
     QStudentEnrollment.Open;
   end
   else
      ShowMessage('‘Â—ÌÂ Å—œ«Œ  ‘œÂ «” ');
end;

procedure TfrmStudentEnrollment.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
begin
  strFilter := 'enrollmentDate >='+QuotedStr(edtSStartDate.Text)+' and enrollmentDate <='+QuotedStr(edtSEndDate.Text);

  if edtSStudentId.Text <> '' then
      strFilter := strFilter + ' and TStudentEnrollment.studentId='+edtSStudentId.Text;


  if edtSTermId.Text <> '' then
      strFilter := strFilter + ' and TStudentEnrollment.TermId='+edtSTermId.Text;

  if edtSStartTime.Text <> '  :  ' then
      strFilter := strFilter + ' and TRentPool.startTime>='+QuotedStr(edtSStartTime.Text);

  if edtSEndTime.Text <> '  :  ' then
      strFilter := strFilter + ' and TRentPool.endTime<='+QuotedStr(edtSEndTime.Text);


  if edtSPoolId.Text <> '' then
      strFilter := strFilter + ' and TPool.id='+edtSPoolId.Text;


  if edtSRentPoolId.Text <> '' then
      strFilter := strFilter + ' and TRentPool.id='+edtSRentPoolId.Text;

  QStudentEnrollment.Close;
  QStudentEnrollment.SQL.Clear;
  QStudentEnrollment.SQL.Add('select TStudentEnrollment.*, TStudent.name+'' ''+TStudent.family studentName, fatherName,');
  QStudentEnrollment.SQL.Add('TRentPool.title rentPoolTitle, TTerm.title termTitle, TTerm.price enrollmentPrice,');
  QStudentEnrollment.SQL.Add('TTerm.startDate startDate, TTerm.endDate endDate, TRentPool.startTime, TRentPool.endTime,');
  QStudentEnrollment.SQL.Add('TPool.title poolTitle, gender.title genderTitle, payment, TTerm.price - payment mustPay');
  QStudentEnrollment.SQL.Add('from TStudentEnrollment');
  QStudentEnrollment.SQL.Add('OUTER APPLY (select isnull(sum(price), 0) payment from TSchoolPayment where studentEnrollmentId = TStudentEnrollment.id) payment');
  QStudentEnrollment.SQL.Add('inner join TStudent on TStudentEnrollment.studentId = TStudent.id');
  QStudentEnrollment.SQL.Add('inner join TTerm on TStudentEnrollment.TermId = TTerm.id');
  QStudentEnrollment.SQL.Add('inner join TRentPool on TTerm.rentPoolId = TRentPool.id');
  QStudentEnrollment.SQL.Add('inner join TPool on TRentPool.poolId = TPool.id');
  QStudentEnrollment.SQL.Add('inner join gender on TStudent.genderId = gender.id');
  QStudentEnrollment.SQL.Add('where '+strFilter);
  QStudentEnrollment.Open;
end;

procedure TfrmStudentEnrollment.btnSStudentClick(Sender: TObject);
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

procedure TfrmStudentEnrollment.btnSTermClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTermInfo, frmTermInfo);
    frmTermInfo.ShowModal;
    if frmTermInfo.strKey='enter' then
    begin
        edtSTermId.Text:=frmTermInfo.QTerm['id'];
        edtSTermTitle.Text:=frmTermInfo.QTerm['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmTermInfo);
end;

procedure TfrmStudentEnrollment.btnSPoolClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPoolsInfo, frmPoolsInfo);
    frmPoolsInfo.ShowModal;
    if frmPoolsInfo.strKey='enter' then
    begin
        edtSPoolId.Text:=frmPoolsInfo.QPool['id'];
        edtSPoolTitle.Text:=frmPoolsInfo.QPool['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmPoolsInfo);
end;

procedure TfrmStudentEnrollment.btnRentPoolClick(Sender: TObject);
begin
    Application.CreateForm(TfrmRentPoolInfo, frmRentPoolInfo);
    frmRentPoolInfo.ShowModal;
    if frmRentPoolInfo.strKey='enter' then
    begin
        edtSRentPoolId.Text:=frmRentPoolInfo.QRent['id'];
        edtSRentPoolTitle.Text:=frmRentPoolInfo.QRent['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmRentPoolInfo);
end;

procedure TfrmStudentEnrollment.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If QStudentEnrollment['enrollmentPrice'] >  QStudentEnrollment['payment'] then
        Grid.Canvas.Brush.Color:=clOlive;
    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
