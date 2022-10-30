unit ComputerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmComputer = class(TForm)
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
    edtComputerName: TEdit;
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
    SP_Computer: TADOStoredProc;
    dsComputer: TDataSource;
    QComputer: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label6: TLabel;
    edtPcPosId: TEdit;
    btnPcPos: TBitBtn;
    edtPcPosTitle: TEdit;
    Panel1: TPanel;
    Label12: TLabel;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
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
    procedure btnPcPosClick(Sender: TObject);
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
  frmComputer: TfrmComputer;
  StatusRecord:String;


implementation

uses PcPosInfoUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmComputer.SetEnabledDisable(BL:Boolean);
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
        edtComputerName.Clear;
        edtComputerName.SetFocus;
        edtPcPosId.Clear;
        edtPcPosTitle.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmComputer.LoadSqlQuery;
Begin
    QComputer.Parameters.ParamByName('ComputerName').Value:='%%';
    QComputer.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmComputer.GetValue;
begin
    edtComputerName.Text:=QComputer.fieldByName('ComputerName').Text;
    edtPcPosId.Text:=QComputer.fieldByName('id').Text;
    edtPcPosTitle.Text:=QComputer.fieldByName('title').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmComputer.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmComputer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmComputer.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmComputer.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmComputer.BtnSaveClick(Sender: TObject);
begin
    IF (edtComputerName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtComputerName.SetFocus;
        Exit;
    End;
    SP_Computer.Parameters.ParamByName('@ComputerID').Value:=QComputer['ComputerID'];
    SP_Computer.Parameters.ParamByName('@ComputerName').Value:=edtComputerName.Text;
    if (edtPcPosId.Text) <> '' then
        SP_Computer.Parameters.ParamByName('@pcPosId').Value:=edtPcPosId.Text;
    IF StatusRecord='Insert' then
        SP_Computer.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Computer.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Computer.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QComputer.Close;
    QComputer.Parameters.ParamByName('ComputerName').Value:='%%';
    QComputer.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmComputer.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmComputer.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmComputer.BtnEditClick(Sender: TObject);
begin
    IF (QComputer.RecNo<=0) OR (QComputer.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmComputer.BtnDelClick(Sender: TObject);
begin
    IF ((QComputer.RecNo<=0) OR (QComputer.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QComputer.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmComputer.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmComputer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QComputer.Close;
end;

procedure TfrmComputer.btnPcPosClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPcPosInfo, frmPcPosInfo);
    frmPcPosInfo.ShowModal;
    if frmPcPosInfo.strKey='enter' then
    begin
        edtPcPosId.Text:=frmPcPosInfo.QPcPos['id'];
        edtPcPosTitle.Text:=frmPcPosInfo.QPcPos['title'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmPcPosInfo);
end;

procedure TfrmComputer.edtSearchChange(Sender: TObject);
begin
    QComputer.Close;
    QComputer.Parameters.ParamByName('ComputerName').Value:='%'+edtSearch.Text+'%';
    QComputer.Open;
end;

end.
