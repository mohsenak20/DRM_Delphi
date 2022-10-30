unit NotIssueExitUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  TqrNotIssueExit = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCurrentDate: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRDBText6: TQRDBText;
    QReception: TADOQuery;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel5: TQRLabel;
  private

  public

  end;

var
  qrNotIssueExit: TqrNotIssueExit;

implementation

uses DMUnit;

{$R *.DFM}

end.
