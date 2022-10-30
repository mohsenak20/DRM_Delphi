unit SalesReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, Grids, DBGrids, ExtCtrls, DB, ADODB,
  QuickRpt;

type
  TfrmSalesReport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbGrid: TDBGrid;
    edtStartDate: TMaskEdit;
    Label3: TLabel;
    edtEndDate: TMaskEdit;
    Label1: TLabel;
    edtKalaID: TEdit;
    edtKalaName: TEdit;
    btnKala: TBitBtn;
    Label2: TLabel;
    Label4: TLabel;
    edtCustomerID: TEdit;
    edtCustomerName: TEdit;
    btnCustomer: TBitBtn;
    BBtnAccept: TBitBtn;
    btnPrint: TBitBtn;
    btnReturn: TBitBtn;
    QReport: TADOQuery;
    dsReport: TDataSource;
    edtStartFactorID: TEdit;
    edtEndFactorID: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    btnGroup: TBitBtn;
    BitBtn1: TBitBtn;
    Label7: TLabel;
    lblSum: TLabel;
    Label9: TLabel;
    lblService: TLabel;
    Label11: TLabel;
    lblDiscount: TLabel;
    Label13: TLabel;
    lblNoCash: TLabel;
    Label15: TLabel;
    lblCashMod: TLabel;
    QRCompositeReport: TQRCompositeReport;
    QFactorCheck: TADOQuery;
    Label8: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    QSum: TADOQuery;
    Label10: TLabel;
    edtKalaGroupId: TEdit;
    edtKalaGroupTitle: TEdit;
    btnKalaGroup: TBitBtn;
    chbIsZero: TCheckBox;
    procedure btnReturnClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnKalaClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnGroupClick(Sender: TObject);
    procedure calcCash();
    procedure BitBtn1Click(Sender: TObject);
    procedure edtStartDateExit(Sender: TObject);
    procedure edtEndDateExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QRCompositeReportAddReports(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure CreateFilter();
    procedure btnKalaGroupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure createForm(FactorType : integer);
  end;

var
  frmSalesReport: TfrmSalesReport;
  fType : integer;
  strFilter, strFilter1 : string;
implementation

uses DMUnit, qrFactorsReportUnit, ShareUnit,
  CalculatUnit, GroupKalaUnit,
  qrCashUnit, Math, KalaInfoUnit, qrFactorCheckUnit, UserInfoUnit,
  KalaGroupInfoUnit;

{$R *.dfm}

procedure TfrmSalesReport.CreateFilter();
var
  userID : integer;
  
begin
    strFilter:='';
    if edtKalaID.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and KalaID='+QuotedStr(edtKalaID.Text)
        else
            strFilter:='KalaID='+QuotedStr(edtKalaID.Text);

    if edtKalaGroupId.Text<>'' then
        if strFilter<>'' then
            strFilter:=strFilter+' and KalaGroupID='+QuotedStr(edtKalaGroupId.Text)
        else
            strFilter:='KalaGroupID='+QuotedStr(edtKalaGroupId.Text);
            
    if edtStartDate.Text<>'1   /  /  ' then
        if edtEndDate.Text<>'1   /  /  ' then
            if strFilter<>'' then
                strFilter:=strFilter+' and ReceptionDate >= '+QuotedStr(edtStartDate.Text)+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text)
            else
                strFilter:='ReceptionDate >= '+QuotedStr(edtStartDate.Text)+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text)
        else
            if strFilter<>'' then
                strFilter:=strFilter+' and ReceptionDate >= '+QuotedStr(edtStartDate.Text)
            else
                strFilter:='ReceptionDate >= '+QuotedStr(edtStartDate.Text)
    else
        if edtEndDate.Text<>'1   /  /  ' then
            if strFilter<>'' then
                strFilter:=strFilter+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text)
            else
                strFilter:='ReceptionDate <= '+QuotedStr(edtEndDate.Text);


    if edtStartFactorID.Text<>'' then
        if edtEndFactorID.Text<>'' then
            if strFilter<>'' then
                strFilter:=strFilter+' and SerialNumber >= '+edtStartFactorID.Text+' and SerialNumber <= '+edtEndFactorID.Text
            else
                strFilter:='SerialNumber >= '+edtStartFactorID.Text+' and SerialNumber <= '+edtEndFactorID.Text
        else
            if strFilter<>'' then
                strFilter:=strFilter+' and SerialNumber >= '+edtStartFactorID.Text
            else
                strFilter:='SerialNumber >= '+edtStartFactorID.Text
    else
        if edtEndFactorID.Text<>'' then
            if strFilter<>'' then
                strFilter:=strFilter+' and SerialNumber <= '+edtEndFactorID.Text
            else
                strFilter:='SerialNumber <= '+edtEndFactorID.Text;

    if chbIsZero.Checked then
      if strFilter<>'' then
          strFilter := strFilter + ' and isZero = 1'
      else
          strFilter := ' isZero = 1';

    strFilter1:=strFilter;
    if (UserInfo.userType = Normal) then
    begin
        if strFilter<>'' then
            strFilter:=strFilter+' and TFactor.UserID='+ IntToStr(UserInfo.UserID)
        else
            strFilter:=' TFactor.UserID='+IntToStr(UserInfo.UserID);
    end
    else
    begin
        if edtUserID.Text<>'' then
        begin
            UserID := StrToInt(edtUserID.Text);
            if strFilter<>'' then
                    strFilter:=strFilter+' and TFactor.UserID='+ IntToStr(UserID)
                else
                    strFilter:='TFactor.UserID='+ IntToStr(UserID)
        end;
    end;


end;

procedure TfrmSalesReport.calcCash();
var
SumDiscount, SumToll, NoCash, CashMod : LONGLONG;
fID : integer;
sum : Real;
begin
    sum:=0;
    SumDiscount:=0;
    SumToll:=0;
    NoCash:=0;
    CashMod:=0;
    QReport.First;
    fID:=-1000000;
    QSum.Close;
    QSum.SQL.Clear;
    QSum.SQL.Add('select SUM(Number*TSubFactor.VahedPrice)');
    QSum.SQL.Add('from TFactor inner join TSubFactor on TFactor.FactorID=TSubFactor.FactorID');
    QSum.SQL.Add('inner join TReception on TFactor.ReceptionID=TReception.ReceptionID');
    QSum.SQL.Add('inner join TKala on TSubFactor.ProductID=TKala.KalaID');
    if strFilter<>'' then
        QSum.SQL.Add('where '+strFilter);
    QSum.Open;


    while Not(QReport.Eof) do
    begin
        sum:=sum+QReport['Number']*QReport['PriceInFactor'];
        QReport.Next;
    end;
    CashMod:=round(sum)+SumToll-SumDiscount-NoCash;
    lblSum.Caption:=FormatFloat('###,',sum);
    lblService.Caption:=FormatFloat('###,', SumToll);
    lblDiscount.Caption:=FormatFloat('###,', SumDiscount);
    lblNoCash.Caption:=FormatFloat('###,', NoCash);
    lblCashMod.Caption:=FormatFloat('###,', CashMod);
end;

procedure TfrmSalesReport.createForm(FactorType : integer);
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

procedure TfrmSalesReport.btnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSalesReport.BBtnAcceptClick(Sender: TObject);
var
  UserID : integer;
SumDiscount, SumToll, NoCash, CashMod : LONGLONG;
fID : integer;
sum : Real;
begin
    CreateFilter();
    QReport.SQL.Clear;
    QReport.SQL.Add('select TFactor.FactorID, TFactor.UserID, SerialNumber, TFactor.ReceptionID, ReceptionDate, TFactor.Active, TFactor.Description,');
    QReport.SQL.Add('Discount, PercentDiscount, DocID, Documentation,');
    QReport.SQL.Add('Code, ProductID, Round(Number, 3) as Number, TSubFactor.VahedPrice as PriceInFactor, StorageTitleID,');
    QReport.SQL.Add('CustomerName, ExportTime,');
    QReport.SQL.Add('KalaID, KalaName, ClosedID');
    QReport.SQL.Add('from TFactor inner join TSubFactor on TFactor.FactorID=TSubFactor.FactorID');
    QReport.SQL.Add('inner join TReception on TFactor.ReceptionID=TReception.ReceptionID');
    QReport.SQL.Add('inner join TKala on TSubFactor.ProductID=TKala.KalaID');
    if strFilter<>'' then
        QReport.SQL.Add('where '+strFilter);
    QReport.SQL.Add('Order by TFactor.SerialNumber');
    QReport.Open;

    //QReport.Filtered:=False;
    //QReport.Filter:=strFilter;
    //QReport.Filtered:=True;
    QReport.Open;
    sum:=0;
    SumDiscount:=0;
    SumToll:=0;
    NoCash:=0;
    CashMod:=0;
    QReport.First;
    fID:=-1000000;
    QSum.Close;
    QSum.SQL.Clear;
    QSum.SQL.Add('select SUM(Number*TSubFactor.VahedPrice) as Sum');
    QSum.SQL.Add('from TFactor inner join TSubFactor on TFactor.FactorID=TSubFactor.FactorID');
    QSum.SQL.Add('inner join TReception on TFactor.ReceptionID=TReception.ReceptionID');
    QSum.SQL.Add('inner join TKala on TSubFactor.ProductID=TKala.KalaID');
    if strFilter<>'' then
        QSum.SQL.Add('where '+strFilter);
    QSum.Open;
    if QSum['Sum']<>null then
        sum := QSum['Sum'];

    CashMod:=round(sum)+SumToll-SumDiscount-NoCash;
    lblSum.Caption:=FormatFloat('###,',sum);
    lblService.Caption:=FormatFloat('###,', SumToll);
    lblDiscount.Caption:=FormatFloat('###,', SumDiscount);
    lblNoCash.Caption:=FormatFloat('###,', NoCash);
    lblCashMod.Caption:=FormatFloat('###,', CashMod);

end;

procedure TfrmSalesReport.btnKalaClick(Sender: TObject);
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

procedure TfrmSalesReport.btnPrintClick(Sender: TObject);
var
sum, SumDiscount, SumToll : LONGLONG;
fID : integer;
begin
    if QReport['FactorID']=Null then Exit;
    sum:=0;
    SumDiscount:=0;
    SumToll:=0;
    Application.CreateForm(TqrFactorsReport, qrFactorsReport);
    qrFactorsReport.lblCoName.Caption:=Parameter.CoName;
    qrFactorsReport.lblReportName.Caption:=Caption;
    qrFactorsReport.lblCurrentDate.Caption:=CurrentDate;
    if fType=1 then
    begin
        qrFactorsReport.lblCustomerOrSaleID.Caption:='òœ ›—Ê‘‰œÂ:';
        qrFactorsReport.lblCustomerOrSalerNameTitle.Caption:='‰«„ ›—Ê‘‰œÂ:';
        qrFactorsReport.lblCustomerOrSalerName.Caption:='‰«„ ›—Ê‘‰œÂ';
    end;
    if edtCustomerID.Text<>'' then
    begin
        qrFactorsReport.lblCustomerID.Caption:=edtCustomerID.Text;
        qrFactorsReport.lblCustomerName.Caption:=edtCustomerName.Text;
    end
    else
    begin
        qrFactorsReport.lblCustomerID.Caption:='';
        qrFactorsReport.lblCustomerName.Caption:='';
    end;
    if edtKalaID.Text<>'' then
    begin
        qrFactorsReport.lblKalaID.Caption:=edtKalaID.Text;
        qrFactorsReport.lblKalaName.Caption:=edtKalaName.Text;
    end
    else
    begin
        qrFactorsReport.lblKalaID.Caption:='';
        qrFactorsReport.lblKalaName.Caption:='';
    end;
    if edtStartDate.Text<>'1   /  /  ' then
        qrFactorsReport.lblStartDate.Caption:=edtStartDate.Text
    else
        qrFactorsReport.lblStartDate.Caption:='';
    if edtEndDate.Text<>'1   /  /  ' then
        qrFactorsReport.lblEndDate.Caption:=edtEndDate.Text
    else
        qrFactorsReport.lblEndDate.Caption:='';
    if edtStartFactorID.Text<>'' then
        qrFactorsReport.lblStartFactorID.Caption:=edtStartFactorID.Text
    else
        qrFactorsReport.lblStartFactorID.Caption:='';
    if edtEndFactorID.Text<>'' then
        qrFactorsReport.lblEndFactorID.Caption:=edtEndFactorID.Text
    else
        qrFactorsReport.lblEndFactorID.Caption:='';
    QReport.First;
    fID:=-1000000;
    while Not(QReport.Eof) do
    begin
        sum:=sum+QReport['Number']*QReport['PriceInFactor'];
        QReport.Next;
    end;
    qrFactorsReport.lblSumFactors.Caption:=FormatFloat('###,', sum);
    if SumToll>0 then
        qrFactorsReport.lblSumToll.Caption:=FormatFloat('###,', SumToll)
    else
        qrFactorsReport.lblSumToll.Caption:='0';
    if SumDiscount>0 then
        qrFactorsReport.lblSumDiscount.Caption:=FormatFloat('###,', SumDiscount)
    else
        qrFactorsReport.lblSumDiscount.Caption:='0';
    qrFactorsReport.Prepare;
    qrFactorsReport.Preview;
    FreeAndNil(qrFactorsReport);
end;

procedure TfrmSalesReport.btnGroupClick(Sender: TObject);
begin
    CreateFilter();
    Application.CreateForm(TfrmGroupKala, frmGroupKala);
    frmGroupKala.CreateForm(strFilter, fType);
    frmGroupKala.ShowModal;
    FreeAndNil(frmGroupKala);
end;

procedure TfrmSalesReport.BitBtn1Click(Sender: TObject);
var
strFilter : string;
begin
    Application.CreateForm(TqrCash, qrCash);
    qrCash.lblCoName.Caption:=Parameter.CoName;
    qrCash.lblCurrentDate.Caption:=CurrentDate;
    qrCash.lblStartDate.Caption:=edtStartDate.Text;
    qrCash.lblEndDate.Caption:=edtEndDate.Text;
    qrCash.lblSum.Caption:=lblSum.Caption;
    qrCash.lblToll.Caption:=lblService.Caption;
    qrCash.lblDiscount.Caption:=lblDiscount.Caption;
    qrCash.lblNoCash.Caption:=lblNoCash.Caption;
    qrCash.lblCashMod.Caption:=lblCashMod.Caption;
    qrCash.Prepare;
    QFactorCheck.Close;
    QFactorCheck.SQL.Clear;
    QFactorCheck.SQL.Add('select * from TFactorCheck');
    if edtStartDate.Text<>'1   /  /  ' then
        if edtEndDate.Text<>'1   /  /  ' then
            strFilter:='InputDate >= '+QuotedStr(edtStartDate.Text)+' and InputDate <= '+QuotedStr(edtEndDate.Text)
        else
            strFilter:='InputDate >= '+QuotedStr(edtStartDate.Text)
    else
        if edtEndDate.Text<>'1   /  /  ' then
            strFilter:='InputDate <= '+QuotedStr(edtEndDate.Text);
    if strFilter<>'' then
        QFactorCheck.SQL.Add(' where '+strFilter);
    QFactorCheck.Open;

    Application.CreateForm(TqrFactorCheck, qrFactorCheck);

    QRCompositeReport.Preview;
    FreeAndNil(qrCash);
    FreeAndNil(qrFactorCheck);
end;

procedure TfrmSalesReport.edtStartDateExit(Sender: TObject);
begin
   
        if UserInfo.UserID = 4 then
            edtEndDate.Text := edtStartDate.Text;

end;

procedure TfrmSalesReport.edtEndDateExit(Sender: TObject);
begin

        if UserInfo.UserID = 4 then
            edtStartDate.Text := edtEndDate.Text;
end;

procedure TfrmSalesReport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmSalesReport.QRCompositeReportAddReports(Sender: TObject);
begin
    QRCompositeReport.Reports.Add(qrCash);
    QRCompositeReport.Reports.Add(qrFactorCheck);
end;

procedure TfrmSalesReport.FormCreate(Sender: TObject);
begin
    if (UserInfo.WorkSectionID=6) or (UserInfo.WorkSectionID=8) or (UserInfo.WorkSectionID=38)then
    begin
        edtUserID.Enabled:=True;
        edtUserName.Enabled:=True;
        btnUser.Enabled:=True;
    end
    else
    begin
        edtStartDate.Text := CurrentDate;
        edtEndDate.Text:=CurrentDate;
        if UserInfo.UserID <> 4 then
            edtStartDate.Enabled := False;
        edtEndDate.Enabled:=False;
    end;
end;

procedure TfrmSalesReport.btnUserClick(Sender: TObject);
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

procedure TfrmSalesReport.btnKalaGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmKalaGroupInfo, frmKalaGroupInfo);
    frmKalaGroupInfo.ShowModal;
    if frmKalaGroupInfo.strKey='enter' then
    begin
        edtKalaGroupId.Text:=frmKalaGroupInfo.QKalaGroup['id'];
        edtKalaGroupTitle.Text:=frmKalaGroupInfo.QKalaGroup['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmKalaInfo);
end;

end.
