unit qrCreditCardBargainUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrBargainCreditCard = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    lblCardID: TQRLabel;
    lblName: TQRLabel;
    lblGroupName: TQRLabel;
    QRLabel21: TQRLabel;
    lblNID: TQRLabel;
    lblID: TQRLabel;
    lblDate: TQRLabel;
    lblSessionNumber: TQRLabel;
    QRLabel18: TQRLabel;
    lblPrice: TQRLabel;
    QRLabel7: TQRLabel;
    lblCreditGroupID: TQRLabel;
  private

  public

  end;

var
  qrBargainCreditCard: TqrBargainCreditCard;

implementation

{$R *.DFM}

end.
