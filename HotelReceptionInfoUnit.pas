unit HotelReceptionInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmHotelReceptionInfo = class(TForm)
    DBGrid: TDBGrid;
    dsHotel: TDataSource;
    QHotel: TADOQuery;
    Panel1: TPanel;
    BtnNew: TBitBtn;
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;
  HotelID : integer;
  HotelName: string;
  end;

var
  frmHotelReceptionInfo: TfrmHotelReceptionInfo;

implementation

uses DMUnit, HotelsInfoUnit, HotelreceptionUnit;

{$R *.dfm}

procedure TfrmHotelReceptionInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then
    begin
        strKey:='enter';
        frmHotelsInfo.ReceptionName := QHotel['ReceptionistName'];
        frmHotelsInfo.HotelReceptionID := QHotel['HotelReceptionID'];
        Close;
    end
    else
        if key=27 then
            Close;
end;

procedure TfrmHotelReceptionInfo.FormShow(Sender: TObject);
begin
    QHotel.Close;
    QHotel.Parameters.ParamByName('HotelID').Value:= HotelID;
    QHotel.Open;
end;

procedure TfrmHotelReceptionInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelReception, frmHotelReception);
    frmHotelReception.QReceptionist.Close;
    frmHotelReception.QReceptionist.Parameters.ParamByName('HotelName').Value:='%'+HotelName+'%';
    frmHotelReception.edtSearch.Text := HotelName;
    frmHotelReception.QReceptionist.Open;
    frmHotelReception.ShowModal;
    FreeAndNil(frmHotelReception);
    QHotel.Close;
    QHotel.Open;
end;

end.
