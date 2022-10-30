unit ViewBargainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DBCtrls,
  Mask;

type
  TfrmViewBargain = class(TForm)
    DBGrid1: TDBGrid;
    SP_ViewBargain: TADOStoredProc;
    dsViewBargain: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    BBtnAccept: TBitBtn;
    Label6: TLabel;
    edtBergainNumber: TEdit;
    edtCompanyID: TEdit;
    Label12: TLabel;
    edtCompanyName: TEdit;
    btnCompany: TBitBtn;
    Label7: TLabel;
    DBText9: TDBText;
    Label8: TLabel;
    DBText8: TDBText;
    Label9: TLabel;
    DBText7: TDBText;
    QSummeryCard: TADOQuery;
    daCardSummery: TDataSource;
    chbActive: TCheckBox;
    Label14: TLabel;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    QBargain: TADOQuery;
    btnUsedCardList: TBitBtn;
    Label1: TLabel;
    edtCardCount: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edtCardNumber: TEdit;
    chbExpire: TCheckBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    QSummery: TADOQuery;
    dsSummery: TDataSource;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    chbNormalBargain: TCheckBox;
    Label5: TLabel;
    lblPrice: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtStart_EndDate: TMaskEdit;
    edtEnd_EndDate: TMaskEdit;
    ExportToExcel: TBitBtn;
    QUpdateUsedCard: TADOQuery;
    GroupBox1: TGroupBox;
    rbFoulTime: TRadioButton;
    rbHalfTime: TRadioButton;
    rbAll: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure btnCompanyClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnPrintClick(Sender: TObject);
    procedure btnUsedCardListClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewBargain: TfrmViewBargain;

implementation

uses DMUnit, UnitCompanyInfo, qrBargainUnit, ShareUnit, CalculatUnit,
  qrUsedListCardUnit, CardListUnit, DateUtils;

{$R *.dfm}

procedure TfrmViewBargain.FormCreate(Sender: TObject);
begin
    {SP_ViewBargain.Close;
    SP_ViewBargain.Parameters.ParamByName('@startDate').Value:=edtStartDate.Text;
    SP_ViewBargain.Parameters.ParamByName('@endDate').Value:=edtEndDate.Text;
    SP_ViewBargain.Open;
    QSummeryCard.Close;
    QSummeryCard.Open;}
end;

procedure TfrmViewBargain.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmViewBargain.btnCompanyClick(Sender: TObject);
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

procedure TfrmViewBargain.BBtnAcceptClick(Sender: TObject);
var
strFilter, strFilter1 : string;
begin
    strFilter:=' BargainID > 1 ';
    strFilter1:='';

    if edtStartDate.Text<>'1   /  /  ' then
        if edtEndDate.Text<>'1   /  /  ' then
                strFilter:=strFilter+' and BargainDate >= '+QuotedStr(edtStartDate.Text)+' and BargainDate <= '+QuotedStr(edtEndDate.Text)
        else
                strFilter:=strFilter+' and BargainDate >= '+QuotedStr(edtStartDate.Text)
    else
        if edtEndDate.Text<>'1   /  /  ' then
                strFilter:=strFilter+' and BargainDate <= '+QuotedStr(edtEndDate.Text);


    if edtCompanyID.Text <> '' then
            strFilter:=strFilter+' and TBargain.CompanyID='+edtCompanyID.Text;

    if edtBergainNumber.Text <> '' then
            strFilter:=strFilter+' and BargainNumber like '+QuotedStr('%'+edtBergainNumber.Text+'%');


    if edtCardCount.Text<>'' then
        strFilter:=strFilter + ' and CardsCount =' + edtCardCount.Text;

    if chbNormalBargain.Checked then
        if strFilter1<>'' then
            strFilter1:=strFilter1+' GetMoney = 0 and CompanyID not in (1, 5, 10, 23, 63, 76, 78, 106, 113, 163, 164, 180, 287, 405)'
        else
            strFilter1:='GetMoney = 0 and CompanyID not in (1, 5, 10, 23, 63, 76, 78, 106, 113, 163, 164, 180, 245, 287, 405)';

    if chbExpire.Checked then
        if strFilter1<>'' then
            strFilter1:=strFilter1+' and CompanyID not in (1, 5, 10, 23, 63, 76, 78, 106, 113, 163, 164, 180, 287, 405) and (select Min(ExpireDate) from TCard where BargainID=GharardadID)<'+QuotedStr(CurrentDate)
        else
            strFilter1:='CompanyID not in (1, 5, 10, 23, 63, 76, 78, 106, 113, 163, 164, 180, 287, 405) and (select Min(ExpireDate) from TCard where BargainID=GharardadID)<'+QuotedStr(CurrentDate);
    if StrToIntDef(edtCardNumber.Text, 0)<>0 then
        strFilter:= strFilter + ' and StartNumber <= '+edtCardNumber.Text +' and EndNumber >= '+edtCardNumber.Text;

    if rbFoulTime.Checked  then
        strFilter:=strFilter+' and TBargain.SpecialForAfternoon=0';

    if rbHalfTime.Checked  then
        strFilter:=strFilter+' and TBargain.SpecialForAfternoon=1';

    QBargain.Close;
    QBargain.SQL.Clear;
    QBargain.SQL.Add('select BargainID, BargainNumber, BargainDate, Expier, CompanyName, CardsCount, FirstCredit, cast(CardsCount as bigint)*FirstCredit sumRow, Edit, ');
    QBargain.SQL.Add('GetMoney, SpecialForAfternoon, StartNumber, EndNumber, UsedCard, CardsCount - usedCard NotUsedCard, TCompany.CompanyID,');
    QBargain.SQL.Add(' (select sum(CardsCount) from TBargain where '+strFilter+') sumCardCount, ');
    QBargain.SQL.Add(' (select sum(CardsCount-UsedCard) from TBargain where '+strFilter+') SumNotUseCard,  ');
    QBargain.SQL.Add(' (select sum(UsedCard) from TBargain where '+strFilter+') SumUseCard, BargainExpireDate  ');
    QBargain.SQL.Add('from TBargain inner join TCompany on TBargain.CompanyID = TCompany.CompanyID ');

    if strFilter <> '' then
        QBargain.SQL.Add(' where '+strFilter + '  order by BargainNumber');


    QBargain.Open;

    {if QBargain['sumPrice']<>null then
        lblPrice.Caption := FormatFloat('###,', QBargain['sumPrice'])
    else
        lblPrice.Caption := '0';

    if StrToIntDef(edtCardNumber.Text, 0)<>0 then Exit;
    QSummeryCard.Close;
    QSummeryCard.SQL.Clear;
    QSummeryCard.SQL.Add(' select Count(ReceptionID) as SalesCard,');
    if chbExpire.Checked then
        if strFilter<>'' then
            strFilter:=strFilter+' and CompanyID not in (1, 23, 63, 76, 78, 106, 113, 163, 164, 180, 287) and ExpireDate<'+QuotedStr(CurrentDate)
        else
            strFilter:='CompanyID not in (1, 23, 63, 76, 78, 106, 113, 163, 164, 180, 287) and ExpireDate<'+QuotedStr(CurrentDate);
    if strFilter<>'' then
    begin
        QSummeryCard.SQL.Add('(select count(TCard.CardID) from TBargain inner join TCard on TBargain.BargainID=TCard.BargainID where '+strFilter+' ) as UsedCard,');
        QSummeryCard.SQL.Add('(select count(TCard.CardID) from TBargain inner join TCard on TBargain.BargainID=TCard.BargainID where '+strFilter+' )- (select Count(ReceptionID) from TBargain inner join TCard on TBargain.BargainID=TCard.BargainID inner join TReception on TCard.CardID=TReception.CardID where TReception.CardID<>1 and '+strFilter+' ) as NotUsedCard');
        QSummeryCard.SQL.Add('from TBargain inner join TCard on TBargain.BargainID=TCard.BargainID inner join TReception on TCard.CardID=TReception.CardID where TReception.CardID<>1 and '+strFilter);
    end
    else
    begin
        QSummeryCard.SQL.Add('(select count(TCard.CardID) from TBargain inner join TCard on TBargain.BargainID=TCard.BargainID ) as UsedCard,');
        QSummeryCard.SQL.Add('(select count(TCard.CardID) from TBargain inner join TCard on TBargain.BargainID=TCard.BargainID)- ');
        QSummeryCard.SQL.Add('(select Count(ReceptionID) from TBargain inner join TCard on TBargain.BargainID=TCard.BargainID inner join TReception on TCard.CardID=TReception.CardID where TReception.CardID<>1) as NotUsedCard');
        QSummeryCard.SQL.Add('from TBargain inner join TCard on TBargain.BargainID=TCard.BargainID inner join TReception on TCard.CardID=TReception.CardID where TReception.CardID<>1');
    end;
    QSummeryCard.Open;
    QSummery.Close;
    QSummery.Open;  }
end;

procedure TfrmViewBargain.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If QBargain['GetMoney']=False then
        DBGrid1.Canvas.Brush.Color:=$00E2BCFE
    else
        DBGrid1.Canvas.Brush.Color:=clTeal;

    //If QBargain['SpecialForAfternoon']=True then
        //DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

    If QBargain['Edit']=True then
       DBGrid1.Canvas.Brush.Color:=clYellow;

    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmViewBargain.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrBargain, qrBargain);
    qrBargain.lblCurrentDate.Caption:=CurrentDate;
    if edtStartDate.Text<>'1   /  /  ' then
        qrBargain.lblStartDate.Caption:=edtStartDate.Text
    else
        qrBargain.lblStartDate.Caption:='';
    if edtEndDate.Text<>'1   /  /  ' then
        qrBargain.lblEndDate.Caption:=edtEndDate.Text
    else
        qrBargain.lblEndDate.Caption:='';
    qrBargain.Preview;
    FreeAndNil(qrBargain);
end;

procedure TfrmViewBargain.btnUsedCardListClick(Sender: TObject);
begin
    Application.CreateForm(TqrUsedCardList, qrUsedCardList);
    qrUsedCardList.qCard.Close;
    qrUsedCardList.qCard.Parameters.ParamByName('BargainID').Value:=QBargain['BargainID'];
    qrUsedCardList.qCard.Open;
    qrUsedCardList.Preview;
    FreeAndNil(qrUsedCardList);
end;

procedure TfrmViewBargain.DBGrid1DblClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCardList, frmCardList);
    With frmCardList do
    begin
        lblCode.Caption := QBargain['BargainID'];
        lblNumber.Caption := QBargain['BargainNumber'];
        lblBargainDate.Caption := QBargain['BargainDate'];
        lblExpireDate.Caption := QBargain['BargainExpireDate'];
        lblCoName.Caption := QBargain['CompanyName'];
        lblCardCount.Caption := QBargain['CardsCount'];
        lblCardPrice.Caption := QBargain['FirstCredit'];
        lblStartCardNumber.Caption := QBargain['StartNumber'];
        lblEndCardNumber.Caption := QBargain['EndNumber'];
        lblUsedCard.Caption := QBargain['UsedCard'];
        LblNotUsedCard.Caption := QBargain['NotUsedCard'];
        
        QCard.Close;
        QCard.Parameters.ParamByName('BargainID').Value := lblCode.Caption;
        QCard.Parameters.ParamByName('UsedCard').Value := 1;
        QCard.Open;
    end;

    frmCardList.ShowModal;
    FreeAndNil(frmCardList);
end;

procedure TfrmViewBargain.ExportToExcelClick(Sender: TObject);
begin
    ExportToExl(QBargain);
end;

procedure TfrmViewBargain.FormShow(Sender: TObject);
begin
    QUpdateUsedCard.ExecSQL;
end;

end.
