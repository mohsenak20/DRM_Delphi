unit CashUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, jpeg, DB, ADODB;

type
  TfrmCash = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Label5: TLabel;
    Label14: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    Panel2: TPanel;
    BtnReturn: TBitBtn;
    Label4: TLabel;
    Label6: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    Shape1: TShape;
    Label8: TLabel;
    QReport: TADOQuery;
    dcReport: TDataSource;
    ADOConnection1: TADOConnection;
    BtnPrint: TBitBtn;
    QPrint: TADOQuery;
    Shape2: TShape;
    lblSum: TLabel;
    lblBozorgsal: TLabel;
    lblKhordsal: TLabel;
    lblCard: TLabel;
    lblCharge: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Image1: TImage;
    procedure btnUserClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCash: TfrmCash;

implementation

uses UserInfoUnit, qrCashUnit, qrSCashUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmCash.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        btnSearch.SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

procedure TfrmCash.btnSearchClick(Sender: TObject);
var
    Bozorgsal, Khordsal, Charge : Largeint;
begin
    QReport.Close;
    QReport.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QReport.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    if edtUserID.Text<>'' then
        QReport.Parameters.ParamByName('UserID').Value:=edtUserID.Text
    else
        QReport.Parameters.ParamByName('UserID').Value:=-1;

    QReport.Open;

    if QReport['Bozorgsal']<>null then
        Bozorgsal := QReport['Bozorgsal']*10
    else
        Bozorgsal := 0;

    if QReport['Khordsal']<>null then
        Khordsal := QReport['Khordsal']*10
    else
        Khordsal := 0;

    if QReport['Charge']<>null then
        Charge := QReport['Charge']*10
    else
        Charge := 0;

    lblBozorgsal.Caption := IntToStr(Bozorgsal);
    lblKhordsal.Caption := IntToStr(Khordsal);
    lblCard.Caption := IntToStr(QReport['Card']);
    lblCharge.Caption := IntToStr(Charge);
    lblSum.Caption:= FormatFloat('###,', Bozorgsal+Khordsal+Charge);
end;

procedure TfrmCash.BtnPrintClick(Sender: TObject);
begin
    QPrint.Close;
    QPrint.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QPrint.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    QPrint.Open;
    Application.CreateForm(TqrSCash, qrSCash);
    qrSCash.lblCurrentDate.Caption := CurrentDate;
    if edtStartDate.Text <> '1   /  /  ' then
        qrSCash.lblStartDate.Caption := edtStartDate.Text;
    if edtEndDate.Text <> '1   /  /  ' then
        qrSCash.lblEndDate.Caption := edtEndDate.Text;
    qrSCash.Preview;
    FreeAndNil(qrSCash);
end;

end.
