unit AvgPriceUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, TeeProcs, Chart, StdCtrls, Mask, Buttons,
  ExtCtrls, DB, ADODB;

type
  TfrmAvgPrice = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    BBtnAccept: TBitBtn;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    Panel2: TPanel;
    btnReturn: TBitBtn;
    btnPrint: TBitBtn;
    Panel3: TPanel;
    Chart1: TChart;
    Series1: TLineSeries;
    QOrderDiscount: TADOQuery;
    rbAvgPrice: TRadioButton;
    rbDiscount: TRadioButton;
    rbDailyInCome: TRadioButton;
    rbNumber: TRadioButton;
    Series2: TLineSeries;
    Series3: TLineSeries;
    lblAvgPrice: TLabel;
    Label4: TLabel;
    QAvgPrice: TADOQuery;
    Label2: TLabel;
    lblSumCardPrice: TLabel;
    Label6: TLabel;
    lblSumCardCount: TLabel;
    Label8: TLabel;
    lblMidPrice: TLabel;
    QCard: TADOQuery;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvgPrice: TfrmAvgPrice;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmAvgPrice.BBtnAcceptClick(Sender: TObject);
begin

    Series1.Clear;
    QOrderDiscount.Close;
    QOrderDiscount.Parameters.ParamByName('StartDate').Value := edtStartDate.Text;
    QOrderDiscount.Parameters.ParamByName('EndDate').Value := edtEndDate.Text;
    QOrderDiscount.Open;

    while not QOrderDiscount.Eof do
    begin
        if rbAvgPrice.Checked then
            Series1.Add(QOrderDiscount['AvrPrice'],  QOrderDiscount['ReceptionDate'], clGreen )
        else
            if rbDiscount.Checked then
                Series1.Add(QOrderDiscount['Price'],  QOrderDiscount['ReceptionDate'], clGreen )
            else
                if rbDailyInCome.Checked then
                    Series1.Add(QOrderDiscount['DailyInCome'],  QOrderDiscount['ReceptionDate'], clGreen )
                else
                    Series1.Add(QOrderDiscount['Number'],  QOrderDiscount['ReceptionDate'], clGreen );
        QOrderDiscount.Next;
    end;
    QAvgPrice.Close;
    QAvgPrice.Parameters.ParamByName('StartReceptionDate').Value := edtStartDate.Text;
    QAvgPrice.Parameters.ParamByName('EndReceptionDate').Value := edtEndDate.Text;
    QAvgPrice.Open;
    if QAvgPrice['avg'] <> null then
        lblAvgPrice.Caption :=  FormatFloat('#,',QAvgPrice['avg'])
    else
        lblAvgPrice.Caption := '0';

    QCard.Close;
    QCard.Open;
    if QCard['SumCardPrice']<> null then
    begin
        lblSumCardPrice.Caption := FormatFloat('#,', QCard['SumCardPrice']);
        lblSumCardCount.Caption := FormatFloat('#,', QCard['SumCardCount']);
        lblMidPrice.Caption := FormatFloat('#,', QCard['MidPrice']);
    end
    else
    begin
        lblSumCardPrice.Caption := '0';
        lblSumCardCount.Caption := '0';
        lblMidPrice.Caption := '0';
    end;

end;

procedure TfrmAvgPrice.btnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmAvgPrice.FormShow(Sender: TObject);
begin
    lblAvgPrice.Caption := '';
end;

end.
