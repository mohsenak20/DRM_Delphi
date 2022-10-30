unit qrOrderHotelDailyReportUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrOrderHotelReport = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    DetailBand1: TQRBand;
    lblHotelName: TQRDBText;
    lblNumber: TQRDBText;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRShape1: TQRShape;
    ReceptionistName: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    PageHeaderBand1: TQRBand;
    lblCurrentDate: TQRLabel;
    QRLabel3: TQRLabel;
    lblReportName: TQRLabel;
    lblCoName: TQRLabel;
    lblUserTotle: TQRLabel;
    lblUser: TQRLabel;
    QRBand1: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
  private

  public

  end;

var
  qrOrderHotelReport: TqrOrderHotelReport;

implementation

uses HotelReceptionReportUnit;

{$R *.DFM}

end.
