unit qrBargainUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrBargain = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    TitleBand1: TQRBand;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCurrentDate: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    SummaryBand1: TQRBand;
  private

  public

  end;

var
  qrBargain: TqrBargain;

implementation

uses ViewBargainUnit;

{$R *.DFM}

end.
