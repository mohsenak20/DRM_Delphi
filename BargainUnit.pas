unit BargainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmBargain = class(TForm)
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
    Label3: TLabel;
    Label6: TLabel;
    edtBargainNumber: TEdit;
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
    SP_Bargain: TADOStoredProc;
    dsBargain: TDataSource;
    QBargain: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    chbGetMoney: TCheckBox;
    edtBargainDate: TMaskEdit;
    edtCompanyID: TEdit;
    edtCompanyName: TEdit;
    btnCompany: TBitBtn;
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
    procedure btnCompanyClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmBargain: TfrmBargain;
  StatusRecord:String;

implementation

uses UnitCompanyInfo;

{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmBargain.SetEnabledDisable(BL:Boolean);
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
        edtBargainNumber.Clear;
        btnCompany.SetFocus;
        edtCompanyID.Clear;
        edtCompanyName.Clear;
        chbGetMoney.Checked:=False;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmBargain.LoadSqlQuery;
Begin
    QBargain.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmBargain.GetValue;
begin
    edtBargainNumber.Text:=QBargain.fieldByName('BargainNumber').Text;
    edtBargainDate.Text:=QBargain.fieldByName('BargainDate').Text;
    edtCompanyID.Text:=QBargain.fieldByName('CompanyID').Text;
    edtCompanyName.Text:=QBargain.fieldByName('CompanyName').Text;
    chbGetMoney.Checked:=QBargain['GetMoney'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmBargain.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmBargain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmBargain.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmBargain.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmBargain.BtnSaveClick(Sender: TObject);
begin
    IF (edtBargainNumber.Text='') Then
    Begin
        MessageBox(Self.Handle,'! ������� ���� ���� ���� ���','��� ���� ���� �������',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtCompanyName.SetFocus;
        Exit;
    End;
    SP_Bargain.Parameters.ParamByName('@BargainID').Value:=QBargain['BargainID'];
    SP_Bargain.Parameters.ParamByName('@BargainNumber').Value:=edtBargainNumber.Text;
    SP_Bargain.Parameters.ParamByName('@BargainDate').Value:=edtBargainDate.Text;
    SP_Bargain.Parameters.ParamByName('@CompanyID').Value:=edtCompanyID.Text;
    if chbGetMoney.Checked then
        SP_Bargain.Parameters.ParamByName('@GetMoney').Value:=1
    else
        SP_Bargain.Parameters.ParamByName('@Getmoney').Value:=0;
    IF StatusRecord='Insert' then
        SP_Bargain.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Bargain.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Bargain.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QBargain.Close;
    QBargain.Open;
    Grid.SetFocus;
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmBargain.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmBargain.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmBargain.BtnEditClick(Sender: TObject);
begin
    IF (QBargain.RecNo<=0) OR (QBargain.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmBargain.BtnDelClick(Sender: TObject);
begin
    IF ((QBargain.RecNo<=0) OR (QBargain.IsEmpty)) Or (MessageBox(Self.Handle,'��� �� ������ ��� ����� ��� ��� �','��� �����',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QBargain.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmBargain.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmBargain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QBargain.Close;
end;



procedure TfrmBargain.btnCompanyClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCompanyInfo, frmCompanyInfo);
    frmCompanyInfo.ShowModal;
    if frmCompanyInfo.strKey='enter' then
    begin
        edtCompanyID.Text:=frmCompanyInfo.QCompany['CompanyID'];
        edtCompanyName.Text:=frmCompanyInfo.QCompany['CompanyName'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmCompanyInfo);
end;

end.
