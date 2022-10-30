unit qrZemanatUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrZemanat = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    lblCoName: TQRLabel;
    lblCoNameDescription: TQRLabel;
    QRLabel9: TQRLabel;
    lblCurrentDate: TQRLabel;
    lblStartDate: TQRLabel;
    QRLabel2: TQRLabel;
    lblEndDate: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape20: TQRShape;
    QRLabel23: TQRLabel;
    DetailBand1: TQRBand;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRExpr1: TQRExpr;
    qrdbtProductName: TQRDBText;
    qrdbtNumber: TQRDBText;
    qrdbtPriceInFactor: TQRDBText;
    qrdbtVahed: TQRDBText;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
  private

  public

  end;

var
  qrZemanat: TqrZemanat;

implementation

uses ZemanatUnit;

{$R *.DFM}

end.
