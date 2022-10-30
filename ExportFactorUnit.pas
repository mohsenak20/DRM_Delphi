unit ExportFactorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, Mask, StdCtrls, Grids, DBGrids,
  ComCtrls, Buttons, ExtCtrls;

type
  TfrmExportFactor = class(TForm)
    PanelButton: TPanel;
    Label13: TLabel;
    lblSumCard: TLabel;
    Label15: TLabel;
    lblPrice: TLabel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtCredit: TEdit;
    edtNumberOfAdult: TEdit;
    edtAdultPrice: TEdit;
    edtTo: TEdit;
    edtFactorDate: TMaskEdit;
    Panel1: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    edtSTo: TEdit;
    edtSNumberOfCustomer: TEdit;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    edtSFactorNumber: TEdit;
    MainMenuUnit: TMainMenu;
    MnuFile: TMenuItem;
    MnuInsert: TMenuItem;
    MnuEdit: TMenuItem;
    MnuDelete: TMenuItem;
    N2: TMenuItem;
    MnuReturn: TMenuItem;
    N1: TMenuItem;
    mnuDayReport: TMenuItem;
    PopupMenuUnit: TPopupMenu;
    MnuPopInsert: TMenuItem;
    MnuPopEdit: TMenuItem;
    MnuPopNone1: TMenuItem;
    MnuPopDelete: TMenuItem;
    SP_Factor: TADOStoredProc;
    dsFactor: TDataSource;
    QFactor: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    qDelete: TADOQuery;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    edtNumberOfChild: TEdit;
    edtChildPrice: TEdit;
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
    procedure btnSearchClick(Sender: TObject);
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
  frmExportFactor: TfrmExportFactor;
  StatusRecord:String;
implementation

uses qrExportFactorUnit, DateUtils, CalculatUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmExportFactor.SetEnabledDisable(BL:Boolean);
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
        edtTo.Clear;
        //edtTo.SetFocus;
        edtFactorDate.Text := CurrentDate;
        edtNumberOfAdult.Text := '0';
        edtAdultPrice.Text := '0';
        edtNumberOfChild.Text := '0';
        edtChildPrice.Text := '0';
        edtCredit.Text := '0';
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmExportFactor.LoadSqlQuery;
Begin
    btnSearchClick(self);
End;

{*******************  GetValue  ***********************}
procedure TfrmExportFactor.GetValue;
begin
    edtTo.Text := QFactor.fieldByName('To').Text;
    edtFactorDate.Text:=QFactor.fieldByName('FactorDate').Text;
    edtNumberOfAdult.Text:=QFactor.fieldByName('NumberOfAdult').Text;
    edtAdultPrice.Text:=QFactor.fieldByName('AdultPrice').Text;
    edtNumberOfChild.Text:=QFactor.fieldByName('NumberOfChild').Text;
    edtChildPrice.Text:=QFactor.fieldByName('ChildPrice').Text;
    edtCredit.Text:=QFactor.fieldByName('Credit').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmExportFactor.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmExportFactor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmExportFactor.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmExportFactor.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmExportFactor.BtnSaveClick(Sender: TObject);
var
  sumPrice : integer;
begin
    IF (edtTo.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtTo.SetFocus;
        Exit;
    End;
    SP_Factor.Parameters.ParamByName('@FactorNumber').Value:=QFactor['FactorNumber'];
    SP_Factor.Parameters.ParamByName('@To').Value:=edtTo.Text;
    SP_Factor.Parameters.ParamByName('@FactorDate').Value:=edtFactorDate.Text;
    SP_Factor.Parameters.ParamByName('@NumberOfAdult').Value:=edtNumberOfAdult.Text;
    SP_Factor.Parameters.ParamByName('@AdultPrice').Value:=edtAdultPrice.Text;
    SP_Factor.Parameters.ParamByName('@NumberOfChild').Value:=edtNumberOfChild.Text;
    SP_Factor.Parameters.ParamByName('@ChildPrice').Value:=edtChildPrice.Text;
    SP_Factor.Parameters.ParamByName('@Credit').Value:=edtCredit.Text;
    IF StatusRecord='Insert' then
        SP_Factor.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Factor.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Factor.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QFactor.Close;
    QFactor.Open;
    //Grid.SetFocus;
    QFactor.Last;
    Application.CreateForm(TqrExportFactor, qrExportFactor);
    With qrExportFactor do
    begin
        if QFactor['NumberOfAdult'] <= 0 then
        begin
            lblAdult.Caption := '';
            lblNumberOfAdult.Caption := '';
            lblAdultPrice.Caption := '';
            lblSumAdult.Caption := '';
        end
        else
        begin
            lblNumberOfAdult.Caption := IntToStr(QFactor['NumberOfAdult']);
            lblAdultPrice.Caption := IntToStr(QFactor['AdultPrice']);
            lblSumAdult.Caption := FormatFloat('#,', QFactor['NumberOfAdult']*QFactor['AdultPrice']);
        end;

        if QFactor['NumberOfChild'] <= 0 then
        begin
            lblChild.Caption := '';
            lblNumberOfChild.Caption := '';
            lblChildPrice.Caption := '';
            lblSumChild.Caption := '';
        end
        else
        begin
            lblNumberOfChild.Caption := IntToStr(QFactor['NumberOfChild']);
            lblChildPrice.Caption := FormatFloat('#,', QFactor['ChildPrice']);
            lblSumChild.Caption := FormatFloat('#,', QFactor['NumberOfChild']*QFactor['ChildPrice']);
        end;

        if QFactor['Credit'] <= 0 then
        begin
            lblCredit.Caption := '';
            lblNumberOfCredit.Caption := '';
            lblCreditPrice.Caption := '';
            lblSumCredit.Caption := '';
        end
        else
        begin
            lblNumberOfCredit.Caption := '1';
            lblCreditPrice.Caption := FormatFloat('#,', QFactor['Credit']);
            lblSumCredit.Caption := lblCreditPrice.Caption;
        end;
        sumPrice := (QFactor['NumberOfAdult']*QFactor['AdultPrice']) +
                    (QFactor['NumberOfChild']*QFactor['ChildPrice']) +
                    (QFactor['Credit']);
        lblSum1.Caption :=  FormatFloat('#,', sumPrice);
        lblDiscount.Caption := FormatFloat('#,', 4*sumPrice/100);
        lblSum2.Caption := FormatFloat('#,', sumPrice - (4*sumPrice/100));
        lblTax.Caption := lblDiscount.Caption;
        lblSum.Caption := lblSum1.Caption;
        lblCustomerName.Caption := QFactor['To'];
        lblFactorNumber.Caption  := QFactor['FactorNumber'];
        lblFactorDate.Caption := QFactor['FactorDate'];
        lblToLetter.Caption := Number2Str(IntToStr(sumPrice));
    end;
    qrExportFactor.Print;
    FreeAndNil(qrExportFactor);

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmExportFactor.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmExportFactor.BtnNewClick(Sender: TObject);
var
    QFactorID : TADOQuery;
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmExportFactor.BtnEditClick(Sender: TObject);
begin
    IF (QFactor.RecNo<=0) OR (QFactor.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmExportFactor.BtnDelClick(Sender: TObject);
begin
    IF ((QFactor.RecNo<=0) OR (QFactor.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    qDelete.Close;
    QDelete.Parameters.ParamByName('FactorNumber').Value := QFactor['FactorNumber'];
    QDelete.ExecSQL;
    QFactor.Close;
    QFactor.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmExportFactor.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmExportFactor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QFactor.Close;
end;

procedure TfrmExportFactor.btnSearchClick(Sender: TObject);
var
    strFilter : String;
begin
    If edtSFactorNumber.Text <> '' then
        strFilter := ' FactorNumber = '+edtSFactorNumber.Text;

    if edtStartDate.Text <> '1   /  /  ' then
        if strFilter <> '' then
            strFilter := strFilter + 'and Date >= '+QuotedStr(edtStartDate.Text)
        else
            strFilter := 'Date >= '+ QuotedStr(edtStartDate.Text);

    if edtEndDate.Text <> '1   /  /  ' then
        if strFilter <> '' then
            strFilter := strFilter + 'and Date <= '+ QuotedStr(edtEndDate.Text)
        else
            strFilter := 'Date >= '+ QuotedStr(edtEndDate.Text);

    if edtSNumberOfCustomer.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and NumberOfCustomer ='+edtSNumberOfCustomer.Text
        else
            strFilter := ' NumberOfCustomer ='+edtSNumberOfCustomer.Text;

    if edtSTo.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and To like ''%'+edtSTo.Text+'%'''
        else
            strFilter := strFilter + ' To like ''%'+edtSTo.Text+'%''';

    QFactor.Close;
    QFactor.SQL.Clear;
    QFactor.SQL.Add('select * from TReceptionFactor');
    if strFilter <> '' then
        QFactor.SQL.Add('where '+strFilter);
    QFactor.SQL.Add(' Order by FactorNumber');
    QFactor.Open;
end;

procedure TfrmExportFactor.BtnPrintClick(Sender: TObject);
var
  sumPrice : integer;
begin
    Application.CreateForm(TqrExportFactor, qrExportFactor);
    With qrExportFactor do
    begin
        if QFactor['NumberOfAdult'] <= 0 then
        begin
            lblAdult.Caption := '';
            lblNumberOfAdult.Caption := '';
            lblAdultPrice.Caption := '';
            lblSumAdult.Caption := '';
        end
        else
        begin
            lblNumberOfAdult.Caption := IntToStr(QFactor['NumberOfAdult']);
            lblAdultPrice.Caption := IntToStr(QFactor['AdultPrice']);
            lblSumAdult.Caption := FormatFloat('#,', QFactor['NumberOfAdult']*QFactor['AdultPrice']);
        end;

        if QFactor['NumberOfChild'] <= 0 then
        begin
            lblChild.Caption := '';
            lblNumberOfChild.Caption := '';
            lblChildPrice.Caption := '';
            lblSumChild.Caption := '';
        end
        else
        begin
            lblNumberOfChild.Caption := IntToStr(QFactor['NumberOfChild']);
            lblChildPrice.Caption := FormatFloat('#,', QFactor['ChildPrice']);
            lblSumChild.Caption := FormatFloat('#,', QFactor['NumberOfChild']*QFactor['ChildPrice']);
        end;

        if QFactor['Credit'] <= 0 then
        begin
            lblCredit.Caption := '';
            lblNumberOfCredit.Caption := '';
            lblCreditPrice.Caption := '';
            lblSumCredit.Caption := '';
        end
        else
        begin
            lblNumberOfCredit.Caption := '1';
            lblCreditPrice.Caption := FormatFloat('#,', QFactor['Credit']);
            lblSumCredit.Caption := lblCreditPrice.Caption;
        end;
        sumPrice := (QFactor['NumberOfAdult']*QFactor['AdultPrice']) +
                    (QFactor['NumberOfChild']*QFactor['ChildPrice']) +
                    (QFactor['Credit']);
        lblSum1.Caption :=  FormatFloat('#,', sumPrice);
        lblDiscount.Caption := FormatFloat('#,', 6*sumPrice/100);
        lblSum2.Caption := FormatFloat('#,', sumPrice - (6*sumPrice/100));
        lblTax.Caption := lblDiscount.Caption;
        lblSum.Caption := lblSum1.Caption;
        lblCustomerName.Caption := QFactor['To'];
        lblFactorNumber.Caption  := QFactor['FactorNumber'];
        lblFactorDate.Caption := QFactor['FactorDate'];
        lblToLetter.Caption := Number2Str(IntToStr(sumPrice));
    end;
    qrExportFactor.Preview;
    FreeAndNil(qrExportFactor);
end;

end.
