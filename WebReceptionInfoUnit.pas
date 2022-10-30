unit WebReceptionInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmWebReceptionInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QWebReception: TADOQuery;
    dsWebReception: TDataSource;
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
  frmWebReceptionInfo: TfrmWebReceptionInfo;

implementation
uses DMUnit;
{$R *.dfm}
procedure TfrmWebReceptionInfo.FormCreate(Sender: TObject);
begin
    QWebReception.Close;
    QWebReception.Parameters.ParamByName('Title').Value:='%%';
    QWebReception.Open;
end;

procedure TfrmWebReceptionInfo.edtSearchChange(Sender: TObject);
begin
    QWebReception.Close;
    QWebReception.Parameters.ParamByName('Title').Value:='%'+edtSearch.Text+'%';
    QWebReception.Open;
end;

procedure TfrmWebReceptionInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmWebReceptionInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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
