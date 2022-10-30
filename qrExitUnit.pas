unit qrExitUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqrExit = class(TQuickRep)
    TitleBand1: TQRBand;
    lblCoName: TQRLabel;
    QRLabel2: TQRLabel;
    lblReceptionID: TQRLabel;
    QRLabel4: TQRLabel;
    lblKeyNumber: TQRLabel;
    QRLabel3: TQRLabel;
    lblReceptionDate: TQRLabel;
    QRLabel7: TQRLabel;
    lblStartTime: TQRLabel;
    QRLabel6: TQRLabel;
    lblEndTime: TQRLabel;
    QRLabel5: TQRLabel;
    lblName: TQRLabel;
    QRLabel9: TQRLabel;
    lblCreditMod: TQRLabel;
    QRLabel8: TQRLabel;
    lblReceptionType: TQRLabel;
    lblMessage: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel17: TQRLabel;
    lblUser: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    lblCompanyName: TQRLabel;
    lblCardID: TQRLabel;
    QRLabel1: TQRLabel;
    lblType: TQRLabel;
    QRLabel11: TQRLabel;
    lblCredit: TQRLabel;
    QRShape3: TQRShape;
    lblNumberOfCustomer: TQRLabel;
    lblLockerCode: TQRLabel;
  private

  public

  end;

var
  qrExit: TqrExit;

implementation

{$R *.DFM}

end.
