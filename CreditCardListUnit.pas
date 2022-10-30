unit CreditCardListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, ADODB, StdCtrls;

type
  TfrmCreditCardList = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblCreditGroupName: TLabel;
    lblName: TLabel;
    lblCardID: TLabel;
    QCredit: TADOQuery;
    dsCredit: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreditCardList: TfrmCreditCardList;

implementation

uses DMUnit;

{$R *.dfm}

end.
