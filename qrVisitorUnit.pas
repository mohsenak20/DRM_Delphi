unit qrVisitorUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrVisitor = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape13: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCurrentDate: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
  private

  public

  end;

var
  qrVisitor: TqrVisitor;

implementation

uses VisitorInfoUnit, VisitorUnit;

{$R *.DFM}

end.
