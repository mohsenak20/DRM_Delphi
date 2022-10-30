unit PosTransactionsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmPosTransactions = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnReturn: TBitBtn;
    Panel2: TPanel;
    Label14: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    dsTrans: TDataSource;
    QTrans: TADOQuery;
    Label2: TLabel;
    edtReceptionId: TEdit;
    edtAmount: TEdit;
    Label5: TLabel;
    edtMobile: TEdit;
    Label6: TLabel;
    edtStartTime: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtEndTime: TEdit;
    Label9: TLabel;
    edtCard: TEdit;
    edtPcPosId: TEdit;
    edtPcPosTitle: TEdit;
    btnPcPos: TBitBtn;
    Label10: TLabel;
    edtSabt: TEdit;
    Label11: TLabel;
    lblSum: TLabel;
    QSum: TADOQuery;
    Label12: TLabel;
    lblCount: TLabel;
    Label13: TLabel;
    edtService_center_id: TEdit;
    edtService_center: TEdit;
    btnService_center: TBitBtn;
    Label15: TLabel;
    edtPSPID: TEdit;
    edtPSPTitle: TEdit;
    btnPSP: TBitBtn;
    chbOk: TCheckBox;
    cboAccount: TComboBox;
    Label16: TLabel;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPcPosClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnService_centerClick(Sender: TObject);
    procedure btnPSPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPosTransactions: TfrmPosTransactions;

implementation

uses DMUnit, CalculatUnit, PcPosInfoUnit, UserInfoUnit,
  ServiceCenterInfoUnit, PSPInfoUnit;

{$R *.dfm}

procedure TfrmPosTransactions.BBtnAcceptClick(Sender: TObject);
var
  strFilter: string;
begin
  strFilter := 'tranDate >= '+QuotedStr(edtStartDate.Text)+' and TranDate <= '+QuotedStr(edtEndDate.Text);
  if edtStartTime.Text <> '' then
      strFilter := strFilter + ' and tranTime >= '+QuotedStr(edtStartTime.Text);
  if edtEndTime.Text <> '' then
      strFilter := strFilter + ' and tranTime <= '+QuotedStr(edtEndTime.Text);

  if edtReceptionId.Text <> '' then
      strFilter := strFilter + ' and receptionID = '+edtReceptionId.Text;

  if edtAmount.Text <> '' then
      strFilter := strFilter + ' and amount = '+edtAmount.Text;

  if edtMobile.Text <> '' then
      strFilter := strFilter + ' and mobile = '+QuotedStr(edtMobile.Text);

  if edtCard.Text <> '' then
      strFilter := strFilter + ' and card = '+QuotedStr(edtCard.Text);

  if edtPcPosId.Text <> '' then
      strFilter := strFilter + ' and TPcPos.id = '+edtPcPosId.Text;

  if edtUserID.Text <> '' then
      strFilter := strFilter + ' and TPosTransactions.userID  = '+edtUserID.Text;

  if edtSabt.Text <> '' then
      strFilter := strFilter + ' and sabt = '+QuotedStr(edtSabt.Text);

  if edtPSPID.Text <> '' then
      strFilter := strFilter + ' and pspId = '+(edtPSPID.Text);

  if edtService_center_id.Text <> '' then
      strFilter := strFilter + ' and TUser.service_center_id = '+QuotedStr(edtService_center_id.Text);

  
  if chbOk.Checked then
     strFilter := strFilter + ' and errorCode = ''00''';

  if cboAccount.Text <> '' then
      strFilter := strFilter + ' and account = '+QuotedStr(cboAccount.Text);

  QTrans.Close;
  QTrans.SQL.Clear;
  QTrans.SQL.Add('select TPosTransactions.id, errorMessage, account, bank, card, serial, terminal,');
  QTrans.SQL.Add('sabt, tranDate, tranTime, errorCode, amount, TPosTransactions.receptionID, posID, TPosTransactions.mobile, title, ClosedID,');
  QTrans.SQL.Add('UserName from TPosTransactions inner join TPcPos on TPosTransactions.posID = TPcPos.id');
  QTrans.SQL.Add('left outer join TReception on TPosTransactions.receptionID = TReception.ReceptionID');
  QTrans.SQL.Add('inner join Tuser on TPosTransactions.userID = TUser.UserID');
  QTrans.SQL.Add('where '+strFilter);
  QTrans.Open;

  QSum.Close;
  QSum.SQL.Clear;
  QSum.SQL.Add('select sum(cast(amount as bigint)) sumAmount, count(TPosTransactions.id) count');
  QSum.SQL.Add('from TPosTransactions inner join TPcPos on TPosTransactions.posID = TPcPos.id');
  QSum.SQL.Add('inner join Tuser on TPosTransactions.userID = TUser.UserID');
  QSum.SQL.Add('where '+strFilter+' and errorCode = ''00''');
  QSum.Open;

  if QSum['sumAmount'] <> null then
      lblSum.Caption := FormatFloat('#,', QSum['sumAmount'])
  else
      lblSum.Caption := '';

  if QSum['count'] <> null then
      lblCount.Caption := FormatFloat('#,', QSum['count'])
  else
      lblCount.Caption := '';

end;

procedure TfrmPosTransactions.FormCreate(Sender: TObject);
begin
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
    lblSum.Caption := '';
    lblCount.Caption := '';
end;

procedure TfrmPosTransactions.btnPcPosClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPcPosInfo, frmPcPosInfo);
    frmPcPosInfo.ShowModal;
    if frmPcPosInfo.strKey='enter' then
    begin
        edtPcPosId.Text:=frmPcPosInfo.QPcPos['id'];
        edtPcPosTitle.Text:=frmPcPosInfo.QPcPos['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmPcPosInfo);
end;

procedure TfrmPosTransactions.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

procedure TfrmPosTransactions.btnService_centerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmService_center_info, frmService_center_info);
    frmService_center_info.ShowModal;
    if frmService_center_info.strKey='enter' then
    begin
        edtService_center_id.Text:=frmService_center_info.QService_center['id'];
        edtService_center.Text:=frmService_center_info.QService_center['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmService_center_info);
end;

procedure TfrmPosTransactions.btnPSPClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPSPInfo, frmPSPInfo);
    frmPSPInfo.ShowModal;
    if frmPSPInfo.strKey='enter' then
    begin
        edtPSPID.Text:=frmPSPInfo.QPSP['id'];
        edtPSPTitle.Text:=frmPSPInfo.QPSP['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmPSPInfo);
end;

end.
