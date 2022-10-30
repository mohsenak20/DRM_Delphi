unit ActiveUserUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmActiveUser = class(TForm)
    dsActiveUser: TDataSource;
    DBGrid1: TDBGrid;
    QActiveUser: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActiveUser: TfrmActiveUser;

implementation

uses DMUnit;

{$R *.dfm}

end.
