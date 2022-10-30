unit qrExitReportUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  TqrExitReport = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QSubFactor: TADOQuery;
    QRExpr2: TQRExpr;
    lblReceptionID: TQRLabel;
    lblReceptionDate: TQRLabel;
    lblStartTime: TQRLabel;
    lblEndTime: TQRLabel;
    lblCreditMod: TQRLabel;
    lblKeyNumber: TQRLabel;
    lblName: TQRLabel;
    procedure WinControlFormCreate(Sender: TObject);
  private

  public

  end;

var
  qrExitReport: TqrExitReport;

implementation

uses qrExitReport2Unit, DMUnit, qrExitReport1Unit;

{$R *.DFM}

procedure TqrExitReport.WinControlFormCreate(Sender: TObject);
begin
    Application.CreateForm(TqrExitReport2, qrExitReport2);
    FreeAndNil(qrExitReport2);
end;

end.
