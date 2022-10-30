unit TempBargainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmTempBargain = class(TForm)
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label12: TLabel;
    edtSearch: TEdit;
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
    SP_TempBargain: TADOStoredProc;
    dsTempBargain: TDataSource;
    QTempBergain: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDel: TADOQuery;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    edtStartNumber: TEdit;
    edtCompanyID: TEdit;
    edtCompanyName: TEdit;
    btnCompany: TBitBtn;
    edtDate: TMaskEdit;
    edtStartDate: TMaskEdit;
    edtNumber: TEdit;
    edtEndDate: TMaskEdit;
    edtPrice: TEdit;
    chbGetMoney: TCheckBox;
    edtBargainNumber: TEdit;
    Label10: TLabel;
    edtSCompanyID: TEdit;
    edtSCompanyName: TEdit;
    btnSCompany: TBitBtn;
    BBtnAccept: TBitBtn;
    chb50Percent: TCheckBox;
    chbSpecialForAfternoon: TCheckBox;
    chbSpecialForNight: TCheckBox;
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
    procedure btSCompanyClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmTempBargain: TfrmTempBargain;
  StatusRecord:String;

implementation

uses DMUnit, UnitCompanyInfo;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmTempBargain.SetEnabledDisable(BL:Boolean);
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
        edtBargainNumber.SetFocus;
        edtCompanyID.Clear;
        edtCompanyName.Clear;
        edtDate.Clear;
        edtStartNumber.Clear;
        edtNumber.Clear;
        edtStartDate.Clear;
        edtEndDate.Clear;
        edtPrice.Clear;
        edtBargainNumber.Clear;
        chbGetMoney.Checked:=False;
        chbSpecialForAfternoon.Checked := False;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmTempBargain.LoadSqlQuery;
Begin
    QTempBergain.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmTempBargain.GetValue;
begin
    edtBargainNumber.Text:=QTempBergain.fieldByName('BargainNumber').Text;
    edtCompanyID.Text:=QTempBergain.fieldByName('CompanyID').Text;
    edtCompanyName.Text:=QTempBergain.fieldByName('CompanyName').Text;
    edtDate.Text:=QTempBergain.fieldByName('ExportDate').Text;
    edtStartNumber.Text:=QTempBergain.fieldByName('StartNumber').Text;
    edtNumber.Text:=QTempBergain.fieldByName('Number').Text;
    edtStartDate.Text:=QTempBergain.fieldByName('StartDate').Text;
    edtEndDate.Text:=QTempBergain.fieldByName('EndDate').Text;
    edtPrice.Text:=QTempBergain.fieldByName('Price').Text;
    if QTempBergain['GetMoney'] then
        chbGetMoney.Checked:=True
    else
        chbGetMoney.Checked:=False;

    if QTempBergain['is50Percent'] then
        chb50Percent.Checked:=True
    else
        chb50Percent.Checked:=False;

    if QTempBergain['SpecialForAfternoon'] then
        chbSpecialForAfternoon.Checked:=True
    else
        chbSpecialForAfternoon.Checked:=False;

    if QTempBergain['SpecialForNight'] then
        chbSpecialForNight.Checked:=True
    else
        chbSpecialForNight.Checked:=False;
end;

{*******************  FormCreate  ***********************}
procedure TfrmTempBargain.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmTempBargain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmTempBargain.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmTempBargain.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmTempBargain.BtnSaveClick(Sender: TObject);
var
    QBargain : TADOQuery;
begin
    IF (edtCompanyID.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtCompanyID.SetFocus;
        Exit;
    End;
    QBargain := TADOQuery.Create(nil);
    QBargain.Connection := DM.ADOConnection;
    QBargain.SQL.Text := 'select * from TBargain where BargainNumber= '+QuotedStr(edtBargainNumber.Text);
    QBargain.Open;
    if (QBargain['BargainID'] <> Null) and (StatusRecord='Insert') then
    begin
        ShowMessage('‘„«—Â ﬁ—«—œ«œ  ò—«—Ì „Ì »«‘œ');
        Exit;
    end;
    if StrToInt(edtNumber.Text) > 100000 then
            IF MessageBox(Self.Handle,'¬Ì«  ⁄œ«œ ò«— Â« ’ÕÌÕ „Ì »«‘œø','çò ‰„Êœ‰  ⁄œ«œ ò«— Â«',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo  Then Exit;
    SP_TempBargain.Parameters.ParamByName('@TempBargainID').Value:=QTempBergain['TempBargainID'];
    SP_TempBargain.Parameters.ParamByName('@BargainNumber').Value:=edtBargainNumber.Text;
    SP_TempBargain.Parameters.ParamByName('@ExportDate').Value:=edtDate.Text;
    SP_TempBargain.Parameters.ParamByName('@CompanyID').Value:=edtCompanyID.Text;
    SP_TempBargain.Parameters.ParamByName('@StartNumber').Value:=edtStartNumber.Text;
    SP_TempBargain.Parameters.ParamByName('@Number').Value:=edtNumber.Text;
    SP_TempBargain.Parameters.ParamByName('@StartDate').Value:=edtStartDate.Text;
    SP_TempBargain.Parameters.ParamByName('@EndDate').Value:=edtEndDate.Text;
    SP_TempBargain.Parameters.ParamByName('@Price').Value:=edtPrice.Text;
    SP_TempBargain.Parameters.ParamByName('@GetMoney').Value:=chbGetMoney.Checked;
    SP_TempBargain.Parameters.ParamByName('@is50Percent').Value:=chb50Percent.Checked;
    SP_TempBargain.Parameters.ParamByName('@SpecialForAfternoon').Value:=chbSpecialForAfternoon.Checked;
    SP_TempBargain.Parameters.ParamByName('@SpecialForNight').Value:=chbSpecialForNight.Checked;
    IF StatusRecord='Insert' then
        SP_TempBargain.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_TempBargain.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_TempBargain.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QTempBergain.Close;
    QTempBergain.Open;
    Grid.SetFocus;
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmTempBargain.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmTempBargain.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmTempBargain.BtnEditClick(Sender: TObject);
begin
    IF (QTempBergain.RecNo<=0) OR (QTempBergain.IsEmpty) Then Exit;
    if (QTempBergain['Active']) then
    begin
        ShowMessage('ﬁ—«—œ«œ „Ê—œ ‰Ÿ— ›⁄«· ‘œÂ «”  Ê ‘„« „Ã«“ »Â  €ÌÌ— ¬‰ ‰„Ì »«‘Ìœ');
        Exit;
    end;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmTempBargain.BtnDelClick(Sender: TObject);
begin
    IF ((QTempBergain.RecNo<=0) OR (QTempBergain.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDel.Close;
    QDel.Parameters.ParamByName('TempBargainID').Value:=QTempBergain['TempBargainID'];
    QDel.ExecSQL;
    QTempBergain.Close;
    QTempBergain.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmTempBargain.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmTempBargain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QTempBergain.Close;
end;


procedure TfrmTempBargain.btnCompanyClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCompanyInfo, frmCompanyInfo);
    frmCompanyInfo.ShowModal;
    if frmCompanyInfo.strKey='enter' then
    begin
        edtCompanyID.Text:=frmCompanyInfo.QCompany['CompanyID'];
        edtCompanyName.Text:=frmCompanyInfo.QCompany['CompanyName'];
        edtDate.SetFocus;
    end;
    FreeAndNil(frmCompanyInfo);
end;

procedure TfrmTempBargain.btSCompanyClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCompanyInfo, frmCompanyInfo);
    frmCompanyInfo.ShowModal;
    if frmCompanyInfo.strKey='enter' then
    begin
        edtSCompanyID.Text:=frmCompanyInfo.QCompany['CompanyID'];
        edtSCompanyName.Text:=frmCompanyInfo.QCompany['CompanyName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmCompanyInfo);
end;

procedure TfrmTempBargain.BBtnAcceptClick(Sender: TObject);
var
strFilter : string;
begin

    if edtSCompanyID.Text <> '' then
        strfilter := ' TTempBargain.CompanyID='+edtSCompanyID.Text;

    if edtSearch.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and BargainNumber like'+QuotedStr('%'+edtSearch.Text+'%')
        else
            strFilter := ' BargainNumber like '+QuotedStr('%'+edtSearch.Text+'%');

    QTempBergain.Close;
    QTempBergain.SQL.Clear;
    QTempBergain.SQL.Add('Select * From TTempBargain inner join TCompany');
    QTempBergain.SQL.Add('on TTempBargain.CompanyID=TCompany.CompanyID');

    if strFilter<>'' then
        QTempBergain.SQL.Add('where '+strFilter);
    QTempBergain.SQL.Add('order by BargainNumber');
    QTempBergain.Open;
end;

end.
