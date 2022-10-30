unit OrderTypeInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmOrderTypeInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    dsOrderType: TDataSource;
    QOrderType: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;
  end;

var
  frmOrderTypeInfo: TfrmOrderTypeInfo;


implementation
uses DMUnit, CalculatUnit;


{$R *.dfm}
procedure TfrmOrderTypeInfo.FormCreate(Sender: TObject);
begin
    QOrderType.Parameters.ParamByName('OrderTypeTitle').Value := '%%';
    QOrderType.Open;
end;

procedure TfrmOrderTypeInfo.edtSearchChange(Sender: TObject);
begin
    QOrderType.Close;
    QOrderType.Parameters.ParamByName('OrderTypeTitle').Value := '%'+edtSearch.Text+'%';
    QOrderType.Open;
end;

procedure TfrmOrderTypeInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmOrderTypeInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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



procedure TfrmOrderTypeInfo.DBGridDblClick(Sender: TObject);
begin
    strKey:='enter';
    Close;
end;

end.
