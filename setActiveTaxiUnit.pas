unit setActiveTaxiUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons;

type
  TfrmSetActiveTaxi = class(TForm)
    Label2: TLabel;
    edtLicensePlate: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    edtDriverName: TEdit;
    edtDriverMobile: TEdit;
    BitBtn1: TBitBtn;
    btnActive: TBitBtn;
    btnDeactive: TBitBtn;
    BtnReturn: TBitBtn;
    QSearchTaxiInfo: TADOQuery;
    QUpdateTTaxiInfo: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure btnActiveClick(Sender: TObject);
    procedure btnDeactiveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetActiveTaxi: TfrmSetActiveTaxi;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmSetActiveTaxi.BitBtn1Click(Sender: TObject);
begin
        QSearchTaxiInfo.Close;
        QSearchTaxiInfo.Parameters.ParamByName('LicensePlate').Value := edtLicensePlate.Text;
        QSearchTaxiInfo.Open;
        if QSearchTaxiInfo['LicensePlate'] <> null then
        begin
            edtDriverName.Text := QSearchTaxiInfo['DriverName'];
            edtDriverMobile.Text := QSearchTaxiInfo['DriverMobile'];
            if QSearchTaxiInfo['isActive'] then
                btnDeactive.SetFocus
            else
                btnActive.SetFocus;
        end;
end;

procedure TfrmSetActiveTaxi.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSetActiveTaxi.btnActiveClick(Sender: TObject);
begin
    QUpdateTTaxiInfo.Close;
    QUpdateTTaxiInfo.Parameters.ParamByName('LicensePlate').Value := edtLicensePlate.Text;
    QUpdateTTaxiInfo.Parameters.ParamByName('Active').Value :=  1;
    QUpdateTTaxiInfo.ExecSQL;
    ShowMessage(' «ò”Ì „Ê—œ ‰Ÿ— ›⁄«· ê—œÌœ');
    Close;
end;

procedure TfrmSetActiveTaxi.btnDeactiveClick(Sender: TObject);
begin
    QUpdateTTaxiInfo.Close;
    QUpdateTTaxiInfo.Parameters.ParamByName('LicensePlate').Value := edtLicensePlate.Text;
    QUpdateTTaxiInfo.Parameters.ParamByName('Active').Value :=  0;
    QUpdateTTaxiInfo.ExecSQL;
    ShowMessage(' «ò”Ì „Ê—œ ‰Ÿ— €Ì—›⁄«· ê—œÌœ');
    Close;
end;

procedure TfrmSetActiveTaxi.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

end.
