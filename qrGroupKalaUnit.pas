unit qrGroupKalaUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrGroupKala = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
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
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
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
    QRLabel5: TQRLabel;
    lblSumToll: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    lblSumDiscount: TQRLabel;
    QRLabel22: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
  private

  public

  end;

var
  qrGroupKala: TqrGroupKala;

implementation

uses GroupKalaUnit, AmareForooshUnit;

{$R *.DFM}

end.
