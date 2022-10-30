unit qrResturentDailyReportUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrDailyReportResturent = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape15: TQRShape;
    DetailBand1: TQRBand;
    QRShape23: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lblCurrentDate: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    lblsumResturent: TQRLabel;
    lblSumCofeeShop: TQRLabel;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    lblSum: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRDBText2: TQRDBText;
    QRShape5: TQRShape;
    lblSumSona: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRDBText3: TQRDBText;
    QRShape7: TQRShape;
    lblSumRevagh: TQRLabel;
  private

  public

  end;

var
  qrDailyReportResturent: TqrDailyReportResturent;

implementation

uses DailyReportUnit;

{$R *.DFM}

end.
