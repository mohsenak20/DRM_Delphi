unit ReceptionCardPriceUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Buttons, Mask;

type
  TfrmREceptionCardPrice = class(TForm)
    Label14: TLabel;
    edtStartDate: TMaskEdit;
    Label3: TLabel;
    edtEndDate: TMaskEdit;
    Label1: TLabel;
    lblPrice: TLabel;
    BtnReturn: TBitBtn;
    QCardPrice: TADOQuery;
    BBtnAccept: TBitBtn;
    BtnPrint: TBitBtn;
    procedure BtnReturnClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmREceptionCardPrice: TfrmREceptionCardPrice;

implementation

uses DMUnit, qrReceptionCardPriceUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmREceptionCardPrice.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmREceptionCardPrice.BBtnAcceptClick(Sender: TObject);
begin
    QCardPrice.Close;
    QCardPrice.Parameters.ParamByName('StartDate').Value:= edtStartDate.Text;
    QCardPrice.Parameters.ParamByName('EndDate').Value:= edtEndDate.Text;
    QCardPrice.Open;
    if QCardPrice['price_mod']<>null then
        lblPrice.Caption := FormatFloat('#,', QCardPrice['price_mod'])
    else
        lblPrice.Caption := '';
end;

procedure TfrmREceptionCardPrice.BtnPrintClick(Sender: TObject);
begin
    BBtnAcceptClick(Sender);
    Application.CreateForm(TqrReceptionCardPrice, qrReceptionCardPrice);
    qrReceptionCardPrice.lblprice_befor.Caption := FormatFloat('#,', QCardPrice['price_befor']);
    qrReceptionCardPrice.lblprice_used_befor.Caption := FormatFloat('#,', QCardPrice['price_used_befor']);
    qrReceptionCardPrice.lblterm_price.Caption := FormatFloat('#,', QCardPrice['term_price']);
    qrReceptionCardPrice.lblprice_used_term.Caption := FormatFloat('#,', QCardPrice['price_used_term']);
    qrReceptionCardPrice.lblprice_in_term.Caption := FormatFloat('#,', QCardPrice['price_in_term']);
    qrReceptionCardPrice.lblprice_mod.Caption := FormatFloat('#,', QCardPrice['price_mod']);
    qrReceptionCardPrice.lbl1.Caption := '›—Ê‘ «“ «» œ«  « «Ê· '+edtStartDate.Text;
    qrReceptionCardPrice.lbl2.Caption := '«” ›«œÂ ‘œÂ «“ «» œ«  « «Ê· '+edtStartDate.Text;
    qrReceptionCardPrice.lbl3.Caption := '›—Ê‘ '+edtStartDate.Text+' «·Ì '+edtEndDate.Text;
    qrReceptionCardPrice.lbl4.Caption := '«” ›«œÂ ‘œÂ «“  «—ÌŒ '+edtStartDate.Text+'  « ¬Œ— '+edtEndDate.Text;
    qrReceptionCardPrice.lbl5.Caption := '«” ›«œÂ ‘œÂ «“ ›—Ê‘ '+ edtStartDate.Text+'  « ¬Œ— '+edtEndDate.Text;
    qrReceptionCardPrice.lbl6.Caption := '„«‰œÂ ò· «” ›«œÂ ‰‘œÂ  « ¬Œ— —Ê“ '+edtEndDate.Text;


    qrReceptionCardPrice.lblStartDate.Caption := edtStartDate.Text;
    qrReceptionCardPrice.lblEndDate.Caption:= edtEndDate.Text;
    qrReceptionCardPrice.lblCurrentDate.Caption := CurrentDate;
    qrReceptionCardPrice.Preview;
    FreeAndNil(qrReceptionCardPrice);
end;

procedure TfrmREceptionCardPrice.FormShow(Sender: TObject);
begin
    lblPrice.Caption := '';
end;

end.
