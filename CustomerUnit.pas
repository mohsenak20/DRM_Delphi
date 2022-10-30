unit CustomerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmCustomer = class(TForm)
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
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCustomerName: TEdit;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtAddress: TEdit;
    edtTel: TEdit;
    edtMobail: TEdit;
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
    SP_Customer: TADOStoredProc;
    DSCustomer: TDataSource;
    QCustomer: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label5: TLabel;
    edtStoreName: TEdit;
    Label6: TLabel;
    edtSectionID: TEdit;
    Label7: TLabel;
    edtCustomerID: TEdit;
    btnSection: TBitBtn;
    edtTitle: TEdit;
    Panel1: TPanel;
    Label10: TLabel;
    edtSSectionID: TEdit;
    edtSectionTitle: TEdit;
    btnSSection: TBitBtn;
    btnSearch: TBitBtn;
    Label8: TLabel;
    edtSCustomerID: TEdit;
    edtSCustomerName: TEdit;
    btnSCustomer: TBitBtn;
    Label9: TLabel;
    edtSAddress: TEdit;
    Label11: TLabel;
    edtSStoreName: TEdit;
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
    procedure btnSectionClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure btnSSectionClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSCustomerClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;



var
  frmCustomer: TfrmCustomer;
  StatusRecord:String;

implementation

uses DMUnit, CalculatUnit, SectionInfoUnit, qrCustomerUni, ShareUnit, Math,
  CustomerInfoUnit;
{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmCustomer.SetEnabledDisable(BL:Boolean);
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
        edtCustomerID.Clear;
        edtCustomerID.SetFocus;
        edtCustomerName.Clear;
        edtStoreName.Clear;
        edtAddress.Clear;
        edtTel.Clear;
        edtMobail.Clear;
        edtSectionID.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmCustomer.LoadSqlQuery;
Begin
    QCustomer.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmCustomer.GetValue;
begin
    edtCustomerID.Text:=QCustomer.fieldByName('CustomerID').Text;
    edtCustomerName.Text:=QCustomer.fieldByName('CustomerName').Text;
    edtStoreName.Text:=QCustomer.fieldByName('StoreName').Text;
    edtAddress.Text:=QCustomer.fieldByName('Address').Text;
    edtTel.Text:=QCustomer.fieldByName('Tel').Text;
    edtMobail.Text:=QCustomer.fieldByName('Mobaile').Text;
    edtSectionID.Text:=QCustomer.fieldByName('SectionID').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmCustomer.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmCustomer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmCustomer.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmCustomer.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmCustomer.BtnSaveClick(Sender: TObject);
begin
    IF (edtCustomerName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtCustomerName.SetFocus;
        Exit;
    End;
    SP_Customer.Parameters.ParamByName('@CustomerID').Value:=edtCustomerID.Text;
    SP_Customer.Parameters.ParamByName('@CustomerName').Value:=edtCustomerName.Text;
    SP_Customer.Parameters.ParamByName('@StoreName').Value:=edtStoreName.Text;
    SP_Customer.Parameters.ParamByName('@Address').Value:=edtAddress.Text;
    SP_Customer.Parameters.ParamByName('@Tel').Value:=edtTel.Text;
    SP_Customer.Parameters.ParamByName('@Mobaile').Value:=edtMobail.Text;
    SP_Customer.Parameters.ParamByName('@SectionID').Value:=edtSectionID.Text;
    IF StatusRecord='Insert' then
        SP_Customer.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Customer.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Customer.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QCustomer.Close;
    QCustomer.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmCustomer.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmCustomer.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmCustomer.BtnEditClick(Sender: TObject);
begin
    IF (QCustomer.RecNo<=0) OR (QCustomer.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmCustomer.BtnDelClick(Sender: TObject);
begin
    IF ((QCustomer.RecNo<=0) OR (QCustomer.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QCustomer.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmCustomer.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmCustomer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QCustomer.Close;
end;

procedure TfrmCustomer.btnSectionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSectionInfo, frmSectionInfo);
    frmSectionInfo.ShowModal;
    if frmSectionInfo.strKey='enter' then
    begin
        edtSectionID.Text:=frmSectionInfo.QSection['SectionID'];
        edtTitle.Text:=frmSectionInfo.QSection['Title'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmSectionInfo);
end;

procedure TfrmCustomer.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrCustomer, qrCustomer);
    qrCustomer.lblCurrentDate.Caption := CurrentDate;
    qrCustomer.lblCoName.Caption := Parameter.CoName;
    qrCustomer.Preview;
    FreeAndNil(qrCustomer);
end;

procedure TfrmCustomer.btnSSectionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSectionInfo, frmSectionInfo);
    frmSectionInfo.ShowModal;
    if frmSectionInfo.strKey='enter' then
    begin
        edtSSectionID.Text:=frmSectionInfo.QSection['SectionID'];
        edtSectionTitle.Text:=frmSectionInfo.QSection['Title'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmSectionInfo);
end;

procedure TfrmCustomer.btnSearchClick(Sender: TObject);
var
    strFilter : string;
begin
    if edtSCustomerID.Text <> '' then
        strFilter := 'CustomerID = '+edtSCustomerID.Text;

    If edtSSectionID.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + 'and SectionID = '+edtSSectionID.Text
        else
            strFilter :='SectionID = '+edtSSectionID.Text;

    if edtSAddress.Text<>'' then
        if strFilter <> '' then
            strFilter := strFilter + ' and Address like ''%'+edtSAddress.Text+'%'''
        else
            strFilter := 'Address like ''%'+edtSAddress.Text+'%''';


    if edtSStoreName.Text<>'' then
        if strFilter <> '' then
            strFilter := strFilter + ' and StoreName like ''%'+edtSStoreName.Text+'%'''
        else
            strFilter := ' StoreName like ''%'+edtSStoreName.Text+'%''';


    QCustomer.Close;
    QCustomer.SQL.Clear;
    QCustomer.SQL.Add('Select * From TCustomer');
    if strFilter <> '' then
        QCustomer.SQL.Add('where '+strFilter);
    QCustomer.Open;
end;

procedure TfrmCustomer.btnSCustomerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCustomerInfo, frmCustomerInfo);
    frmCustomerInfo.ShowModal;
    if frmCustomerInfo.strKey='enter' then
    begin
        edtSCustomerID.Text:=frmCustomerInfo.QCustomer['CustomerID'];
        edtSCustomerName.Text:=frmCustomerInfo.QCustomer['CustomerName'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmCustomerInfo);
end;

end.
