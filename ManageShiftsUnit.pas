unit ManageShiftsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ADODB, DB, Menus, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmManageShift = class(TForm)
    Panel1: TPanel;
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
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
    SP_Shift: TADOStoredProc;
    dsShift: TDataSource;
    QShift: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    chbIsDeactive: TCheckBox;
    btnShowShifts: TBitBtn;
    chbLockerReset: TCheckBox;
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
    procedure btnShowShiftsClick(Sender: TObject);

  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;



var
  frmManageShift: TfrmManageShift;
  StatusRecord:String;

implementation

uses CreditGroupAndShiftUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmManageShift.SetEnabledDisable(BL:Boolean);
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
        chbIsDeactive.Checked := False;
        chbLockerReset.Checked := False;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmManageShift.LoadSqlQuery;
Begin
    QShift.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmManageShift.GetValue;
begin
    edtTitle.Text:=QShift.fieldByName('title').Text;
    chbIsDeactive.Checked := not QShift['isActive'];
    chbLockerReset.Checked := QShift['lockerReset'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmManageShift.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmManageShift.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmManageShift.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmManageShift.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmManageShift.BtnSaveClick(Sender: TObject);
begin
    IF (edtTitle.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtTitle.SetFocus;
        Exit;
    End;
    SP_Shift.Parameters.ParamByName('@id').Value:=QShift['id'];
    SP_Shift.Parameters.ParamByName('@title').Value:=edtTitle.Text;
    SP_Shift.Parameters.ParamByName('@lockerReset').Value:= chbLockerReset.Checked;
    SP_Shift.Parameters.ParamByName('@isActive').Value:= not chbIsDeactive.Checked;
    IF StatusRecord='Insert' then
        SP_Shift.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Shift.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Shift.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QShift.Close;
    QShift.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmManageShift.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmManageShift.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmManageShift.BtnEditClick(Sender: TObject);
begin
    IF (QShift.RecNo<=0) OR (QShift.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmManageShift.BtnDelClick(Sender: TObject);
begin
    IF ((QShift.RecNo<=0) OR (QShift.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QShift.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmManageShift.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmManageShift.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QShift.Close;
end;


procedure TfrmManageShift.btnShowShiftsClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditGroupAndShift, frmCreditGroupAndShift);
    frmCreditGroupAndShift.edtSearchShiftId.Text := QShift['id'];
    frmCreditGroupAndShift.edtSearchShiftTitle.Text := QShift['title'];
    frmCreditGroupAndShift.BBtnAcceptClick(Sender);
    frmCreditGroupAndShift.ShowModal;
    FreeAndNil(frmCreditGroupAndShift);
end;

end.
