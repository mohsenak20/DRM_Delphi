unit PcPosUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ADODB, DB, Menus, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmPcPos = class(TForm)
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
    SP_PcPos: TADOStoredProc;
    DSPcPos: TDataSource;
    QPcPos: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label1: TLabel;
    edtIp: TEdit;
    Label3: TLabel;
    edtPort: TEdit;
    chbIsActive: TCheckBox;
    Label4: TLabel;
    edtPSPID: TEdit;
    edtPSPTitle: TEdit;
    btnPSP: TBitBtn;
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
    procedure btnPSPClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmPcPos: TfrmPcPos;
  StatusRecord:String;

implementation

uses PSPInfoUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmPcPos.SetEnabledDisable(BL:Boolean);
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
        edtIp.Clear;
        edtPort.Clear;
        chbIsActive.Checked := False;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmPcPos.LoadSqlQuery;
Begin
    QPcPos.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmPcPos.GetValue;
begin
    edtTitle.Text:=QPcPos.fieldByName('title').Text;
    edtIp.Text:=QPcPos.fieldByName('ip').Text;
    edtPort.Text:=QPcPos.fieldByName('port').Text;
    chbIsActive.Checked := QPcPos['isActive'];
    edtPSPID.Text := QPcPos['pspId'];
    edtPSPTitle.Text := QPcPos['pspTitle'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmPcPos.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmPcPos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmPcPos.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmPcPos.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmPcPos.BtnSaveClick(Sender: TObject);
begin
    IF (edtTitle.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtTitle.SetFocus;
        Exit;
    End;
    SP_PcPos.Parameters.ParamByName('@id').Value:=QPcPos['id'];
    SP_PcPos.Parameters.ParamByName('@title').Value:=edtTitle.Text;
    SP_PcPos.Parameters.ParamByName('@ip').Value:=edtIp.Text;
    SP_PcPos.Parameters.ParamByName('@port').Value:=edtPort.Text;
    SP_PcPos.Parameters.ParamByName('@isActive').Value:= chbIsActive.Checked;
    SP_PcPos.Parameters.ParamByName('@pspId').Value:= edtPSPID.Text;
    IF StatusRecord='Insert' then
        SP_PcPos.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_PcPos.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_PcPos.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QPcPos.Close;
    QPcPos.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmPcPos.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmPcPos.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmPcPos.BtnEditClick(Sender: TObject);
begin
    IF (QPcPos.RecNo<=0) OR (QPcPos.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmPcPos.BtnDelClick(Sender: TObject);
begin
    IF ((QPcPos.RecNo<=0) OR (QPcPos.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QPcPos.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmPcPos.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmPcPos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QPcPos.Close;
end;

procedure TfrmPcPos.btnPSPClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPSPInfo, frmPSPInfo);
    frmPSPInfo.ShowModal;
    if frmPSPInfo.strKey='enter' then
    begin
        edtPSPID.Text:=frmPSPInfo.QPSP['id'];
        edtPSPTitle.Text:=frmPSPInfo.QPSP['title'];
        edtTitle.SetFocus;
    end;
    FreeAndNil(frmPSPInfo);
end;

end.
