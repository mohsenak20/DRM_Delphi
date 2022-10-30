unit LottoryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Grids, DBGrids, ADODB;

type
  TfrmLottory = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    QLottory: TADOQuery;
    DBGrid1: TDBGrid;
    dsLottory: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLottory: TfrmLottory;

implementation

uses DMUnit;

{$R *.dfm}

end.
