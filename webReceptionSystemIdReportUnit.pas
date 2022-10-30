unit webReceptionSystemIdReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls;

type
  TfrmWebReceptionSystemIdReport = class(TForm)
    Panel1: TPanel;
    BtnReturn: TBitBtn;
    DBGrid1: TDBGrid;
    Label14: TLabel;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    QInternet: TADOQuery;
    dsInternet: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWebReceptionSystemIdReport: TfrmWebReceptionSystemIdReport;

implementation

{$R *.dfm}

end.
