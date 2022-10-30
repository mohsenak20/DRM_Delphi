unit PrivateTaxiInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmPrivateTaxiInfo = class(TForm)
    dsPrivateTaxi: TDataSource;
    DBGrid1: TDBGrid;
    TPrivateTaxi: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrivateTaxiInfo: TfrmPrivateTaxiInfo;

implementation

uses DMUnit;

{$R *.dfm}

end.
