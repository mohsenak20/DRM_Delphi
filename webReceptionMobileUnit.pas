unit webReceptionMobileUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB;

type
  TfrmWebRecptionMobile = class(TForm)
    dsWebReception: TDataSource;
    QWebReception: TADOQuery;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWebRecptionMobile: TfrmWebRecptionMobile;

implementation

uses DMUnit;

{$R *.dfm}

end.
