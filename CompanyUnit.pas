unit CompanyUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmCompany = class(TForm)
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
    edtCompanyName: TEdit;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtManagerName: TEdit;
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
    SP_Company: TADOStoredProc;
    DSCompany: TDataSource;
    QCompany: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    edtTel: TEdit;
    Label4: TLabel;
    edtAddress: TEdit;
    Label5: TLabel;
    edtDescription: TEdit;
    Label6: TLabel;
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
  frmCompany: TfrmCompany;
  StatusRecord:String;

implementation

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmCompany.SetEnabledDisable(BL:Boolean);
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
        edtCompanyName.Clear;
        edtCompanyName.SetFocus;
        edtManagerName.Clear;
        edtTel.Clear;
        edtAddress.Clear;
        edtDescription.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmCompany.LoadSqlQuery;
Begin
    QCompany.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmCompany.GetValue;
begin
    edtCompanyName.Text:=QCompany.fieldByName('CompanyName').Text;
    edtManagerName.Text:=QCompany.fieldByName('ManagerName').Text;
    edtTel.Text:=QCompany.fieldByName('Tel').Text;
    edtAddress.Text:=QCompany.fieldByName('Address').Text;
    edtDescription.Text:=QCompany.fieldByName('Description').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmCompany.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmCompany.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmCompany.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmCompany.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmCompany.BtnSaveClick(Sender: TObject);
begin
    IF (edtCompanyName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtCompanyName.SetFocus;
        Exit;
    End;
    SP_Company.Parameters.ParamByName('@CompanyID').Value:=QCompany['CompanyID'];
    SP_Company.Parameters.ParamByName('@CompanyName').Value:=edtCompanyName.Text;
    SP_Company.Parameters.ParamByName('@ManagerName').Value:=edtManagerName.Text;
    SP_Company.Parameters.ParamByName('@Tel').Value:=edtTel.Text;
    SP_Company.Parameters.ParamByName('@Address').Value:=edtAddress.Text;
    SP_Company.Parameters.ParamByName('@Description').Value:=edtDescription.Text;
    IF StatusRecord='Insert' then
        SP_Company.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Company.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Company.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QCompany.Close;
    QCompany.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmCompany.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmCompany.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmCompany.BtnEditClick(Sender: TObject);
begin
    IF (QCompany.RecNo<=0) OR (QCompany.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmCompany.BtnDelClick(Sender: TObject);
begin
    IF ((QCompany.RecNo<=0) OR (QCompany.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QCompany.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmCompany.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmCompany.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QCompany.Close;
end;



end.
