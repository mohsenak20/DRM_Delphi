unit OrderDiscountInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmOrderDiscountInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QOrderDiscount: TADOQuery;
    dsOrderDiscount: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;
  end;

var
  frmOrderDiscountInfo: TfrmOrderDiscountInfo;

implementation
  uses DMUnit, CalculatUnit, ShareUnit;
{$R *.dfm}

procedure TfrmOrderDiscountInfo.FormCreate(Sender: TObject);
begin
    QOrderDiscount.Close;
    QOrderDiscount.Parameters.ParamByName('customerName').Value:='%%';
    QOrderDiscount.Parameters.ParamByName('orderDate').Value := CurrentDate;
    QOrderDiscount.Parameters.ParamByName('userId').Value := UserInfo.UserID;
    QOrderDiscount.Open;
end;

procedure TfrmOrderDiscountInfo.edtSearchChange(Sender: TObject);
begin
    QOrderDiscount.Close;
    QOrderDiscount.Parameters.ParamByName('customerName').Value:='%'+edtSearch.Text+'%';
    QOrderDiscount.Parameters.ParamByName('orderDate').Value := CurrentDate;
    QOrderDiscount.Parameters.ParamByName('userId').Value := UserInfo.UserID;
    QOrderDiscount.Open;
end;

procedure TfrmOrderDiscountInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=13 then
        DBGrid.SetFocus
    else
        if Key=27 then
        begin
            Close;
        end;
end;

procedure TfrmOrderDiscountInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then
    begin
        strKey:='enter';
        Close;
    end
    else
        if key=27 then
            Close;
end;

end.
