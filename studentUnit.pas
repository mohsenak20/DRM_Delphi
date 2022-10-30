unit studentUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmStudent = class(TForm)
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
    Label6: TLabel;
    edtName: TEdit;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtFamily: TEdit;
    edtFatherName: TEdit;
    edtNID: TEdit;
    edtAddress: TEdit;
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
    SP_Student: TADOStoredProc;
    dsStudent: TDataSource;
    QStudent: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label5: TLabel;
    Label7: TLabel;
    edtPhone: TEdit;
    Label8: TLabel;
    edtMobile: TEdit;
    Label9: TLabel;
    edtMobile1: TEdit;
    Label10: TLabel;
    edtMobile2: TEdit;
    Label16: TLabel;
    edtGenderID: TEdit;
    edtGenderTitle: TEdit;
    btnGender: TBitBtn;
    QDelete: TADOQuery;
    lblTerm: TLabel;
    edtTermId: TEdit;
    edtTermTitle: TEdit;
    btnTerm: TBitBtn;
    SP_StudentEnrollment: TADOStoredProc;
    Panel1: TPanel;
    Label11: TLabel;
    edtSFamily: TEdit;
    Label12: TLabel;
    edtSNID: TEdit;
    Label13: TLabel;
    edtSMobile: TEdit;
    Label14: TLabel;
    edtSGenderId: TEdit;
    edtSGenderTitle: TEdit;
    btnSGender: TBitBtn;
    BBtnAccept: TBitBtn;
    chbSuspend: TCheckBox;
    chbEnrollNewTerm: TCheckBox;
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
    procedure btnGenderClick(Sender: TObject);
    procedure btnTermClick(Sender: TObject);
    procedure btnSGenderClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
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
  frmStudent: TfrmStudent;
  StatusRecord:String;
implementation

uses DMUnit, CalculatUnit, GenderInfoUnit, TermInfoUnit, Math;
{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmStudent.SetEnabledDisable(BL:Boolean);
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
        edtName.Clear;
        edtFamily.Clear;
        edtFatherName.Clear;
        edtNID.Clear;
        edtPhone.Clear;
        edtMobile.Clear;
        edtMobile1.Clear;
        edtMobile2.Clear;
        edtAddress.Clear;
        edtGenderID.Clear;
        edtGenderTitle.Clear;
        chbSuspend.Checked := False;
        chbEnrollNewTerm.Checked := True;
        edtName.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmStudent.LoadSqlQuery;
Begin
    QStudent.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmStudent.GetValue;
begin
    edtName.Text:=QStudent['Name'];
    edtFamily.Text:=QStudent['family'];
    edtFatherName.Text:=QStudent['fatherName'];
    edtNID.Text:=QStudent['NID'];
    edtPhone.Text:=QStudent['phone'];
    edtMobile.Text:=QStudent['mobile'];
    edtMobile1.Text:=QStudent['mobile1'];
    edtMobile2.Text:=QStudent['mobile2'];
    edtAddress.Text:=QStudent['address'];
    edtGenderID.Text:=QStudent['genderId'];
    edtGenderTitle.Text:=QStudent['genderTitle'];
    chbSuspend.Checked := QStudent['isSuspend'];
    chbEnrollNewTerm.Checked := QStudent['enrollNewTerm'];
    edtTermId.Visible := False;
    edtTermTitle.Visible := False;
    btnTerm.Visible:= False;
    lblTerm.Visible := False;
end;

{*******************  FormCreate  ***********************}
procedure TfrmStudent.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmStudent.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmStudent.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmStudent.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmStudent.BtnSaveClick(Sender: TObject);
begin
    IF (edtName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtName.SetFocus;
        Exit;
    End;
    SP_Student.Parameters.ParamByName('@id').Value:=QStudent['id'];
    SP_Student.Parameters.ParamByName('@name').Value:=edtName.Text;
    SP_Student.Parameters.ParamByName('@family').Value:=edtFamily.Text;
    SP_Student.Parameters.ParamByName('@fatherName').Value:=edtFatherName.Text;
    SP_Student.Parameters.ParamByName('@NID').Value:=edtNID.Text;
    SP_Student.Parameters.ParamByName('@phone').Value:=edtPhone.Text;
    SP_Student.Parameters.ParamByName('@mobile').Value:=edtMobile.Text;
    SP_Student.Parameters.ParamByName('@mobile1').Value:=edtMobile1.Text;
    SP_Student.Parameters.ParamByName('@mobile2').Value:=edtMobile2.Text;
    SP_Student.Parameters.ParamByName('@genderId').Value:=edtGenderID.Text;    
    SP_Student.Parameters.ParamByName('@address').Value:=edtAddress.Text;
    SP_Student.Parameters.ParamByName('@isSuspend').Value:=chbSuspend.Checked;
    SP_Student.Parameters.ParamByName('@enrollNewTerm').Value:=chbEnrollNewTerm.Checked;

    IF StatusRecord='Insert' then
        SP_Student.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Student.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Student.ExecProc;

    ////////// enrollment //////////////////
    IF (StatusRecord='Insert') and (edtTermId.Text <> '') then
    begin

        SP_StudentEnrollment.Parameters.ParamByName('@id').Value:=-1;
        SP_StudentEnrollment.Parameters.ParamByName('@studentId').Value:=SP_Student.Parameters.ParamByName('@studentId').Value;
        SP_StudentEnrollment.Parameters.ParamByName('@termId').Value:=edtTermId.Text;
        SP_StudentEnrollment.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;
        SP_StudentEnrollment.Parameters.ParamByName('@enrollmentDate').Value:=CurrentDate;
        SP_StudentEnrollment.Parameters.ParamByName('@Action').Value:='Insert';
        SP_StudentEnrollment.ExecProc;
        ShowMessage('À»  ‰«„ «‰Ã«„ ê—œÌœ');
    end;
    StatusRecord:='';
    SetEnabledDisable(True);
    QStudent.Close;
    QStudent.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmStudent.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmStudent.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    edtTermId.Visible := True;
    edtTermTitle.Visible := True;
    btnTerm.Visible:= True;
    lblTerm.Visible := True;
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmStudent.BtnEditClick(Sender: TObject);
begin
    IF (QStudent.RecNo<=0) OR (QStudent.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmStudent.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QStudent.RecNo<=0) OR (QStudent.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QStudent['id'];
    QDelete.ExecSQL;
    QStudent.Close;
    QStudent.Open;
    Grid.SetFocus;
  except
   ShowMessage('Œÿ« œ— Õ–› «ÿ·«⁄« ');
  end;    
end;

{*******************  Form Show  ***********************}
procedure TfrmStudent.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmStudent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QStudent.Close;
end;


procedure TfrmStudent.btnGenderClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGenderInfo, frmGenderInfo);
    frmGenderInfo.ShowModal;
    if frmGenderInfo.strKey='enter' then
    begin
        edtGenderID.Text:=frmGenderInfo.QGender['id'];
        edtGenderTitle.Text:=frmGenderInfo.QGender['Title'];
        edtAddress.SetFocus;
    end;
    FreeAndNil(frmGenderInfo);
end;

procedure TfrmStudent.btnTermClick(Sender: TObject);
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

procedure TfrmStudent.btnSGenderClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGenderInfo, frmGenderInfo);
    frmGenderInfo.ShowModal;
    if frmGenderInfo.strKey='enter' then
    begin
        edtSGenderID.Text:=frmGenderInfo.QGender['id'];
        edtSGenderTitle.Text:=frmGenderInfo.QGender['Title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmGenderInfo);
end;

procedure TfrmStudent.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
begin
  if edtSFamily.Text <> '' then
    strFilter := ' family like '+QuotedStr('%'+edtSFamily.Text+'%');

  if edtSNID.Text <> '' then
    if strFilter <> '' then
        strFilter :=  strFilter + ' and NID ='+edtSNID.Text
    else
        strFilter :=  'NID ='+edtSNID.Text;

  if edtSMobile.Text <> '' then
    if strFilter <> '' then
        strFilter :=  strFilter + ' and mobile ='+edtSMobile.Text
    else
        strFilter :=  'mobile ='+edtSMobile.Text;

  if edtSGenderId.Text <> '' then
    if strFilter <> '' then
        strFilter :=  strFilter + ' and genderId ='+edtSGenderId.Text
    else
        strFilter :=  'genderId ='+edtSGenderId.Text;

  QStudent.Close;
  QStudent.SQL.Clear;
  QStudent.SQL.Add('select TStudent.*, gender.title genderTitle ');
  QStudent.SQL.Add('from TStudent inner join gender on TStudent.genderId = gender.id');
  if strFilter <> '' then
    QStudent.SQL.Add('where '+ strFilter);
  QStudent.Open;

end;

procedure TfrmStudent.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if QStudent['enrollNewTerm'] <> null then
  begin
    If not QStudent['enrollNewTerm'] then
        Grid.Canvas.Brush.Color:=clTeal;

    If QStudent['isSuspend'] then
        Grid.Canvas.Brush.Color:=clOlive;

    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
