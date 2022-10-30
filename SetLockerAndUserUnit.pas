unit SetLockerAndUserUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmSetLockerAndUser = class(TForm)
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
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
    SP_SetLockerAndUser: TADOStoredProc;
    DSSetLOckerAndUSer: TDataSource;
    QSetLockerAndUser: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label4: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    chbActive: TCheckBox;
    QDelete: TADOQuery;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtStartLocker: TEdit;
    Label3: TLabel;
    edtEndLocker: TEdit;
    rbchangingRoom1: TRadioButton;
    rbchangingRoom2: TRadioButton;
    rbchangingRoom3: TRadioButton;
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
    procedure btnUserClick(Sender: TObject);
    procedure rbchangingRoom1Click(Sender: TObject);
    procedure rbchangingRoom2Click(Sender: TObject);
    procedure rbchangingRoom3Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;


var
  frmSetLockerAndUser: TfrmSetLockerAndUser;
  StatusRecord:String;

implementation

uses DMUnit, CalculatUnit, UserInfoUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmSetLockerAndUser.SetEnabledDisable(BL:Boolean);
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
        edtUserID.Clear;
        edtUserName.Clear;
        edtStartLocker.Clear;
        edtEndLocker.Clear;
        chbActive.Checked := True;
        btnUser.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmSetLockerAndUser.LoadSqlQuery;
Begin
    QSetLockerAndUser.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmSetLockerAndUser.GetValue;
begin
    edtUserID.Text:=QSetLockerAndUser.fieldByName('UserID').Text;
    edtUserName.Text:=QSetLockerAndUser.fieldByName('UserName').Text;
    edtStartLocker.Text:=QSetLockerAndUser.fieldByName('StartLocker').Text;
    edtEndLocker.Text:=QSetLockerAndUser.fieldByName('EndLocker').Text;
    chbActive.Checked := QSetLockerAndUser['Active'];

end;

{*******************  FormCreate  ***********************}
procedure TfrmSetLockerAndUser.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmSetLockerAndUser.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmSetLockerAndUser.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmSetLockerAndUser.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmSetLockerAndUser.BtnSaveClick(Sender: TObject);
begin
    IF (edtUserID.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        btnUser.SetFocus;
        Exit;
    End;
    SP_SetLockerAndUser.Parameters.ParamByName('@UserID').Value:=edtUserID.Text;
    SP_SetLockerAndUser.Parameters.ParamByName('@StartLocker').Value:=edtStartLocker.Text;
    SP_SetLockerAndUser.Parameters.ParamByName('@EndLocker').Value:=edtEndLocker.Text;
    if chbActive.Checked then
        SP_SetLockerAndUser.Parameters.ParamByName('@Active').Value:=1
    else
        SP_SetLockerAndUser.Parameters.ParamByName('@Active').Value:=0;
    IF StatusRecord='Insert' then
        SP_SetLockerAndUser.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_SetLockerAndUser.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_SetLockerAndUser.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QSetLockerAndUser.Close;
    QSetLockerAndUser.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmSetLockerAndUser.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmSetLockerAndUser.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmSetLockerAndUser.BtnEditClick(Sender: TObject);
begin
    IF (QSetLockerAndUser.RecNo<=0) OR (QSetLockerAndUser.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmSetLockerAndUser.BtnDelClick(Sender: TObject);
begin
    IF ((QSetLockerAndUser.RecNo<=0) OR (QSetLockerAndUser.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Close;
    QDelete.Parameters.ParamByName('UserID').Value := QSetLockerAndUser['UserID'];
    QDelete.ExecSQL;
    QSetLockerAndUser.Close;
    QSetLockerAndUser.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmSetLockerAndUser.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmSetLockerAndUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QSetLockerAndUser.Close;
end;


procedure TfrmSetLockerAndUser.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        edtStartLocker
        .SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

procedure TfrmSetLockerAndUser.rbchangingRoom1Click(Sender: TObject);
begin
    edtStartLocker.Text := '1';
    edtEndLocker.Text := '1016';
end;

procedure TfrmSetLockerAndUser.rbchangingRoom2Click(Sender: TObject);
begin
    edtStartLocker.Text := '1017';
    edtEndLocker.Text := '2630';
end;

procedure TfrmSetLockerAndUser.rbchangingRoom3Click(Sender: TObject);
begin
    edtStartLocker.Text := '2631';
    edtEndLocker.Text := '2782';
end;

end.
