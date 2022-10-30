unit qrReceptionUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrReception = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    lblCustomerName: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    lblType: TQRLabel;
    lblAmanat: TQRLabel;
    lblCredit: TQRLabel;
    lblReceptionID: TQRLabel;
    lblKeyNumber: TQRLabel;
    lblReceptionTime: TQRLabel;
    lblReceptionDate: TQRLabel;
    lblReceptionType: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    lblLAmanat: TQRLabel;
    QRLabel23: TQRLabel;
    lblLName: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel12: TQRLabel;
  private

  public

  end;

var
  qrReception: TqrReception;

implementation

{$R *.DFM}

end.
