unit CreditCardChargeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask;

type
  TfrmCreditCardCharge = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    Label6: TLabel;
    Image: TImage;
    edtPrice: TEdit;
    edtNumberOfSession: TEdit;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    lblCardID: TLabel;
    lblName: TLabel;
    SP_CreditCardCharge: TADOStoredProc;
    dsCreditCardCharge: TDataSource;
    DBGrid1: TDBGrid;
    QCreditCardCharge: TADOQuery;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    Panel2: TPanel;
    BBtnAccept: TBitBtn;
    Label1: TLabel;
    Label14: TLabel;
    edtDate: TMaskEdit;
    Label11: TLabel;
    edtGroupName: TEdit;
    btnGroupInfo: TBitBtn;
    edtGroupID: TEdit;
    ExportToExcel: TBitBtn;
    procedure BtnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSaveClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edtPriceChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnGroupInfoClick(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreditCardCharge: TfrmCreditCardCharge;

implementation

uses CalculatUnit, DMUnit, CredeitCardInfoUnit, ShareUnit,
  qrCreditCardBargainUnit, CreditCardGroupInfoUnit;

{$R *.dfm}

procedure TfrmCreditCardCharge.BtnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCreditCardCharge.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmCreditCardCharge.BtnSaveClick(Sender: TObject);
begin
    IF (edtPrice.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtPrice.SetFocus;
        Exit;
    End;
    SP_CreditCardCharge.Parameters.ParamByName('@CreditCardChargeID').Value:=-1;
    SP_CreditCardCharge.Parameters.ParamByName('@CreditCardID').Value:= lblCardID.Caption;
    SP_CreditCardCharge.Parameters.ParamByName('@Price').Value:=Fnc_ReturnNum(edtPrice.Text);
    SP_CreditCardCharge.Parameters.ParamByName('@ChargeDate').Value:=CurrentDate;
    SP_CreditCardCharge.Parameters.ParamByName('@NumberOfSession').Value:= edtNumberOfSession.Text;
    SP_CreditCardCharge.Parameters.ParamByName('@ChargeGroupID').Value:= edtGroupID.Text;    
    SP_CreditCardCharge.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_CreditCardCharge.Parameters.ParamByName('@Action').Value:='Insert';
    SP_CreditCardCharge.ExecProc;

    QCreditCardCharge.Close;
    QCreditCardCharge.Parameters.ParamByName('ChargeDate').Value := CurrentDate;
    QCreditCardCharge.Open;

end;

procedure TfrmCreditCardCharge.btnSearchClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardInfo, frmCreditCardInfo);
    frmCreditCardInfo.ShowModal;
    if frmCreditCardInfo.strKey='enter' then
    begin
        lblCardID.Caption:=frmCreditCardInfo.QCreditCard['CardID'];
        lblName.Caption:=frmCreditCardInfo.QCreditCard['Name'];
        Image.Picture.LoadFromFile(Parameter.URL_Pic+'\'+frmCreditCardInfo.QCreditCard['pic']);
        edtGroupID.Text := frmCreditCardInfo.QCreditCard['CreditGroupID'];
        edtGroupName.Text := frmCreditCardInfo.QCreditCard['CreditGroupName'];
        edtNumberOfSession.Text := '0';
        edtPrice.SetFocus;
    end;
    FreeAndNil(frmCreditCardInfo);
end;

procedure TfrmCreditCardCharge.edtPriceChange(Sender: TObject);
begin
    edtPrice.Text:= FormatFloat( '###,', StrToInt(Money2Number(edtPrice.Text)));
    edtPrice.SelStart:=Length(edtPrice.Text)+1;
end;

procedure TfrmCreditCardCharge.btnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrBargainCreditCard, qrBargainCreditCard);
    qrBargainCreditCard.lblDate.Caption := QCreditCardCharge['ChargeDate'];
    qrBargainCreditCard.lblID.Caption := QCreditCardCharge['CreditCardChargeID'];
    qrBargainCreditCard.lblCardID.Caption := QCreditCardCharge['CardID'];
    qrBargainCreditCard.lblName.Caption := QCreditCardCharge['Name']+' '+QCreditCardCharge['lastName'];
    qrBargainCreditCard.lblNID.Caption := QCreditCardCharge['NID'];
    qrBargainCreditCard.lblGroupName.Caption := QCreditCardCharge['CreditGroupName'];
    qrBargainCreditCard.lblCreditGroupID.Caption := QCreditCardCharge['ChargeGroupID'];
    qrBargainCreditCard.lblSessionNumber.Caption := QCreditCardCharge['NumberOfSession'];
    qrBargainCreditCard.lblPrice.Caption := FormatFloat('#,', QCreditCardCharge['Price']);
    qrBargainCreditCard.Prepare;
    qrBargainCreditCard.PreviewModal;
    FreeAndNil(qrBargainCreditCard);
end;

procedure TfrmCreditCardCharge.BBtnAcceptClick(Sender: TObject);
begin
    QCreditCardCharge.Close;
    QCreditCardCharge.Parameters.ParamByName('ChargeDate').Value := edtDate.Text;
    QCreditCardCharge.Open;
end;

procedure TfrmCreditCardCharge.btnGroupInfoClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardGroupInfo, frmCreditCardGroupInfo);
    frmCreditCardGroupInfo.ShowModal;
    if frmCreditCardGroupInfo.strKey='enter' then
    begin
        edtGroupID.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupID'];
        edtGroupName.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupName'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmCreditCardGroupInfo);
end;

procedure TfrmCreditCardCharge.ExportToExcelClick(Sender: TObject);
begin
    ExportToExl(QCreditCardCharge);
end;

procedure TfrmCreditCardCharge.FormCreate(Sender: TObject);
begin
  edtDate.Text := CurrentDate;
  BBtnAcceptClick(Sender);
end;

procedure TfrmCreditCardCharge.FormShow(Sender: TObject);
begin
    btnSearch.SetFocus;
end;

end.
