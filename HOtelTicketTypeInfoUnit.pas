unit HOtelTicketTypeInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmHotelTicketTypeInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QHotelTicketType: TADOQuery;
    dsHotelTicketType: TDataSource;
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
  frmHotelTicketTypeInfo: TfrmHotelTicketTypeInfo;

implementation

uses DMUnit;
{$R *.dfm}

procedure TfrmHotelTicketTypeInfo.FormCreate(Sender: TObject);
begin
    QHotelTicketType.Close;
    QHotelTicketType.Parameters.ParamByName('Title').Value:='%%';
    QHotelTicketType.Open;
end;

procedure TfrmHotelTicketTypeInfo.edtSearchChange(Sender: TObject);
begin
    QHotelTicketType.Close;
    QHotelTicketType.Parameters.ParamByName('Title').Value:='%'+edtSearch.Text+'%';
    QHotelTicketType.Open;
end;

procedure TfrmHotelTicketTypeInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmHotelTicketTypeInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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
