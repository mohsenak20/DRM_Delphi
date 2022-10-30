unit AddOnServicesUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  TfrmAddOnServices = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    btnSearch: TBitBtn;
    lblClosed: TLabel;
    lbl1: TLabel;
    BtnReturn: TBitBtn;
    btnAccept: TBitBtn;
    Label1: TLabel;
    lblReceptionID: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblCustomerName: TLabel;
    Label6: TLabel;
    QAddOnServices: TADOQuery;
    QAccept: TADOQuery;
    procedure btnSearchClick(Sender: TObject);
    procedure clearForm();
    procedure btnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddOnServices: TfrmAddOnServices;

implementation

uses SearchCustomerUnit, DMUnit, qrAddOnServicesUnit, ShareUnit,
  CalculatUnit;

{$R *.dfm}


procedure TfrmAddOnServices.clearForm();
begin
    lblClosed.Caption := '';
    lblReceptionID.Caption := '';
    lblCustomerName.Caption := '';
    QAddOnServices.Close;
end;

procedure TfrmAddOnServices.btnSearchClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSearchKeyNumber, frmSearchKeyNumber);
    frmSearchKeyNumber.ShowModal;
    if (frmSearchKeyNumber.strKey='enter') and (frmSearchKeyNumber.lblReceptionID.Caption<>'') then
    begin
        lblReceptionID.Caption:=frmSearchKeyNumber.lblReceptionID.Caption;
        lblClosed.Caption:=frmSearchKeyNumber.edtKeyNumber.Text;
        lblCustomerName.Caption:=frmSearchKeyNumber.lblCustomerName.Caption;
        QAddOnServices.Close;
        QAddOnServices.Parameters.ParamByName('closedID').Value := lblClosed.Caption;
        QAddOnServices.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
        if (UserInfo.WorkSectionID = 8) or (UserInfo.WorkSectionID = 6) then
            QAddOnServices.Parameters.ParamByName('UserID').Value := -1
        else
            QAddOnServices.Parameters.ParamByName('UserID').Value := UserInfo.UserID;

        QAddOnServices.Open;
    end
    else
    begin
        clearForm;
    end;
    FreeAndNil(frmSearchKeyNumber);
end;

procedure TfrmAddOnServices.btnAcceptClick(Sender: TObject);
begin
    QAccept.Close;
    QAccept.Parameters.ParamByName('order_id').Value := QAddOnServices['id'];
    QAccept.ExecSQL;

    Application.CreateForm(TqrAddOnServices, qrAddOnServices);
    qrAddOnServices.lblCoNameAndAddress.Caption := Parameter.CoName+' '+Parameter.CoName+'    ·›‰ '+Parameter.Tel;
    qrAddOnServices.lblKeyNumber.Caption := lblClosed.Caption;
    qrAddOnServices.lblCustomerName.Caption := lblCustomerName.Caption;
    qrAddOnServices.lblReceptionID.Caption := lblReceptionID.Caption;
    
    qrAddOnServices.Preview;
    FreeAndNil(qrAddOnServices);
end;

end.
