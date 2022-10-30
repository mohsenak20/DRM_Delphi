unit ComputerGroupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmComputerGroup = class(TForm)
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
    Panel1: TPanel;
    Label12: TLabel;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
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
    SP_ComputerGroup: TADOStoredProc;
    dsComputerGroup: TDataSource;
    QComputerGroup: TADOQuery;
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
    procedure edtSearchChange(Sender: TObject);
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComputerGroup: TfrmComputerGroup;
  StatusRecord:String;

implementation

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmComputerGroup.SetEnabledDisable(BL:Boolean);
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
Procedure TfrmComputerGroup.LoadSqlQuery;
Begin
    QComputerGroup.Parameters.ParamByName('title').Value:='%%';
    QComputerGroup.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmComputerGroup.GetValue;
begin
    edtTitle.Text:=QComputerGroup['title'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmComputerGroup.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmComputerGroup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmComputerGroup.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmComputerGroup.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmComputerGroup.BtnSaveClick(Sender: TObject);
begin
    IF (edtTitle.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtTitle.SetFocus;
        Exit;
    End;
    SP_ComputerGroup.Parameters.ParamByName('@id').Value:=QComputerGroup['ID'];
    SP_ComputerGroup.Parameters.ParamByName('@title').Value:=edtTitle.Text;
    IF StatusRecord='Insert' then
        SP_ComputerGroup.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_ComputerGroup.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_ComputerGroup.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QComputerGroup.Close;
    QComputerGroup.Parameters.ParamByName('title').Value:='%%';
    QComputerGroup.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmComputerGroup.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmComputerGroup.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmComputerGroup.BtnEditClick(Sender: TObject);
begin
    IF (QComputerGroup.RecNo<=0) OR (QComputerGroup.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmComputerGroup.BtnDelClick(Sender: TObject);
begin
    IF ((QComputerGroup.RecNo<=0) OR (QComputerGroup.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QComputerGroup.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmComputerGroup.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmComputerGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QComputerGroup.Close;
end;

procedure TfrmComputerGroup.edtSearchChange(Sender: TObject);
begin
    QComputerGroup.Close;
    QComputerGroup.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QComputerGroup.Open;
end;


end.
