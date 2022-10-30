unit qrDailyReportUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrReportDaily = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    SummaryBand1: TQRBand;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCustomerOrSaleID: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lblCurrentDate: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel21: TQRLabel;
    lblCreditTitle: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    lblSumCredit: TQRExpr;
    lblTBK: TQRExpr;
    lblTedadB: TQRExpr;
    QRLabel7: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    lblReception: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape10: TQRShape;
    QRExpr3: TQRExpr;
  private

  public

  end;

var
  qrReportDaily: TqrReportDaily;

implementation

uses DailyReportUnit;

{$R *.DFM}

end.
