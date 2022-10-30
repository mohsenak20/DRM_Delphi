unit CardListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, Grids, DBGrids, Buttons;

type
  TfrmCardList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    QCard: TADOQuery;
    rbUsedCard: TRadioButton;
    rbNotUsedCard: TRadioButton;
    rbBot: TRadioButton;
    DBGrid1: TDBGrid;
    dsCard: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblCode: TLabel;
    lblExpireDate: TLabel;
    lblCardPrice: TLabel;
    lblUsedCard: TLabel;
    lblNumber: TLabel;
    lblCoName: TLabel;
    lblStartCardNumber: TLabel;
    LblNotUsedCard: TLabel;
    lblBargainDate: TLabel;
    lblCardCount: TLabel;
    lblEndCardNumber: TLabel;
    lblBargainPrice: TLabel;
    BtnReturn: TBitBtn;
    procedure BtnReturnClick(Sender: TObject);
    procedure rbUsedCardClick(Sender: TObject);
    procedure rbNotUsedCardClick(Sender: TObject);
    procedure rbBotClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCardList: TfrmCardList;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmCardList.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCardList.rbUsedCardClick(Sender: TObject);
begin
    QCard.Close;
    QCard.Parameters.ParamByName('BargainID').Value := lblCode.Caption;
    QCard.Parameters.ParamByName('UsedCard').Value := 2;
    QCard.Open;
end;

procedure TfrmCardList.rbNotUsedCardClick(Sender: TObject);
begin
    QCard.Close;
    QCard.Parameters.ParamByName('BargainID').Value := lblCode.Caption;
    QCard.Parameters.ParamByName('UsedCard').Value := 3;
    QCard.Open;
end;

procedure TfrmCardList.rbBotClick(Sender: TObject);
begin
    QCard.Close;
    QCard.Parameters.ParamByName('BargainID').Value := lblCode.Caption;
    QCard.Parameters.ParamByName('UsedCard').Value := 1;
    QCard.Open;
end;

procedure TfrmCardList.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If QCard['ExpireDate'] <> lblExpireDate.Caption then
        DBGrid1.Canvas.Brush.Color:=clMoneyGreen;

    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
