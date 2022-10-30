unit qrLockerPrintUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrLockerPrint = class(TQuickRep)
    TitleBand1: TQRBand;
    lblReceptionDate: TQRLabel;
    QRLabel3: TQRLabel;
    lblReceptionID: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    lblCustomerName: TQRLabel;
    QRLabel5: TQRLabel;
    lblLockerNumber: TQRLabel;
    QRLabel4: TQRLabel;
    lblLockerCode: TQRLabel;
  private

  public

  end;

var
  qrLockerPrint: TqrLockerPrint;

implementation

{$R *.DFM}

end.
