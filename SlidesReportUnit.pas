unit SlidesReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, ExtCtrls, StdCtrls, Buttons;

type
  TfrmSlidesReport = class(TForm)
    QSlides: TADOQuery;
    DBGrid1: TDBGrid;
    dcSlides: TDataSource;
    QSelectDate: TADOQuery;
    QUpdateDate: TADOQuery;
    QSelectDateID: TAutoIncField;
    QSelectDateTimeStamp: TWideStringField;
    ADOConnection1: TADOConnection;
    Panel1: TPanel;
    Label7: TLabel;
    edtStartTime: TEdit;
    Label8: TLabel;
    edtEndTime: TEdit;
    BBtnAccept: TBitBtn;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSlidesReport: TfrmSlidesReport;

implementation

uses DMUnit, OneSlideReportUnit, UFarsiDate, ShareUnit;

{$R *.dfm}

procedure TfrmSlidesReport.DBGrid1DblClick(Sender: TObject);
begin
    {Application.CreateForm(TfrmOneSlidesReport, frmOneSlidesReport);
    frmOneSlidesReport.KalaID := QSlides['KalaID'];
    frmOneSlidesReport.ReceptionDate := QSlides.Parameters.ParamValues['ReceptionDate'];
    frmOneSlidesReport.BBtnAcceptClick(Sender);
    frmOneSlidesReport.Caption := frmOneSlidesReport.Caption + '-------- '+QSlides['KalaName']+' --------';
    frmOneSlidesReport.ShowModal;
    FreeAndNil(frmOneSlidesReport);}
end;


procedure TfrmSlidesReport.FormCreate(Sender: TObject);
begin
    {QSelectDate.Close;
    QSelectDate.Open;
    while not QSelectDate.Eof do
    begin
        QUpdateDate.Close;
        QUpdateDate.Parameters.ParamByName('IssueDate').Value := m2sh(Copy(QSelectDate['TimeStamp'], 7, 4)+'/'+Copy(QSelectDate['TimeStamp'], 1, 5));
        QUpdateDate.Parameters.ParamByName('ID').Value := QSelectDate['ID'];
        QUpdateDate.ExecSQL;
        QSelectDate.Next;
    end;}
end;

procedure TfrmSlidesReport.BBtnAcceptClick(Sender: TObject);
begin
    QSlides.Close;
    if edtStartTime.Text <> '' then
      QSlides.Parameters.ParamByName('start_time').Value := edtStartTime.Text
    else
      QSlides.Parameters.ParamByName('start_time').Value := '00:00';
    if edtEndTime.Text <> '' then
      QSlides.Parameters.ParamByName('end_time').Value := edtEndTime.Text
    else
      QSlides.Parameters.ParamByName('end_time').Value := '99:99';
    QSlides.Open;
end;

end.





