unit qrHotelUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrHotels = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCurrentDate: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
  private

  public

  end;

var
  qrHotels: TqrHotels;

implementation

uses HotelsUnit;

{$R *.DFM}

end.
