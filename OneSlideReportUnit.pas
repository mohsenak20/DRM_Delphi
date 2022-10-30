unit OneSlideReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, Grids, DBGrids, Buttons;

type
  TfrmOneSlidesReport = class(TForm)
    Grid: TDBGrid;
    Panel1: TPanel;
    QSlide: TADOQuery;
    dsSlide: TDataSource;
    edtLockerNumber: TEdit;
    Label1: TLabel;
    BBtnAccept: TBitBtn;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure GridTitleClick(Column: TColumn);
    procedure GridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }

  public
    { Public declarations }
  KalaID : integer;
  ReceptionDate :string;


  end;

var
  frmOneSlidesReport: TfrmOneSlidesReport;


implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmOneSlidesReport.BBtnAcceptClick(Sender: TObject);
begin
    QSlide.Close;
    QSlide.SQL.Clear;
    QSlide.SQL.Add('select TReception.ReceptionID, CustomerName, ClosedID, SUM(Number) Number, COUNT(TFactor.FactorID) Times');
    QSlide.SQL.Add('from TReception inner join TFactor on TReception.ReceptionID = TFactor.ReceptionID');
    QSlide.SQL.Add('inner join TSubFactor on TFactor.FactorID = TSubFactor.FactorID');
    QSlide.SQL.Add('where ProductID = '+IntToStr(KalaID)+' and ReceptionDate = '+QuotedStr(ReceptionDate));
    if edtLockerNumber.Text <> '' then
        QSlide.SQL.Add(' and ClosedID='+edtLockerNumber.Text);
    QSlide.SQL.Add('GROUP BY TReception.ReceptionID, CustomerName, ClosedID');
    QSlide.Open;
end;

procedure TfrmOneSlidesReport.GridTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = 0;
{$J-}
begin

  if Grid.DataSource.DataSet is TCustomADODataSet then
  with TCustomADODataSet(Grid.DataSource.DataSet) do
  begin
    try
      Grid.Columns[PreviousColumnIndex].title.Font.Style :=
      Grid.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];

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
  end;end;

procedure TfrmOneSlidesReport.GridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
  pt: TGridcoord;
begin
   pt:= Grid.MouseCoord(x, y);

  if pt.y=0 then
    Grid.Cursor:=crHandPoint
  else
    Grid.Cursor:=crDefault;
end;

end.
