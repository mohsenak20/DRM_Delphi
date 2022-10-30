unit qrUsedListCardUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  TqrUsedCardList = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRShape8: TQRShape;
    QRDBText1: TQRDBText;
    TitleBand1: TQRBand;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCurrentDate: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    qCard: TADOQuery;
  private

  public

  end;

var
  qrUsedCardList: TqrUsedCardList;

implementation

uses DMUnit;

{$R *.DFM}

end.
