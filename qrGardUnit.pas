unit qrGardUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrGard = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCustomerOrSaleID: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lblCurrentDate: TQRLabel;
    lblStartTime: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
  private

  public

  end;

var
  qrGard: TqrGard;

implementation

uses GardUnit;

{$R *.DFM}

end.
