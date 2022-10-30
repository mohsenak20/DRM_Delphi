unit ReceptionChartUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, TeEngine, Series, TeeProcs, Chart, Mask, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmReceptionChart = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    edtStartDate2: TMaskEdit;
    edtEndDate2: TMaskEdit;
    BBtnAccept: TBitBtn;
    Panel2: TPanel;
    btnReturn: TBitBtn;
    btnPrint: TBitBtn;
    QReception: TADOQuery;
    Label1: TLabel;
    Label3: TLabel;
    edtStartDate1: TMaskEdit;
    edtEndDate1: TMaskEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Chart: TChart;
    Series1: TBarSeries;
    Chart1: TChart;
    BarSeries8: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Chart2: TChart;
    BarSeries1: TBarSeries;
    BarSeries2: TBarSeries;
    rbMen: TRadioButton;
    rbWomen: TRadioButton;
    RadioButton3: TRadioButton;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReceptionChart: TfrmReceptionChart;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmReceptionChart.BBtnAcceptClick(Sender: TObject);
begin
    Series1.Clear;
    Chart1.Series[0].Clear;

    Series2.Clear;
    Chart1.Series[1].Clear;

    Series1.Clear;
    Chart2.Series[0].Clear;

    Series2.Clear;
    Chart1.Series[1].Clear;

    QReception.Close;
    QReception.Parameters.ParamByName('StartDate').Value:=edtStartDate1.Text;
    QReception.Parameters.ParamByName('EndDate').Value:=edtEndDate1.Text;
    if rbMen.Checked then
      QReception.Parameters.ParamByName('service_center_id').Value:= 1
    else
      if rbWomen.Checked then
        QReception.Parameters.ParamByName('service_center_id').Value:= 2
      else
        QReception.Parameters.ParamByName('service_center_id').Value:= -1;
    QReception.Open;

        if QReception['TBK']<>Null then
            Series1.Add(  QReception['TBK'], ' ⁄œ«œ ò·' , clGreen ) ;

        if QReception['TedadB']<>Null then
            Series1.Add(  QReception['TedadB'], '»“—ê”«·' , clGreen ) ;

        if QReception['TedadK']<>Null then
            Series1.Add(  QReception['TedadK'], 'Œ—œ”«·' , clGreen ) ;

        if QReception['CardCount']<>Null then
            Series1.Add(  QReception['CardCount'], 'ò«— ' , clGreen ) ;

        if QReception['CofeeShop2']<>Null then
            Chart1.Series[0].Add(  QReception['CofeeShop2'], 'ò«›Ì ‘«Å »«‰Ê«‰' , clGreen )
        else
            Chart1.Series[0].Add(  0, 'ò«›Ì ‘«Å »«‰Ê«‰' , clGreen );

        if QReception['FastFood1']<>Null then
            Chart2.Series[0].Add(  QReception['FastFood1'], '—” Ê—«‰ ¬ﬁ«Ì«‰' , clGreen )
        else
            Chart2.Series[0].Add(  0, '—” Ê—«‰ ¬ﬁ«Ì«‰' , clGreen );

        if QReception['FastFood2']<>Null then
            Chart2.Series[0].Add(  QReception['FastFood2'], '—” Ê—«‰ »«‰Ê«‰' , clGreen )
        else
            Chart2.Series[0].Add(  0, '—” Ê—«‰ »«‰Ê«‰' , clGreen );


        if QReception['Sport1']<>Null then
            Chart2.Series[0].Add(  QReception['Sport1'], 'Ê—“‘Ì ¬ﬁ«Ì«‰' , clGreen )
        else
            Chart2.Series[0].Add(  0, 'Ê—“‘Ì ¬ﬁ«Ì«‰' , clGreen );

       if QReception['Sport2']<>Null then
            Chart2.Series[0].Add(  QReception['Sport2'], 'Ê—“‘Ì »«‰Ê«‰' , clGreen )
        else
            Chart2.Series[0].Add(  0, 'Ê—“‘Ì »«‰Ê«‰' , clGreen );


        if QReception['Sona']<>Null then
            Chart1.Series[0].Add(  QReception['Sona'], 'ò«›Ì ‘«Å ”Ê‰«' , clGreen )
        else
            Chart1.Series[0].Add(  0, 'ò«›Ì ‘«Å ”Ê‰«' , clGreen );

        if QReception['Photo']<>Null then
            Chart1.Series[0].Add(  QReception['Photo'], '⁄ò«”Ì' , clGreen )
        else
            Chart1.Series[0].Add(  0, '⁄ò«”Ì' , clGreen );

        if QReception['Hamam1']<>Null then
            Chart1.Series[0].Add(  QReception['Hamam1'], 'Õ„«„  —òÌ ¬ﬁ«Ì«‰' , clGreen )
        else
            Chart1.Series[0].Add(  0, 'Õ„«„  —òÌ ¬ﬁ«Ì«‰' , clGreen );

        if QReception['Hamam2']<>Null then
            Chart1.Series[0].Add(  QReception['Hamam2'], 'Õ„«„  —òÌ »«‰Ê«‰' , clGreen )
        else
            Chart1.Series[0].Add(  0, 'Õ„«„  —òÌ »«‰Ê«‰' , clGreen );

        if QReception['Revagh']<>Null then
            Chart1.Series[0].Add(  QReception['Revagh'], '—Ê«ﬁ' , clGreen )
        else
            Chart1.Series[0].Add(  0, '—Ê«ﬁ' , clGreen );

        if QReception['Joice']<>Null then
            Chart1.Series[0].Add(  QReception['Joice'], '¬»„ÌÊÂ' , clGreen )
        else
            Chart1.Series[0].Add(  0, '¬»„ÌÊÂ' , clGreen );

        if QReception['Orange']<>Null then
            Chart1.Series[0].Add(  QReception['Orange'], '¬» Å— €«·' , clGreen )
        else
            Chart1.Series[0].Add(  0, '¬» Å— €«·' , clGreen );


    QReception.Close;
    QReception.Parameters.ParamByName('StartDate').Value:=edtStartDate2.Text;
    QReception.Parameters.ParamByName('EndDate').Value:=edtEndDate2.Text;
    QReception.Open;

        if QReception['TBK']<>Null then
            Series2.Add(  QReception['TBK'], ' ⁄œ«œ ò·' , clRed ) ;

        if QReception['TedadB']<>Null then
            Series2.Add(  QReception['TedadB'], '»“—ê”«·' , clRed ) ;

        if QReception['TedadK']<>Null then
            Series2.Add(  QReception['TedadK'], 'Œ—œ”«·' , clRed ) ;

        if QReception['CardCount']<>Null then
            Series2.Add(  QReception['CardCount'], 'ò«— ' , clRed ) ;

        if QReception['CofeeShop2']<>Null then
            Chart1.Series[1].Add(  QReception['CofeeShop2'], 'ò«›Ì ‘«Å »«‰Ê«‰' , clRed )
        else
            Chart1.Series[1].Add(  0,  'ò«›Ì ‘«Å »«‰Ê«‰' , clRed );

        if QReception['FastFood1']<>Null then
            Chart2.Series[1].Add(  QReception['FastFood1'], '—” Ê—«‰ ¬ﬁ«Ì«‰' , clRed )
        else
            Chart2.Series[1].Add(  0, '—” Ê—«‰ ¬ﬁ«Ì«‰' , clRed );

        if QReception['FastFood2']<>Null then
            Chart2.Series[1].Add(  QReception['FastFood2'], '—” Ê—«‰ »«‰Ê«‰' , clRed )
        else
            Chart2.Series[1].Add(  0, '—” Ê—«‰ »«‰Ê«‰' , clRed );

        if QReception['Sport1']<>Null then
            Chart2.Series[1].Add(  QReception['Sport1'], 'Ê—“‘Ì ¬ﬁ«Ì«‰' , clRed )
        else
            Chart2.Series[1].Add(  0, 'Ê—“‘Ì ¬ﬁ«Ì«‰' , clRed );

        if QReception['Sport2']<>Null then
            Chart2.Series[1].Add(  QReception['Sport2'], 'Ê—“‘Ì »«‰Ê«‰' , clRed )
        else
            Chart2.Series[1].Add(  0, 'Ê—“‘Ì »«‰Ê«‰' , clRed );


        if QReception['Sona']<>Null then
            Chart1.Series[1].Add(  QReception['Sona'], 'ò«›Ì ‘«Å ”Ê‰«' , clRed )
        else
            Chart1.Series[1].Add(  0, 'ò«›Ì ‘«Å ”Ê‰«' , clRed );


        if QReception['Photo']<>Null then
            Chart1.Series[1].Add(  QReception['Photo'], '⁄ò«”Ì' , clRed )
        else
            Chart1.Series[1].Add(  0, '⁄ò«”Ì' , clRed );

        if QReception['Hamam1']<>Null then
            Chart1.Series[1].Add(  QReception['Hamam1'], 'Õ„«„  —òÌ ¬ﬁ«Ì«‰' , clRed )
        else
            Chart1.Series[1].Add(  0, 'Õ„«„  —òÌ ¬ﬁ«Ì«‰' , clRed );

        if QReception['Hamam2']<>Null then
            Chart1.Series[1].Add(  QReception['Hamam2'], 'Õ„«„  —òÌ »«‰Ê«‰' , clRed )
        else
            Chart1.Series[1].Add(  0, 'Õ„«„  —òÌ »«‰Ê«‰' , clRed );

        if QReception['Revagh']<>Null then
            Chart1.Series[1].Add(  QReception['Revagh'], '—Ê«ﬁ' , clRed )
        else
            Chart1.Series[1].Add(  0, '—Ê«ﬁ' , clRed );

        if QReception['Joice']<>Null then
            Chart1.Series[1].Add(  QReception['Joice'], '¬»Ì„ÊÂ' , clRed )
        else
            Chart1.Series[1].Add(  0, '¬»„ÌÊÂ' , clRed );

        if QReception['Orange']<>Null then
            Chart1.Series[1].Add(  QReception['Orange'], '¬» Å— €«·' , clRed )
        else
            Chart1.Series[1].Add(  0, '¬» Å— €«·' , clRed );




end;

procedure TfrmReceptionChart.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

end.
