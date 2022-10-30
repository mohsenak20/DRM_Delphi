unit ShiftInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmShiftInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QShift: TADOQuery;
    dsShift: TDataSource;
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
  strKey : string;
  end;

var
  frmShiftInfo: TfrmShiftInfo;

implementation
uses DMUnit, ManageShiftsUnit;
{$R *.dfm}


procedure TfrmShiftInfo.FormCreate(Sender: TObject);
begin
    QShift.Close;
    QShift.Parameters.ParamByName('title').Value:='%%';
    QShift.Open;
end;

procedure TfrmShiftInfo.edtSearchChange(Sender: TObject);
begin
    QShift.Close;
    QShift.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QShift.Open;
end;

procedure TfrmShiftInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmShiftInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmShiftInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmManageShift, frmManageShift);
    frmManageShift.ShowModal;
    FreeAndNil(frmManageShift);
    QShift.Close;
    QShift.Open;
end;
end.
