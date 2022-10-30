unit ChargeManagerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls,
  Buttons;

type
  TfrmChargeManager = class(TForm)
    Panel1: TPanel;
    dsCharge: TDataSource;
    DBGrid1: TDBGrid;
    QCharge: TADOQuery;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    lblCustomerName: TLabel;
    Label2: TLabel;
    lblLocker: TLabel;
    btnDelete: TBitBtn;
    QDelete: TADOQuery;
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChargeManager: TfrmChargeManager;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmChargeManager.btnDeleteClick(Sender: TObject);
begin
    if MessageBox(Self.Handle,'¬Ì« „«Ì· »Â Õ–› «Ì‰ ‘«—é Â” Ìœø','Õ–› —òÊ—œ',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrNo  then Exit;
    QDelete.Close;
    QDelete.Parameters.ParamByName('CreditID').Value:=QCharge['CreditID'];
    QDelete.ExecSQL;
    QCharge.Close;
    QCharge.Open;
end;

end.
