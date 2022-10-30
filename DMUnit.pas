unit DMUnit;
interface

uses
  SysUtils, Classes, DB, ADODB, StdCtrls;

type
  TDM = class(TDataModule)
    ADOConnection: TADOConnection;
    QCity: TADOQuery;
    QVahed: TADOQuery;
    QOffice: TADOQuery;
    QDegree: TADOQuery;
    QEmployee: TADOQuery;
    QOfficeRes: TADOQuery;
    QRaste: TADOQuery;
    QBaseSalary: TADOQuery;
    QCanon: TADOQuery;
    QPicture: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
