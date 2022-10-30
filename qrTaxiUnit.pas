unit qrTaxiUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrTaxi = class(TQuickRep)
    TitleBand1: TQRBand;
    QRShape3: TQRShape;
    lblCoName: TQRLabel;
    QRLabel3: TQRLabel;
    lblIssueDate: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    lblDriverName: TQRLabel;
    lblPassenger: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel17: TQRLabel;
    lblUser: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel1: TQRLabel;
    lblDriverMobile: TQRLabel;
    QRLabel11: TQRLabel;
    lblPrice: TQRLabel;
    QRLabel6: TQRLabel;
    lblID: TQRLabel;
    QRLabel2: TQRLabel;
    lblLicensePlate: TQRLabel;
  private

  public

  end;

var
  qrTaxi: TqrTaxi;

implementation

{$R *.DFM}

end.
