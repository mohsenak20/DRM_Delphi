unit ServiceCenterInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmService_center_info = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QService_center: TADOQuery;
    dsServiceCenter: TDataSource;
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
  frmService_center_info: TfrmService_center_info;

implementation

uses DMUnit;
{$R *.dfm}
procedure TfrmService_center_info.FormCreate(Sender: TObject);
begin
    QService_center.Close;
    QService_center.Parameters.ParamByName('Title').Value:='%%';
    QService_center.Open;
end;

procedure TfrmService_center_info.edtSearchChange(Sender: TObject);
begin
    QService_center.Close;
    QService_center.Parameters.ParamByName('Title').Value:='%'+edtSearch.Text+'%';
    QService_center.Open;
end;

procedure TfrmService_center_info.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmService_center_info.DBGridKeyDown(Sender: TObject; var Key: Word;
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
