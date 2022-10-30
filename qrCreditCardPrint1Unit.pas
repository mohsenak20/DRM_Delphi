unit qrCreditCardPrint1Unit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqrCreditCard1 = class(TQuickRep)
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    imgPerson2: TQRImage;
    imgPerson1: TQRImage;
    imgPerson3: TQRImage;
  private

  public

  end;

var
  qrCreditCard1: TqrCreditCard1;

implementation

{$R *.DFM}

end.
