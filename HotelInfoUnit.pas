unit HotelInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmHotelInfo = class(TForm)
    DBGrid: TDBGrid;
    QHotel: TADOQuery;
    dsRiz: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;


  end;


var
  frmHotelInfo: TfrmHotelInfo;

implementation

uses DMUnit, ProductUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmHotelInfo.FormCreate(Sender: TObject);
begin
    QHotel.Close;
    QHotel.Open;
end;

procedure TfrmHotelInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then
    begin
        strKey:='enter';
        Close;
    end
    else
        if key=27 then
            Close;
end;

procedure TfrmHotelInfo.DBGridDblClick(Sender: TObject);
begin
    strKey:='enter';
    Close;
end;


end.
