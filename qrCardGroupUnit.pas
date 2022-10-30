unit qrCardGroupUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  TqrCardGroup = class(TQuickRep)
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
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCustomerOrSalerNameTitle: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lblCurrentDate: TQRLabel;
    lblUserName: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QCardPrint: TADOQuery;
  private

  public

  end;

var
  qrCardGroup: TqrCardGroup;

implementation

uses ViewReceptionUnit;

{$R *.DFM}

end.
