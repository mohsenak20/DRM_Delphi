unit ModCreditReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmModCreditReport = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    Panel2: TPanel;
    Label14: TLabel;
    edtDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    dsModCredit: TDataSource;
    QModCredit: TADOQuery;
    procedure BtnReturnClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModCreditReport: TfrmModCreditReport;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmModCreditReport.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmModCreditReport.BBtnAcceptClick(Sender: TObject);
begin
    QModCredit.Close;
    QModCredit.Parameters.ParamByName('ReceptionDate').Value:=edtDate.Text;
    QModCredit.Open;
end;

end.
