unit UniMobileInternetReportt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls;

type
  TfrmInternetMobileReport = class(TForm)
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
    procedure BtnReturnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInternetMobileReport: TfrmInternetMobileReport;

implementation

uses CalculatUnit, webReceptionMobileUnit;

{$R *.dfm}

procedure TfrmInternetMobileReport.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmInternetMobileReport.FormCreate(Sender: TObject);
begin
  edtStartDate.Text := CurrentDate;
  edtEndDate.Text := CurrentDate;
  QInternet.Parameters.ParamByName('startDate').Value := CurrentDate;
  QInternet.Parameters.ParamByName('endDate').Value := CurrentDate;
  QInternet.Open;
end;

procedure TfrmInternetMobileReport.btnSearchClick(Sender: TObject);
begin
  QInternet.Close;
  QInternet.Parameters.ParamByName('startDate').Value := edtStartDate.Text;
  QInternet.Parameters.ParamByName('endDate').Value := edtEndDate.Text;
  QInternet.Open;
end;

procedure TfrmInternetMobileReport.DBGrid1TitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = 0;
{$J-}
begin

  if DBGrid1.DataSource.DataSet is TCustomADODataSet then
  with TCustomADODataSet(DBGrid1.DataSource.DataSet) do
  begin
    try
      DBGrid1.Columns[PreviousColumnIndex].title.Font.Style :=
      DBGrid1.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];

    except
  end;

    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];
    PreviousColumnIndex := Column.Index;

    if (Pos(Column.Field.FieldName, Sort) = 1)
    and (Pos(' DESC', Sort)= 0) then
      Sort := Column.Field.FieldName + ' DESC'
    else
      Sort := Column.Field.FieldName + ' ASC';
  end;
end;

procedure TfrmInternetMobileReport.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
  pt: TGridcoord;
begin
   pt:= DBGrid1.MouseCoord(x, y);

  if pt.y=0 then
    DBGrid1.Cursor:=crHandPoint
  else
    DBGrid1.Cursor:=crDefault;
end;

procedure TfrmInternetMobileReport.DBGrid1DblClick(Sender: TObject);
begin
    if QInternet['mobile'] <> null then
    begin
      Application.CreateForm(TfrmWebRecptionMobile, frmWebRecptionMobile);
      frmWebRecptionMobile.QWebReception.Parameters.ParamByName('mobile').Value := QInternet['mobile'];
      frmWebRecptionMobile.QWebReception.Open;
      frmWebRecptionMobile.ShowModal;
      FreeAndNil(frmWebRecptionMobile);
    end;
end;

end.
