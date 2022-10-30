unit qrExitReport2Unit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrExitReport2 = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr2: TQRExpr;
  private

  public

  end;

var
  qrExitReport2: TqrExitReport2;

implementation

uses SabegheMoshtariUnit;

{$R *.DFM}

end.
