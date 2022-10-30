unit HotelSectionInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmHotelSectionInfo = class(TForm)
    DBGrid: TDBGrid;
    QHotelSection: TADOQuery;
    dsHotelSection: TDataSource;
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
  frmHotelSectionInfo: TfrmHotelSectionInfo;

implementation

{$R *.dfm}
procedure TfrmHotelSectionInfo.FormCreate(Sender: TObject);
begin
    QHotelSection.Close;
    QHotelSection.Open;
end;

procedure TfrmHotelSectionInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmHotelSectionInfo.DBGridDblClick(Sender: TObject);
begin
    strKey:='enter';
    Close;
end;


end.
