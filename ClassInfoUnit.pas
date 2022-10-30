unit ClassInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmClassInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QClass: TADOQuery;
    dsClass: TDataSource;
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
  frmClassInfo: TfrmClassInfo;

implementation
uses DMUnit;

{$R *.dfm}

procedure TfrmClassInfo.FormCreate(Sender: TObject);
begin
    QClass.Close;
    QClass.Parameters.ParamByName('title').Value:='%%';
    QClass.Open;
end;

procedure TfrmClassInfo.edtSearchChange(Sender: TObject);
begin
    QClass.Close;
    QClass.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QClass.Open;
end;

procedure TfrmClassInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmClassInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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
