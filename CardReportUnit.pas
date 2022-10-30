unit CardReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask,
  QuickRpt;

type
  TfrmCardReport = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    Panel2: TPanel;
    dsViewBargain: TDataSource;
    Label14: TLabel;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    QCard: TADOQuery;
    QGroupCard: TADOQuery;
    QRCompositeReport: TQRCompositeReport;
    Label12: TLabel;
    edtCompanyID: TEdit;
    edtCompanyName: TEdit;
    btnCompany: TBitBtn;
    Label4: TLabel;
    edtBargainNumber: TEdit;
    procedure BtnReturnClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure QRCompositeReportAddReports(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCompanyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCardReport: TfrmCardReport;

implementation

uses DMUnit, qrCardReportUnit, qrCardNumberUnit, CalculatUnit,
  UnitCompanyInfo;

{$R *.dfm}

procedure TfrmCardReport.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCardReport.BBtnAcceptClick(Sender: TObject);
begin
    QCard.Close;
    QCard.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QCard.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    if edtBargainNumber.Text = '' then
        QCard.Parameters.ParamByName('BargainNumber').Value:= '-1'
    else
        QCard.Parameters.ParamByName('BargainNumber').Value:=edtBargainNumber.Text;

    if edtCompanyID.Text = '' then
        QCard.Parameters.ParamByName('CompanyID').Value:= -1
    else
        QCard.Parameters.ParamByName('CompanyID').Value:=edtCompanyID.Text;
    QCard.Open;

    QGroupCard.Close;
    QGroupCard.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QGroupCard.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    if edtBargainNumber.Text = '' then
        QGroupCard.Parameters.ParamByName('BargainNumber').Value:= '-1'
    else
        QGroupCard.Parameters.ParamByName('BargainNumber').Value:=edtBargainNumber.Text;
    if edtCompanyID.Text = '' then
        QGroupCard.Parameters.ParamByName('CompanyID').Value:= -1
    else
        QGroupCard.Parameters.ParamByName('CompanyID').Value:=edtCompanyID.Text;


    QGroupCard.Open;

end;

procedure TfrmCardReport.QRCompositeReportAddReports(Sender: TObject);
begin
    QRCompositeReport.Reports.Add(qrCardReport);
    QRCompositeReport.Reports.Add(qrCardNumber);
end;

procedure TfrmCardReport.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrCardReport, qrCardReport);
    Application.CreateForm(TqrCardNumber, qrCardNumber);
    qrCardReport.lblCurrentDate.Caption:=edtStartDate.Text;
    QRCompositeReport.Preview;
    FreeAndNil(qrCardNumber);
    FreeAndNil(qrCardReport);
end;

procedure TfrmCardReport.FormShow(Sender: TObject);
begin
    edtStartDate.Text:=CurrentDate;
    edtEndDate.Text:=CurrentDate;
end;

procedure TfrmCardReport.btnCompanyClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCompanyInfo, frmCompanyInfo);
    frmCompanyInfo.ShowModal;
    if frmCompanyInfo.strKey='enter' then
    begin
        edtCompanyID.Text:=frmCompanyInfo.QCompany['CompanyID'];
        edtCompanyName.Text:=frmCompanyInfo.QCompany['CompanyName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmCompanyInfo);
end;

end.
