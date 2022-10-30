unit CreditModUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Mask;

type
  TfrmCreditMod = class(TForm)
    Label13: TLabel;
    lblCreditMod: TLabel;
    BtnReturn: TBitBtn;
    BBtnAccept: TBitBtn;
    QCreditMod: TADOQuery;
    edtDate: TMaskEdit;
    Label14: TLabel;
    SP_ModCharge: TADOStoredProc;
    lblStatus: TLabel;
    QMod: TADOQuery;
    Label1: TLabel;
    lblModCredit1: TLabel;
    Label3: TLabel;
    lblModCredit2: TLabel;
    Label2: TLabel;
    edtService_center_id: TEdit;
    edtService_center: TEdit;
    btnService_center: TBitBtn;
    Label4: TLabel;
    lblModCreditFaz2: TLabel;
    Label5: TLabel;
    lblServiceCenter2_1: TLabel;
    procedure BtnReturnClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnService_centerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreditMod: TfrmCreditMod;

implementation

uses DMUnit, CalculatUnit, ServiceCenterInfoUnit;

{$R *.dfm}

procedure TfrmCreditMod.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCreditMod.BBtnAcceptClick(Sender: TObject);
var
Charge, Factor : integer;
begin
    Charge:=0;
    Factor:=0;
    if edtDate.Text<>CurrentDate then
    begin
        lblStatus.Visible:=True;
        frmCreditMod.Refresh;

        //SP_ModCharge.Close;
        //SP_ModCharge.Parameters.ParamByName('@Receptiondate').Value:=edtDate.Text;
        //SP_ModCharge.Open;

        QMod.Close;
        QMod.Parameters.ParamByName('ReceptionDate').Value:=edtDate.Text;
        QMod.Parameters.ParamByName('service_center_id').Value:=edtService_center_id.Text;        
        QMod.Open;

        if QMod['ModCharge']<>Null then
            lblCreditMod.Caption:=FormatFloat('###,', QMod['ModCharge'])
        else
            lblCreditMod.Caption:='0';
        lblStatus.Visible:=False;
    end
    else
    begin
        QCreditMod.Close;
        QCreditMod.Parameters.ParamByName('ReceptionDate').Value:=edtDate.Text;
        QCreditMod.Open;
        if QCreditMod['ModCharge']<>Null then
            lblCreditMod.Caption:=FormatFloat('###,', QCreditMod['ModCharge'])
        else
            lblCreditMod.Caption:='0';

        if QCreditMod['ModCharge1']<>Null then
            lblModCredit1.Caption:=FormatFloat('###,', QCreditMod['ModCharge1'])
        else
            lblModCredit1.Caption:='0';

        if QCreditMod['ModCharge2']<>Null then
            lblModCredit2.Caption:=FormatFloat('###,', QCreditMod['ModCharge2'])
        else
            lblModCredit2.Caption:='0';

        if QCreditMod['ModChargeFaz2']<>Null then
            lblModCreditFaz2.Caption:=FormatFloat('###,', QCreditMod['ModChargeFaz2'])
        else
            lblModCreditFaz2.Caption:='0';

        if QCreditMod['ModChargeFaz2_1']<>Null then
            lblServiceCenter2_1.Caption:=FormatFloat('###,', QCreditMod['ModChargeFaz2_1'])
        else
            lblServiceCenter2_1.Caption:='0';
    end;
end;

procedure TfrmCreditMod.FormCreate(Sender: TObject);
begin
    lblCreditMod.Caption:='0';
end;

procedure TfrmCreditMod.btnService_centerClick(Sender: TObject);
begin
Application.CreateForm(TfrmService_center_info, frmService_center_info);
    frmService_center_info.ShowModal;
    if frmService_center_info.strKey='enter' then
    begin
        edtService_center_id.Text:=frmService_center_info.QService_center['id'];
        edtService_center.Text:=frmService_center_info.QService_center['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmService_center_info);
end;

end.
