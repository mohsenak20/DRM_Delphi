unit qrSmallMenuFactorUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrSmallMenuFactor = class(TQuickRep)
    TitleBand1: TQRBand;
    lblCoNameAndAddress: TQRLabel;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    lblKalaName: TQRDBText;
    lblNumber: TQRDBText;
    lblVahedPrice: TQRDBText;
    lblSumRow: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape15: TQRShape;
    lblMessage: TQRLabel;
    lblSum: TQRLabel;
    lblToll: TQRLabel;
    lblEndSum: TQRLabel;
    lblMod: TQRLabel;
    lblCustomerName: TQRLabel;
    lblTime: TQRLabel;
    lblReceptionDate: TQRDBText;
    lblSerialNumber: TQRDBText;
    QRLabel16: TQRLabel;
    lblUserName: TQRLabel;
    QRShape16: TQRShape;
    QRLabel17: TQRLabel;
    lblDiscount: TQRLabel;
    QRLabel18: TQRLabel;
    lblLocker: TQRLabel;
    QRShape17: TQRShape;
    QRLabel14: TQRLabel;
    lblRePrint: TQRLabel;
  private

  public

  end;

var
  qrSmallMenuFactor: TqrSmallMenuFactor;

implementation

uses MenuUnit;

{$R *.DFM}

end.
