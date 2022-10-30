unit LockerRoominfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmLockerRoomInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QLockerRoom: TADOQuery;
    dsLockerRoom: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;

var
  frmLockerRoomInfo: TfrmLockerRoomInfo;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmLockerRoomInfo.FormCreate(Sender: TObject);
begin
    QLockerRoom.Close;
    QLockerRoom.Parameters.ParamByName('title').Value:='%%';
    QLockerRoom.Open;
end;

procedure TfrmLockerRoomInfo.edtSearchChange(Sender: TObject);
begin
    QLockerRoom.Close;
    QLockerRoom.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QLockerRoom.Open;
end;

procedure TfrmLockerRoomInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=13 then
        DBGrid.SetFocus
    else
        if Key=27 then
        begin
            Close;
        end;
end;

procedure TfrmLockerRoomInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

end.
