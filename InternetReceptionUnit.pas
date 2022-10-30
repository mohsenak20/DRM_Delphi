unit InternetReceptionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, ADODB, Grids, DBGrids, ExtCtrls, Buttons;

type
  TfrmInternetReception = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    QInternetReception: TADOQuery;
    dsInternetReception: TDataSource;
    Label14: TLabel;
    edtStartDate: TMaskEdit;
    Label3: TLabel;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    BtnReturn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInternetReception: TfrmInternetReception;

implementation

uses DMUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmInternetReception.FormCreate(Sender: TObject);
begin
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
    btnSearch.Click();
end;

procedure TfrmInternetReception.btnSearchClick(Sender: TObject);
begin
    QInternetReception.Close;
    QInternetReception.Parameters.ParamByName('startDate').Value := edtStartDate.Text;
    QInternetReception.Parameters.ParamByName('endDate').Value := edtEndDate.Text;
    QInternetReception.Open;
end;

procedure TfrmInternetReception.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

end.
