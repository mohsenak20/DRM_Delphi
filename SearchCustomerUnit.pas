unit SearchCustomerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSearchKeyNumber = class(TForm)
    QSearch: TADOQuery;
    edtKeyNumber: TEdit;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblReceptionID: TLabel;
    lblCustomerName: TLabel;
    lblCurrentCredit: TLabel;
    Label7: TLabel;
    btnAccept: TBitBtn;
    SP_GetCurrentCredit: TADOStoredProc;
    rbGeneral: TRadioButton;
    rbVip: TRadioButton;
    rbManager: TRadioButton;
    Label4: TLabel;
    lblType: TLabel;
    QManagerCard: TADOQuery;
    Shape1: TShape;
    Label5: TLabel;
    Shape2: TShape;
    Label6: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    lblCompanyName1: TLabel;
    lblCompanyName2: TLabel;
    lblCompanyName3: TLabel;
    Label11: TLabel;
    lblPersonOrder: TLabel;
    QPersonOrder: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button6: TButton;
    Button5: TButton;
    Button4: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button12: TButton;
    Button10: TButton;
    Button11: TButton;
    procedure edtKeyNumberExit(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnAcceptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtKeyNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure rbGeneralKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbVipKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbManagerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;
  end;

var
  frmSearchKeyNumber: TfrmSearchKeyNumber;

implementation

uses DMUnit, CalculatUnit, Math;

{$R *.dfm}

procedure TfrmSearchKeyNumber.edtKeyNumberExit(Sender: TObject);
begin
    lblType.Caption:='';
    if edtKeyNumber.Text='' then Exit;
    QSearch.Close;
    QSearch.Parameters.ParamByName('KeyNumber').Value:=edtKeyNumber.Text;
    QSearch.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QSearch.Open;
    QManagerCard.Close;


    if QSearch['ReceptionID']<>Null then
    begin
        QManagerCard.Close;
        QManagerCard.Parameters.ParamByName('ReceptionID').Value := QSearch['ReceptionID'];
        QManagerCard.Open;
        if QManagerCard['CompanyID1']<>null then
        begin
            lblCompanyName1.Caption := QManagerCard['CompanyName1'];
            lblCompanyName2.Caption := QManagerCard['CompanyName2'];
            lblCompanyName3.Caption := QManagerCard['CompanyName3'];
        end
        else
        begin
            lblCompanyName1.Caption := '';
            lblCompanyName2.Caption := '';
            lblCompanyName3.Caption := '';
        end;

        QPersonOrder.Close;
        QPersonOrder.Parameters.ParamByName('OrderID').Value := QSearch['OrderNumber'];
        QPersonOrder.Open;
        if QPersonOrder['PersonOrder']<> null then
            lblPersonOrder.Caption := QPersonOrder['PersonOrder']
        else
            lblPersonOrder.Caption := '';

        if not QSearch['Active'] then
        begin
            ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— €Ì— ›⁄«· „Ì »«‘œ ·ÿ›« »« „œÌ— ””Ì” „  „«” »êÌ—Ìœ');
            lblReceptionID.Caption:='';
            lblCustomerName.Caption:='';
            lblCurrentCredit.Caption:='';
            lblType.Caption:='';
            Exit;
        end;
        lblReceptionID.Caption:=IntToStr(QSearch['ReceptionID']);
        lblCustomerName.Caption:=QSearch['CustomerName'];
        SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QSearch['ReceptionID'];
        SP_GetCurrentCredit.ExecProc;

        lblCurrentCredit.Caption:=FormatFloat('#,', SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value);

        if QSearch['NumberOfAdult']=1 then
            lblType.Caption:='»“—ê”«·'
        else
            if QSearch['NumberOfAdult']=2 then
                lblType.Caption:='»“—ê”«·'+'+'+'»“—ê”«·';

        if QSearch['NumberOfChild']=1 then
            if lblType.Caption<>'' then
                lblType.Caption:=lblType.Caption+'+'+'Œ—œ”«·'
            else
                lblType.Caption:='Œ—œ”«·'
        else
            if QSearch['NumberOfChild']=2 then
                lblType.Caption:='Œ—œ”«·'+'+'+'Œ—œ”«·';
    end
    else
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        lblReceptionID.Caption:='';
        lblCustomerName.Caption:='';
        lblCurrentCredit.Caption:='';
        lblType.Caption:='';
        lblCompanyName1.Caption := '';
        lblCompanyName2.Caption := '';
        lblCompanyName3.Caption := '';
        lblPersonOrder.Caption := '';
        Exit;
    end;
end;

procedure TfrmSearchKeyNumber.btnAcceptClick(Sender: TObject);
begin
    edtKeyNumberExit(Sender);
    strKey:='enter';
    Close;
end;

procedure TfrmSearchKeyNumber.btnAcceptKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=27 then Close;
    if Key=13 then
    begin
        strKey:='enter';
        Close;
    end;
end;

procedure TfrmSearchKeyNumber.edtKeyNumberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=13 then btnAccept.SetFocus;
end;

procedure TfrmSearchKeyNumber.FormCreate(Sender: TObject);
begin
    lblReceptionID.Caption:='';
    lblCustomerName.Caption:='';
    lblCurrentCredit.Caption:='';
    lblType.Caption:='';
    lblCompanyName1.Caption := '';
    lblCompanyName2.Caption:= '';
    lblCompanyName3.Caption := '';
end;

procedure TfrmSearchKeyNumber.rbGeneralKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=13 then edtKeyNumber.SetFocus;
end;

procedure TfrmSearchKeyNumber.rbVipKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=13 then edtKeyNumber.SetFocus;
end;

procedure TfrmSearchKeyNumber.rbManagerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=13 then edtKeyNumber.SetFocus;
end;

procedure TfrmSearchKeyNumber.Button1Click(Sender: TObject);
begin
    edtKeyNumber.Text := edtKeyNumber.Text + TButton(FindComponent(ActiveControl.Name)).Caption;
end;

procedure TfrmSearchKeyNumber.Button12Click(Sender: TObject);
begin
    edtKeyNumber.Clear;
end;

end.
