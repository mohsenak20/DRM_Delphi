unit EmployeeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmEmployee = class(TForm)
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
    edtCode: TEdit;
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
    SP_Employee: TADOStoredProc;
    dsEmployee: TDataSource;
    QEmployee: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label1: TLabel;
    edtName: TEdit;
    Label6: TLabel;
    edtEmployeeGroupTitle: TEdit;
    btnEmployeeGroup: TBitBtn;
    edtEmployeeGroupId: TEdit;
    Label3: TLabel;
    edtMobile: TEdit;
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
    procedure btnEmployeeGroupClick(Sender: TObject);

  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;


var
  frmEmployee: TfrmEmployee;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, EmployeeGroupInfoUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmEmployee.SetEnabledDisable(BL:Boolean);
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
        edtCode.Clear;
        edtName.Clear;
        edtMobile.Clear;
        edtEmployeeGroupId.Clear;
        edtEmployeeGroupTitle.Clear;
        edtCode.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmEmployee.LoadSqlQuery;
Begin
    QEmployee.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmEmployee.GetValue;
begin
    edtCode.Text:=QEmployee['code'];
    edtName.Text:=QEmployee['name'];
    edtMobile.Text:=QEmployee['mobile'];
    edtEmployeeGroupId.Text:=QEmployee['employeeGroupId'];
    edtEmployeeGroupTitle.Text:=QEmployee['employeeGroupTitle'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmEmployee.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmEmployee.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmEmployee.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmEmployee.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmEmployee.BtnSaveClick(Sender: TObject);
begin
    IF (edtName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtName.SetFocus;
        Exit;
    End;
    SP_Employee.Parameters.ParamByName('@id').Value:=QEmployee['id'];
    SP_Employee.Parameters.ParamByName('@code').Value:=edtCode.Text;
    SP_Employee.Parameters.ParamByName('@name').Value:=edtName.Text;
    SP_Employee.Parameters.ParamByName('@mobile').Value:=edtMobile.Text;
    SP_Employee.Parameters.ParamByName('@employeeGroupId').Value:=edtEmployeeGroupId.Text;
    IF StatusRecord='Insert' then
        SP_Employee.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Employee.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Employee.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QEmployee.Close;
    QEmployee.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmEmployee.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmEmployee.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmEmployee.BtnEditClick(Sender: TObject);
begin
    IF (QEmployee.RecNo<=0) OR (QEmployee.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmEmployee.BtnDelClick(Sender: TObject);
begin
    IF ((QEmployee.RecNo<=0) OR (QEmployee.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QEmployee['id'];
    QDelete.ExecSQL;
    QEmployee.Close;
    QEmployee.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmEmployee.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmEmployee.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QEmployee.Close;
end;


procedure TfrmEmployee.btnEmployeeGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEmployeeGroupInfo, frmEmployeeGroupInfo);
    frmEmployeeGroupInfo.ShowModal;
    if frmEmployeeGroupInfo.strKey='enter' then
    begin
        edtEmployeeGroupId.Text:=frmEmployeeGroupInfo.QEmployeeGroup['id'];
        edtEmployeeGroupTitle.Text:=frmEmployeeGroupInfo.QEmployeeGroup['title'];
        edtMobile.SetFocus;
    end;
    FreeAndNil(frmEmployeeGroupInfo);
end;

end.
