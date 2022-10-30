unit SubBargainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmSubBargain = class(TForm)
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtStartCardNumber: TEdit;
    edtEndCardNumber: TEdit;
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
    SP_SubBargain: TADOStoredProc;
    dsSubBargain: TDataSource;
    QSubBargain: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label8: TLabel;
    edtBargainID: TEdit;
    edtCompanyName: TEdit;
    btnBargain: TBitBtn;
    edtCoID: TEdit;
    edtCoName: TEdit;
    btnCo: TBitBtn;
    Label1: TLabel;
    edtBargainNumber: TEdit;
    QDelete: TADOQuery;
    Panel1: TPanel;
    Label2: TLabel;
    edtSBargainID: TEdit;
    edtSCompanyName: TEdit;
    btnSBargain: TBitBtn;
    edtHotelID: TEdit;
    edtHotelName: TEdit;
    btnHotel: TBitBtn;
    Label3: TLabel;
    edtSBargainNumber: TEdit;
    QPrint: TADOQuery;
    QTempForCheck: TADOQuery;
    mnuCheck: TMenuItem;
    BBtnAccept: TBitBtn;
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
    procedure btnBargainClick(Sender: TObject);
    procedure btnCoClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure mnuCheckClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnSBargainClick(Sender: TObject);
    procedure btnHotelClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;


var
  frmSubBargain: TfrmSubBargain;
  StatusRecord:String;
implementation

uses DMUnit, BargainInfoUnit, SubBargainCoInfoUnit, qrSubBargainUnit,
  CalculatUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmSubBargain.SetEnabledDisable(BL:Boolean);
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
        //edtBargainID.Clear;
        //edtBargainNumber.Clear;
        //edtCompanyName.Clear;
        btnCo.SetFocus;
        edtCoID.Clear;
        edtCoName.Clear;
        edtStartCardNumber.Clear;
        edtEndCardNumber.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmSubBargain.LoadSqlQuery;
Begin
    QSubBargain.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmSubBargain.GetValue;
begin
    edtBargainID.Text:=QSubBargain.fieldByName('BargainID').Text;
    edtBargainNumber.Text:=QSubBargain.fieldByName('BargainNumber').Text;
    edtCompanyName.Text:=QSubBargain.fieldByName('CompanyName').Text;
    edtCoID.Text:=QSubBargain.fieldByName('SubBargainCoID').Text;
    edtCoName.Text:=QSubBargain.fieldByName('SubBargainCoName').Text;
    edtStartCardNumber.Text:=QSubBargain.fieldByName('StartCardNumber').Text;
    edtEndCardNumber.Text:=QSubBargain.fieldByName('EndCardNumber').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmSubBargain.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmSubBargain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmSubBargain.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmSubBargain.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmSubBargain.BtnSaveClick(Sender: TObject);
var
  QCheckCardNumber : TADOQuery;
begin
    IF (edtBargainID.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtBargainID.SetFocus;
        Exit;
    End;
    if StatusRecord = 'Insert' then
    begin
        QCheckCardNumber:=TADOQuery.Create(nil);
        QCheckCardNumber.Connection:=DM.ADOConnection;
        QCheckCardNumber.SQL.Text:='select SubBargainID from TSubBargain where StartCardNumber<='+edtStartCardNumber.Text+' and EndCardNumber>='+edtStartCardNumber.Text;
        QCheckCardNumber.SQL.Add(' or StartCardNumber<='+edtEndCardNumber.Text+' and EndCardNumber>='+edtEndCardNumber.Text);
        QCheckCardNumber.Open;
        if QCheckCardNumber['SubBargainID']<>Null then
        begin
            ShowMessage(' œ«Œ· »« —œÌ› '+IntToStr(QCheckCardNumber['SubBargainID']));
            Exit;
        end;
    end;

    SP_SubBargain.Parameters.ParamByName('@SubBargainID').Value:=QSubBargain['SubBargainID'];
    SP_SubBargain.Parameters.ParamByName('@BargainID').Value:=edtBargainID.Text;
    SP_SubBargain.Parameters.ParamByName('@CoID').Value:=edtCoID.Text;
    SP_SubBargain.Parameters.ParamByName('@StartCardNumber').Value:=edtStartCardNumber.Text;
    SP_SubBargain.Parameters.ParamByName('@EndCardNumber').Value:=edtEndCardNumber.Text;
    IF StatusRecord='Insert' then
        SP_SubBargain.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_SubBargain.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_SubBargain.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QSubBargain.Close;
    QSubBargain.Open;
    Grid.SetFocus;
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmSubBargain.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmSubBargain.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmSubBargain.BtnEditClick(Sender: TObject);
begin
    IF (QSubBargain.RecNo<=0) OR (QSubBargain.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmSubBargain.BtnDelClick(Sender: TObject);
begin
    IF ((QSubBargain.RecNo<=0) OR (QSubBargain.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Close;
    QDelete.Parameters.ParamByName('SubBargainID').Value:=QSubBargain['SubBargainID'];
    QDelete.ExecSQL;
    QSubBargain.Close;
    QSubBargain.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmSubBargain.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmSubBargain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QSubBargain.Close;
end;
procedure TfrmSubBargain.btnBargainClick(Sender: TObject);
begin
    Application.CreateForm(TfrmBargainInfo, frmBargainInfo);
    frmBargainInfo.ShowModal;
    if frmBargainInfo.strKey='enter' then
    begin
        edtBargainID.Text:=frmBargainInfo.QBargain['BargainID'];
        edtBargainNumber.Text:=frmBargainInfo.QBargain['BargainNumber'];
        edtCompanyName.Text:=frmBargainInfo.QBargain['CompanyName'];
        btnCo.SetFocus;
    end;
    FreeAndNil(frmBargainInfo);
end;

procedure TfrmSubBargain.btnCoClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSubBargainCoInfo, frmSubBargainCoInfo);
    frmSubBargainCoInfo.ShowModal;
    if frmSubBargainCoInfo.strKey='enter' then
    begin
        edtCoID.Text:=frmSubBargainCoInfo.QSubBargainCo['SubBargainCoID'];
        edtCoName.Text:=frmSubBargainCoInfo.QSubBargainCo['SubBargainCoName'];
        edtStartCardNumber.SetFocus;
    end;
    FreeAndNil(frmSubBargainCoInfo);
end;

procedure TfrmSubBargain.BtnPrintClick(Sender: TObject);
begin
    QPrint.Close;
    if edtSBargainID.Text<>'' then
        QPrint.Parameters.ParamByName('BargainID').Value:=edtSBargainID.Text
    else
        QPrint.Parameters.ParamByName('BargainID').Value:=-1;

    if edtHotelID.Text<>'' then
        QPrint.Parameters.ParamByName('SubBargainCoID').Value:=edtHotelID.Text
    else
        QPrint.Parameters.ParamByName('SubBargainCoID').Value:=-1;

    QPrint.Open;
    Application.CreateForm(TqrSubBargain, qrSubBargain);
    qrSubBargain.lblCurrentDate.Caption:=CurrentDate;
    qrSubBargain.Preview;
    FreeAndNil(qrSubBargain);
end;

procedure TfrmSubBargain.mnuCheckClick(Sender: TObject);
var
  QCheckCardNumber, QCheckSubBargain, QTryAgain : TADOQuery;
begin
    QCheckSubBargain:=TADOQuery.Create(nil);
    QCheckSubBargain.Connection:=DM.ADOConnection;
    QCheckCardNumber:=TADOQuery.Create(nil);
    QCheckCardNumber.Connection:=DM.ADOConnection;
    QTryAgain:=TADOQuery.Create(nil);
    QTryAgain.Connection:=DM.ADOConnection;

    QCheckSubBargain.SQL.Text:='select * from TSubBargain';
    QCheckSubBargain.Open;
    while not QCheckSubBargain.Eof do
    begin
        QCheckCardNumber.SQL.Text:='select SubBargainID from TSubBargain where (StartCardNumber<='+IntToStr(QCheckSubBargain['StartCardNumber'])+' and EndCardNumber>='+IntToStr(QCheckSubBargain['StartCardNumber'])+')';
        QCheckCardNumber.SQL.Add(' or (StartCardNumber<='+IntToStr(QCheckSubBargain['EndCardNumber'])+' and EndCardNumber>='+IntToStr(QCheckSubBargain['EndCardNumber'])+')');
        QCheckCardNumber.SQL.Add(' and SubBargainID<>'+IntToStr(QCheckSubBargain['SubBargainID']));
        QCheckCardNumber.Open;
        while not QCheckCardNumber.Eof do
        begin
            QTryAgain.SQL.Text:='Update TSubBargain set TryAgain=1 where SubBargainID='+IntToStr(QCheckCardNumber['SubBargainID']);
            QTryAgain.ExecSQL;
            QCheckCardNumber.Next;
        end;
        QCheckSubBargain.Next;
    end;
end;

procedure TfrmSubBargain.BBtnAcceptClick(Sender: TObject);
var
    strFilter : string;
begin
  if edtSBargainID.Text<>'' then
      strFilter:=' BargainID ='+edtSBargainID.Text;

  if edtHotelID.Text<>'' then
      if strFilter<>'' then
          strFilter:=strFilter+' and SubBargainCoID = '+edtHotelID.Text
      else
          strFilter:=' SubBargainCoID = '+edtHotelID.Text;

  QSubBargain.Filtered:=False;
  QSubBargain.Filter:=strFilter;
  QSubBargain.Filtered:=True;

end;

procedure TfrmSubBargain.btnSBargainClick(Sender: TObject);
begin
    Application.CreateForm(TfrmBargainInfo, frmBargainInfo);
    frmBargainInfo.ShowModal;
    if frmBargainInfo.strKey='enter' then
    begin
        edtSBargainID.Text:=frmBargainInfo.QBargain['BargainID'];
        edtSBargainNumber.Text:=frmBargainInfo.QBargain['BargainNumber'];
        edtSCompanyName.Text:=frmBargainInfo.QBargain['CompanyName'];
        btnHotel.SetFocus;
    end;
    FreeAndNil(frmBargainInfo);

end;

procedure TfrmSubBargain.btnHotelClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSubBargainCoInfo, frmSubBargainCoInfo);
    frmSubBargainCoInfo.ShowModal;
    if frmSubBargainCoInfo.strKey='enter' then
    begin
        edtHotelID.Text:=frmSubBargainCoInfo.QSubBargainCo['SubBargainCoID'];
        edtHotelName.Text:=frmSubBargainCoInfo.QSubBargainCo['SubBargainCoName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmSubBargainCoInfo);
end;

end.
