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
            Series1.Add(  QReception['TBK'], '����� ��' , clGreen ) ;

        if QReception['TedadB']<>Null then
            Series1.Add(  QReception['TedadB'], '��ѐ���' , clGreen ) ;

        if QReception['TedadK']<>Null then
            Series1.Add(  QReception['TedadK'], '������' , clGreen ) ;

        if QReception['CardCount']<>Null then
            Series1.Add(  QReception['CardCount'], '����' , clGreen ) ;

        if QReception['CofeeShop2']<>Null then
            Chart1.Series[0].Add(  QReception['CofeeShop2'], '���� �ǁ ������' , clGreen )
        else
            Chart1.Series[0].Add(  0, '���� �ǁ ������' , clGreen );

        if QReception['FastFood1']<>Null then
            Chart2.Series[0].Add(  QReception['FastFood1'], '������� ������' , clGreen )
        else
            Chart2.Series[0].Add(  0, '������� ������' , clGreen );

        if QReception['FastFood2']<>Null then
            Chart2.Series[0].Add(  QReception['FastFood2'], '������� ������' , clGreen )
        else
            Chart2.Series[0].Add(  0, '������� ������' , clGreen );


        if QReception['Sport1']<>Null then
            Chart2.Series[0].Add(  QReception['Sport1'], '����� ������' , clGreen )
        else
            Chart2.Series[0].Add(  0, '����� ������' , clGreen );

       if QReception['Sport2']<>Null then
            Chart2.Series[0].Add(  QReception['Sport2'], '����� ������' , clGreen )
        else
            Chart2.Series[0].Add(  0, '����� ������' , clGreen );


        if QReception['Sona']<>Null then
            Chart1.Series[0].Add(  QReception['Sona'], '���� �ǁ ����' , clGreen )
        else
            Chart1.Series[0].Add(  0, '���� �ǁ ����' , clGreen );

        if QReception['Photo']<>Null then
            Chart1.Series[0].Add(  QReception['Photo'], 'ژ���' , clGreen )
        else
            Chart1.Series[0].Add(  0, 'ژ���' , clGreen );

        if QReception['Hamam1']<>Null then
            Chart1.Series[0].Add(  QReception['Hamam1'], '���� �ј� ������' , clGreen )
        else
            Chart1.Series[0].Add(  0, '���� �ј� ������' , clGreen );

        if QReception['Hamam2']<>Null then
            Chart1.Series[0].Add(  QReception['Hamam2'], '���� �ј� ������' , clGreen )
        else
            Chart1.Series[0].Add(  0, '���� �ј� ������' , clGreen );

        if QReception['Revagh']<>Null then
            Chart1.Series[0].Add(  QReception['Revagh'], '����' , clGreen )
        else
            Chart1.Series[0].Add(  0, '����' , clGreen );

        if QReception['Joice']<>Null then
            Chart1.Series[0].Add(  QReception['Joice'], '������' , clGreen )
        else
            Chart1.Series[0].Add(  0, '������' , clGreen );

        if QReception['Orange']<>Null then
            Chart1.Series[0].Add(  QReception['Orange'], '�� ������' , clGreen )
        else
            Chart1.Series[0].Add(  0, '�� ������' , clGreen );


    QReception.Close;
    QReception.Parameters.ParamByName('StartDate').Value:=edtStartDate2.Text;
    QReception.Parameters.ParamByName('EndDate').Value:=edtEndDate2.Text;
    QReception.Open;

        if QReception['TBK']<>Null then
            Series2.Add(  QReception['TBK'], '����� ��' , clRed ) ;

        if QReception['TedadB']<>Null then
            Series2.Add(  QReception['TedadB'], '��ѐ���' , clRed ) ;

        if QReception['TedadK']<>Null then
            Series2.Add(  QReception['TedadK'], '������' , clRed ) ;

        if QReception['CardCount']<>Null then
            Series2.Add(  QReception['CardCount'], '����' , clRed ) ;

        if QReception['CofeeShop2']<>Null then
            Chart1.Series[1].Add(  QReception['CofeeShop2'], '���� �ǁ ������' , clRed )
        else
            Chart1.Series[1].Add(  0,  '���� �ǁ ������' , clRed );

        if QReception['FastFood1']<>Null then
            Chart2.Series[1].Add(  QReception['FastFood1'], '������� ������' , clRed )
        else
            Chart2.Series[1].Add(  0, '������� ������' , clRed );

        if QReception['FastFood2']<>Null then
            Chart2.Series[1].Add(  QReception['FastFood2'], '������� ������' , clRed )
        else
            Chart2.Series[1].Add(  0, '������� ������' , clRed );

        if QReception['Sport1']<>Null then
            Chart2.Series[1].Add(  QReception['Sport1'], '����� ������' , clRed )
        else
            Chart2.Series[1].Add(  0, '����� ������' , clRed );

        if QReception['Sport2']<>Null then
            Chart2.Series[1].Add(  QReception['Sport2'], '����� ������' , clRed )
        else
            Chart2.Series[1].Add(  0, '����� ������' , clRed );


        if QReception['Sona']<>Null then
            Chart1.Series[1].Add(  QReception['Sona'], '���� �ǁ ����' , clRed )
        else
            Chart1.Series[1].Add(  0, '���� �ǁ ����' , clRed );


        if QReception['Photo']<>Null then
            Chart1.Series[1].Add(  QReception['Photo'], 'ژ���' , clRed )
        else
            Chart1.Series[1].Add(  0, 'ژ���' , clRed );

        if QReception['Hamam1']<>Null then
            Chart1.Series[1].Add(  QReception['Hamam1'], '���� �ј� ������' , clRed )
        else
            Chart1.Series[1].Add(  0, '���� �ј� ������' , clRed );

        if QReception['Hamam2']<>Null then
            Chart1.Series[1].Add(  QReception['Hamam2'], '���� �ј� ������' , clRed )
        else
            Chart1.Series[1].Add(  0, '���� �ј� ������' , clRed );

        if QReception['Revagh']<>Null then
            Chart1.Series[1].Add(  QReception['Revagh'], '����' , clRed )
        else
            Chart1.Series[1].Add(  0, '����' , clRed );

        if QReception['Joice']<>Null then
            Chart1.Series[1].Add(  QReception['Joice'], '������' , clRed )
        else
            Chart1.Series[1].Add(  0, '������' , clRed );

        if QReception['Orange']<>Null then
            Chart1.Series[1].Add(  QReception['Orange'], '�� ������' , clRed )
        else
            Chart1.Series[1].Add(  0, '�� ������' , clRed );




end;

procedure TfrmReceptionChart.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

end.
