unit qrReceptionWithCard;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  TreReceptionWithCard = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCurrentDate: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape12: TQRShape;
    qReceptionWithCard: TADOQuery;
    QRExpr1: TQRExpr;
    lblCode: TQRDBText;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape14: TQRShape;
    lblBargainNumber: TQRDBText;
    lblCompanyName: TQRDBText;
    lblCardID: TQRDBText;
    lblPriceForReception: TQRDBText;
    lblBasePrice: TQRDBText;
    QRShape13: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    lblExpireDate: TQRDBText;
    lblCredit: TQRDBText;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    lblUserName: TQRDBText;
    QRShape15: TQRShape;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    lblCustomerName: TQRDBText;
    QRShape20: TQRShape;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
  private

  public

  end;

var

  reReceptionWithCard: TreReceptionWithCard;

implementation

uses GeneralReportUnit;

{$R *.DFM}

end.
