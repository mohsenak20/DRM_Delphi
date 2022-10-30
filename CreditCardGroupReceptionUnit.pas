unit CreditCardGroupReceptionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmCreditCardGroupReception = class(TForm)
    Panel1: TPanel;
    Label14: TLabel;
    Label2: TLabel;
    edtStartDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    edtEndDate: TMaskEdit;
    Panel2: TPanel;
    lblCount: TLabel;
    Label3: TLabel;
    ExportToExcel: TBitBtn;
    BtnReturn: TBitBtn;
    DBGrid1: TDBGrid;
    QReceptionCredit: TADOQuery;
    dsReceptionCredit: TDataSource;
    QSum: TADOQuery;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreditCardGroupReception: TfrmCreditCardGroupReception;

implementation

uses ShareUnit;

{$R *.dfm}

procedure TfrmCreditCardGroupReception.BBtnAcceptClick(Sender: TObject);
begin
    QReceptionCredit.Close;
    QReceptionCredit.Parameters.ParamByName('StartDate').Value := edtStartDate.Text;
    QReceptionCredit.Parameters.ParamByName('EndDate').Value := edtEndDate.Text;
    QReceptionCredit.Open;

    QSum.Close;
    QSum.Parameters.ParamByName('StartDate').Value := edtStartDate.Text;
    QSum.Parameters.ParamByName('EndDate').Value := edtEndDate.Text;
    QSum.Open;

    if QSum['count'] then
      lblCount.Caption := QSum['count']
    else
      lblCount.Caption := '0';

end;

procedure TfrmCreditCardGroupReception.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCreditCardGroupReception.FormCreate(Sender: TObject);
begin
    lblCount.Caption := '';
end;

procedure TfrmCreditCardGroupReception.ExportToExcelClick(Sender: TObject);
begin
  ExportToExl(QReceptionCredit);
end;

end.
