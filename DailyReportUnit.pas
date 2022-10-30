unit DailyReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, Grids, DBGrids, ExtCtrls, DB, ADODB;

type
  TfrmDailyReport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Grid: TDBGrid;
    Label14: TLabel;
    edtStartDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    BtnReturn: TBitBtn;
    QDailyReport: TADOQuery;
    dsDailyReport: TDataSource;
    BtnPrint: TBitBtn;
    Label1: TLabel;
    edtEndDate: TMaskEdit;
    SP_DailyReport: TADOStoredProc;
    BitBtn1: TBitBtn;
    QSumResturent: TADOQuery;
    btnShop: TBitBtn;
    SP_Shop: TADOStoredProc;
    QShopReport: TADOQuery;
    QSumSpecial: TADOQuery;
    QSumPrice: TADOQuery;
    ExportToExcel: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    QShop2: TADOQuery;
    procedure BtnReturnClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnShopClick(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDailyReport: TfrmDailyReport;

implementation

uses DMUnit, Math, qrDailyReportUnit, ShareUnit, CalculatUnit,
  qrResturentDailyReportUnit, qrShopUnit, qrAmareForooshUnit;

{$R *.dfm}

procedure TfrmDailyReport.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmDailyReport.BBtnAcceptClick(Sender: TObject);
begin
    //QDailyReport.Close;
    //QDailyReport.Parameters.ParamByName('ReceptionDate').Value:=edtReceptionDate.Text;
    //QDailyReport.Open;
    if UserInfo.WorkSectionID=16 then
    begin
        SP_DailyReport.ProcedureName:='SP_Special_DailyReport;1';
        with SP_DailyReport.Parameters.AddParameter do begin
          DataType := ftWideString;
          Direction := pdInput;
          Name:='@StartDate';
        end;
        with SP_DailyReport.Parameters.AddParameter do begin
          DataType := ftWideString;
          Direction := pdInput;
          Name:='@EndDate';
        end;
    end;

    QDailyReport.Close;
    QDailyReport.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QDailyReport.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    QDailyReport.Open;

end;

procedure TfrmDailyReport.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrReportDaily, qrReportDaily);
    qrReportDaily.lblCoName.Caption:=Parameter.CoName;
    qrReportDaily.lblCurrentDate.Caption:=CurrentDate;
    qrReportDaily.lblStartDate.Caption:=edtStartDate.Text;
    qrReportDaily.lblEndDate.Caption:=edtEndDate.Text;
    //qrReportDaily.lblCard.Caption:=

    if UserInfo.WorkSectionID=16 then
    begin
        QSumSpecial.Close;
        QSumSpecial.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
        QSumSpecial.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
        QSumSpecial.Open;
        //qrReportDaily.lblBozorgsal.Caption:=FloatToStr((QSumSpecial['B']-QSumSpecial['Card'])*150000);
        qrReportDaily.lblReception.Caption:= FloatToStr((QSumSpecial['B']-QSumSpecial['Card'])*150000+QSumSpecial['k']*100000);
        //qrReportDaily.lblCard.Caption:=QSumSpecial['Card'];
        //qrReportDaily.lblCredit.DataField:='';
        qrReportDaily.lblSumCredit.Expression:='';
        qrReportDaily.lblCreditTitle.Caption:='';
    end;
    qrReportDaily.Preview;
    FreeAndNil(qrReportDaily);
end;

procedure TfrmDailyReport.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TqrDailyReportResturent, qrDailyReportResturent);
    qrDailyReportResturent.lblCoName.Caption:=Parameter.CoName;
    qrDailyReportResturent.lblCurrentDate.Caption:=CurrentDate;
    qrDailyReportResturent.lblStartDate.Caption:=edtStartDate.Text;
    qrDailyReportResturent.lblEndDate.Caption:=edtEndDate.Text;

    QSumResturent.Close;
    QSumResturent.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QSumResturent.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    QSumResturent.Open;
    if QSumResturent['SumResturent']<>Null then
        qrDailyReportResturent.lblsumResturent.Caption:=FormatFloat('###,', QSumResturent['SumResturent'])
    else
        qrDailyReportResturent.lblsumResturent.Caption:='0';

    if QSumResturent['SumCofeeShop']<>Null then
        qrDailyReportResturent.lblSumCofeeShop.Caption:=FormatFloat('###,', QSumResturent['SumCofeeShop'])
    else
        qrDailyReportResturent.lblSumCofeeShop.Caption:='0';

    if QSumResturent['SumSona']<>Null then
        qrDailyReportResturent.lblSumSona.Caption:=FormatFloat('###,', QSumResturent['SumSona'])
    else
        qrDailyReportResturent.lblSumSona.Caption:='0';

    if QSumResturent['SumRevagh']<>Null then
        qrDailyReportResturent.lblSumRevagh.Caption:=FormatFloat('###,', QSumResturent['SumRevagh'])
    else
        qrDailyReportResturent.lblSumRevagh.Caption:='0';

    if QSumResturent['SumResturentCofeeShop']<>Null then
        qrDailyReportResturent.lblSum.Caption:=FormatFloat('###,', QSumResturent['SumResturentCofeeShop'])
    else
        qrDailyReportResturent.lblSum.Caption:='0';

    qrDailyReportResturent.Preview;
    FreeAndNil(qrDailyReportResturent);
end;

procedure TfrmDailyReport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmDailyReport.btnShopClick(Sender: TObject);
begin
    QShopReport.Close;
    QShopReport.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QShopReport.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    QShopReport.Open;

    QSumPrice.Close;
    QSumPrice.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QSumPrice.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    QSumPrice.Open;


    Application.CreateForm(TqrShop, qrShop);

    qrShop.lblSumFastFood.Caption := FormatFloat('#,', QSumPrice['SumFastFood']);
    qrShop.lblSumPrice.Caption := FormatFloat('#,',QSumPrice['SumFactor']);
    qrShop.lblSumSport.Caption := FormatFloat('#,',QSumPrice['sumSport']);
    qrShop.lblSumSport1.Caption := FormatFloat('#,',QSumPrice['sumSport1']);
    if (QSumPrice['sumSport2'] <> null) then
      qrShop.lblSumSport2.Caption := FormatFloat('#,',QSumPrice['sumSport2'])
    else
      qrShop.lblSumSport2.Caption := '0';

    if (QSumPrice['sumFastFood2'] <> null) then
      qrShop.lblFastFood2.Caption := FormatFloat('#,',QSumPrice['sumFastFood2'])
    else
      qrShop.lblFastFood2.Caption := '0';

    if (QSumPrice['sumCoffeeShop2'] <> null) then
      qrShop.lblCoffeeShop2.Caption := FormatFloat('#,',QSumPrice['sumCoffeeShop2'])
    else
      qrShop.lblCoffeeShop2.Caption := '0';


    qrShop.lblSumRevagh.Caption := FormatFloat('#,',QSumPrice['sumRevagh']);


    if (QSumPrice['sumSona'] <> null) then
      qrShop.lblSumSona.Caption := FormatFloat('#,',QSumPrice['sumSona'])
    else
      qrShop.lblSumSona.Caption := '0';

    if (QSumPrice['sumPhoto'] <> null) then
      qrShop.lblSumPhoto.Caption := FormatFloat('#,',QSumPrice['sumPhoto'])
    else
      qrShop.lblSumPhoto.Caption := '0';


    if (QSumPrice['sumOrange'] <> null) then
      qrShop.lblSumOrange.Caption := FormatFloat('#,',QSumPrice['sumOrange'])
    else
      qrShop.lblSumOrange.Caption := '0';

    if (QSumPrice['hamamTorkiAghayan'] <> null) then
      qrShop.lblHamamTorkiAghayan.Caption := FormatFloat('#,',QSumPrice['hamamTorkiAghayan'])
    else
      qrShop.lblHamamTorkiAghayan.Caption := '0';

    if (QSumPrice['hamamTorkiBanovan'] <> null) then
      qrShop.lblHamamTorkiBanovan.Caption := FormatFloat('#,',QSumPrice['hamamTorkiBanovan'])
    else
      qrShop.lblHamamTorkiBanovan.Caption := '0';

    qrShop.lblCoName.Caption:=Parameter.CoName;
    qrShop.lblCurrentDate.Caption:=CurrentDate;
    qrShop.lblStartDate.Caption:=edtStartDate.Text;
    qrShop.lblEndDate.Caption:=edtEndDate.Text;
    qrShop.Preview;
    FreeAndNil(qrShop);
end;

procedure TfrmDailyReport.ExportToExcelClick(Sender: TObject);
begin
  ExportToExl(QDailyReport);
end;

procedure TfrmDailyReport.BitBtn2Click(Sender: TObject);
begin
    QShopReport.Close;
    QShopReport.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QShopReport.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    QShopReport.Open;
    ExportToExl(QShopReport);
end;

procedure TfrmDailyReport.BitBtn3Click(Sender: TObject);
begin
    QShop2.Close;
    QShop2.Parameters.ParamByName('startDate').Value := edtStartDate.Text;
    QShop2.Parameters.ParamByName('endDate').Value := edtEndDate.Text;
    QShop2.Open;
    Application.CreateForm(TqrAmareForoosh, qrAmareForoosh);
    qrAmareForoosh.DataSet := QShop2;
    qrAmareForoosh.Preview;
    FreeAndNil(qrAmareForoosh);
end;

end.
