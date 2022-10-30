unit qrEnterOrderUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrEnterOrder = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    lblPersonOrder: TQRLabel;
    lblCustomerName: TQRLabel;
    lblAdult: TQRLabel;
    lblChild: TQRLabel;
    lblComment: TQRLabel;
    lblPrice: TQRLabel;
    lblChildDiscount: TQRLabel;
    lblAdultDiscount: TQRLabel;
    lblOrderID: TQRLabel;
    QRLabel12: TQRLabel;
    lblUser: TQRLabel;
    QRLabel19: TQRLabel;
    lblDate: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape1: TQRShape;
    QRShape11: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    lblTime: TQRLabel;
    lblDiscount: TQRLabel;
  private

  public

  end;

var
  qrEnterOrder: TqrEnterOrder;

implementation

{$R *.DFM}

end.
