unit GroupByServerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmGroupByServer = class(TForm)
    Panel1: TPanel;
    btnPrint: TBitBtn;
    btnReturn: TBitBtn;
    ExportToExcel: TBitBtn;
    DBGrid1: TDBGrid;
    QQroup: TADOQuery;
    dsQroup: TDataSource;
    procedure btnReturnClick(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure CreateForm(userId : integer; startDate: string; endDate: string);
  end;
var
  frmGroupByServer: TfrmGroupByServer;
  FactorType : integer;

implementation

uses DMUnit, CalculatUnit, ShareUnit;

{$R *.dfm}
Procedure TfrmGroupByServer.CreateForm(userId : integer; startDate: string; endDate: string);
begin
    QQroup.SQL.Clear;
    QQroup.SQL.Add('select TFactor.description server, isNull(Sum(TSubFactor.VahedPrice*Number), 0) as sumPrice');
    QQroup.SQL.Add('from TReception inner join TFactor on TReception.ReceptionID = TFactor.ReceptionID');
    QQroup.SQL.Add('inner join TSubFactor on TFactor.FactorID=TSubFactor.FactorID');
    QQroup.SQL.Add('where ReceptionDate >='+QuotedStr(startDate)+' and ReceptionDate<='+QuotedStr(endDate)+ ' and Tfactor.UserId ='+IntToStr(userId));
    QQroup.SQL.Add('Group by TFactor.description');
    QQroup.SQL.Add('order by TFactor.description');
    QQroup.Open;
end;

procedure TfrmGroupByServer.btnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmGroupByServer.ExportToExcelClick(Sender: TObject);
begin
    ExportToExl(QQroup);
end;
end.
