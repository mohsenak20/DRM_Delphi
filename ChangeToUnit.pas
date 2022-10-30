unit ChangeToUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmChangeTo = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblClosedID: TLabel;
    lblPrice: TLabel;
    lblNumber: TLabel;
    lblCardID1: TLabel;
    Label17: TLabel;
    lblReceptionID: TLabel;
    Label1: TLabel;
    lblCustomerName: TLabel;
    Label2: TLabel;
    btnSearch: TBitBtn;
    edtKeyNumber: TEdit;
    edtAdult: TEdit;
    Label11: TLabel;
    edtChild: TEdit;
    Label7: TLabel;
    BtnReturn: TBitBtn;
    BtnSave: TBitBtn;
    Label8: TLabel;
    lblCardID2: TLabel;
    Label10: TLabel;
    lblCardID3: TLabel;
    Label13: TLabel;
    lblAdult: TLabel;
    lblChild: TLabel;
    Label16: TLabel;
    lblCompanyName1: TLabel;
    lblCompanyName2: TLabel;
    lblCompanyName3: TLabel;
    QReception: TADOQuery;
    QGetCardPrice: TADOQuery;
    procedure btnSearchClick(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure Clear();
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangeTo: TfrmChangeTo;

implementation

uses ShareUnit, CalculatUnit;

{$R *.dfm}

Procedure TfrmChangeTo.Clear();
begin
    lblClosedID.Caption := '';
    lblReceptionID.Caption := '';
    lblCustomerName.Caption := '';
    lblNumber.Caption := '';
    lblPrice.Caption := '';
    lblAdult.Caption := '';
    lblChild.Caption := '';
    lblCardID1.Caption := '';
    lblCardID2.Caption := '';
    lblCardID3.Caption := '';
    lblCompanyName1.Caption := '';
    lblCompanyName2.Caption :='';
    lblCompanyName3.Caption := '';
end;
procedure TfrmChangeTo.btnSearchClick(Sender: TObject);
begin
    if edtKeyNumber.Text='' then Exit;
    QReception.Close;
    QReception.Parameters.ParamByName('KeyNumber').Value:=edtKeyNumber.Text;
    QReception.Parameters.ParamByName('UserID').Value:= UserInfo.UserID;
    if UserInfo.WorkSectionID = 8 then
        QReception.Parameters.ParamByName('Manager').Value:= 1
    else
        QReception.Parameters.ParamByName('Manager').Value:= 0;
    QReception.Open;
    if QReception['ReceptionID']<>Null then
    begin
        lblReceptionID.Caption:=IntToStr(QReception['ReceptionID']);
        lblClosedID.Caption:=IntToStr(QReception['KeyNumber']);
        lblCustomerName.Caption:=QReception['CustomerName'];

        lblPrice.Caption:=QReception['Price'];
        lblNumber.Caption:=IntToStr(QReception['Number']);
        lblAdult.Caption:=IntToStr(QReception['NumberOfAdult']);
        lblChild.Caption:=IntToStr(QReception['NumberOfChild']);
        if QReception['CardID']<>1 then
        begin
            lblCardID1.Caption := QReception['CardID'];
            lblCompanyName1.Caption := QReception['CompanyName1'];
        end
        else
        begin
            lblCardID1.Caption := '';
            lblCompanyName1.Caption := '';
        end;

        if QReception['CardID2']<>1 then
        begin
            lblCardID2.Caption := QReception['CardID2'];
            lblCompanyName2.Caption := QReception['CompanyName2'];
        end
        else
        begin
            lblCardID2.Caption := '';
            lblCompanyName2.Caption := '';
        end;

        if QReception['CardID3']<>1 then
        begin
            lblCardID3.Caption := QReception['CardID3'];
            lblCompanyName3.Caption := QReception['CompanyName3'];
        end
        else
        begin
            lblCardID3.Caption := '';
            lblCompanyName3.Caption := '';
        end;

    end
    else
    begin
        ShowMessage('«Ì‰ ‘„«—Â ﬂ·Ìœ „⁄ »— ‰„Ì »«‘œ');
        Clear;
    end;
end;

procedure TfrmChangeTo.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmChangeTo.FormCreate(Sender: TObject);
begin
    Clear;
end;


procedure TfrmChangeTo.BtnSaveClick(Sender: TObject);
var
  NumberOfAdult, NumberOfChild, NewNumberOfAdult,
  NewNumberOfChild, CardID1, CardID2, CardID3,
  CardPrice1, CardPrice2, CardPrice3, Price, Bozorgsal, Khordsal :integer;
begin
    if edtKeyNumber.Text='' then Exit;
    QReception.Close;
    QReception.Parameters.ParamByName('KeyNumber').Value:=edtKeyNumber.Text;
    QReception.Parameters.ParamByName('UserID').Value:= UserInfo.UserID;
    if UserInfo.WorkSectionID = 8 then
        QReception.Parameters.ParamByName('Manager').Value:= 1
    else
        QReception.Parameters.ParamByName('Manager').Value:= 0;
    QReception.Open;
    if QReception['ReceptionID']<>null then
    begin
        NumberOfAdult := QReception['NumberOfAdult'];
        NumberOfChild := QReception['NumberOfChild'];
        NewNumberOfAdult := StrToIntDef(edtAdult.Text, NumberOfAdult);
        NewNumberOfChild := StrToIntDef(edtChild.Text, NumberOfChild);
        CardID1 := QReception['CardID'];
        CardID2 := QReception['CardID2'];
        CardID3 := QReception['CardID3'];

        if CardID1<>1 then
        begin
            QGetCardPrice.Close;
            QGetCardPrice.Parameters.ParamByName('CardID').Value:= CardID1;
            QGetCardPrice.Parameters.ParamByName('ReceptionDate').Value:= CurrentDate;
            QGetCardPrice.Open;
            if QGetCardPrice['CardPrice']<>null then
                CardPrice1 := QGetCardPrice['CardPrice']
            else
            begin
                ShowMessage('‘„«—Â ò«—  1 „⁄ »— ‰„Ì »«‘œ');
                Exit;
            end;
        end;

        if CardID2<>1 then
        begin
            QGetCardPrice.Close;
            QGetCardPrice.Parameters.ParamByName('CardID').Value:= CardID2;
            QGetCardPrice.Parameters.ParamByName('ReceptionDate').Value:= CurrentDate;
            QGetCardPrice.Open;
            if QGetCardPrice['CardPrice']<>null then
                CardPrice2 := QGetCardPrice['CardPrice']
            else
            begin
                ShowMessage('‘„«—Â ò«—  2 „⁄ »— ‰„Ì »«‘œ');
                Exit;
            end;
        end;

        if CardID3<>1 then
        begin
            QGetCardPrice.Close;
            QGetCardPrice.Parameters.ParamByName('CardID').Value:= CardID3;
            QGetCardPrice.Parameters.ParamByName('ReceptionDate').Value:= CurrentDate;
            QGetCardPrice.Open;
            if QGetCardPrice['CardPrice']<>null then
                CardPrice3 := QGetCardPrice['CardPrice']
            else
            begin
                ShowMessage('‘„«—Â ò«—  3 „⁄ »— ‰„Ì »«‘œ');
                Exit;
            end;
        end;
        Price := QReception['Price'];
        Bozorgsal := Parameter.Bozorgsal;
        Khordsal := Parameter.khordsal;

    end;
end;

end.
