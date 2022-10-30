unit qrFactorPrintUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  TqrFctorPrint = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    DetailBand1: TQRBand;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    lblCustomerName: TQRLabel;
    lblStartTime: TQRLabel;
    QRLabel16: TQRLabel;
    lblEndTime: TQRLabel;
    lblCoNameAndAddress: TQRLabel;
    QRShape1: TQRShape;
    SummaryBand1: TQRBand;
    lblMessage: TQRLabel;
    QSubFactor: TADOQuery;
    lblReceptionDate: TQRLabel;
    lblReceptionID: TQRLabel;
    QRLabel10: TQRLabel;
    lblKeyNumber: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel17: TQRLabel;
    QRShape10: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
  private

  public

  end;

var
  qrFctorPrint: TqrFctorPrint;

implementation

uses DMUnit;

{$R *.DFM}

end.
