unit StudentAndClassUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmStudentAndClass = class(TForm)
    Label5: TLabel;
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    btnClassReport: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label16: TLabel;
    Label3: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtStudentId: TEdit;
    edtStudentName: TEdit;
    btnStudent: TBitBtn;
    edtClassId: TEdit;
    edtClassTitle: TEdit;
    btnClass: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    BBtnAccept: TBitBtn;
    edtSClassId: TEdit;
    edtSClassTitle: TEdit;
    btnSClass: TBitBtn;
    edtSStudentId: TEdit;
    edtSStudentName: TEdit;
    btnSStudent: TBitBtn;
    edtInstructorId: TEdit;
    edtInstructorName: TEdit;
    btnInstructor: TBitBtn;
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
    SP_StudentAndClass: TADOStoredProc;
    dsStudentAndClass: TDataSource;
    QStudentAndClass: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDelete: TADOQuery;
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
    procedure btnClassClick(Sender: TObject);
    procedure btnSClassClick(Sender: TObject);
    procedure btnInstructorClick(Sender: TObject);
    procedure btnClassReportClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;


var
  frmStudentAndClass: TfrmStudentAndClass;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, ClassInfoUnit, InstructorInfoUnit,
  StudentInfoUnit, ClassReportUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmStudentAndClass.SetEnabledDisable(BL:Boolean);
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
        edtClassId.Clear;
        edtClassTitle.Clear;
        btnStudent.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmStudentAndClass.LoadSqlQuery;
Begin
    QStudentAndClass.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmStudentAndClass.GetValue;
begin
    edtStudentId.Text:=QStudentAndClass['studentId'];
    edtStudentName.Text:=QStudentAndClass['studentName'];
    edtClassId.Text:=QStudentAndClass['classId'];
    edtClassTitle.Text:=QStudentAndClass['classTitle'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmStudentAndClass.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmStudentAndClass.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmStudentAndClass.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmStudentAndClass.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmStudentAndClass.BtnSaveClick(Sender: TObject);
begin
    IF (edtStudentId.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        btnStudent.SetFocus;
        Exit;
    End;
    SP_StudentAndClass.Parameters.ParamByName('@id').Value:=QStudentAndClass['id'];
    SP_StudentAndClass.Parameters.ParamByName('@studentId').Value:=edtStudentId.Text;
    SP_StudentAndClass.Parameters.ParamByName('@classId').Value:=edtClassId.Text;
    SP_StudentAndClass.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;

    IF StatusRecord='Insert' then
        SP_StudentAndClass.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_StudentAndClass.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_StudentAndClass.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QStudentAndClass.Close;
    QStudentAndClass.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmStudentAndClass.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmStudentAndClass.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmStudentAndClass.BtnEditClick(Sender: TObject);
begin
    IF (QStudentAndClass.RecNo<=0) OR (QStudentAndClass.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmStudentAndClass.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QStudentAndClass.RecNo<=0) OR (QStudentAndClass.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QStudentAndClass['id'];
    QDelete.ExecSQL;
    QStudentAndClass.Close;
    QStudentAndClass.Open;
    Grid.SetFocus;
  except
   ShowMessage('Œÿ« œ— Õ–› «ÿ·«⁄« ');
  end;
end;

{*******************  Form Show  ***********************}
procedure TfrmStudentAndClass.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmStudentAndClass.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QStudentAndClass.Close;
end;


procedure TfrmStudentAndClass.btnStudentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStudentInfo, frmStudentInfo);
    frmStudentInfo.ShowModal;
    if frmStudentInfo.strKey='enter' then
    begin
        edtStudentId.Text:=frmStudentInfo.QStudent['id'];
        edtStudentName.Text:=frmStudentInfo.QStudent['name']+' '+frmStudentInfo.QStudent['family'];
        btnClass.SetFocus;
    end;
    FreeAndNil(frmStudentInfo);
end;

procedure TfrmStudentAndClass.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
begin

  if edtSStudentId.Text <> '' then
      strFilter := 'TStudent.id='+edtSStudentId.Text;

  if edtSClassId.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and Tclass.id='+edtSClassId.Text
    else
      strFilter := 'Tclass.id='+edtSClassId.Text;

  if edtInstructorId.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TInstructor.id='+edtInstructorId.Text
    else
      strFilter := 'TInstructor.id='+edtInstructorId.Text;

  QStudentAndClass.Close;
  QStudentAndClass.SQL.Clear;
  QStudentAndClass.SQL.Add('select TStudentAndClass.*, TStudent.name+'' ''+TStudent.family studentName, TStudent.NID,');
  QStudentAndClass.SQL.Add('TClass.title classTitle, TInstructor.name instructorName, TStudent.mobile studentMobile');
  QStudentAndClass.SQL.Add('from TStudentAndClass');
  QStudentAndClass.SQL.Add('inner join TStudent on TStudentAndClass.studentId = TStudent.id');
  QStudentAndClass.SQL.Add('inner join TClass on TStudentAndClass.classId = TClass.id');
  QStudentAndClass.SQL.Add('inner join TInstructor on TClass.instructorId = TInstructor.id');
  if strFilter <> '' then
    QStudentAndClass.SQL.Add('where '+strFilter);
  QStudentAndClass.Open;
end;

procedure TfrmStudentAndClass.btnSStudentClick(Sender: TObject);
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

procedure TfrmStudentAndClass.btnClassClick(Sender: TObject);
begin
    Application.CreateForm(TfrmClassInfo, frmClassInfo);
    frmClassInfo.ShowModal;
    if frmClassInfo.strKey='enter' then
    begin
        edtClassId.Text:=frmClassInfo.QClass['id'];
        edtClassTitle.Text:=frmClassInfo.QClass['title'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmClassInfo);
end;

procedure TfrmStudentAndClass.btnSClassClick(Sender: TObject);
begin
    Application.CreateForm(TfrmClassInfo, frmClassInfo);
    frmClassInfo.ShowModal;
    if frmClassInfo.strKey='enter' then
    begin
        edtSClassId.Text:=frmClassInfo.QClass['id'];
        edtSClassTitle.Text:=frmClassInfo.QClass['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmClassInfo);
end;

procedure TfrmStudentAndClass.btnInstructorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmInstructorInfo, frmInstructorInfo);
    frmInstructorInfo.ShowModal;
    if frmInstructorInfo.strKey='enter' then
    begin
        edtInstructorId.Text:=frmInstructorInfo.QInstructor['id'];
        edtInstructorName.Text:=frmInstructorInfo.QInstructor['name'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmInstructorInfo);
end;

procedure TfrmStudentAndClass.btnClassReportClick(Sender: TObject);
begin
    if QStudentAndClass['id'] <> null then
    begin
        Application.CreateForm(TfrmClassReport, frmClassReport);
        frmClassReport.lblStudent.Caption := QStudentAndClass['studentName'];
        frmClassReport.lblClass.Caption := QStudentAndClass['classTitle'];
        frmClassReport.studentAndClassId := QStudentAndClass['id'];
        frmClassReport.ShowModal;
        FreeAndNil(frmClassReport);
    end;

end;

end.
