unit qrAddOnServicesUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrAddOnServices = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    TitleBand1: TQRBand;
    lblCoNameAndAddress: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    lblKeyNumber: TQRLabel;
    lblCustomerName: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    lblReceptionID: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRExpr1: TQRExpr;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape10: TQRShape;
    lblMessage: TQRLabel;
  private

  public

  end;

var
  qrAddOnServices: TqrAddOnServices;

implementation

uses AddOnServicesUnit;

{$R *.DFM}

end.
