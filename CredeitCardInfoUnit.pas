unit CredeitCardInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCreditCardInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtName: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QCreditCard: TADOQuery;
    dsCreditCard: TDataSource;
    edtCreditCardID: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCreditCardIDExit(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;

var
  frmCreditCardInfo: TfrmCreditCardInfo;

implementation
uses DMUnit;

{$R *.dfm}


procedure TfrmCreditCardInfo.FormCreate(Sender: TObject);
begin
    QCreditCard.Close;
    QCreditCard.Parameters.ParamByName('CardID').Value:='%%';
    QCreditCard.Parameters.ParamByName('Name').Value:='%%';
    QCreditCard.Open;
end;

procedure TfrmCreditCardInfo.edtSearchChange(Sender: TObject);
begin
    QCreditCard.Close;
    if edtCreditCardID.Text <> '' then
        QCreditCard.Parameters.ParamByName('CardID').Value:='%'+edtCreditCardID.Text+'%'
    else
        QCreditCard.Parameters.ParamByName('CardID').Value:='-1';
    QCreditCard.Parameters.ParamByName('Name').Value:='%'+edtName.Text+'%';
    QCreditCard.Open;
end;

procedure TfrmCreditCardInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCreditCardInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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


procedure TfrmCreditCardInfo.edtCreditCardIDExit(Sender: TObject);
begin
    if edtCreditCardID.Text <> '' then
    begin
        QCreditCard.Close;
        QCreditCard.Parameters.ParamByName('CardID').Value:= edtCreditCardID.Text;
        QCreditCard.Parameters.ParamByName('name').Value:= '';
        QCreditCard.Open;
    end;
end;

procedure TfrmCreditCardInfo.edtNameChange(Sender: TObject);
begin
    QCreditCard.Close;
    QCreditCard.Parameters.ParamByName('CardID').Value:= '-1';
    QCreditCard.Parameters.ParamByName('name').Value:='%'+edtName.Text+'%';
    QCreditCard.Open;
end;

end.
