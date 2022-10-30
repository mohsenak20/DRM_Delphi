unit qrReceptionCardPriceUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrReceptionCardPrice = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    lbl1: TQRLabel;
    lblterm_price: TQRLabel;
    lblprice_befor: TQRLabel;
    lblprice_used_befor: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    lbl3: TQRLabel;
    lbl6: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel4: TQRLabel;
    lblCurrentDate: TQRLabel;
    lbl4: TQRLabel;
    lblprice_used_term: TQRLabel;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lblStartDate: TQRLabel;
    lblEndDate: TQRLabel;
    lbl2: TQRLabel;
    lblprice_mod: TQRLabel;
    lbl5: TQRLabel;
    lblprice_in_term: TQRLabel;
    QRShape7: TQRShape;
  private

  public

  end;

var
  qrReceptionCardPrice: TqrReceptionCardPrice;

implementation

{$R *.DFM}

end.
