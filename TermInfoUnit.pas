unit TermInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmTermInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    chbActive: TCheckBox;
    DBGrid: TDBGrid;
    QTerm: TADOQuery;
    dsTerm: TDataSource;
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
  frmTermInfo: TfrmTermInfo;

implementation
uses DMUnit;
{$R *.dfm}


procedure TfrmTermInfo.FormCreate(Sender: TObject);
begin
    QTerm.Close;
    QTerm.Parameters.ParamByName('title').Value:='%%';
    QTerm.Open;
end;

procedure TfrmTermInfo.edtSearchChange(Sender: TObject);
begin
    QTerm.Close;
    QTerm.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QTerm.Open;
end;

procedure TfrmTermInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmTermInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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
