unit qrSellUni;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrSell = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape13: TQRShape;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRShape9: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRDBText6: TQRDBText;
    QRShape10: TQRShape;
    QRDBText7: TQRDBText;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCurrentDate: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRLabel8: TQRLabel;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText12: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    lblNumber: TQRLabel;
    lblPrice: TQRLabel;
  private

  public

  end;

var
  qrSell: TqrSell;

implementation

uses SellUnit;

{$R *.DFM}

end.
