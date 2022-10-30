unit ReceptionCreditCardReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmReceptionCreditCardReport = class(TForm)
    Panel1: TPanel;
    Label14: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtStartDate: TMaskEdit;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    BBtnAccept: TBitBtn;
    edtEndDate: TMaskEdit;
    edtCreditGroupID: TEdit;
    edtCreditGroupTitle: TEdit;
    btnCreditGroup: TBitBtn;
    edtCard: TEdit;
    edtName: TEdit;
    Panel2: TPanel;
    lblCount: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    QReceptionCredit: TADOQuery;
    dsReceptionCredit: TDataSource;
    Label8: TLabel;
    edtNID: TEdit;
    Label9: TLabel;
    edtGeneralCode: TEdit;
    Label16: TLabel;
    edtGenderID: TEdit;
    edtGenderTitle: TEdit;
    btnGender: TBitBtn;
    QSum: TADOQuery;
    ExportToExcel: TBitBtn;
    BtnReturn: TBitBtn;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnCreditGroupClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnGenderClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReceptionCreditCardReport: TfrmReceptionCreditCardReport;

implementation

uses CreditCardGroupInfoUnit, UserInfoUnit, GenderInfoUnit, DMUnit,
  ShareUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmReceptionCreditCardReport.BBtnAcceptClick(Sender: TObject);
var
  strFilter: string;
begin
  strFilter := 'ReceptionDate >='+QuotedStr(edtStartDate.Text)+' and Receptiondate <='+QuotedStr(edtEndDate.Text);
  if edtUserID.Text <> '' then
      strFilter := strFilter + ' and TReception.UserID='+edtUserID.Text;

  if edtCreditGroupID.Text <> '' then
      strFilter := strFilter + ' and TCreditGroup.creditGroupID='+edtCreditGroupID.Text;

  if edtCard.Text <> '' then
      strFilter := strFilter + ' and CardID='+QuotedStr(edtCard.Text);

  if edtGeneralCode.Text <> '' then
      strFilter := strFilter + ' and generalCode='+QuotedStr(edtGeneralCode.Text);

  if edtName.Text <> '' then
      strFilter := strFilter + ' and lastName like '+QuotedStr('%'+edtName.Text+'%');

  if edtNID.Text <> '' then
      strFilter := strFilter + ' and NID='+QuotedStr(edtNID.Text);

  if edtGenderID.Text <> '' then
      strFilter := strFilter + ' and genderId='+edtGenderID.Text;

  QReceptionCredit.Close;
  QReceptionCredit.SQL.Clear;
  QReceptionCredit.SQL.Add('select ReceptionID, ReceptionDate, Name, lastName, numberOfAdult, numberOfChild, CreditGroupName ');
  QReceptionCredit.SQL.Add('from TReception inner join TCreditCard on TReception.CreditCardID = TCreditCard.CardID');
  QReceptionCredit.SQL.Add('inner join TCReditGroup on TCreditCard.CreditGroupID = TCReditGroup.CreditGroupID');
  QReceptionCredit.SQL.Add('where '+strFilter);
  QReceptionCredit.SQL.Add('order by ReceptionID');
  QReceptionCredit.Open;

  QSum.Close;
  QSum.SQL.Clear;
  QSum.SQL.Add('select sum(numberOfAdult) sumNumberOfAdult, sum(numberOfChild) sumNumberOfChild ');
  QSum.SQL.Add('from TReception inner join TCreditCard on TReception.CreditCardID = TCreditCard.CardID');
  QSum.SQL.Add('inner join TCReditGroup on TCreditCard.CreditGroupID = TCReditGroup.CreditGroupID');
  QSum.SQL.Add('where '+strFilter);
  QSum.Open;

  if QSum['sumNumberOfAdult'] <> null then
    lblCount.Caption := QSum['sumNumberOfAdult']
  else
    lblCount.Caption := '0';
end;

procedure TfrmReceptionCreditCardReport.btnCreditGroupClick(
  Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardGroupInfo, frmCreditCardGroupInfo);
    frmCreditCardGroupInfo.ShowModal;
    if frmCreditCardGroupInfo.strKey='enter' then
    begin
        edtCreditGroupID.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupID'];
        edtCreditGroupTitle.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmCreditCardGroupInfo);
end;

procedure TfrmReceptionCreditCardReport.btnUserClick(Sender: TObject);
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

procedure TfrmReceptionCreditCardReport.btnGenderClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGenderInfo, frmGenderInfo);
    frmGenderInfo.ShowModal;
    if frmGenderInfo.strKey='enter' then
    begin
        edtGenderID.Text:=frmGenderInfo.QGender['id'];
        edtGenderTitle.Text:=frmGenderInfo.QGender['Title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmGenderInfo);
end;

procedure TfrmReceptionCreditCardReport.FormCreate(Sender: TObject);
begin
    lblCount.Caption := '';
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
end;

procedure TfrmReceptionCreditCardReport.ExportToExcelClick(
  Sender: TObject);
begin
  ExportToExl(QReceptionCredit);
end;

end.
