unit qrGeneralExitFactoryUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrGeneralExitFactory = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape13: TQRShape;
    lblCustomerOrSalerName: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape15: TQRShape;
    QRLabel19: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape22: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape16: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRDBText9: TQRDBText;
    QRShape21: TQRShape;
    QRDBText10: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    lblSumFactors: TQRLabel;
    QRLabel16: TQRLabel;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCustomerOrSaleID: TQRLabel;
    lblCustomerOrSalerNameTitle: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lblCurrentDate: TQRLabel;
    lblCustomerID: TQRLabel;
    lblCustomerName: TQRLabel;
    lblKalaID: TQRLabel;
    lblKalaName: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    QRLabel4: TQRLabel;
    lblStartFactorID: TQRLabel;
    QRLabel17: TQRLabel;
    lblEndFactorID: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr2: TQRExpr;
  private

  public

  end;

var
  qrGeneralExitFactory: TqrGeneralExitFactory;

implementation

uses ExitFactoryReportUnit;

{$R *.DFM}

end.
