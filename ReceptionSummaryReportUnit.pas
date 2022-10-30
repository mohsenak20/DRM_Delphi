unit ReceptionSummaryReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmReceptionSummaryReport = class(TForm)
    Panel1: TPanel;
    Label14: TLabel;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    Panel2: TPanel;
    BtnReturn: TBitBtn;
    ExportToExcel: TBitBtn;
    DBGrid1: TDBGrid;
    QSummary: TADOQuery;
    dsSummary: TDataSource;
    Label1: TLabel;
    edtService_center_id: TEdit;
    edtService_center: TEdit;
    btnService_center: TBitBtn;
    procedure BtnReturnClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnService_centerClick(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure ExportToExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReceptionSummaryReport: TfrmReceptionSummaryReport;

implementation

uses DMUnit, ServiceCenterInfoUnit, ShareUnit;

{$R *.dfm}

procedure TfrmReceptionSummaryReport.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmReceptionSummaryReport.btnSearchClick(Sender: TObject);
var
  strFilter : string;
  serviceCenter: string;
begin
    strFilter := 'ReceptionDate >= ' + QuotedStr(edtStartDate.Text) + ' and ReceptionDate <= ' + QuotedStr(edtEndDate.Text);
    if edtService_center_id.Text <> '' then
    begin
      strFilter := strFilter + ' and service_center_id =' + edtService_center_id.Text;
      serviceCenter := ' and service_center_id ='+edtService_center_id.Text;
    end;
    QSummary.Close;
    QSummary.SQL.Clear;
    QSummary.SQL.Add('select receptionDate, sum(cast(price as bigint)) price,');
    QSummary.SQL.Add('(select sum(cast(TCredit.credit as bigint)) from TReception ');
    QSummary.SQL.Add('inner join TCredit on TReception.ReceptionID = TCredit.ReceptionID where  ReceptionDate = TR.ReceptionDate '+serviceCenter+' ) credit,');
    QSummary.SQL.Add('(select sum((cast(NumberOfAdult as bigint)*vahedPrice)+(cast(NumberOfChild as bigint)*child_price)) ');
    QSummary.SQL.Add('from TReception inner join tfactors on TReception.order_id = tfactors.id');
    QSummary.SQL.Add('where ReceptionDate = TR.ReceptionDate '+serviceCenter+' ) intenet,');
    QSummary.SQL.Add('(select sum(cast(credit as bigint)) from VReceptionCard');
    QSummary.SQL.Add('where ReceptionDate = TR.ReceptionDate and GetMoney = 0 '+serviceCenter+' ) card,');
    QSummary.SQL.Add('(select sum(NumberOfAdult*HotelTickets.adultPrice+NumberOfChild*HotelTickets.childPrice) ');
    QSummary.SQL.Add('from TReception inner join HotelTickets on TReception.hotelTicketId = HotelTickets.id');
    QSummary.SQL.Add('where ReceptionDate = TR.ReceptionDate '+serviceCenter+' ) hotel,');
    QSummary.SQL.Add('(select sum(cast(TSubFactor.Number as bigint)*VahedPrice) from TReception inner join TFactor on TReception.ReceptionID =TFactor.ReceptionID');
    QSummary.SQL.Add('inner join TSubFactor on TFactor.FactorID = TSubFactor.FactorID');
    QSummary.SQL.Add('where ReceptionDate = TR.ReceptionDate '+serviceCenter+' ) receipt');
    QSummary.SQL.Add('from TReception TR');
    QSummary.SQL.Add('where '+strFilter);
    QSummary.SQL.Add('group by ReceptionDate');
    QSummary.SQL.Add('order by ReceptionDate');
    QSummary.Open;
    TFloatField(QSummary.fieldByName('price')).DisplayFormat := '#,';
    TFloatField(QSummary.fieldByName('credit')).DisplayFormat := '#,';
    TFloatField(QSummary.fieldByName('intenet')).DisplayFormat := '#,';
    TFloatField(QSummary.fieldByName('card')).DisplayFormat := '#,';
    TFloatField(QSummary.fieldByName('hotel')).DisplayFormat := '#,';
    TFloatField(QSummary.fieldByName('receipt')).DisplayFormat := '#,';
end;

procedure TfrmReceptionSummaryReport.btnService_centerClick(
  Sender: TObject);
begin
    Application.CreateForm(TfrmService_center_info, frmService_center_info);
    frmService_center_info.ShowModal;
    if frmService_center_info.strKey='enter' then
    begin
        edtService_center_id.Text:=frmService_center_info.QService_center['id'];
        edtService_center.Text:=frmService_center_info.QService_center['title'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmService_center_info);
end;

procedure TfrmReceptionSummaryReport.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if Field.Name = 'price' then
   TFloatField(Field).DisplayFormat := '#,';
end;

procedure TfrmReceptionSummaryReport.ExportToExcelClick(Sender: TObject);
begin
  ExportToExl(QSummary);
end;

end.
