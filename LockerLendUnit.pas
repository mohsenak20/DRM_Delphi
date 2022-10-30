unit LockerLendUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB;

type
  TfrmLendLockers = class(TForm)
    QLoclers: TADOQuery;
    DBGrid1: TDBGrid;
    dsLocker: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLendLockers: TfrmLendLockers;

implementation

uses DMUnit;

{$R *.dfm}

end.
