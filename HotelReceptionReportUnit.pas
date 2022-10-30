unit HotelReceptionReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmHotelReceptionReport = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    Panel2: TPanel;
    Label14: TLabel;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    dsHotel: TDataSource;
    QHotel: TADOQuery;
    Label4: TLabel;
    edtHotelID: TEdit;
    edtHotelName: TEdit;
    btnHotel: TBitBtn;
    Label1: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    BitBtn1: TBitBtn;
    QReportHotel: TADOQuery;
    ExportToExcel: TBitBtn;
    btnSummery: TBitBtn;
    QSummery: TADOQuery;
    procedure btnHotelClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
    procedure btnSummeryClick(Sender: TObject);
    procedure QHotelBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHotelReceptionReport: TfrmHotelReceptionReport;

implementation

uses HotelsInfoUnit, DMUnit, qrOrderHotelDailyUnit, CalculatUnit,
  ShareUnit, UserInfoUnit, qrOrderHotelDailyReportUnit;

{$R *.dfm}

procedure TfrmHotelReceptionReport.btnHotelClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelsInfo, frmHotelsInfo);
    frmHotelsInfo.ShowModal;
    if frmHotelsInfo.strKey='enter' then
    begin
        edtHotelID.Text:=frmHotelsInfo.QHotel['HotelID'];
        edtHotelName.Text:=frmHotelsInfo.QHotel['HotelName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmHotelsInfo);
end;

procedure TfrmHotelReceptionReport.BBtnAcceptClick(Sender: TObject);
var
    strFilter1, strFilter2 : string;
begin
    strFilter1 := 'ReceptionDate >= '+QuotedStr(edtStartDate.Text)+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text);
    if edtHotelID.Text <> '' then
        strFilter2 := ' THotel.HotelID = '+edtHotelID.Text;
    if edtUserID.Text <> '' then
        if strFilter2 <> '' then
            strFilter2 := strFilter2 + ' and TReception.UserID = '+edtUserID.Text
        else
            strFilter2 := ' TReception.UserID = '+edtUserID.Text;


    {QHotel.Close;
    QHotel.SQL.Clear;
    QHotel.SQL.Add('Declare @TH table(HotelName	nvarchar(100), Address nvarchar(300), Tel nvarchar(50),');
    QHotel.SQL.Add('NumberOfCustomer int, Mod1 int, HotelID	int, CardCount100 int, CurrentMod	int)');
    QHotel.SQL.Add('declare @StartReceptionID bigint, @EndReceptionID Bigint, @StartReceptionDate char(10), @EndtReceptionDate Char(10)');
    QHotel.SQL.Add('select @StartReceptionID=MIN(ReceptionID), @EndReceptionID = MAX(ReceptionID) from TReception');
    QHotel.SQL.Add('where '+strFilter1);
    QHotel.SQL.Add('INSERT INTO @TH (HotelID, HotelName, Address, Tel, Mod1, NumberOfCustomer)');
    QHotel.SQL.Add('select THotel.HotelID, HotelName, Address, THotel.Tel,');
    QHotel.SQL.Add('(select SUM(THotelReception.Mod1) from THotelReception where HotelID = THotel.HotelID),');
    QHotel.SQL.Add('(select SUM(NumberOfAdult) from TReception inner join TOrderHotel on TReception.ReceptionID = TOrderHotel.ReceptionID');
    QHotel.SQL.Add('inner join THotelReception on TOrderHotel.HotelReceptionID = THotelReception.HotelReceptionID');
    QHotel.SQL.Add('where HotelID = THotel.HotelID and TReception.ReceptionID >= @StartReceptionID and TReception.ReceptionID <= @EndReceptionID and THotel.HotelID <> 982 )');
    QHotel.SQL.Add('from THotel');
    QHotel.SQL.Add('inner join THotelReception on THotel.HotelID = THotelReception.HotelID');
    if strFilter2 <> '' then
    QHotel.SQL.Add(' and '+strFilter2);
    QHotel.SQL.Add('group by THotel.HotelID, HotelName, Address, THotel.Tel');
    QHotel.SQL.Add('order by HotelName');
    QHotel.SQL.Add('update @TH set CardCount100 = (NumberOfCustomer+Mod1) / 30, CurrentMod = NumberOfCustomer+Mod1');
    QHotel.SQL.Add('update @TH set CurrentMod = (NumberOfCustomer+Mod1) - CardCount100*30');
    QHotel.SQL.Add('select * from @TH where CardCount100 > 0');
    QHotel.Open; }



    QReportHotel.Close;
    QReportHotel.SQL.Clear;
    QReportHotel.SQL.Add('declare @StartReceptionID bigint, @EndReceptionID Bigint, @StartReceptionDate char(10), @EndtReceptionDate Char(10)');
    QReportHotel.SQL.Add('select @StartReceptionID=MIN(ReceptionID), @EndReceptionID = MAX(ReceptionID) from TReception');
    QReportHotel.SQL.Add('where '+strFilter1);
    QReportHotel.SQL.Add('select THotelReception.HotelReceptionID, HotelName, CustomerName, SUM(NumberOfAdult) as NumberOfCustomer, THotel.HotelID, StartTime, ReceptionistName');
    QReportHotel.SQL.Add('from TOrderHotel inner join TReception on TOrderHotel.ReceptionID = TReception.ReceptionID');
    QReportHotel.SQL.Add('INNER JOIN THotelReception  on THotelReception.HotelReceptionID = TOrderHotel.HotelReceptionID');
    QReportHotel.SQL.Add('inner join THotel on THotel.HotelID = THotelReception.HotelID');
    QReportHotel.SQL.Add('where TReception.ReceptionID >= @StartReceptionID and TReception.ReceptionID <= @EndReceptionID  and THotel.HotelID <> 982');
    if strFilter2 <> '' then
    QReportHotel.SQL.Add(' and '+strFilter2);
    QReportHotel.SQL.Add('Group by THotelReception.HotelReceptionID, HotelName, THotel.HotelID, CustomerName, StartTime, ReceptionistName');
    QReportHotel.SQL.Add('order by StartTime');
    QReportHotel.Open;




end;

procedure TfrmHotelReceptionReport.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrOrderHotel, qrOrderHotel);
    qrOrderHotel.lblCurrentDate.Caption := edtStartDate.Text;
    qrOrderHotel.lblCoName.Caption := Parameter.CoName;

    qrOrderHotel.Preview;
    FreeAndNil(qrOrderHotel);
end;

procedure TfrmHotelReceptionReport.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

procedure TfrmHotelReceptionReport.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TqrOrderHotelReport, qrOrderHotelReport);
    qrOrderHotelReport.DataSet := QReportHotel;
    qrOrderHotelReport.lblHotelName.DataSet := QReportHotel;
    qrOrderHotelReport.lblNumber.DataSet := QReportHotel;
    qrOrderHotelReport.lblCurrentDate.Caption := edtStartDate.Text;
    qrOrderHotelReport.lblCoName.Caption := Parameter.CoName;
    qrOrderHotelReport.lblUser.Caption := edtUserName.Text;
    qrOrderHotelReport.Preview;
    FreeAndNil(qrOrderHotelReport);
end;

procedure TfrmHotelReceptionReport.ExportToExcelClick(Sender: TObject);
begin
    ExportToExl(QReportHotel);
end;

procedure TfrmHotelReceptionReport.btnSummeryClick(Sender: TObject);
var
    strFilter1, strFilter2 : string;
begin
    strFilter1 := 'ReceptionDate >= '+QuotedStr(edtStartDate.Text)+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text);
    if edtHotelID.Text <> '' then
        strFilter2 := ' THotel.HotelID = '+edtHotelID.Text;
    if edtUserID.Text <> '' then
        if strFilter2 <> '' then
            strFilter2 := strFilter2 + ' and TReception.UserID = '+edtUserID.Text
        else
            strFilter2 := ' TReception.UserID = '+edtUserID.Text;

    QSummery.Close;
    QSummery.SQL.Clear;
    QSummery.SQL.Add('declare @StartReceptionID bigint, @EndReceptionID Bigint, @StartReceptionDate char(10), @EndtReceptionDate Char(10)');
    QSummery.SQL.Add('select @StartReceptionID=MIN(ReceptionID), @EndReceptionID = MAX(ReceptionID) from TReception');
    QSummery.SQL.Add('where '+strFilter1);
    QSummery.SQL.Add('select HotelName, SUM(NumberOfAdult) as NumberOfCustomer, THotel.HotelID, Address, THotel.Tel');
    QSummery.SQL.Add('from TOrderHotel inner join TReception on TOrderHotel.ReceptionID = TReception.ReceptionID');
    QSummery.SQL.Add('INNER JOIN THotelReception  on THotelReception.HotelReceptionID = TOrderHotel.HotelReceptionID');
    QSummery.SQL.Add('inner join THotel on THotel.HotelID = THotelReception.HotelID');
    QSummery.SQL.Add('where TReception.ReceptionID >= @StartReceptionID and TReception.ReceptionID <= @EndReceptionID  and THotel.HotelID <> 982');
    if strFilter2 <> '' then
        QSummery.SQL.Add(' and'+strFilter2);

    QSummery.SQL.Add('Group by HotelName, THotel.HotelID, Address, THotel.Tel');
    QSummery.Open;
    ExportToExl(QSummery);
end;

procedure TfrmHotelReceptionReport.QHotelBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

end.
