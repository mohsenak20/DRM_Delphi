unit LessonGroupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmLessonGroup = class(TForm)
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
    SP_LessonGroup: TADOStoredProc;
    dsLessonGroup: TDataSource;
    QLessonGroup: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
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

  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;

var
  frmLessonGroup: TfrmLessonGroup;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmLessonGroup.SetEnabledDisable(BL:Boolean);
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
        edtTitle.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmLessonGroup.LoadSqlQuery;
Begin
    QLessonGroup.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmLessonGroup.GetValue;
begin
    edtTitle.Text:=QLessonGroup.fieldByName('title').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmLessonGroup.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmLessonGroup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmLessonGroup.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmLessonGroup.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmLessonGroup.BtnSaveClick(Sender: TObject);
begin
    IF (edtTitle.Text='') Then
    Begin
        MessageBox(Self.Handle,'! ������� ���� ���� ���� ���','��� ���� ���� �������',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtTitle.SetFocus;
        Exit;
    End;
    SP_LessonGroup.Parameters.ParamByName('@id').Value:=QLessonGroup['id'];
    SP_LessonGroup.Parameters.ParamByName('@title').Value:=edtTitle.Text;
    IF StatusRecord='Insert' then
        SP_LessonGroup.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_LessonGroup.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_LessonGroup.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QLessonGroup.Close;
    QLessonGroup.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmLessonGroup.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmLessonGroup.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmLessonGroup.BtnEditClick(Sender: TObject);
begin
    IF (QLessonGroup.RecNo<=0) OR (QLessonGroup.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmLessonGroup.BtnDelClick(Sender: TObject);
begin
    IF ((QLessonGroup.RecNo<=0) OR (QLessonGroup.IsEmpty)) Or (MessageBox(Self.Handle,'��� �� ������ ��� ����� ��� ��� �','��� �����',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QLessonGroup.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmLessonGroup.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmLessonGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QLessonGroup.Close;
end;


end.
