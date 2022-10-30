unit ShiftSammeryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmShiftSammery = class(TForm)
    dsShift: TDataSource;
    DBGrid1: TDBGrid;
    QShift: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShiftSammery: TfrmShiftSammery;

implementation

uses DMUnit;

{$R *.dfm}

end.
