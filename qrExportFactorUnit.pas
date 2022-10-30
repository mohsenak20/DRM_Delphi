unit qrExportFactorUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrExportFactor = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape18: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    lblAdult: TQRLabel;
    lblNumberOfAdult: TQRLabel;
    lblAdultPrice: TQRLabel;
    lblSumAdult: TQRLabel;
    lblChild: TQRLabel;
    lblNumberOfChild: TQRLabel;
    lblChildPrice: TQRLabel;
    lblSumChild: TQRLabel;
    lblCredit: TQRLabel;
    lblNumberOfCredit: TQRLabel;
    lblCreditPrice: TQRLabel;
    lblSumCredit: TQRLabel;
    lblSum1: TQRLabel;
    lblDiscount: TQRLabel;
    lblSum2: TQRLabel;
    lblTax: TQRLabel;
    lblSum: TQRLabel;
    lblToLetter: TQRLabel;
    lblFactorDate: TQRLabel;
    lblFactorNumber: TQRLabel;
    lblCustomerName: TQRLabel;
  private

  public

  end;

var
  qrExportFactor: TqrExportFactor;

implementation

uses ExportFactorUnit;

{$R *.DFM}

end.
