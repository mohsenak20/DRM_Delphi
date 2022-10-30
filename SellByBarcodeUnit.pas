unit SellByBarcodeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Buttons, Grids, ExtCtrls, Menus;

type
  TfrmSaleByBarcode = class(TForm)
    QKala: TADOQuery;
    QReception: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
    SP_Factor: TADOStoredProc;
    SP_SubFactor: TADOStoredProc;
    QPrint: TADOQuery;
    Panel1: TPanel;
    btnExportFactor: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtBarcode: TEdit;
    edtLockerNumber: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblCustomerName: TLabel;
    lblReceptionID: TLabel;
    lblCurrentCredit: TLabel;
    sg: TStringGrid;
    btnNewGroup: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuDeleteFactor: TMenuItem;
    PopupMenu1: TPopupMenu;
    mnuDelRow: TMenuItem;
    procedure edtBarcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLockerNumberExit(Sender: TObject);
    procedure btnExportFactorClick(Sender: TObject);
    procedure ClearForm();
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddToSG(KalaId: integer; kalaName: string; price: integer; amount: integer = 1);
    function sumFactor(): integer;
    procedure btnNewGroupClick(Sender: TObject);
    procedure edtLockerNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnuDeleteFactorClick(Sender: TObject);
    procedure mnuDelRowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaleByBarcode: TfrmSaleByBarcode;

implementation

uses DMUnit, ShareUnit, CalculatUnit, Math, qrSmallMenuFactorUnit,
  MenuPasswordUnit;

{$R *.dfm}

function TfrmSaleByBarcode.sumFactor(): integer;
var
sum: integer;
i: integer;
begin
  sum := 0;
  for i:= 1 to sg.RowCount-2 do
  begin
      sum := sum + StrToIntDef(sg.Cells[3, i], 0);
  end;
  sumFactor := sum;
end;

procedure TfrmSaleByBarcode.AddToSG(KalaId: integer; kalaName: string; price: integer; amount: integer = 1);
var
i: integer; found: Boolean;
begin
  found := False;
  for i:=1 to sg.RowCount do
  begin
    if sg.Cells[0, i] = IntToStr(KalaId) then
    begin
      sg.Cells[2, i] := IntToStr(StrToIntDef(sg.Cells[2,i], 0)+1);
      found:=True;
      Break;
    end;
  end;
  if not found then
  begin
    sg.Cells[0, sg.RowCount-1]:=IntToStr(KalaId);
    sg.Cells[1, sg.RowCount-1]:=kalaName;
    sg.Cells[2, sg.RowCount-1]:='1';
    sg.Cells[3, sg.RowCount-1]:=IntToStr(price);
    sg.RowCount := sg.RowCount + 1;
  end;
  edtBarcode.Clear;
  edtBarcode.SetFocus;
end;

procedure TfrmSaleByBarcode.ClearForm();
var
i: integer;
begin
    edtBarcode.Clear;
    edtLockerNumber.Clear;
    lblReceptionID.Caption := '';
    lblCustomerName.Caption :='';
    lblCurrentCredit.Caption := '';
    for i:=1 to sg.RowCount do
    begin
      SG.Cells[0,i]:='';
      SG.Cells[1,i]:='';
      SG.Cells[2,i]:='';
      SG.Cells[3,i]:='';
    end;
    sg.RowCount := 2;
    edtLockerNumber.SetFocus;
    btnExportFactor.Enabled := True;
end;

procedure TfrmSaleByBarcode.edtBarcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
  begin
    QKala.Close;
    QKala.Parameters.ParamByName('Barcode').Value := edtBarcode.Text;
    QKala.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QKala.Open;
    if QKala['Barcode'] = null then
    begin
      ShowMessage('ò«·«Ì „Ê—œ ‰Ÿ— Ì«›  ‰‘œ');
      edtBarcode.Clear;
      Exit;
    end;
    AddToSG(QKala['KalaID'], QKala['KalaName'], QKala['VahedPrice'], 1);
  end;
end;

procedure TfrmSaleByBarcode.edtLockerNumberExit(Sender: TObject);
begin
    if edtLockerNumber.Text='' then Exit;
    QReception.Close;
    QReception.Parameters.ParamByName('KeyNumber').Value:=edtLockerNumber.Text;
    QReception.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QReception.Open;
    if QReception['ReceptionID']<>Null then
    begin
        if QReception['Active'] then
        begin
            if QReception.RecordCount=1 then
            begin
                lblReceptionID.Caption := QReception['ReceptionID'];
                lblCustomerName.Caption := QReception['CustomerName'];
                SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
                SP_GetCurrentCredit.ExecProc;
                lblCurrentCredit.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
            end
            else
                ShowMessage('«“ «Ì‰ ‘„«—Â »Ì‘ «“ Ìﬂ ‰›— «” ›«œÂ „Ì ﬂ‰‰œ');
        end
        else
            ShowMessage('«Ì‰ ‘„«—Â ﬂ·Ìœ »Â ÿÊ— „Êﬁ  €Ì— ›⁄«· ‘œÂ «”  ·ÿ›« »Â „œÌ—Ì  œ«Œ·Ì „—«Ã⁄Â ‘Êœ');

    end
    else
        ShowMessage('«Ì‰ ‘„«—Â ﬂ·Ìœ „⁄ »— ‰„Ì »«‘œ');
end;

procedure TfrmSaleByBarcode.btnExportFactorClick(Sender: TObject);
var
i: integer;
begin
    btnExportFactor.Enabled := False;
    if sg.RowCount < 2 then Exit;

    if sumFactor() > StrToInt(lblCurrentCredit.Caption) then
    begin
        ShowMessage('‘«—é „ÌÂ„«‰ ò«›Ì ‰Ì” ');
        btnExportFactor.Enabled := True;
        Exit;
    end;

    SP_Factor.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
    SP_Factor.Parameters.ParamByName('@isZero').Value := 0;
    SP_Factor.Parameters.ParamByName('@Description').Value:='';
    SP_Factor.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Factor.Parameters.ParamByName('@Discount').Value:=0;
    SP_Factor.Parameters.ParamByName('@FactorID').Value:=-1;
    SP_Factor.Parameters.ParamByName('@Active').Value:=True;
    SP_Factor.Parameters.ParamByName('@PercentDiscount').Value:=0;
    SP_Factor.Parameters.ParamByName('@Documentation').Value:=False;
    SP_Factor.Parameters.ParamByName('@Action').Value:='Insert';
    SP_Factor.ExecProc;
    SP_SubFactor.Parameters.ParamByName('@FactorID').Value:=SP_Factor.Parameters.ParamByName('@OutFactorID').Value;
    for i:=1 to sg.RowCount-2 do
    begin
      SP_SubFactor.Parameters.ParamByName('@ProductID').Value:=sg.Cells[0, i];
      SP_SubFactor.Parameters.ParamByName('@Number').Value:=sg.Cells[2, i];
      SP_SubFactor.Parameters.ParamByName('@VahedPrice').Value:=sg.Cells[3, i];
      SP_SubFactor.Parameters.ParamByName('@Description').Value:='';
      SP_SubFactor.Parameters.ParamByName('@StorageTitleID').Value:=1;
      SP_SubFactor.Parameters.ParamByName('@Active').Value:=True;
      SP_SubFactor.Parameters.ParamByName('@Action').Value:='Insert';
      SP_SubFactor.ExecProc;
    end;
    ShowMessage('’œÊ— ›«ò Ê— »« „Ê›ﬁÌ  «‰Ã«„ ê—œÌœ');
    QPrint.Close;
    QPrint.Parameters.ParamByName('FactorID').Value:=SP_Factor.Parameters.ParamByName('@OutFactorID').Value;
    QPrint.Open;
    Application.CreateForm(TqrSmallMenuFactor, qrSmallMenuFactor);
     qrSmallMenuFactor.DataSet := QPrint;
    qrSmallMenuFactor.lblKalaName.DataSet := QPrint;
    qrSmallMenuFactor.lblNumber.DataSet := QPrint;
    qrSmallMenuFactor.lblVahedPrice.DataSet := QPrint;
    qrSmallMenuFactor.lblSumRow.DataSet := QPrint;

    qrSmallMenuFactor.lblSum.Caption:=IntToStr(sumFactor());
    qrSmallMenuFactor.lblToll.Caption:='0';
    qrSmallMenuFactor.lblRePrint.Caption := '';
    qrSmallMenuFactor.lblEndSum.Caption:=IntToStr(sumFactor());
    qrSmallMenuFactor.lblCustomerName.Caption:=lblCustomerName.Caption;
    qrSmallMenuFactor.lblLocker.Caption:=edtLockerNumber.Text;
    qrSmallMenuFactor.lblTime.Caption:=TimeToStr(Time);
    qrSmallMenuFactor.lblUserName.Caption:=UserInfo.UserName;
    qrSmallMenuFactor.lblDiscount.Caption:='0';
    qrSmallMenuFactor.lblMessage.Caption:=Parameter.factorMessage;
    qrSmallMenuFactor.lblCoNameAndAddress.Caption:=Parameter.CoName+' '+Parameter.CoAddress+'    ·›‰ '+Parameter.Tel;
    SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
    SP_GetCurrentCredit.ExecProc;
    qrSmallMenuFactor.lblMod.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    qrSmallMenuFactor.Prepare;
    qrSmallMenuFactor.Print;
    FreeAndNil(qrSmallMenuFactor);
    ClearForm;

end;

procedure TfrmSaleByBarcode.FormShow(Sender: TObject);
begin
    ClearForm;
end;

procedure TfrmSaleByBarcode.FormCreate(Sender: TObject);
begin
    sg.Cells[0,0]:='òœ';
    sg.Cells[1,0]:='‰«„';
    sg.Cells[2,0]:=' ⁄œ«œ';
    sg.Cells[3,0]:='ﬁÌ„  Ê«Õœ';
end;



procedure TfrmSaleByBarcode.btnNewGroupClick(Sender: TObject);
begin
  ClearForm;
end;

procedure TfrmSaleByBarcode.edtLockerNumberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
      edtBarcode.SetFocus;
end;

procedure TfrmSaleByBarcode.mnuDeleteFactorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmMenuPassword, frmMenuPassword);
    frmMenuPassword.Caption:='—„“ Õ–› ›«ò Ê—';
    frmMenuPassword.Acction:='Delete';
    frmMenuPassword.ShowModal;
    FreeAndNil(frmMenuPassword);
end;

procedure TfrmSaleByBarcode.mnuDelRowClick(Sender: TObject);
var
i: integer;
begin
    if sg.RowCount <= 3 then Exit;
    for i:=sg.Row to sg.RowCount-1 do
    begin
        sg.Cells[0, i] := sg.Cells[0, i+1];
        sg.Cells[1, i] := sg.Cells[1, i+1];
        sg.Cells[2, i] := sg.Cells[2, i+1];
        sg.Cells[3, i] := sg.Cells[3, i+1];
    end;
    sg.RowCount := sg.RowCount -1;
end;

end.
