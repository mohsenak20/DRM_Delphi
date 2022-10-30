unit LessonUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmLesson = class(TForm)
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
    edtTitle: TEdit;
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
    SP_Lesson: TADOStoredProc;
    dsLesson: TDataSource;
    QLesson: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    lblStartDate: TLabel;
    edtStartDate: TMaskEdit;
    lblEndDate: TLabel;
    edtEndDate: TMaskEdit;
    Label1: TLabel;
    edtDeadline: TMaskEdit;
    Label3: TLabel;
    edtSessionNumber: TEdit;
    Label4: TLabel;
    edtPrice: TEdit;
    Label11: TLabel;
    edtAgeCategoryTitle: TEdit;
    btnAgeCategory: TBitBtn;
    edtAgeCategoryId: TEdit;
    Label5: TLabel;
    edtLessonTypeTitle: TEdit;
    btnLessonType: TBitBtn;
    edtLessonTypeId: TEdit;
    Label6: TLabel;
    edtLessonGroupTitle: TEdit;
    btnLessonGroup: TBitBtn;
    edtLessonGroupId: TEdit;
    Label7: TLabel;
    edtCapacity: TEdit;
    Label8: TLabel;
    edtCode: TEdit;
    QDelete: TADOQuery;
    Panel1: TPanel;
    Label9: TLabel;
    edtSearchAgeCategoryTitle: TEdit;
    btnSearchAgeCategory: TBitBtn;
    edtSearchAgeCategoryId: TEdit;
    Label10: TLabel;
    edtSearchLessonTypeTitle: TEdit;
    btnSearchLessonType: TBitBtn;
    edtSearchLessonTypeId: TEdit;
    Label12: TLabel;
    edtSearchLessonGroupTitle: TEdit;
    btnSearchLessonGroup: TBitBtn;
    edtSearchLessonGroupId: TEdit;
    Label13: TLabel;
    edtSearchTitle: TEdit;
    Label14: TLabel;
    edtSearchCode: TEdit;
    chbCanEnrollment: TCheckBox;
    BBtnAccept: TBitBtn;
    Label15: TLabel;
    edtSearchStartDate: TMaskEdit;
    Label16: TLabel;
    edtSearchEndDate: TMaskEdit;
    N1: TMenuItem;
    mnuEnrollmentList: TMenuItem;
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
    procedure btnAgeCategoryClick(Sender: TObject);
    procedure btnLessonTypeClick(Sender: TObject);
    procedure btnLessonGroupClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure mnuEnrollmentListClick(Sender: TObject);
    procedure btnSearchAgeCategoryClick(Sender: TObject);
    procedure btnSearchLessonTypeClick(Sender: TObject);
    procedure btnSearchLessonGroupClick(Sender: TObject);

  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;

var
  frmLesson: TfrmLesson;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, AgeCategoryInfoUnit, LeesonTypeInfoUnit,
  LessonGroupInfoUnit, EnrollmentUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmLesson.SetEnabledDisable(BL:Boolean);
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
        edtStartDate.Clear;
        edtEndDate.Clear;
        edtDeadline.Clear;
        edtSessionNumber.Clear;
        edtPrice.Clear;
        edtLessonTypeId.Clear;
        edtLessonTypeTitle.Clear;
        edtAgeCategoryId.Clear;
        edtAgeCategoryTitle.Clear;
        edtTitle.SetFocus;
        edtLessonGroupId.Clear;
        edtLessonGroupTitle.Clear;
        edtCapacity.Clear;
        edtCode.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmLesson.LoadSqlQuery;
Begin
    QLesson.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmLesson.GetValue;
begin
    edtTitle.Text:=QLesson.fieldByName('title').Text;
    edtStartDate.Text := QLesson['startDate'];
    edtEndDate.Text := QLesson['endDate'];
    edtDeadline.Text := QLesson['deadline'];
    edtPrice.Text := QLesson['price'];
    edtSessionNumber.Text := QLesson['sessionNumber'];
    edtAgeCategoryId.Text := QLesson['ageCategoryId'];
    edtAgeCategoryTitle.Text := QLesson['ageCategoryTitle'];
    edtLessonTypeId.Text := QLesson['lessonTypeId'];
    edtLessonTypeTitle.Text := QLesson['lessonTypeTitle'];
    edtLessonGroupId.Text := QLesson['lessonGroupId'];
    edtLessonGroupTitle.Text := QLesson['lessonGroupTitle'];
    edtCapacity.Text := QLesson['capacity'];
    edtCode.Text := QLesson['code'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmLesson.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmLesson.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmLesson.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmLesson.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmLesson.BtnSaveClick(Sender: TObject);
begin
    IF (edtTitle.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtTitle.SetFocus;
        Exit;
    End;
    SP_Lesson.Parameters.ParamByName('@id').Value:=QLesson['id'];
    SP_Lesson.Parameters.ParamByName('@title').Value:=edtTitle.Text;
    SP_Lesson.Parameters.ParamByName('@startDate').Value:=edtStartDate.Text;
    SP_Lesson.Parameters.ParamByName('@endDate').Value:=edtEndDate.Text;
    SP_Lesson.Parameters.ParamByName('@deadline').Value:=edtDeadline.Text;
    SP_Lesson.Parameters.ParamByName('@sessionNumber').Value:=edtSessionNumber.Text;
    SP_Lesson.Parameters.ParamByName('@price').Value:=edtPrice.Text;
    SP_Lesson.Parameters.ParamByName('@lessonTypeId').Value:=edtLessonTypeId.Text;
    SP_Lesson.Parameters.ParamByName('@ageCategoryId').Value:=edtAgeCategoryId.Text;
    SP_Lesson.Parameters.ParamByName('@capacity').Value:=edtCapacity.Text;
    SP_Lesson.Parameters.ParamByName('@lessonGroupId').Value:=edtLessonGroupId.Text;
    SP_Lesson.Parameters.ParamByName('@code').Value:=edtCode.Text;
    IF StatusRecord='Insert' then
        SP_Lesson.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Lesson.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Lesson.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QLesson.Close;
    QLesson.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmLesson.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmLesson.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmLesson.BtnEditClick(Sender: TObject);
begin
    IF (QLesson.RecNo<=0) OR (QLesson.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmLesson.BtnDelClick(Sender: TObject);
begin
    IF ((QLesson.RecNo<=0) OR (QLesson.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('lessonId').Value := QLesson['id'];
    QDelete.ExecSQL;
    QLesson.Close;
    QLesson.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmLesson.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmLesson.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QLesson.Close;
end;


procedure TfrmLesson.btnAgeCategoryClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAgeCategoryInfo, frmAgeCategoryInfo);
    frmAgeCategoryInfo.ShowModal;
    if frmAgeCategoryInfo.strKey='enter' then
    begin
        edtAgeCategoryId.Text:=frmAgeCategoryInfo.QAgeCategory['id'];
        edtAgeCategoryTitle.Text:=frmAgeCategoryInfo.QAgeCategory['title'];
        btnLessonType.SetFocus;
    end;
    FreeAndNil(frmAgeCategoryInfo);
end;

procedure TfrmLesson.btnLessonTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLessonTypeInfo, frmLessonTypeInfo);
    frmLessonTypeInfo.ShowModal;
    if frmLessonTypeInfo.strKey='enter' then
    begin
        edtLessonTypeId.Text:=frmLessonTypeInfo.QLessonType['id'];
        edtLessonTypeTitle.Text:=frmLessonTypeInfo.QLessonType['title'];
        btnLessonGroup.SetFocus;
    end;
    FreeAndNil(frmLessonTypeInfo);
end;

procedure TfrmLesson.btnLessonGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLessonGroupInfo, frmLessonGroupInfo);
    frmLessonGroupInfo.ShowModal;
    if frmLessonGroupInfo.strKey='enter' then
    begin
        edtLessonGroupId.Text:=frmLessonGroupInfo.QLessonGroup['id'];
        edtLessonGroupTitle.Text:=frmLessonGroupInfo.QLessonGroup['title'];
        edtCapacity.SetFocus;
    end;
    FreeAndNil(frmLessonGroupInfo);
end;

procedure TfrmLesson.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
begin
  if chbCanEnrollment.Checked then
      strFilter := 'deadline >= '+QuotedStr(CurrentDate);

  if edtSearchTitle.Text <> '' then
    if strFilter <> '' then
      strFilter :=  strFilter + ' and TLesson.title like '+QuotedStr('%'+edtSearchTitle.Text+'%')
    else
      strFilter := 'TLesson.title like '+QuotedStr('%'+edtSearchTitle.Text+'%');

  if edtSearchStartDate.Text <> '1   /  /  ' then
    if strFilter <> '' then
      strFilter := strFilter + ' and startDate>='+QuotedStr(edtSearchStartDate.Text)
    else
      strFilter := 'startDate>='+QuotedStr(edtSearchStartDate.Text);

  if edtSearchEndDate.Text <> '1   /  /  ' then
    if strFilter <> '' then
      strFilter := strFilter + ' and startDate<='+QuotedStr(edtSearchEndDate.Text)
    else
      strFilter := 'startDate>='+QuotedStr(edtSearchEndDate.Text);


  if edtSearchCode.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and code='+edtSearchCode.Text
    else
      strFilter := 'code='+edtSearchCode.Text;

  if edtSearchAgeCategoryId.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and ageCategoryId='+edtSearchAgeCategoryId.Text
    else
      strFilter := 'ageCategoryId='+edtSearchAgeCategoryId.Text;


  if edtSearchLessonTypeId.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and lessonTypeId='+edtSearchLessonTypeId.Text
    else
      strFilter := 'lessonTypeId='+edtSearchLessonTypeId.Text;

  if edtSearchLessonGroupId.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and lessongroupId='+edtSearchLessonGroupId.Text
    else
      strFilter := 'lessonGroupId='+edtSearchLessonTypeId.Text;


  QLesson.Close;
  QLesson.SQL.Clear;
  QLesson.SQL.Add('Select TLesson.*, TLessonType.title lessonTypeTitle, TageCategory.title ageCategoryTitle,');
  QLesson.SQL.Add('TLessonGroup.title lessonGroupTitle, ');
  QLesson.SQL.Add('(select count(id) from TEnrollment where lessonId = TLesson.id) enrollmentCount');
  QLesson.SQL.Add('From TLesson ');
  QLesson.SQL.Add('inner join TLessonType on TLesson.lessonTypeId = TLessonType.id');
  QLesson.SQL.Add('inner join TageCategory on TLesson.ageCategoryId = TageCategory.id');
  QLesson.SQL.Add('inner join TLessonGroup on TLesson.lessonGroupId = TLessonGroup.id');
  if strFilter <> '' then
    QLesson.SQL.Add('where '+strFilter);
  QLesson.SQL.Add('order by startDate');
  QLesson.Open;

end;

procedure TfrmLesson.mnuEnrollmentListClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEnrollment, frmEnrollment);
    frmEnrollment.edtSearchLessonId.Text := QLesson['id'];
    frmEnrollment.edtSearchLessonTitle.Text := QLesson['title'];
    frmEnrollment.BBtnAcceptClick(Sender);
    frmEnrollment.ShowModal;
    FreeAndNil(frmEnrollment);
end;

procedure TfrmLesson.btnSearchAgeCategoryClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAgeCategoryInfo, frmAgeCategoryInfo);
    frmAgeCategoryInfo.ShowModal;
    if frmAgeCategoryInfo.strKey='enter' then
    begin
        edtSearchAgeCategoryId.Text:=frmAgeCategoryInfo.QAgeCategory['id'];
        edtSearchAgeCategoryTitle.Text:=frmAgeCategoryInfo.QAgeCategory['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmAgeCategoryInfo);
end;

procedure TfrmLesson.btnSearchLessonTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLessonTypeInfo, frmLessonTypeInfo);
    frmLessonTypeInfo.ShowModal;
    if frmLessonTypeInfo.strKey='enter' then
    begin
        edtSearchLessonTypeId.Text:=frmLessonTypeInfo.QLessonType['id'];
        edtSearchLessonTypeTitle.Text:=frmLessonTypeInfo.QLessonType['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmLessonTypeInfo);
end;

procedure TfrmLesson.btnSearchLessonGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLessonGroupInfo, frmLessonGroupInfo);
    frmLessonGroupInfo.ShowModal;
    if frmLessonGroupInfo.strKey='enter' then
    begin
        edtSearchLessonGroupId.Text:=frmLessonGroupInfo.QLessonGroup['id'];
        edtSearchLessonGroupTitle.Text:=frmLessonGroupInfo.QLessonGroup['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmLessonGroupInfo);
end;

end.
