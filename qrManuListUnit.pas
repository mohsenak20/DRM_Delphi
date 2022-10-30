unit qrManuListUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrMenuList = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel13: TQRLabel;
    PageHeaderBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCustomerOrSalerNameTitle: TQRLabel;
    lblCurrentDate: TQRLabel;
    lblSectionName: TQRLabel;
  private

  public

  end;

var
  qrMenuList: TqrMenuList;

implementation

uses MenuListUnit;

{$R *.DFM}

end.
