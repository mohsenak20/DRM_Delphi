unit RentPoolInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, Buttons, ExtCtrls;

type
  TfrmRentPoolInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QRent: TADOQuery;
    dsRent: TDataSource;
    chbActive: TCheckBox;
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
  frmRentPoolInfo: TfrmRentPoolInfo;

implementation
uses DMUnit;

{$R *.dfm}

procedure TfrmRentPoolInfo.FormCreate(Sender: TObject);
begin
    QRent.Close;
    QRent.Parameters.ParamByName('title').Value:='%%';
    QRent.Open;
end;

procedure TfrmRentPoolInfo.edtSearchChange(Sender: TObject);
begin
    QRent.Close;
    QRent.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QRent.Open;
end;

procedure TfrmRentPoolInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmRentPoolInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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
