unit qrOrderHotelDailyUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrOrderHotel = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    DetailBand1: TQRBand;
    lblHotelName: TQRDBText;
    lblNumber: TQRDBText;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRShape1: TQRShape;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape16: TQRShape;
    PageHeaderBand1: TQRBand;
    lblCurrentDate: TQRLabel;
    QRLabel3: TQRLabel;
    lblReportName: TQRLabel;
    lblCoName: TQRLabel;
    QRBand1: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel7: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
  private

  public

  end;

var
  qrOrderHotel: TqrOrderHotel;

implementation

uses HotelReceptionReportUnit;

{$R *.DFM}

end.
