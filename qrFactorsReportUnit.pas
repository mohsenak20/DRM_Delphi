unit qrFactorsReportUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrFactorsReport = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCustomerOrSaleID: TQRLabel;
    lblCustomerOrSalerNameTitle: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    lblCurrentDate: TQRLabel;
    lblCustomerID: TQRLabel;
    lblCustomerName: TQRLabel;
    lblKalaID: TQRLabel;
    lblKalaName: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel2: TQRLabel;
    lblSumFactors: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape13: TQRShape;
    lblCustomerOrSalerName: TQRLabel;
    QRShape14: TQRShape;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    lblStartFactorID: TQRLabel;
    QRLabel17: TQRLabel;
    lblEndFactorID: TQRLabel;
    QRLabel5: TQRLabel;
    lblSumToll: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    lblSumDiscount: TQRLabel;
    QRLabel22: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr2: TQRExpr;
  private

  public

  end;

var
  qrFactorsReport: TqrFactorsReport;

implementation

uses SalesReportUnit;

{$R *.DFM}

end.
