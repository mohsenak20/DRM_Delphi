unit CreditCardPriceGroupInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCreditCardPriceGroupInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QGroup: TADOQuery;
    dsGroup: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;
var
  frmCreditCardPriceGroupInfo: TfrmCreditCardPriceGroupInfo;

implementation
uses DMUnit, CreditCardPriceGroupUnit;
{$R *.dfm}


procedure TfrmCreditCardPriceGroupInfo.FormCreate(Sender: TObject);
begin
    QGroup.Close;
    QGroup.Parameters.ParamByName('title').Value:='%%';
    QGroup.Open;
end;

procedure TfrmCreditCardPriceGroupInfo.edtSearchChange(Sender: TObject);
begin
    QGroup.Close;
    QGroup.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QGroup.Open;
end;

procedure TfrmCreditCardPriceGroupInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCreditCardPriceGroupInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCreditCardPriceGroupInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardPriceGroup, frmCreditCardPriceGroup);
    frmCreditCardPriceGroup.ShowModal;
    FreeAndNil(frmCreditCardPriceGroup);
    QGroup.Close;
    QGroup.Open;
end;
end.
