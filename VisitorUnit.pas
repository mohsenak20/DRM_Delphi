unit VisitorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmVisitor = class(TForm)
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
    edtVisitorName: TEdit;
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
    SP_Visitor: TADOStoredProc;
    DSVisitor: TDataSource;
    QVisitor: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtAddress: TEdit;
    edtTel: TEdit;
    edtMobail: TEdit;
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
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmVisitor: TfrmVisitor;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, qrVisitorUnit, ShareUnit;
{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmVisitor.SetEnabledDisable(BL:Boolean);
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
        edtVisitorName.Clear;
        edtVisitorName.SetFocus;
        edtAddress.Clear;
        edtTel.Clear;
        edtMobail.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmVisitor.LoadSqlQuery;
Begin
    QVisitor.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmVisitor.GetValue;
begin
    edtVisitorName.Text:=QVisitor.fieldByName('VisitorName').Text;
    edtAddress.Text:=QVisitor.fieldByName('Address').Text;
    edtTel.Text:=QVisitor.fieldByName('Tel').Text;
    edtMobail.Text:=QVisitor.fieldByName('Mobail').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmVisitor.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmVisitor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmVisitor.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmVisitor.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmVisitor.BtnSaveClick(Sender: TObject);
begin
    IF (edtVisitorName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtVisitorName.SetFocus;
        Exit;
    End;
    SP_Visitor.Parameters.ParamByName('@VisitorID').Value:=QVisitor['VisitorID'];
    SP_Visitor.Parameters.ParamByName('@VisitorName').Value:=edtVisitorName.Text;
    SP_Visitor.Parameters.ParamByName('@Address').Value:=edtAddress.Text;
    SP_Visitor.Parameters.ParamByName('@Tel').Value:=edtTel.Text;
    SP_Visitor.Parameters.ParamByName('@Mobail').Value:=edtMobail.Text;
    IF StatusRecord='Insert' then
        SP_Visitor.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Visitor.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Visitor.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QVisitor.Close;
    QVisitor.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmVisitor.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmVisitor.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmVisitor.BtnEditClick(Sender: TObject);
begin
    IF (QVisitor.RecNo<=0) OR (QVisitor.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmVisitor.BtnDelClick(Sender: TObject);
begin
    IF ((QVisitor.RecNo<=0) OR (QVisitor.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QVisitor.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmVisitor.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmVisitor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QVisitor.Close;
end;
procedure TfrmVisitor.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrVisitor, qrVisitor);
    qrVisitor.lblCurrentDate.Caption := CurrentDate;
    qrVisitor.lblCoName.Caption := Parameter.CoName;
    qrVisitor.Preview;
    FreeAndNil(qrVisitor);
end;

end.
