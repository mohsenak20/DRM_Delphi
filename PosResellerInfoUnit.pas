unit PosResellerInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmPosResellerInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QWebResellers: TADOQuery;
    dsWebResellers: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;
  group_id : integer;
  end;

var
  frmPosResellerInfo: TfrmPosResellerInfo;

implementation
uses DMUnit;
{$R *.dfm}

procedure TfrmPosResellerInfo.FormCreate(Sender: TObject);
begin
    group_id := 2;
end;

procedure TfrmPosResellerInfo.edtSearchChange(Sender: TObject);
begin
    QWebResellers.Close;
    QWebResellers.Parameters.ParamByName('name').Value:='%'+edtSearch.Text+'%';
    QWebResellers.Parameters.ParamByName('group_id').Value:= group_id;
    QWebResellers.Open;
end;

procedure TfrmPosResellerInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPosResellerInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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


procedure TfrmPosResellerInfo.FormShow(Sender: TObject);
begin
    QWebResellers.Close;
    QWebResellers.Parameters.ParamByName('name').Value:='%%';
    QWebResellers.Parameters.ParamByName('group_id').Value:= group_id;
    QWebResellers.Open;
end;

end.
