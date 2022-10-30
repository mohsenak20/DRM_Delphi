unit OrderDiscountUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmOrderDiscount = class(TForm)
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
    SP_OrderDiscount: TADOStoredProc;
    dsOrderDiscount: TDataSource;
    QOrderDiscount: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label1: TLabel;
    edtPrice: TEdit;
    edtReceptionDate: TMaskEdit;
    Label3: TLabel;
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
  frmOrderDiscount: TfrmOrderDiscount;
  StatusRecord:String;

implementation

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmOrderDiscount.SetEnabledDisable(BL:Boolean);
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
        edtReceptionDate.Clear;
        edtReceptionDate.SetFocus;
        edtPrice.Text := '0';
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmOrderDiscount.LoadSqlQuery;
Begin
    QOrderDiscount.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmOrderDiscount.GetValue;
begin
    edtReceptionDate.Text:=QOrderDiscount.fieldByName('ReceptionDate').Text;
    edtPrice.Text:=QOrderDiscount.fieldByName('Price').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmOrderDiscount.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmOrderDiscount.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmOrderDiscount.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmOrderDiscount.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmOrderDiscount.BtnSaveClick(Sender: TObject);
begin
    IF (edtReceptionDate.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtReceptionDate.SetFocus;
        Exit;
    End;
    SP_OrderDiscount.Parameters.ParamByName('@ReceptionDate').Value:=edtReceptionDate.Text;
    SP_OrderDiscount.Parameters.ParamByName('@Price').Value:=edtPrice.Text;
    IF StatusRecord='Insert' then
        SP_OrderDiscount.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_OrderDiscount.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_OrderDiscount.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QOrderDiscount.Close;
    QOrderDiscount.Open;
    QOrderDiscount.Last;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmOrderDiscount.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmOrderDiscount.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmOrderDiscount.BtnEditClick(Sender: TObject);
begin
    IF (QOrderDiscount.RecNo<=0) OR (QOrderDiscount.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmOrderDiscount.BtnDelClick(Sender: TObject);
begin
    IF ((QOrderDiscount.RecNo<=0) OR (QOrderDiscount.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QOrderDiscount.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmOrderDiscount.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmOrderDiscount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QOrderDiscount.Close;
end;

end.
