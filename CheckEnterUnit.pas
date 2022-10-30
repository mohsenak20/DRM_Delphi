unit CheckEnterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TfrmCheckEnter = class(TForm)
    DBGrid1: TDBGrid;
    QEnter: TADOQuery;
    dsEnter: TDataSource;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheckEnter: TfrmCheckEnter;

implementation

uses DMUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmCheckEnter.Timer1Timer(Sender: TObject);
begin
    QEnter.Close;
    QEnter.Open;
end;

procedure TfrmCheckEnter.FormCreate(Sender: TObject);
begin
    QEnter.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QEnter.Open;
end;

end.
