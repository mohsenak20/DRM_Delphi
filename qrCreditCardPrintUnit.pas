unit qrCreditCardPrintUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqrCreditCardPrint = class(TQuickRep)
    DetailBand1: TQRBand;
    imgPerson: TQRImage;
    QRImage1: TQRImage;
    lblLastName: TQRLabel;
    lblNID: TQRLabel;
    lblName: TQRLabel;
    lblIssueDate: TQRLabel;
  private

  public

  end;

var
  qrCreditCardPrint: TqrCreditCardPrint;

implementation

{$R *.DFM}

end.
