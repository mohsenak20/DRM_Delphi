unit creditCardsListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Mask, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  ADODB;

type
  TfrmCreditCardsList = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    edtSName: TEdit;
    edtSNID: TEdit;
    edtSCardNumber: TEdit;
    BBtnAccept: TBitBtn;
    btnCredit: TBitBtn;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    edtSGroupID: TEdit;
    edtSGroupName: TEdit;
    btnSGroupInfo: TBitBtn;
    ExportToExcel: TBitBtn;
    DBGrid1: TDBGrid;
    BtnReturn: TBitBtn;
    QCreditCard: TADOQuery;
    dsCreditCard: TDataSource;
    pmnuGrid: TPopupMenu;
    pmnuEdit: TMenuItem;
    mnuSummary: TMenuItem;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnSGroupInfoClick(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
    procedure btnCreditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreditCardsList: TfrmCreditCardsList;

implementation

uses DMUnit, CreditCardGroupInfoUnit, CreditCardChargeUnit, ShareUnit,
  CalculatUnit;

{$R *.dfm}

procedure TfrmCreditCardsList.BBtnAcceptClick(Sender: TObject);
var
    strFilter : string;
begin
    strFilter := ' issueDate >= '+QuotedStr(edtStartDate.Text)+' and IssueDate <= '+QuotedStr(edtEndDate.Text);
    If edtSName.Text <> '' then
        strFilter := strFilter + ' and lastName like '+QuotedStr('%'+edtSName.Text+'%');
    if edtSNID.Text <> '' then
        strFilter := strFilter + ' and NID like '+QuotedStr('%'+edtSNID.Text+'%');
    if edtSCardNumber.Text <> '' then
        strFilter := strFilter + ' and CardID like '+QuotedStr('%'+edtSCardNumber.Text+'%');

    if edtSGroupID.Text <> '' then
        strFilter := strFilter + ' and TCreditCard.CreditGroupID ='+edtSGroupID.Text;

    QCreditCard.Close;
    QCreditCard.SQL.Clear;
    QCreditCard.SQL.Add('select CardID, Name, lastName, NID, FatherName, Address, Tel, TCreditCard.CreditGroupID, NumberOfCustomer,');
    QCreditCard.SQL.Add('CreditGroupName, Pic, IssueDate, IssueTime, UserID, Active, Comment, Type,  TCReditCardType.title, TCreditCard.CardIssuePrice, generalCode, NotActive, ');
    QCreditCard.SQL.Add('gender.title genderTitle, genderId');
    QCreditCard.SQL.Add('from TCreditCard inner join TCreditGroup');
    QCreditCard.SQL.Add('on TCreditCard.CreditGroupID = TCreditGroup.CreditGroupID');
    QCreditCard.SQL.Add('inner join TCReditCardType on TCreditCardType.id = TCreditCard.type');
    QCreditCard.SQL.Add('inner join gender on TCreditCard.genderId = gender.id');
    if strFilter <> '' then
        QCreditCard.SQL.Add(' where '+strFilter);
    QCreditCard.SQL.Add('order by  issueDate, IssueTime DESC');
    QCreditCard.Open;
end;

procedure TfrmCreditCardsList.btnSGroupInfoClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardGroupInfo, frmCreditCardGroupInfo);
    frmCreditCardGroupInfo.ShowModal;
    if frmCreditCardGroupInfo.strKey='enter' then
    begin
        edtSGroupID.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupID'];
        edtSGroupName.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmCreditCardGroupInfo);
end;

procedure TfrmCreditCardsList.ExportToExcelClick(Sender: TObject);
begin
  ExportToExl(QCreditCard);
end;

procedure TfrmCreditCardsList.btnCreditClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardCharge, frmCreditCardCharge);
    frmCreditCardCharge.ShowModal;
    FreeAndNil(frmCreditCardCharge);
end;

procedure TfrmCreditCardsList.FormCreate(Sender: TObject);
begin
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
    QCreditCard.Open;
end;

procedure TfrmCreditCardsList.BtnReturnClick(Sender: TObject);
begin
  Close;
end;

end.
