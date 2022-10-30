unit qrCardNumberUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrCardNumber = class(TQuickRep)
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
  private

  public

  end;

var
  qrCardNumber: TqrCardNumber;

implementation

uses CardReportUnit;

{$R *.DFM}

end.
