unit ReceptionCardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Grids, DBGrids;

type
  TfrmReceptionCard = class(TForm)
    PanelButton: TPanel;
    BtnReturn: TBitBtn;
    DBGrid1: TDBGrid;
    QReceptionCard: TADOQuery;
    dsCard: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReceptionCard: TfrmReceptionCard;

implementation

{$R *.dfm}

end.
