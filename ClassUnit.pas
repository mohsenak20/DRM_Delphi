unit ClassUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, Mask, StdCtrls, Grids, DBGrids,
  ComCtrls, Buttons, ExtCtrls;

type
  TfrmClass = class(TForm)
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
    Label3: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtAgeCategoryId: TEdit;
    edtAgeCategoryTitle: TEdit;
    btnAgeCategory: TBitBtn;
    edtCourseId: TEdit;
    edtCourseTitle: TEdit;
    btnCourse: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BBtnAccept: TBitBtn;
    edtSTermId: TEdit;
    edtSTermTitle: TEdit;
    btnSTerm: TBitBtn;
    edtSAgeCategoryId: TEdit;
    edtSAgeCategoryTitle: TEdit;
    btnSAgeCategory: TBitBtn;
    edtSStartDate: TMaskEdit;
    edtSEndDate: TMaskEdit;
    edtSStartTime: TMaskEdit;
    edtSEndTime: TMaskEdit;
    edtSPoolId: TEdit;
    edtSPoolTitle: TEdit;
    btnSPool: TBitBtn;
    edtSInstructorId: TEdit;
    edtSInstructorName: TEdit;
    btnSInstructor: TBitBtn;
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
    SP_Class: TADOStoredProc;
    dsClass: TDataSource;
    QClass: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDelete: TADOQuery;
    Label9: TLabel;
    edtTitle: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edtTermId: TEdit;
    edtTermTitle: TEdit;
    btnTerm: TBitBtn;
    edtInstructorId: TEdit;
    edtInstructorName: TEdit;
    btnInstructor: TBitBtn;
    Label12: TLabel;
    edtSCourseId: TEdit;
    edtSCourseTitle: TEdit;
    btnSCourse: TBitBtn;
    Label13: TLabel;
    edtSSupervisorId: TEdit;
    edtSSupervisorName: TEdit;
    BitBtn2: TBitBtn;
    edtSTitle: TEdit;
    Label14: TLabel;
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
    procedure btnTermClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnAgeCategoryClick(Sender: TObject);
    procedure btnSAgeCategoryClick(Sender: TObject);
    procedure btnCourseClick(Sender: TObject);
    procedure btnSCourseClick(Sender: TObject);
    procedure btnSTermClick(Sender: TObject);
    procedure btnInstructorClick(Sender: TObject);
    procedure btnSInstructorClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnSPoolClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;


var
  frmClass: TfrmClass;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, TermInfoUnit, CourseInfoUnit,
  InstructorInfoUnit, PoolSupervisorInfoUnit, PoolInfoUnit,
  AgeCategoryInfoUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmClass.SetEnabledDisable(BL:Boolean);
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
        edtTitle.Clear;
        edtAgeCategoryId.Clear;
        edtAgeCategoryTitle.Clear;
        edtCourseId.Clear;
        edtCourseTitle.Clear;
        edtTermId.Clear;
        edtTermTitle.Clear;
        edtInstructorId.Clear;
        edtInstructorName.Clear;
        edtTitle.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmClass.LoadSqlQuery;
Begin
    QClass.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmClass.GetValue;
begin
    edtTitle.Text := QClass['title'];
    edtAgeCategoryId.Text:=QClass['ageCategoryId'];
    edtAgeCategoryTitle.Text:=QClass['ageCategoryTitle'];
    edtCourseId.Text := QClass['courseId'];
    edtCourseTitle.Text := QClass['courseTitle'];
    edtTermId.Text:=QClass['termId'];
    edtTermTitle.Text:=QClass['termTitle'];
    edtInstructorId.Text := QClass['instructorId'];
    edtInstructorName.Text := QClass['instructorName'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmClass.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmClass.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmClass.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmClass.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmClass.BtnSaveClick(Sender: TObject);
begin
    IF (edtTitle.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtTitle.SetFocus;
        Exit;
    End;
    SP_Class.Parameters.ParamByName('@id').Value:=QClass['id'];
    SP_Class.Parameters.ParamByName('@title').Value:=edtTitle.Text;
    SP_Class.Parameters.ParamByName('@ageCategoryId').Value:=edtAgeCategoryId.Text;
    SP_Class.Parameters.ParamByName('@termId').Value:=edtTermId.Text;
    SP_Class.Parameters.ParamByName('@courseId').Value:=edtCourseId.Text;
    SP_Class.Parameters.ParamByName('@instructorId').Value:=edtInstructorId.Text;

    IF StatusRecord='Insert' then
        SP_Class.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Class.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Class.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QClass.Close;
    QClass.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmClass.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmClass.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmClass.BtnEditClick(Sender: TObject);
begin
    IF (QClass.RecNo<=0) OR (QClass.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmClass.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QClass.RecNo<=0) OR (QClass.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QClass['id'];
    QDelete.ExecSQL;
    QClass.Close;
    QClass.Open;
    Grid.SetFocus;
  except
   ShowMessage('ÌÂ œ·Ì· «” ›«œÂ œ— ﬁ”„ Â«Ì œ—ê— «„ò«‰ Õ–› ‰„Ì »«‘œ');
  end;
end;

{*******************  Form Show  ***********************}
procedure TfrmClass.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmClass.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QClass.Close;
end;


procedure TfrmClass.btnTermClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTermInfo, frmTermInfo);
    frmTermInfo.ShowModal;
    if frmTermInfo.strKey='enter' then
    begin
        edtTermId.Text:=frmTermInfo.QTerm['id'];
        edtTermTitle.Text:=frmTermInfo.QTerm['title'];
        btnInstructor.SetFocus;
    end;
    FreeAndNil(frmTermInfo);
end;

procedure TfrmClass.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
begin
  if edtSAgeCategoryId.Text <> '' then
      strFilter := 'TClass.ageCategoryId='+edtSAgeCategoryId.Text;

  if edtSCourseId.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and Tclass.courseId='+edtSCourseId.Text
    else
      strFilter := 'Tclass.courseId='+edtSCourseId.Text;

  if edtSTermId.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and Tclass.termId='+edtSTermId.Text
    else
      strFilter := 'Tclass.termId='+edtSTermId.Text;


  if edtSInstructorId.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and Tclass.instructorId='+edtSInstructorId.Text
    else
      strFilter := 'Tclass.instructorId='+edtSInstructorId.Text;


  if edtSTitle.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TClass.title like'+QuotedStr('%'+edtSTitle.Text+'%')
    else
      strFilter := 'TClass.title like'+QuotedStr('%'+edtSTitle.Text+'%');


  if edtSPoolId.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TPool.id='+edtSPoolId.Text
    else
      strFilter := 'TPool.id='+edtSPoolId.Text;

  if edtSSupervisorId.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TpoolSupervisor.id='+edtSSupervisorId.Text
    else
      strFilter := 'TpoolSupervisor.id='+edtSSupervisorId.Text;

  if edtSStartDate.Text <> '1   /  /  ' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TTerm.startDate>='+QuotedStr(edtSStartDate.Text)
    else
      strFilter := 'TTerm.startDate>='+QuotedStr(edtSStartDate.Text);

  if edtSEndDate.Text <> '1   /  /  ' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TTerm.endDate<='+QuotedStr(edtSEndDate.Text)
    else
      strFilter := 'TTerm.endDate>='+QuotedStr(edtSEndDate.Text);

  if edtSStartTime.Text <> '  :  ' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TRentPool.startTime>='+QuotedStr(edtSStartTime.Text)
    else
      strFilter := 'TRentPool.startTime>='+QuotedStr(edtSStartTime.Text);

  if edtSEndTime.Text <> '  :  ' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TRentPool.endTime<='+QuotedStr(edtSEndTime.Text)
    else
      strFilter := 'TRentPool.endTime>='+QuotedStr(edtSEndTime.Text);

  if edtSTitle.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and TPool.id='+edtSPoolId.Text
    else
      strFilter := 'TPool.id='+edtSPoolId.Text;



  QClass.Close;
  QClass.SQL.Clear;
  QClass.SQL.Add('select TClass.*, TageCategory.title ageCategortTitle, TCourse.title courseTitle,');
  QClass.SQL.Add('TTerm.title termTitle, TInstructor.name instructorName, TPoolSupervisor.name poolSupervisorName,');
  QClass.SQL.Add('Tpool.title poolTitle, TTerm.startDate, TTerm.endDate, TRentPool.startTime, TRentPool.endTime');
  QClass.SQL.Add('from TClass');
  QClass.SQL.Add('inner join TageCategory on TClass.ageCategoryId = TageCategory.id');
  QClass.SQL.Add('inner join TCourse on TClass.courseId = TCourse.id');
  QClass.SQL.Add('inner join TTerm on TClass.TermId = TTerm.id');
  QClass.SQL.Add('inner join TRentPool on TTErm.rentPoolId = TRentPool.id');
  QClass.SQL.Add('inner join TTermAndSupervisor on TTerm.id = TTermAndSupervisor.termId');
  QClass.SQL.Add('inner join TPoolSupervisor on TTermAndSupervisor.poolSupervisorId = TPoolSupervisor.id');
  QClass.SQL.Add('inner join TPool on TRentPool.poolId = TPool.id');
  QClass.SQL.Add('inner join TInstructor on TClass.instructorId = TInstructor.id');
  if strFilter <> '' then
    QClass.SQL.Add('where '+strFilter);
  QClass.Open;
end;

procedure TfrmClass.btnAgeCategoryClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAgeCategoryInfo, frmAgeCategoryInfo);
    frmAgeCategoryInfo.ShowModal;
    if frmAgeCategoryInfo.strKey='enter' then
    begin
        edtAgeCategoryId.Text:=frmAgeCategoryInfo.QAgeCategory['id'];
        edtAgeCategoryTitle.Text:=frmAgeCategoryInfo.QAgeCategory['title'];
        btnCourse.SetFocus;
    end;
    FreeAndNil(frmAgeCategoryInfo);
end;

procedure TfrmClass.btnSAgeCategoryClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAgeCategoryInfo, frmAgeCategoryInfo);
    frmAgeCategoryInfo.ShowModal;
    if frmAgeCategoryInfo.strKey='enter' then
    begin
        edtSAgeCategoryId.Text:=frmAgeCategoryInfo.QAgeCategory['id'];
        edtSAgeCategoryTitle.Text:=frmAgeCategoryInfo.QAgeCategory['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmAgeCategoryInfo);
end;

procedure TfrmClass.btnCourseClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCourceInfo, frmCourceInfo);
    frmCourceInfo.ShowModal;
    if frmCourceInfo.strKey='enter' then
    begin
        edtCourseId.Text:=frmCourceInfo.QCourse['id'];
        edtCourseTitle.Text:=frmCourceInfo.QCourse['title'];
        btnTerm.SetFocus;
    end;
    FreeAndNil(frmCourceInfo);
end;

procedure TfrmClass.btnSCourseClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCourceInfo, frmCourceInfo);
    frmCourceInfo.ShowModal;
    if frmCourceInfo.strKey='enter' then
    begin
        edtSCourseId.Text:=frmCourceInfo.QCourse['id'];
        edtSCourseTitle.Text:=frmCourceInfo.QCourse['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmCourceInfo);
end;

procedure TfrmClass.btnSTermClick(Sender: TObject);
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

procedure TfrmClass.btnInstructorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmInstructorInfo, frmInstructorInfo);
    frmInstructorInfo.ShowModal;
    if frmInstructorInfo.strKey='enter' then
    begin
        edtInstructorId.Text:=frmInstructorInfo.QInstructor['id'];
        edtInstructorName.Text:=frmInstructorInfo.QInstructor['name'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmInstructorInfo);
end;

procedure TfrmClass.btnSInstructorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmInstructorInfo, frmInstructorInfo);
    frmInstructorInfo.ShowModal;
    if frmInstructorInfo.strKey='enter' then
    begin
        edtSInstructorId.Text:=frmInstructorInfo.QInstructor['id'];
        edtSInstructorName.Text:=frmInstructorInfo.QInstructor['name'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmInstructorInfo);

end;

procedure TfrmClass.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(TfrmPoolSupervisorInfo, frmPoolSupervisorInfo);
    frmPoolSupervisorInfo.ShowModal;
    if frmPoolSupervisorInfo.strKey='enter' then
    begin
        edtSSupervisorId.Text:=frmPoolSupervisorInfo.QPoolSupervisor['id'];
        edtSSupervisorName.Text:=frmPoolSupervisorInfo.QPoolSupervisor['name'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmPoolSupervisorInfo);
end;

procedure TfrmClass.btnSPoolClick(Sender: TObject);
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

end.
