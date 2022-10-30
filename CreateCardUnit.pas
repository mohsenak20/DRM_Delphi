unit CreateCardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmCreateCard = class(TForm)
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
    Label5: TLabel;
    Label6: TLabel;
    edtStartNumber: TEdit;
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
    SP_CreateCard: TADOStoredProc;
    dsCard: TDataSource;
    QCard: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label1: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    edtCompanyID: TEdit;
    edtCompanyName: TEdit;
    btnCompany: TBitBtn;
    edtCardTypeID: TEdit;
    edtCardTypeName: TEdit;
    btnCardType: TBitBtn;
    edtDate: TMaskEdit;
    edtStartDate: TMaskEdit;
    edtNumber: TEdit;
    edtEndDate: TMaskEdit;
    edtPrice: TEdit;
    Panel1: TPanel;
    Label10: TLabel;
    edtSCompanyID: TEdit;
    edtSCompanyName: TEdit;
    btSCompany: TBitBtn;
    Label11: TLabel;
    edtSCardTypeID: TEdit;
    edtSCardTypeName: TEdit;
    btnSCardType: TBitBtn;
    Label12: TLabel;
    edtSDate: TMaskEdit;
    Label13: TLabel;
    edtSStartDate: TMaskEdit;
    Label14: TLabel;
    edtSEndDate: TMaskEdit;
    Label15: TLabel;
    edtSStartNumber: TEdit;
    Label16: TLabel;
    edtSEndNumber: TEdit;
    BBtnAccept: TBitBtn;
    QMinMax: TADOQuery;
    QCardBargainID: TIntegerField;
    QCardBargainDate: TStringField;
    QCardCompanyID: TSmallintField;
    QCardCompanyName: TWideStringField;
    QCardCardID: TLargeintField;
    QCardCredit: TIntegerField;
    QCardExpireDate: TStringField;
    QCardCardTypeID: TSmallintField;
    QCardCardTypeName: TWideStringField;
    QCardMinCardID: TIntegerField;
    QCardMaxCardID: TIntegerField;
    QCardCreateDate: TStringField;
    chbGetMoney: TCheckBox;
    Label4: TLabel;
    edtBargainNumber: TEdit;
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
    procedure btnCardTypeClick(Sender: TObject);
    procedure btSCompanyClick(Sender: TObject);
    procedure btnSCardTypeClick(Sender: TObject);
    procedure QCardCalcFields(DataSet: TDataSet);
    procedure edtNumberExit(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;


var
  frmCreateCard: TfrmCreateCard;
  StatusRecord:String;
implementation

uses DMUnit, CardTypeInfoUnit, UnitCompanyInfo, BargainInfoUnit;

{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmCreateCard.SetEnabledDisable(BL:Boolean);
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
        edtCompanyID.Clear;
        edtCompanyName.Clear;
        btnCompany.SetFocus;
        edtCardTypeID.Clear;
        edtCardTypeName.Clear;
        edtDate.Clear;
        edtStartNumber.Clear;
        edtNumber.Clear;
        edtStartDate.Clear;
        edtEndDate.Clear;
        edtPrice.Clear;
        edtBargainNumber.Clear;
        chbGetMoney.Checked:=False;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmCreateCard.LoadSqlQuery;
Begin
    QCard.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmCreateCard.GetValue;
begin
    edtCompanyID.Text:=QCard.fieldByName('CompanyID').Text;
    edtCompanyName.Text:=QCard.fieldByName('CompanyName').Text;
    edtCardTypeID.Text:=QCard.fieldByName('CardTypeID').Text;
    edtCardTypeName.Text:=QCard.fieldByName('CardTypeName').Text;
    edtDate.Text:=QCard.fieldByName('BargainDate').Text;
    edtStartNumber.Text:=QCard.fieldByName('MinCardID').Text;
    edtEndDate.Text:=QCard.fieldByName('MaxCardID').Text;
    edtStartNumber.Text:=QCard.fieldByName('CreateDate').Text;
    edtEndDate.Text:=QCard.fieldByName('ExpireDate').Text;
    edtPrice.Text:=QCard.fieldByName('Credit').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmCreateCard.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmCreateCard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmCreateCard.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmCreateCard.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmCreateCard.BtnSaveClick(Sender: TObject);
begin
    IF (edtCompanyID.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtCompanyID.SetFocus;
        Exit;
    End;
    SP_CreateCard.Parameters.ParamByName('@BargainDate').Value:=edtDate.Text;
    SP_CreateCard.Parameters.ParamByName('@BargainNumber').Value:=edtBargainNumber.Text;
    SP_CreateCard.Parameters.ParamByName('@CardType').Value:=edtCardTypeID.Text;
    SP_CreateCard.Parameters.ParamByName('@CreateDate').Value:=edtStartDate.Text;
    SP_CreateCard.Parameters.ParamByName('@ExpireDate').Value:=edtEndDate.Text;
    SP_CreateCard.Parameters.ParamByName('@StartCardID').Value:=edtStartNumber.Text;
    SP_CreateCard.Parameters.ParamByName('@CardCount').Value:=edtNumber.Text;
    SP_CreateCard.Parameters.ParamByName('@Credit').Value:=edtPrice.Text;
    SP_CreateCard.Parameters.ParamByName('@CompanyID').Value:=edtCompanyID.Text;
    SP_CreateCard.Parameters.ParamByName('@GetMoney').Value:=chbGetMoney.Checked;
    SP_CreateCard.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QCard.Close;
    QCard.Open;
    Grid.SetFocus;
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmCreateCard.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmCreateCard.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmCreateCard.BtnEditClick(Sender: TObject);
begin
    IF (QCard.RecNo<=0) OR (QCard.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmCreateCard.BtnDelClick(Sender: TObject);
begin
    IF ((QCard.RecNo<=0) OR (QCard.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    Application.CreateForm(TfrmBargainInfo, frmBargainInfo);
    frmBargainInfo.edtSearch.Text:=QCard['CompanyName'];
    frmBargainInfo.ShowModal;
    FreeAndNil(frmBargainInfo);
    QCard.Close;
    QCard.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmCreateCard.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmCreateCard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QCard.Close;
end;


procedure TfrmCreateCard.btnCompanyClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCompanyInfo, frmCompanyInfo);
    frmCompanyInfo.ShowModal;
    if frmCompanyInfo.strKey='enter' then
    begin
        edtCompanyID.Text:=frmCompanyInfo.QCompany['CompanyID'];
        edtCompanyName.Text:=frmCompanyInfo.QCompany['CompanyName'];
        btnCardType.SetFocus;
    end;
    FreeAndNil(frmCompanyInfo);
end;

procedure TfrmCreateCard.btnCardTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCardTypeInfo, frmCardTypeInfo);
    frmCardTypeInfo.ShowModal;
    if frmCardTypeInfo.strKey='enter' then
    begin
        edtCardTypeID.Text:=frmCardTypeInfo.QCardTypeInfo['CardTypeID'];
        edtCardTypeName.Text:=frmCardTypeInfo.QCardTypeInfo['CardTypeName'];
        edtDate.SetFocus;
    end;
    FreeAndNil(frmCardTypeInfo);
end;

procedure TfrmCreateCard.btSCompanyClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCompanyInfo, frmCompanyInfo);
    frmCompanyInfo.ShowModal;
    if frmCompanyInfo.strKey='enter' then
    begin
        edtSCompanyID.Text:=frmCompanyInfo.QCompany['CompanyID'];
        edtSCompanyName.Text:=frmCompanyInfo.QCompany['CompanyName'];
        btnSCardType.SetFocus;
    end;
    FreeAndNil(frmCompanyInfo);
end;

procedure TfrmCreateCard.btnSCardTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCardTypeInfo, frmCardTypeInfo);
    frmCardTypeInfo.ShowModal;
    if frmCardTypeInfo.strKey='enter' then
    begin
        edtSCardTypeID.Text:=frmCardTypeInfo.QCardTypeInfo['CardTypeID'];
        edtSCardTypeName.Text:=frmCardTypeInfo.QCardTypeInfo['CardTypeName'];
        edtSDate.SetFocus;
    end;
    FreeAndNil(frmCardTypeInfo);
end;

procedure TfrmCreateCard.QCardCalcFields(DataSet: TDataSet);
begin
    QMinMax.Close;
    QMinMax.Parameters.ParamByName('BargainID').Value:=QCard['BargainID'];
    QMinMax.Open;
    if QMinMax['MinCardID']<>Null then
        QCard['MinCardID']:=QMinMax['MinCardID'];
    if QMinMax['MaxCardID']<>Null then
        QCard['MaxCardID']:=QMinMax['MaxCardID'];
end;

procedure TfrmCreateCard.edtNumberExit(Sender: TObject);
begin
    if edtNumber.Text<>'' then
        if StrToInt(edtNumber.Text)>=1000 then
            ShowMessage('·ÿ›«  ⁄œ«œ ò«— Â« —« „Ãœœ« çò ‰„«ÌÌœ');

end;

end.
