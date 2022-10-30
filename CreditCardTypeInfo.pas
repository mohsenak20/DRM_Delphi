unit CreditCardTypeInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmCreditCardTypeInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QCreditCardType: TADOQuery;
    dsCreditCardType: TDataSource;
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
  frmCreditCardTypeInfo: TfrmCreditCardTypeInfo;

implementation
uses DMUnit, VahedUnit, CreditGroupUnit;

{$R *.dfm}
procedure TfrmCreditCardTypeInfo.FormCreate(Sender: TObject);
begin
    QCreditCardType.Close;
    QCreditCardType.Parameters.ParamByName('Title').Value:='%%';
    QCreditCardType.Open;
end;

procedure TfrmCreditCardTypeInfo.edtSearchChange(Sender: TObject);
begin
    QCreditCardType.Close;
    QCreditCardType.Parameters.ParamByName('Title').Value:='%'+edtSearch.Text+'%';
    QCreditCardType.Open;
end;

procedure TfrmCreditCardTypeInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCreditCardTypeInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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
