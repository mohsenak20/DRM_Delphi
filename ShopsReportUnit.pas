unit ShopsReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmShopsReport = class(TForm)
    Panel1: TPanel;
    Label14: TLabel;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    Panel2: TPanel;
    BtnReturn: TBitBtn;
    DBGrid1: TDBGrid;
    QShops: TADOQuery;
    dsShops: TDataSource;
    BitBtn3: TBitBtn;
    ExportToExcel: TBitBtn;
    QSum: TADOQuery;
    Label19: TLabel;
    lblSum: TLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShopsReport: TfrmShopsReport;

implementation

uses qrAmareForooshUnit, CalculatUnit, ShareUnit, DMUnit;

{$R *.dfm}

procedure TfrmShopsReport.btnSearchClick(Sender: TObject);
begin
    QShops.Close;
    QShops.Parameters.ParamByName('startDate').Value := edtStartDate.Text;
    QShops.Parameters.ParamByName('endDate').Value := edtEndDate.Text;
    QShops.Open;

    QSum.Close;
    QSum.Parameters.ParamByName('startDate').Value := edtStartDate.Text;
    QSum.Parameters.ParamByName('endDate').Value := edtEndDate.Text;
    QSum.Open;
    lblSum.Caption := QSum['AmareForoosh'];
    
end;

procedure TfrmShopsReport.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TqrAmareForoosh, qrAmareForoosh);
    qrAmareForoosh.lblCoName.Caption := Parameter.CoName;
    qrAmareForoosh.lblStartDate.Caption := edtStartDate.Text;
    qrAmareForoosh.lblEndDate.Caption := edtEndDate.Text;
    qrAmareForoosh.lblSum.Caption := QSum['AmareForoosh'];
    
    qrAmareForoosh.DataSet := QShops;
    qrAmareForoosh.Preview;
    FreeAndNil(qrAmareForoosh);

end;

procedure TfrmShopsReport.FormCreate(Sender: TObject);
begin
    lblSum.Caption := '';
end;

end.
