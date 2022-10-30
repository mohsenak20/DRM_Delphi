unit qrCashUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrCash = class(TQuickRep)
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    QRLabel6: TQRLabel;
    lblCurrentDate: TQRLabel;
    QRLabel8: TQRLabel;
    lblStartDate: TQRLabel;
    QRLabel9: TQRLabel;
    lblEndDate: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    lblSum: TQRLabel;
    lblToll: TQRLabel;
    lblDiscount: TQRLabel;
    lblNoCash: TQRLabel;
    lblCashMod: TQRLabel;
    QRShape1: TQRShape;
  private

  public

  end;

var
  qrCash: TqrCash;

implementation

{$R *.DFM}

end.
