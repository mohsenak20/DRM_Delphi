unit ReceptionGroupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TfrmReceptionGroup = class(TForm)
    Panel1: TPanel;
    dsGroup: TDataSource;
    DBGrid1: TDBGrid;
    QGroup: TADOQuery;
    BtnReturn: TBitBtn;
    procedure BtnReturnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReceptionGroup: TfrmReceptionGroup;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmReceptionGroup.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

end.
