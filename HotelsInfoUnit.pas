unit HotelsInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmHotelsInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QHotel: TADOQuery;
    dsHotel: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey, ReceptionName : string;
  HotelReception : integer;
  HotelReceptionID : integer;
  end;

var
  frmHotelsInfo: TfrmHotelsInfo;

implementation
uses DMUnit, HotelsUnit, Math, HotelReceptionInfoUnit;

{$R *.dfm}
procedure TfrmHotelsInfo.FormCreate(Sender: TObject);
begin
    HotelReception := -1;
    HotelReceptionID := -1;
    QHotel.Close;
    QHotel.Parameters.ParamByName('HotelName').Value:='%%';
    QHotel.Open;
end;

procedure TfrmHotelsInfo.edtSearchChange(Sender: TObject);
begin
    QHotel.Close;
    QHotel.Parameters.ParamByName('HotelName').Value:='%'+edtSearch.Text+'%';
    QHotel.Open;
end;

procedure TfrmHotelsInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmHotelsInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then
    begin
        strKey:='enter';
        If HotelReception = 1 then
        begin
            Application.CreateForm(TfrmHotelReceptionInfo, frmHotelReceptionInfo);
            frmHotelReceptionInfo.HotelName := QHotel['HotelName'];
            frmHotelReceptionInfo.HotelID := QHotel['HotelID'];
            frmHotelReceptionInfo.ShowModal;
            FreeAndNil(frmHotelReceptionInfo);
        end;
        Close;
    end
    else
        if key=27 then
            Close;
end;

procedure TfrmHotelsInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotels, frmHotels);
    frmHotels.ShowModal;
    FreeAndNil(frmHotels);
    QHotel.Close;
    QHotel.Open;
end;

end.
