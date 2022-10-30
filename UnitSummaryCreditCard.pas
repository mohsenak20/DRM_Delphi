unit UnitSummaryCreditCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, ExtCtrls, StdCtrls, Buttons, Menus;

type
  TfrmSummaryCreditCard = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    QSummaryReception: TADOQuery;
    QCredit: TADOQuery;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    QReception: TADOQuery;
    dsCredit: TDataSource;
    dsReception: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    lblSummaryReception: TLabel;
    lblSummaryCreduit: TLabel;
    QCreditCreditCardChargeID: TAutoIncField;
    QCreditCreditCardID: TWideStringField;
    QCreditPrice: TIntegerField;
    QCreditChargeTime: TStringField;
    QCreditChargeDate: TStringField;
    QCreditNumberOfSession: TIntegerField;
    QCreditChargeGroupID: TIntegerField;
    QCreditUserID: TIntegerField;
    QCreditActive: TSmallintField;
    QReceptionReceptionID: TLargeintField;
    QReceptionCustomerName: TWideStringField;
    QReceptionReceptionDate: TStringField;
    QReceptionClosedID: TIntegerField;
    QReceptionNumberOfAdult: TIntegerField;
    QReceptionNumberOfChild: TIntegerField;
    QSummaryCredit: TADOQuery;
    BtnReturn: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    lblPriceUsed: TLabel;
    Label5: TLabel;
    lblMod: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    QDeleteCredit: TADOQuery;
    PopupMenu1: TPopupMenu;
    mnuDeleteCreditCardCharge: TMenuItem;
    procedure BtnReturnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuDeleteCreditCardChargeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSummaryCreditCard: TfrmSummaryCreditCard;

implementation

uses DMUnit, CreditCardUnit, creditCardsListUnit;

{$R *.dfm}

procedure TfrmSummaryCreditCard.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSummaryCreditCard.FormCreate(Sender: TObject);
begin
    QSummaryReception.Parameters.ParamByName('CreditCardID').Value := frmCreditCard.QCreditCard['CardID'];
    QSummaryReception.Open;
    if QSummaryReception['sumNumber']<> null then
    begin
        lblSummaryReception.Caption := IntToStr(QSummaryReception['sumNumber']);
        lblPriceUsed.Caption := IntToStr(QSummaryReception['used']);
    end
    else
    begin
        lblSummaryReception.Caption := '0';
        lblPriceUsed.Caption := '0';
    end;

    QSummaryCredit.Parameters.ParamByName('CreditCardID').Value := frmCreditCard.QCreditCard['CardID'];
    QSummaryCredit.Open;
    if QSummaryCredit['sumPrice']<> null then
        lblSummaryCreduit.Caption := IntToStr(QSummaryCredit['sumPrice'])
    else
        lblSummaryCreduit.Caption := '0';

    lblMod.Caption := FormatFloat('#,', StrToIntDef(lblSummaryCreduit.Caption, 0)-StrToIntDef(lblPriceUsed.Caption, 0));

    QReception.Parameters.ParamByName('CreditCardID').Value := frmCreditCard.QCreditCard['CardID'];
    QReception.Open;

    QCredit.Parameters.ParamByName('CreditCardID').Value := frmCreditCard.QCreditCard['CardID'];
    QCredit.Open;

end;

procedure TfrmSummaryCreditCard.mnuDeleteCreditCardChargeClick(
  Sender: TObject);
var
  price, modPrice : integer;
begin
  if QCredit['price'] <= (QSummaryCredit['sumPrice'] - QSummaryReception['used'])  then
  begin
    price := QCredit['price'];
    QDeleteCredit.Parameters.ParamByName('CreditCardChargeID').Value := QCredit['CreditCardChargeID'];
    QDeleteCredit.ExecSQL;
    QCredit.Close;
    QCredit.Open;
    QSummaryReception.Close;
    QSummaryReception.Parameters.Refresh;
    QSummaryReception.Open;

    lblSummaryCreduit.Caption := IntToStr(QSummaryCredit['sumPrice']);
    modPrice := StrToIntDef(lblSummaryCreduit.Caption, 0)-StrToIntDef(lblPriceUsed.Caption, 0);
    lblMod.Caption := FormatFloat('#,', modPrice);
    ShowMessage('ÔÇÑŽ ãæÑÏ äÙÑ ÍÐÝ ÑÏíÏ');
  end
  else
    ShowMessage('ÔÇÑŽ ãæÑÏ äÙÑ ÌåÊ ÍÐÝ ÔÏä ÈíÔÊÑ ÇÒ ãÇäÏå ÔÇÑŽ ãí ÈÇÔÏ æ Çã˜Çä ÍÐÝ ÔÇÑŽ äãí ÈÇÔÏ.');
end;

end.
