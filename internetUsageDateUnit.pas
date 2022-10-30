unit internetUsageDateUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons, Mask;

type
  TfrminternetUsageDate = class(TForm)
    Panel1: TPanel;
    QInternet: TADOQuery;
    dsInternet: TDataSource;
    DBGrid1: TDBGrid;
    Label14: TLabel;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    BtnReturn: TBitBtn;
    Label1: TLabel;
    edtTime: TEdit;
    Label7: TLabel;
    edtService_center_id: TEdit;
    edtService_center: TEdit;
    btnService_center: TBitBtn;
    procedure BtnReturnClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnService_centerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frminternetUsageDate: TfrminternetUsageDate;

implementation

uses DMUnit, CalculatUnit, ServiceCenterInfoUnit;

{$R *.dfm}

procedure TfrminternetUsageDate.BtnReturnClick(Sender: TObject);
begin
    close;
end;

procedure TfrminternetUsageDate.btnSearchClick(Sender: TObject);
begin
    QInternet.Close;
    QInternet.SQL.Clear;
    QInternet.sql.Add('select customerUsageDate, sum(number+child_amount) sum,');
    QInternet.sql.Add('(select sum(number+child_amount) from tfactors where customerUsageDate = tf.customerUsageDate and Used = 1');
    if edtService_center_id.Text <> '' then
        QInternet.SQL.Add(' and service_center_id = '+edtService_center_id.Text);
    QInternet.SQL.Add(') used,');
    QInternet.sql.Add('sum(number+child_amount)-(select sum(number+child_amount) from tfactors where customerUsageDate = tf.customerUsageDate and Used = 1');
    if edtService_center_id.Text <> '' then
        QInternet.SQL.Add(' and service_center_id = '+edtService_center_id.Text);
    QInternet.sql.Add(') reminder');
    QInternet.sql.Add('from tfactors tf');
    QInternet.sql.Add('where customerUsageDate >= '+QuotedStr(edtStartDate.Text)+' and customerUsageDate <= '+QuotedStr(edtEndDate.Text)+'  and convert(char(5), dt, 108) <= '+QuotedStr(edtTime.Text));
    if edtService_center_id.Text <> '' then
        QInternet.SQL.Add(' and service_center_id = '+edtService_center_id.Text);
    QInternet.sql.Add('group by customerUsageDate');
    QInternet.sql.Add('order by customerUsageDate');
    QInternet.Open;
end;

procedure TfrminternetUsageDate.FormCreate(Sender: TObject);
begin
  edtStartDate.Text := CurrentDate;
  edtEndDate.Text := CurrentDate;
end;

procedure TfrminternetUsageDate.btnService_centerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmService_center_info, frmService_center_info);
    frmService_center_info.ShowModal;
    if frmService_center_info.strKey='enter' then
    begin
        edtService_center_id.Text:=frmService_center_info.QService_center['id'];
        edtService_center.Text:=frmService_center_info.QService_center['title'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmService_center_info);
end;

end.
