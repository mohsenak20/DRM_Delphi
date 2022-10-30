unit ReturnTicketUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrReturnTicket = class(TQuickRep)
    TitleBand1: TQRBand;
    lblReceptionDate: TQRLabel;
    QRLabel3: TQRLabel;
    lblReceptionID: TQRLabel;
    QRLabel1: TQRLabel;
    lblCustomerName: TQRLabel;
    QRLabel5: TQRLabel;
    lblLockerNumber: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
  private

  public

  end;

var
  qrReturnTicket: TqrReturnTicket;

implementation

{$R *.DFM}

end.
