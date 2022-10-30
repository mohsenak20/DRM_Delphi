unit qrDayReportUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrDayReport = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRDBText5: TQRDBText;
    QRShape6: TQRShape;
    QRDBText6: TQRDBText;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCurrentDate: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr2: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    lblNumber: TQRLabel;
    lblSum: TQRLabel;
  private

  public

  end;

var
  qrDayReport: TqrDayReport;

implementation

uses SellUnit;

{$R *.DFM}

end.
