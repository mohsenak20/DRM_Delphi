unit qrReturnFromExitUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrReturnFromExit = class(TQuickRep)
    TitleBand1: TQRBand;
    QRShape11: TQRShape;
    QRLabel16: TQRLabel;
    lblCoName: TQRLabel;
    QRShape2: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape13: TQRShape;
    QRLabel1: TQRLabel;
  private

  public

  end;

var
  qrReturnFromExit: TqrReturnFromExit;

implementation

uses ManagerUnit;

{$R *.DFM}

end.
