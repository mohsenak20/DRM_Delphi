unit LastEnterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls;

type
  TfrmLastEnter = class(TForm)
    lblNumberOfCustomer: TLabel;
    QEnter: TADOQuery;
    Timer1: TTimer;
    lblLockerNumber: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLastEnter: TfrmLastEnter;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmLastEnter.Timer1Timer(Sender: TObject);
begin
    QEnter.Close;
    QEnter.Open;
    lblNumberOfCustomer.Caption := inttostr(QEnter['NumberOfCustomer']);
    lblLockerNumber.Caption := inttostr(QEnter['LockerNumber']);
    Refresh;
end;

end.
