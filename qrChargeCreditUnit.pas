unit qrChargeCreditUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrChargeCredit = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    lblReceptionID: TQRLabel;
    lblKeyNumber: TQRLabel;
    lblNewCharge: TQRLabel;
    QRLabel6: TQRLabel;
    lblUserName: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
  private

  public

  end;

var
  qrChargeCredit: TqrChargeCredit;

implementation

{$R *.DFM}

end.
