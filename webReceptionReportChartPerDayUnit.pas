unit webReceptionReportChartPerDayUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DB, ADODB;

type
  TfrmWebReceptionReportChartPerDay = class(TForm)
    Chart1: TChart;
    Series1: TBarSeries;
    QWeb: TADOQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWebReceptionReportChartPerDay: TfrmWebReceptionReportChartPerDay;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmWebReceptionReportChartPerDay.FormCreate(Sender: TObject);
begin
    Series1.Clear;
    Chart1.Series[0].Clear;
    QWeb.Open;
    while (not QWeb.eof) do
    begin
        Series1.Add(QWeb['count'], QWeb['hour'] , clGreen ) ;
        QWeb.Next;

    end;
end;

end.
