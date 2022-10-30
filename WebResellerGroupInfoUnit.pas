unit WebResellerGroupInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmWebResellerGroup = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;

var
  frmWebResellerGroup: TfrmWebResellerGroup;

implementation
uses DMUnit;
{$R *.dfm}

procedure TfrmWebResellerGroup.FormCreate(Sender: TObject);
begin
    QWebResellers.Close;
    QWebResellers.Parameters.ParamByName('name').Value:='%%';
    QWebResellers.Open;
end;

procedure TfrmWebResellerGroup.edtSearchChange(Sender: TObject);
begin
    QWebResellers.Close;
    QWebResellers.Parameters.ParamByName('name').Value:='%'+edtSearch.Text+'%';
    QWebResellers.Open;
end;

procedure TfrmWebResellerGroup.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmWebResellerGroup.DBGridKeyDown(Sender: TObject; var Key: Word;
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
