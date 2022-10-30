unit MenuPasswordUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmMenuPassword = class(TForm)
    btnStorage: TBitBtn;
    edtPass: TEdit;
    Label28: TLabel;
    BtnReturn: TBitBtn;
    QPass: TADOQuery;
    procedure BtnReturnClick(Sender: TObject);
    procedure btnStorageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Acction : string;
  end;

var
  frmMenuPassword: TfrmMenuPassword;

implementation

uses SalesReportUnit, CalculatUnit, DMUnit, ShareUnit, ViewFactorsUnit;

{$R *.dfm}

procedure TfrmMenuPassword.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmMenuPassword.btnStorageClick(Sender: TObject);
var
ok : Boolean;
PrintOk : Boolean;
begin
    ok:=False;
    PrintOk:=False;

    case UserInfo.UserID of
    4 :
    begin
        if Trim(QPass['Resturent'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['ResturentReport'])=edtPass.Text then
            PrintOk:=True;
    end;

    51 :
    begin
        if Trim(QPass['Resturent2'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['ResturentReport2'])=edtPass.Text then
            PrintOk:=True;
    end;

    20:
    begin
        if Trim(QPass['CofeeShop'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['CofeeShopReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    28:
    begin
        if Trim(QPass['Photo'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['PhotoReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    32:
    begin
        if Trim(QPass['Sona'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['SonaReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    38:
    begin
        if Trim(QPass['Revagh'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['RevaghReport'])=edtPass.Text then
            PrintOk:=True;
    end;

    49, 50:
    begin
        if Trim(QPass['Sport'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['SportReport'])=edtPass.Text then
            PrintOk:=True;
    end;

    95:  // Joice
    begin
        if Trim(QPass['IcePack'])=edtPass.Text then  
            ok:=True;
        if Trim(QPass['IcePackReport'])=edtPass.Text then
            PrintOk:=True;
    end;

    52:
    begin
        if Trim(QPass['Orange'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['OrangeReport'])=edtPass.Text then
            PrintOk:=True;
    end;

    112:
    begin
        if Trim(QPass['Massage'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['MassageReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    184:
    begin
        if Trim(QPass['LoopSlide'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['LoopSlideReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    186:
    begin
        if Trim(QPass['TornadoSlide'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['TornadoSlideReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    194:
    begin
        if Trim(QPass['SpaceHole'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['SpaceHoleReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    195:
    begin
        if Trim(QPass['BlackHole'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['BlackHoleReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    196:
    begin
        if Trim(QPass['BlueSlide'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['BlueSlideReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    219:
    begin
        if Trim(QPass['Massage1'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['Massage1Report'])=edtPass.Text then
            PrintOk:=True;
    end;
    281:
    begin
        if Trim(QPass['Turkey'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['TurkeyReport'])=edtPass.Text then
            PrintOk:=True;
    end;

    285:
    begin
        if Trim(QPass['TurkeyBoofe'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['TurkeyBoofeReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    283:
    begin
        if Trim(QPass['Turkey2'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['Turkey2Report'])=edtPass.Text then
            PrintOk:=True;
    end;
    284:
    begin
        if Trim(QPass['Turkey2Boofe'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['Turkey2BoofeReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    312:
    begin
        if Trim(QPass['VRC'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['VRCReport'])=edtPass.Text then
            PrintOk:=True;
    end;
    378:
    begin
        if Trim(QPass['coffeeShop2'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['coffeeShopReport2'])=edtPass.Text then
            PrintOk:=True;
    end;
    377:
    begin
        if Trim(QPass['Resturent2'])=edtPass.Text then
            ok:=True;
        if Trim(QPass['ResturentReport2'])=edtPass.Text then
            PrintOk:=True;
    end;

    end;







    if Acction='Print' then
    begin
        if PrintOk then
        begin
            Application.CreateForm(TfrmSalesReport, frmSalesReport);
            frmSalesReport.edtStartDate.Text:=CurrentDate;
            frmSalesReport.edtEndDate.Text:=CurrentDate;
            frmSalesReport.ShowModal;
            FreeAndNil(frmSalesReport);
        end
        else
        begin
            ShowMessage('ò·„Â ⁄»Ê— «‘ »«Â „Ì »«‘œ');
            Exit;
        end;
    end
    else
    begin
        if ok then
        begin
            Application.CreateForm(TfrmViewFactors, frmViewFactors);
            frmViewFactors.edtReceptiondate.Enabled:=False;
            frmViewFactors.ShowModal;
            FreeAndNil(frmViewFactors);
        end
        else
        begin
            ShowMessage('ò·„Â ⁄»Ê— «‘ »«Â „Ì »«‘œ');
            Exit;
        end;
    end;
end;

procedure TfrmMenuPassword.FormCreate(Sender: TObject);
begin
    QPass.Close;
    QPass.Open;
end;

procedure TfrmMenuPassword.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

end.
