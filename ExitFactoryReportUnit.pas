unit ExitFactoryReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmExitFactoryReport = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    edtKalaID: TEdit;
    edtKalaName: TEdit;
    btnKala: TBitBtn;
    edtPersonID: TEdit;
    edtPersonName: TEdit;
    btnPerson: TBitBtn;
    BBtnAccept: TBitBtn;
    edtStartSerialNumber: TEdit;
    edtEndSerialNumber: TEdit;
    Panel2: TPanel;
    Label7: TLabel;
    lblSum: TLabel;
    btnPrint: TBitBtn;
    btnReturn: TBitBtn;
    btnGroup: TBitBtn;
    btnExportToExcel: TBitBtn;
    dbGrid: TDBGrid;
    QReport: TADOQuery;
    dsReport: TDataSource;
    procedure btnReturnClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnPersonClick(Sender: TObject);
    procedure btnKalaClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnGroupClick(Sender: TObject);
    procedure calcCash();
    procedure edtStartDateExit(Sender: TObject);
    procedure edtEndDateExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExportToExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    StorageType : integer;
    procedure createForm(FactorType : integer);
  end;

var
  frmExitFactoryReport: TfrmExitFactoryReport;
  fType : integer;
  strFilter : string;

implementation

uses DMUnit, InformationUnit,
  CalculatUnit, GroupKalaUnit,
  Math, KalaInfoUnit,
  PersonInfoUnit, GroupKalaStorageUnit, qrGeneralExitFactoryUnit,
  qrGeneralReportUnit;

{$R *.dfm}
procedure TfrmExitFactoryReport.calcCash();
var
SumDiscount, SumToll, NoCash, CashMod, Cash : LONGLONG;
fID : integer;
sum : Real;
begin
    sum:=0;
    SumDiscount:=0;
    SumToll:=0;
    NoCash:=0;
    CashMod:=0;
    Cash:=0;
    QReport.First;
    fID:=-1000000;
    while Not(QReport.Eof) do
    begin
        sum:=sum+QReport['Number']*QReport['PriceInFactor'];
        QReport.Next;
    end;
    CashMod:=round(sum);
    lblSum.Caption:=FormatFloat('###,',sum);
end;

procedure TfrmExitFactoryReport.createForm(FactorType : integer);
begin
    fType:=FactorType;
    if fType=1 then
        Caption:='ê“«—‘ Œ—Ìœ'
    else
        if fType=2 then
            Caption:='ê“«—‘ ›—Ê‘'
        else
            Caption:='ê“«—‘ ÕÊ«·Â «‰»«—';
    QReport.Parameters.ParamByName('FactorType').Value:=FactorType;
    QReport.Open;
    calcCash;
end;

procedure TfrmExitFactoryReport.btnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmExitFactoryReport.BBtnAcceptClick(Sender: TObject);
begin
    strFilter:='TExitFactory.ExitFactoryID >= 1';

    if edtPersonID.Text<>'' then
        strFilter:=strFilter+ ' and TExitFactory.PersonID='+QuotedStr(edtPersonID.Text);
    if edtKalaID.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and TSubExitFactory.KalaID='+QuotedStr(edtKalaID.Text)
        else
            strFilter:='TSubExitFactory.KalaID='+QuotedStr(edtKalaID.Text);
    if edtStartDate.Text<>'1   /  /  ' then
        if edtEndDate.Text<>'1   /  /  ' then
            if strFilter<>'' then
                strFilter:=strFilter+' and ExportDate >= '+QuotedStr(edtStartDate.Text)+' and ExportDate <= '+QuotedStr(edtEndDate.Text)
            else
                strFilter:='ExportDate >= '+QuotedStr(edtStartDate.Text)+' and ExportDate <= '+QuotedStr(edtEndDate.Text)
        else
            if strFilter<>'' then
                strFilter:=strFilter+' and ExportDate >= '+QuotedStr(edtStartDate.Text)
            else
                strFilter:='ExportDate >= '+QuotedStr(edtStartDate.Text)
    else
        if edtEndDate.Text<>'1   /  /  ' then
            if strFilter<>'' then
                strFilter:=strFilter+' and ExportDate <= '+QuotedStr(edtEndDate.Text)
            else
                strFilter:='ExportDate <= '+QuotedStr(edtEndDate.Text);


    if edtStartSerialNumber.Text<>'' then
        if edtEndSerialNumber.Text<>'' then
            if strFilter<>'' then
                strFilter:=strFilter+' and SerialNumber >= '+edtStartSerialNumber.Text+' and SerialNumber <= '+edtEndSerialNumber.Text
            else
                strFilter:='SerialNumber >= '+edtStartSerialNumber.Text+' and SerialNumber <= '+edtEndSerialNumber.Text
        else
            if strFilter<>'' then
                strFilter:=strFilter+' and SerialNumber >= '+edtStartSerialNumber.Text
            else
                strFilter:='SerialNumber >= '+edtStartSerialNumber.Text
    else
        if edtEndSerialNumber.Text<>'' then
            if strFilter<>'' then
                strFilter:=strFilter+' and SerialNumber <= '+edtEndSerialNumber.Text
            else
                strFilter:='SerialNumber <= '+edtEndSerialNumber.Text;

    QReport.Close;
    QReport.SQL.Clear;
    QReport.SQL.Add('select TExitFactory.ExitFactoryID, SerialNumber, TExitFactory.PersonID, ExportDate, TExitFactory.Comment,');
    QReport.SQL.Add('UserID, TExitFactory.Type, VahedName, ');
    QReport.SQL.Add('TSubExitFactory.KalaID, Round(Number, 3) as Number, TSubExitFactory.VahedPrice as PriceInFactor,');
    QReport.SQL.Add('PersonName,(TSubExitFactory.VahedPrice*Number) as sumPrice, KalaName, PersonName, TSubExitFactory.Comment SubComment');
    QReport.SQL.Add('from TExitFactory inner join TSubExitFactory on TExitFactory.ExitFactoryID=TSubExitFactory.ExitFactoryID');
    QReport.SQL.Add('inner join TPerson on TExitFactory.PersonID=TPerson.PersonID');
    QReport.SQL.Add('inner join TKala on TSubExitFactory.KalaID=TKala.KalaID');
    QReport.SQL.Add('inner join TVahed on TKala.VahedID=TVahed.VahedID');
    QReport.SQL.Add('where '+strFilter);
    QReport.SQL.Add('Order By ExportDate, SerialNumber');
    QReport.Open;
    calcCash;
end;

procedure TfrmExitFactoryReport.btnPersonClick(Sender: TObject);
var
    PersonInfo :Person;
    personType : Integer;
begin
    case StorageType of
      1: personType:=1;
      2: personType:=1;
      3: personType:=4;
      4: personType:=4;
    end;
    PersonInfo:=(TfrmPersonInfo.Execute(personType));
    if PersonInfo.PersonID<>-1 then
    begin
        edtPersonID.Text:=IntToStr(PersonInfo.PersonID);
        edtPersonName.Text:=PersonInfo.PersonName;
        edtStartDate.SetFocus;
    end;
end;

procedure TfrmExitFactoryReport.btnKalaClick(Sender: TObject);
begin
    Application.CreateForm(TfrmKalaInfo, frmKalaInfo);
    frmKalaInfo.ShowModal;
    if frmKalaInfo.strKey='enter' then
    begin
        edtKalaID.Text:=frmKalaInfo.QKala['KalaID'];
        edtKalaName.Text:=frmKalaInfo.QKala['KalaName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmKalaInfo);
end;

procedure TfrmExitFactoryReport.btnPrintClick(Sender: TObject);
var
sum: LONGLONG;
fID : integer;
begin
    if QReport['ExitFactoryID']=Null then Exit;
    sum:=0;
    if qrGeneralReport = nil then
        Application.CreateForm(TqrGeneralExitFactory, qrGeneralExitFactory);
    qrGeneralExitFactory.lblCoName.Caption:=BaseInfo.CoName;
    qrGeneralExitFactory.lblReportName.Caption:=Caption;
    qrGeneralExitFactory.lblCurrentDate.Caption:=CurrentDate;
    if fType=1 then
    begin
        qrGeneralExitFactory.lblCustomerOrSaleID.Caption:='òœ ›—Ê‘‰œÂ:';
        qrGeneralExitFactory.lblCustomerOrSalerNameTitle.Caption:='‰«„ ›—Ê‘‰œÂ:';
        qrGeneralExitFactory.lblCustomerOrSalerName.Caption:='‰«„ ›—Ê‘‰œÂ';
    end;
    if edtPersonID.Text<>'' then
    begin
        qrGeneralExitFactory.lblCustomerID.Caption:=edtPersonID.Text;
        qrGeneralExitFactory.lblCustomerName.Caption:=edtPersonName.Text;
    end
    else
    begin
        qrGeneralExitFactory.lblCustomerID.Caption:='';
        qrGeneralExitFactory.lblCustomerName.Caption:='';
    end;
    if edtKalaID.Text<>'' then
    begin
        qrGeneralExitFactory.lblKalaID.Caption:=edtKalaID.Text;
        qrGeneralExitFactory.lblKalaName.Caption:=edtKalaName.Text;
    end
    else
    begin
        qrGeneralExitFactory.lblKalaID.Caption:='';
        qrGeneralExitFactory.lblKalaName.Caption:='';
    end;
    if edtStartDate.Text<>'1   /  /  ' then
        qrGeneralExitFactory.lblStartDate.Caption:=edtStartDate.Text
    else
        qrGeneralExitFactory.lblStartDate.Caption:='';
    if edtEndDate.Text<>'1   /  /  ' then
        qrGeneralExitFactory.lblEndDate.Caption:=edtEndDate.Text
    else
        qrGeneralExitFactory.lblEndDate.Caption:='';
    if edtStartSerialNumber.Text<>'' then
        qrGeneralExitFactory.lblStartFactorID.Caption:=edtStartSerialNumber.Text
    else
        qrGeneralExitFactory.lblStartFactorID.Caption:='';
    if edtEndSerialNumber.Text<>'' then
        qrGeneralExitFactory.lblEndFactorID.Caption:=edtEndSerialNumber.Text
    else
        qrGeneralExitFactory.lblEndFactorID.Caption:='';
    QReport.First;
    fID:=-1000000;
    while Not(QReport.Eof) do
    begin
        sum:=sum+QReport['Number']*QReport['PriceInFactor'];
        QReport.Next;
    end;
    qrGeneralExitFactory.lblSumFactors.Caption:=FormatFloat('###,', sum);
    qrGeneralExitFactory.Prepare;
    qrGeneralExitFactory.Preview;
    FreeAndNil(qrGeneralExitFactory);
end;

procedure TfrmExitFactoryReport.btnGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGroupKalaStorage, frmGroupKalaStorage);
    frmGroupKalaStorage.CreateForm(strFilter, StorageType);
    frmGroupKalaStorage.ShowModal;
    FreeAndNil(frmGroupKalaStorage);
end;

procedure TfrmExitFactoryReport.edtStartDateExit(Sender: TObject);
begin
    if edtStartDate.Text<>'1   /  /  ' then
        if not CheckDate(edtStartDate.Text) then
            edtStartDate.SetFocus;
end;

procedure TfrmExitFactoryReport.edtEndDateExit(Sender: TObject);
begin
    if edtEndDate.Text<>'1   /  /  ' then
        if not CheckDate(edtEndDate.Text) then
            edtEndDate.SetFocus;
end;

procedure TfrmExitFactoryReport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmExitFactoryReport.btnExportToExcelClick(Sender: TObject);
begin
    ExportToExl(QReport);
end;

end.
