unit GeneralReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, DB, ADODB, Grids, DBGrids;

type
  TfrmGeneralReport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lblStartDate: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    Label4: TLabel;
    Label6: TLabel;
    edtStartTime: TMaskEdit;
    edtEndTime: TMaskEdit;
    BBtnAccept: TBitBtn;
    BtnReturn: TBitBtn;
    lblEndDate: TLabel;
    QReport: TADOQuery;
    dsReport: TDataSource;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    dsDebit: TDataSource;
    QDebit: TADOQuery;
    Panel5: TPanel;
    Label13: TLabel;
    lblSum: TLabel;
    Label1: TLabel;
    lblSumChild: TLabel;
    Label3: TLabel;
    lblSumAdult: TLabel;
    Label14: TLabel;
    lblSumPrice: TLabel;
    Panel6: TPanel;
    Label2: TLabel;
    lblSumDebit: TLabel;
    Label5: TLabel;
    lblAllSum: TLabel;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    Panel8: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    QOrder: TADOQuery;
    dsOrder: TDataSource;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure clearForm();
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeneralReport: TfrmGeneralReport;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmGeneralReport.clearForm();
begin
    lblSumAdult.Caption := '';
    lblSumChild.Caption := '';
    lblSum.Caption := '';
    lblSumPrice.Caption := '';
    lblSumDebit.Caption := '';
end;
procedure TfrmGeneralReport.BBtnAcceptClick(Sender: TObject);
var
strFilter, debitFilter, orderFilter : string;
sumDebit, sumReception: Largeint;
begin
  clearForm;
  sumDebit:=0;
  sumReception:=0;
  strFilter := 'ReceptionDate>='+QuotedStr(edtStartDate.Text)+ ' and ReceptionDate <='+QuotedStr(edtEndDate.Text);
  debitFilter := 'chargeDate>='+QuotedStr(edtStartDate.Text)+' and ChargeDate<='+QuotedStr(edtEndDate.Text);
  orderFilter := 'orderDate>='+QuotedStr(edtStartDate.Text)+' and orderDate<='+QuotedStr(edtEndDate.Text);
  if edtStartTime.Text <> '  :  ' then
    strFilter := strFilter + ' and startTime >='+QuotedStr(edtStartTime.Text);


  if edtEndTime.Text <> '  :  ' then
    strFilter := strFilter + ' and endTime >='+QuotedStr(edtEndTime.Text);





  QReport.Close;
  QReport.SQL.Clear;
  QReport.SQL.Add('select ReceptionTitle, sum(NumberOfAdult)  numberOfAdult, ');
  QReport.SQL.Add('(select sum(NumberOfAdult) from TReception where '+strFilter+') sumNumberOfAdult,');
  QReport.SQL.Add('(select sum(NumberOfChild) from TReception where '+strFilter+') sumNumberOfChild,');
  QReport.SQL.Add('(select sum(NumberOfAdult+NumberOfChild) from TReception where '+strFilter+') sum,');
  QReport.SQL.Add('(select isNull(sum(cast(price as bigint)), 0) from TReception where '+strFilter+') sumPrice');
  QReport.SQL.Add('from TReception inner join TReceptionType on TReception.ReceptionType = TReceptionType.ReceptionTypeID');
  QReport.SQL.Add('where '+strFilter);
  QReport.SQL.Add('group by ReceptionTitle');
  QReport.Open;
  if QReport['sumNumberOfAdult'] <> null then lblSumAdult.Caption := FormatFloat('#,', QReport['sumNumberOfAdult']);
  if QReport['sumNumberOfChild'] <> null then lblSumChild.Caption := FormatFloat('#,', QReport['sumNumberOfChild']);
  if QReport['sum'] <> null then lblSum.Caption := FormatFloat('#,', QReport['sum']);
  if QReport['sumPrice'] <> null then lblSumPrice.Caption := FormatFloat('#,', QReport['sumPrice']);






  QDebit.Close;
  QDebit.SQL.Clear;
  QDebit.SQL.Add('select TCReditGroup.CreditGroupName, sum(cast(TCreditCardCharge.Price as bigint)) price, ');
  QDebit.SQL.Add('(select isNull(sum(cast(price as bigint)), 0) from TCreditCardCharge where '+debitFilter+' ) sumPrice');
  QDebit.SQL.Add('from TCreditCardCharge');
  QDebit.SQL.Add('inner join TCreditCard on TCreditCardCharge.CreditCardID = TCreditCard.CardID');
  QDebit.SQL.Add('inner join TCReditGroup on TCreditCard.CreditGroupID = TCReditGroup.CreditGroupID');
  QDebit.SQL.Add('where '+debitFilter);
  QDebit.SQL.Add('group by TCReditGroup.CreditGroupName');
  QDebit.Open;
  if QDebit['sumPrice'] <> null then lblSumDebit.Caption := FormatFloat('#,', QDebit['sumPrice']);

  if QDebit['sumPrice'] <> null then sumDebit := QDebit['sumPrice'];
  if QReport['sumPrice'] <> null then sumReception := QReport['sumPrice'];
  lblAllSum.Caption := FormatFloat('#,', sumDebit+sumReception);

  QOrder.Close;
  QOrder.SQL.Clear;
  QOrder.SQL.Add('select TOrderType.OrderType, isNull(sum(NumberOfAdult), 0) sumOrderCount');
  QOrder.SQL.Add('from TOrder');
  QOrder.SQL.Add('inner join TOrderType on TOrder.OrderType = TOrderType.id');
  QOrder.SQL.Add('inner join TReception on TOrder.OrderID = TReception.OrderNumber');
  QOrder.SQL.Add('where '+orderFilter);
  QOrder.SQL.Add('group by TOrderType.OrderType');
  QOrder.Open;


end;

procedure TfrmGeneralReport.FormCreate(Sender: TObject);
begin
    clearForm;
end;

end.
