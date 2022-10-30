unit OrderUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmOrder = class(TForm)
    Label18: TLabel;
    edtAdultDiscount: TEdit;
    Label1: TLabel;
    edtAdult: TEdit;
    Label2: TLabel;
    edtPersonOrder: TEdit;
    Label3: TLabel;
    BtnReturn: TBitBtn;
    btnSave: TBitBtn;
    SP_Order: TADOStoredProc;
    Label4: TLabel;
    edtAdultPrice: TEdit;
    rbOne: TRadioButton;
    rbTow: TRadioButton;
    rbThree: TRadioButton;
    edtID: TEdit;
    edtCustomerName: TEdit;
    btnCustomer: TBitBtn;
    Label21: TLabel;
    lblHotelReceptionID: TLabel;
    Label23: TLabel;
    lblReceptionName: TLabel;
    QAdultPrice: TADOQuery;
    Label5: TLabel;
    btnOrderType: TBitBtn;
    edtOrderType: TEdit;
    edtOrderTypeID: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnReturnClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbOneClick(Sender: TObject);
    procedure rbTowClick(Sender: TObject);
    procedure rbThreeClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnOrderTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrder: TfrmOrder;
  inLocker : integer;

implementation

uses DMUnit, ShareUnit, ReceptionUnit, CalculatUnit, OrderCustomerUnit,
  UserInfoUnit, HotelsInfoUnit, OrderTypeInfoUnit;

{$R *.dfm}

procedure TfrmOrder.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmOrder.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmOrder.btnSaveClick(Sender: TObject);
begin
    if StrToInt(edtAdultDiscount.Text) > StrToInt(edtAdultPrice.Text) then
    begin
        ShowMessage(' Œ›Ì› Ê«—œ ‘œÂ „⁄ »— ‰„Ì »«‘œ');
        Exit;
    end;

    SP_Order.Parameters.ParamByName('@OrderID').Value:=-1;
    SP_Order.Parameters.ParamByName('@PersonOrder').Value:=edtPersonOrder.Text;
    SP_Order.Parameters.ParamByName('@CustomerName').Value:=edtCustomerName.Text;
    SP_Order.Parameters.ParamByName('@Adult').Value:=edtAdult.Text;
    SP_Order.Parameters.ParamByName('@Child').Value:=0;
    SP_Order.Parameters.ParamByName('@AdultDiscount').Value:=edtAdultDiscount.Text;
    SP_Order.Parameters.ParamByName('@ChildDiscount').Value:=0;
    SP_Order.Parameters.ParamByName('@Comment').Value:='';
    SP_Order.Parameters.ParamByName('@OrderDate').Value:=CurrentDate;
    SP_Order.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Order.Parameters.ParamByName('@AdultPrice').Value:=edtAdultPrice.Text;
    SP_Order.Parameters.ParamByName('@ChildPrice').Value:=Parameter.khordsal;
    SP_Order.Parameters.ParamByName('@CustomerID').Value:=edtID.Text;
    SP_Order.Parameters.ParamByName('@OrderType').Value:=edtOrderTypeID.Text;
    SP_Order.Parameters.ParamByName('@Action').Value:='Insert';
    SP_Order.ExecProc;
    frmReception.edtCustomerName.Text := edtCustomerName.Text;
    frmReception.edtDiscount.Text := edtAdultDiscount.Text;
    frmReception.edtOrderNumber.Text := SP_Order.Parameters.ParamByName('@OutOrderID').Value;
    frmReception.rbNormal.Checked;
    frmReception.rbAA.Checked := rbTow.Checked;
    frmReception.rbAAA.Checked := rbThree.Checked;

    frmReception.edtGroup.Text := IntToStr(StrToInt(edtAdult.Text) div inLocker);
    frmReception.lblHotelReceptionID.Caption := lblHotelReceptionID.Caption;
    frmReception.lblReceptionName.Caption := lblReceptionName.Caption;
    Close;
end;

procedure TfrmOrder.FormCreate(Sender: TObject);
begin
    edtAdultPrice.Text := IntToStr(Parameter.Bozorgsal);
    inLocker := 1;
    lblHotelReceptionID.Caption := '';
    lblReceptionName.Caption := '';
    QAdultPrice.Close;
    QAdultPrice.Open;
    if QAdultPrice['Bozorgsal']<>null then
        Parameter.Bozorgsal:= QAdultPrice['Bozorgsal'];
    edtAdultPrice.Text := IntToStr(Parameter.Bozorgsal);
end;

procedure TfrmOrder.rbOneClick(Sender: TObject);
begin
    inLocker := 1;
end;

procedure TfrmOrder.rbTowClick(Sender: TObject);
begin
    inLocker := 2;
end;

procedure TfrmOrder.rbThreeClick(Sender: TObject);
begin
    inLocker := 3;
end;

procedure TfrmOrder.btnCustomerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmOrderCustomer, frmOrderCustomer);
    frmOrderCustomer.ShowModal;
    if frmOrderCustomer.strKey='enter' then
    begin
        edtID.Text:=frmOrderCustomer.QOrderCustomer['ID'];
        edtCustomerName.Text:=frmOrderCustomer.QOrderCustomer['Title'];
        edtAdult.SetFocus;
    end;
    FreeAndNil(frmOrderCustomer);
    if edtID.Text = '2' then
    begin
        Application.CreateForm(TfrmHotelsInfo, frmHotelsInfo);
        frmHotelsInfo.HotelReception := 1;
        frmHotelsInfo.ShowModal;
        if frmHotelsInfo.strKey='enter' then
        begin
            lblHotelReceptionID.Caption := IntToStr(frmHotelsInfo.HotelReceptionID);
            lblReceptionName.Caption := frmHotelsInfo.ReceptionName;
        end;
        FreeAndNil(frmHotelsInfo);
    end;
end;

procedure TfrmOrder.btnOrderTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmOrderTypeInfo, frmOrderTypeInfo);
    frmOrderTypeInfo.ShowModal;
    if frmOrderTypeInfo.strKey='enter' then
    begin
        edtOrderTypeID.Text:=frmOrderTypeInfo.QOrderType['ID'];
        edtOrderType.Text:=frmOrderTypeInfo.QOrderType['OrderType'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmOrderTypeInfo);
end;

end.
