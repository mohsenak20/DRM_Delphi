unit qrShopUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrShop = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel4: TQRLabel;
    QRShape19: TQRShape;
    QRLabel16: TQRLabel;
    QRShape26: TQRShape;
    QRLabel17: TQRLabel;
    QRShape29: TQRShape;
    QRLabel19: TQRLabel;
    QRShape31: TQRShape;
    DetailBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape25: TQRShape;
    QRDBText14: TQRDBText;
    QRShape27: TQRShape;
    QRDBText15: TQRDBText;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRDBText16: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    lblReportName: TQRLabel;
    QRLabel3: TQRLabel;
    lblCustomerOrSaleID: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lblCurrentDate: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
    QRExpr3: TQRExpr;
    QRShape6: TQRShape;
    QRLabel13: TQRLabel;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRLabel15: TQRLabel;
    QRShape12: TQRShape;
    QRLabel18: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape17: TQRShape;
    QRDBText6: TQRDBText;
    QRExpr9: TQRExpr;
    QRLabel20: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr12: TQRExpr;
    lblSumSport: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape38: TQRShape;
    QRLabel22: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRDBText9: TQRDBText;
    QRShape49: TQRShape;
    QRShape32: TQRShape;
    lblSumPrice: TQRLabel;
    lblSumFastFood: TQRLabel;
    lblSumSport1: TQRLabel;
    lblCoffeeShop2: TQRLabel;
    lblFastFood2: TQRLabel;
    lblSumSport2: TQRLabel;
    lblSumRevagh: TQRLabel;
    QRExpr6: TQRExpr;
    lblSumSona: TQRLabel;
    lblSumPhoto: TQRLabel;
    QRLabel27: TQRLabel;
    lblSumOrange: TQRLabel;
    lblHamamTorkiAghayan: TQRLabel;
    lblHamamTorkiBanovan: TQRLabel;
  private

  public

  end;

var
  qrShop: TqrShop;

implementation

uses DailyReportUnit;

{$R *.DFM}

end.
