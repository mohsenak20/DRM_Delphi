unit OrderCustomerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmOrderCustomer = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QOrderCustomer: TADOQuery;
    dsOrderDiscount: TDataSource;
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
  frmOrderCustomer: TfrmOrderCustomer;

implementation
uses DMUnit,  CalculatUnit;

{$R *.dfm}
procedure TfrmOrderCustomer.FormCreate(Sender: TObject);
begin
    QOrderCustomer.Close;
    QOrderCustomer.Parameters.ParamByName('Title').Value:='%%';
    QOrderCustomer.Open;
end;

procedure TfrmOrderCustomer.edtSearchChange(Sender: TObject);
begin
    QOrderCustomer.Close;
    QOrderCustomer.Parameters.ParamByName('Title').Value:='%'+edtSearch.Text+'%';
    QOrderCustomer.Open;
end;

procedure TfrmOrderCustomer.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmOrderCustomer.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmOrderCustomer.DBGridDblClick(Sender: TObject);
begin
    strKey:='enter';
    Close;
end;

end.
