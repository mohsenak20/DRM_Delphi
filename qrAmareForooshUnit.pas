unit qrAmareForooshUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrAmareForoosh = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    SummaryBand1: TQRBand;
    lblSum: TQRLabel;
    QRLabel4: TQRLabel;
  private

  public

  end;

var
  qrAmareForoosh: TqrAmareForoosh;

implementation

uses ShopsReportUnit;

{$R *.DFM}

end.
