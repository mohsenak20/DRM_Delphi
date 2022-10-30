unit GroupKalaUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, ADODB, StdCtrls, Buttons;

type
  TfrmGroupKala = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnPrint: TBitBtn;
    btnReturn: TBitBtn;
    QQroup: TADOQuery;
    dsQroup: TDataSource;
    ExportToExcel: TBitBtn;
    procedure btnReturnClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure CreateForm(strFilter : string; FType : integer);
  end;

var
  frmGroupKala: TfrmGroupKala;
  FactorType : integer;
implementation

uses DMUnit, qrGroupKalaUnit, CalculatUnit, ShareUnit,
  SalesReportUnit, qrFactorsReportUnit;

{$R *.dfm}
Procedure TfrmGroupKala.CreateForm(strFilter : string; FType : integer);
begin


    QQroup.SQL.Clear;
    QQroup.SQL.Add('select KalaID, KalaName, Sum(Number) sumNumber, Sum(TSubFactor.VahedPrice*Number) as sumPrice ');
    QQroup.SQL.Add('from TFactor inner join TSubFactor on TFactor.FactorID=TSubFactor.FactorID');
    QQroup.SQL.Add('inner join TReception on TFactor.ReceptionID=TReception.ReceptionID');
    QQroup.SQL.Add('inner join TKala on TSubFactor.ProductID=TKala.KalaID');
    QQroup.SQL.Add('where TFactor.Active=1 ');
    if ((UserInfo.userType<>Admin) and (UserInfo.userType<>Acc))  then
        QQroup.SQL.Add(' and TFactor.UserID='+IntToStr(UserInfo.UserID))
    else
        if frmSalesReport.edtUserID.Text<>'' then
            QQroup.SQL.Add(' and TFactor.UserID='+frmSalesReport.edtUserID.Text);
    if strFilter<>'' then
        QQroup.SQL.Add(' and '+strFilter1);
    QQroup.SQL.Add('Group by KalaID, KalaName');
    QQroup.SQL.Add('order by sumNumber');
    QQroup.Open;
end;

procedure TfrmGroupKala.btnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmGroupKala.btnPrintClick(Sender: TObject);
var
sum, SumDiscount, SumToll : LONGLONG;
fID : integer;
begin
    if QQroup['KalaID']=Null then Exit;
    sum:=0;
    SumDiscount:=0;
    SumToll:=0;
    Application.CreateForm(TqrGroupKala, qrGroupKala);
    qrGroupKala.lblCoName.Caption:=Parameter.CoName;
    qrGroupKala.lblCurrentDate.Caption:=CurrentDate;
    if FactorType=1 then
    begin
        qrGroupKala.lblCustomerOrSaleID.Caption:='òœ ›—Ê‘‰œÂ:';
        qrGroupKala.lblCustomerOrSalerNameTitle.Caption:='‰«„ ›—Ê‘‰œÂ:';
    end;
    if frmSalesReport.edtCustomerID.Text<>'' then
    begin
        qrGroupKala.lblCustomerID.Caption:=frmSalesReport.edtCustomerID.Text;
        qrGroupKala.lblCustomerName.Caption:=frmSalesReport.edtCustomerName.Text;
    end
    else
    begin
        qrGroupKala.lblCustomerID.Caption:='';
        qrGroupKala.lblCustomerName.Caption:='';
    end;
    if frmSalesReport.edtKalaID.Text<>'' then
    begin
        qrGroupKala.lblKalaID.Caption:=frmSalesReport.edtKalaID.Text;
        qrGroupKala.lblKalaName.Caption:=frmSalesReport.edtKalaName.Text;
    end
    else
    begin
        qrGroupKala.lblKalaID.Caption:='';
        qrGroupKala.lblKalaName.Caption:='';
    end;
    if frmSalesReport.edtStartDate.Text<>'1   /  /  ' then
        qrGroupKala.lblStartDate.Caption:=frmSalesReport.edtStartDate.Text
    else
        qrGroupKala.lblStartDate.Caption:='';
    if frmSalesReport.edtEndDate.Text<>'1   /  /  ' then
        qrGroupKala.lblEndDate.Caption:=frmSalesReport.edtEndDate.Text
    else
        qrGroupKala.lblEndDate.Caption:='';
    if frmSalesReport.edtStartFactorID.Text<>'' then
        qrGroupKala.lblStartFactorID.Caption:=frmSalesReport.edtStartFactorID.Text
    else
        qrGroupKala.lblStartFactorID.Caption:='';
    if frmSalesReport.edtEndFactorID.Text<>'' then
        qrGroupKala.lblEndFactorID.Caption:=frmSalesReport.edtEndFactorID.Text
    else
        qrGroupKala.lblEndFactorID.Caption:='';
    QQroup.First;
    fID:=-1000000;
    while Not(QQroup.Eof) do
    begin
        sum:=sum+QQroup['sumPrice'];
        QQroup.Next;
    end;
    //frmSalesReport.QReport.First;
    qrGroupKala.lblSumFactors.Caption:=FormatFloat('###,', sum);
    if SumToll>0 then
        qrGroupKala.lblSumToll.Caption:=FormatFloat('###,', SumToll)
    else
        qrGroupKala.lblSumToll.Caption:='0';
    if SumDiscount>0 then
        qrGroupKala.lblSumDiscount.Caption:=FormatFloat('###,', SumDiscount)
    else
        qrGroupKala.lblSumDiscount.Caption:='0';
    qrGroupKala.Prepare;
    qrGroupKala.Preview;
    FreeAndNil(qrGroupKala);
end;

procedure TfrmGroupKala.ExportToExcelClick(Sender: TObject);
begin
    ExportToExl(QQroup);
end;

end.
