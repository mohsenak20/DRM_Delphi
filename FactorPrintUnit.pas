unit FactorPrintUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, ADODB, DB, StdCtrls, Buttons;

type
  TfrmFactorPrint = class(TForm)
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtKeyNumber: TEdit;
    btnAccept: TBitBtn;
    QSearch: TADOQuery;
    DBNavigator1: TDBNavigator;
    lblReceptionID: TDBText;
    lblCustomerName: TDBText;
    DSsEARCH: TDataSource;
    QReception: TADOQuery;
    btnPrintLockerCode: TBitBtn;
    procedure edtKeyNumberExit(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnAcceptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKeyNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPrintLockerCodeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;
  end;

var
  frmFactorPrint: TfrmFactorPrint;

implementation

uses DMUnit, CalculatUnit, qrExitReportUnit, qrExitReport2Unit,
  qrFactorPrintUnit, ShareUnit, qrLockerPrintUnit, Math;

{$R *.dfm}

procedure TfrmFactorPrint.edtKeyNumberExit(Sender: TObject);
begin
    if edtKeyNumber.Text='' then Exit;
    QSearch.Close;
    QSearch.Parameters.ParamByName('KeyNumber').Value:=edtKeyNumber.Text;
    QSearch.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QSearch.Parameters.ParamByName('serviceCenterId').Value:=UserInfo.Service_center_id;    
    QSearch.Open;
    if QSearch['ReceptionID']<>Null then
    begin
        lblReceptionID.Caption:=IntToStr(QSearch['ReceptionID']);
        lblCustomerName.Caption:=QSearch['CustomerName'];
    end
    else
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        Exit;
    end;
end;

procedure TfrmFactorPrint.btnAcceptClick(Sender: TObject);
begin
    QReception.Close;
    QReception.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
    QReception.Open;
    Application.CreateForm(TqrFctorPrint, qrFctorPrint);
    qrFctorPrint.lblReceptionID.Caption:=lblReceptionID.Caption;
    qrFctorPrint.lblKeyNumber.Caption:=edtKeyNumber.Text;
    qrFctorPrint.lblCustomerName.Caption:=lblCustomerName.Caption;
    qrFctorPrint.lblEndTime.Caption:=QReception['EndTime'];
    qrFctorPrint.lblStartTime.Caption:=QReception['StartTime'];
    qrFctorPrint.lblReceptionDate.Caption:=QReception['ReceptionDate'];
    //qrFctorPrint.lblCreditMod.Caption:='';
    qrFctorPrint.lblMessage.Caption:=Parameter.factorMessage;
    qrFctorPrint.lblCoNameAndAddress.Caption:=Parameter.CoName;    
    qrFctorPrint.QSubFactor.Close;
    qrFctorPrint.QSubFactor.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
    qrFctorPrint.QSubFactor.Open;
    qrFctorPrint.Preview;
    FreeAndNil(qrFctorPrint);
    strKey:='enter';
    Close;
end;

procedure TfrmFactorPrint.btnAcceptKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=27 then Close;
    if Key=13 then
    begin
        strKey:='enter';
        Close;
    end;
end;

procedure TfrmFactorPrint.edtKeyNumberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=13 then btnAccept.SetFocus;
end;

procedure TfrmFactorPrint.btnPrintLockerCodeClick(Sender: TObject);
begin
    if QSearch['Code'] <> null then
        if QSearch['Code'] <> -1 then
        begin
            Application.CreateForm(TqrLockerPrint, qrLockerPrint);
            qrLockerPrint.lblReceptionDate.Caption := CurrentDate;
            qrLockerPrint.lblReceptionID.Caption :=  QSearch['ReceptionID'];
            qrLockerPrint.lblCustomerName.Caption := QSearch['CustomerName'];
            qrLockerPrint.lblLockerNumber.Caption := QSearch['ClosedID'];
            qrLockerPrint.lblLockerCode.Caption := QSearch['Code'];
            qrLockerPrint.Preview;
            FreeAndNil(qrLockerPrint);

        end
        else
            ShowMessage('ò„œ „Ê—œ ‰Ÿ— òœ ò›‘œ«—Ì ‰œ«—œ')
    else
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
end;

procedure TfrmFactorPrint.FormShow(Sender: TObject);
begin
    if edtKeyNumber.Text <> '' then
    begin
        edtKeyNumberExit(Sender);
        btnAccept.SetFocus;
    end;
end;

end.
