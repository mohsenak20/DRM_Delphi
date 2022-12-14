unit PoolsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmPools = class(TForm)
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
    SP_Pool: TADOStoredProc;
    dsPool: TDataSource;
    QPool: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label1: TLabel;
    edtManager: TEdit;
    Label3: TLabel;
    edtPhone: TEdit;
    Label4: TLabel;
    edtMobile: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtAddress: TEdit;
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
  frmPools: TfrmPools;
  StatusRecord:String;
implementation

{$R *.dfm}
uses DMUnit, CalculatUnit;
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmPools.SetEnabledDisable(BL:Boolean);
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
        edtManager.Clear;
        edtPhone.Clear;
        edtMobile.Clear;
        edtAddress.Clear;
        edtTitle.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmPools.LoadSqlQuery;
Begin
    QPool.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmPools.GetValue;
begin
    edtTitle.Text:=QPool['title'];
    edtManager.Text:=QPool['manager'];
    edtPhone.Text:=QPool['phone'];
    edtMobile.Text:=QPool['mobile'];
    edtAddress.Text:=QPool['address'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmPools.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmPools.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmPools.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmPools.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmPools.BtnSaveClick(Sender: TObject);
begin
    IF (edtTitle.Text='') Then
    Begin
        MessageBox(Self.Handle,'! ??????? ???? ???? ???? ???','??? ????? ???? ???????',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtTitle.SetFocus;
        Exit;
    End;
    SP_Pool.Parameters.ParamByName('@id').Value:=QPool['id'];
    SP_Pool.Parameters.ParamByName('@title').Value:=edtTitle.Text;
    SP_Pool.Parameters.ParamByName('@manager').Value:=edtManager.Text;
    SP_Pool.Parameters.ParamByName('@phone').Value:=edtPhone.Text;
    SP_Pool.Parameters.ParamByName('@mobile').Value:=edtMobile.Text;
    SP_Pool.Parameters.ParamByName('@address').Value:=edtAddress.Text;

    IF StatusRecord='Insert' then
        SP_Pool.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Pool.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Pool.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QPool.Close;
    QPool.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmPools.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmPools.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmPools.BtnEditClick(Sender: TObject);
begin
    IF (QPool.RecNo<=0) OR (QPool.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmPools.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QPool.RecNo<=0) OR (QPool.IsEmpty)) Or (MessageBox(Self.Handle,'??? ?? ?????? ??? ????? ??? ??? ?','??? ?????',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QPool.Delete;
    Grid.SetFocus;
  except
   ShowMessage('??? ?? ??? ???????');
  end;
end;

{*******************  Form Show  ***********************}
procedure TfrmPools.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmPools.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QPool.Close;
end;


end.
