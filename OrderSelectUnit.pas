unit OrderSelectUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ExtCtrls, ADODB, StdCtrls, Buttons;

type
  TfrmOrderSelect = class(TForm)
    dsOrder: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label23: TLabel;
    edtAdult: TEdit;
    BtnEnter: TBitBtn;
    Label1: TLabel;
    edtChild: TEdit;
    BtnReturn: TBitBtn;
    QOrder: TADOQuery;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrderSelect: TfrmOrderSelect;

implementation

uses DMUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmOrderSelect.FormShow(Sender: TObject);
begin
    QOrder.Close;
    QOrder.Parameters.ParamByName('CurrentDate').Value := CurrentDate;
    QOrder.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QOrder.Open;
end;

end.

