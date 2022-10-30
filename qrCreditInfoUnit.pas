unit qrCreditInfoUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrCreditInfo = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    lblReceptionID: TQRLabel;
    lblCustomerName: TQRLabel;
    lblKeyNumber: TQRLabel;
    lblAllCharge: TQRLabel;
    QRLabel11: TQRLabel;
  private

  public

  end;

var
  qrCreditInfo: TqrCreditInfo;

implementation

{$R *.DFM}

end.
