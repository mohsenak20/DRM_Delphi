unit ReceptionCreditCardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Mask;

type
  TfrmReceptionCreditCard = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    QReceptionCreditCard: TADOQuery;
    dsReceptionCreditCard: TDataSource;
    Label14: TLabel;
    edtReceptionDate: TMaskEdit;
    btnSearch: TBitBtn;
    BtnReturn: TBitBtn;
    procedure BtnReturnClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReceptionCreditCard: TfrmReceptionCreditCard;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmReceptionCreditCard.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmReceptionCreditCard.btnSearchClick(Sender: TObject);
begin
    QReceptionCreditCard.Close;
    QReceptionCreditCard.Parameters.ParamByName('ReceptionDate').Value := edtReceptionDate.Text;
    QReceptionCreditCard.Open;
end;

end.
