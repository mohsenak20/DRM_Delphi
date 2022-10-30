unit SpecialCreditCardReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSpecialCreditCardReport = class(TForm)
    QReport: TADOQuery;
    DBGrid1: TDBGrid;
    dsReport: TDataSource;
    Panel1: TPanel;
    BtnSave: TBitBtn;
    BtnReturn: TBitBtn;
    procedure BtnReturnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSpecialCreditCardReport: TfrmSpecialCreditCardReport;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmSpecialCreditCardReport.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

end.
