unit CustomerInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCustomerInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QCustomer: TADOQuery;
    dsCustomer: TDataSource;
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
  frmCustomerInfo: TfrmCustomerInfo;

implementation
uses CompanyUnit, DMUnit, CustomerUnit;
{$R *.dfm}

procedure TfrmCustomerInfo.FormCreate(Sender: TObject);
begin
    QCustomer.Close;
    QCustomer.Parameters.ParamByName('CustomerName').Value:='%%';
    QCustomer.Open;
end;

procedure TfrmCustomerInfo.edtSearchChange(Sender: TObject);
begin
    QCustomer.Close;
    QCustomer.Parameters.ParamByName('CustomerName').Value:='%'+edtSearch.Text+'%';
    QCustomer.Open;
end;

procedure TfrmCustomerInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCustomerInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCustomerInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCustomer, frmCustomer);
    frmCustomer.ShowModal;
    FreeAndNil(frmCustomer);
    QCustomer.Close;
    QCustomer.Open;
end;

end.
