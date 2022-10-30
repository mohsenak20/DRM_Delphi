unit PosReceptionInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmPosReceptionInfo = class(TForm)
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
  frmPosReceptionInfo: TfrmPosReceptionInfo;

implementation
uses DMUnit;
{$R *.dfm}


procedure TfrmPosReceptionInfo.FormCreate(Sender: TObject);
begin
    QWebReception.Close;
    QWebReception.Parameters.ParamByName('Title').Value:='%%';
    QWebReception.Open;
end;

procedure TfrmPosReceptionInfo.edtSearchChange(Sender: TObject);
begin
    QWebReception.Close;
    QWebReception.Parameters.ParamByName('Title').Value:='%'+edtSearch.Text+'%';
    QWebReception.Open;
end;

procedure TfrmPosReceptionInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPosReceptionInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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
