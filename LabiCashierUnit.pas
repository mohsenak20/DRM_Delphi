unit LabiCashierUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  Menus;

type
  TfrmLabiCashier = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtFactorID: TEdit;
    BtnPrint: TBitBtn;
    BtnReturn: TBitBtn;
    BtnExport: TBitBtn;
    Label2: TLabel;
    QFactor: TADOQuery;
    DBGrid1: TDBGrid;
    dsFactor: TDataSource;
    DBText1: TDBText;
    btnFactor: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuStart: TMenuItem;
    N3: TMenuItem;
    mnuExit: TMenuItem;
    SP_Start: TADOStoredProc;
    QReceptionID: TADOQuery;
    SP_FactorAccept: TADOStoredProc;
    QPrint: TADOQuery;
    BtnDel: TBitBtn;
    QDelete: TADOQuery;
    DBGrid2: TDBGrid;
    QCreditList: TADOQuery;
    dsCreditList: TDataSource;
    btnCredit: TBitBtn;
    QCreditListCreditID: TLargeintField;
    QCreditListCredit: TIntegerField;
    QCreditListChargeTime: TStringField;
    QCreditListClosedID: TIntegerField;
    SP_Delete: TADOStoredProc;
    procedure BtnReturnClick(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure btnFactorClick(Sender: TObject);
    procedure mnuStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    Procedure PrintFactor(FactorID : integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCreditClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLabiCashier: TfrmLabiCashier;
  ReceptionID : Largeint;

implementation

uses DMUnit, CalculatUnit, qrSmallMenuFactorUnit, ShareUnit, CreditUnit;

{$R *.dfm}

Procedure TfrmLabiCashier.PrintFactor(FactorID : integer);
begin
    QPrint.Close;
    QPrint.Parameters.ParamByName('FactorID').Value:=FactorID;
    QPrint.Open;
    Application.CreateForm(TqrSmallMenuFactor, qrSmallMenuFactor);
    qrSmallMenuFactor.DataSet:=QPrint;
    qrSmallMenuFactor.lblReceptionDate.DataSet:=QPrint;
    qrSmallMenuFactor.lblSerialNumber.DataSet:=QPrint;
    qrSmallMenuFactor.lblSerialNumber.DataField:='FactorID';
    qrSmallMenuFactor.lblKalaName.DataSet:=QPrint;
    qrSmallMenuFactor.lblVahedPrice.DataSet:=QPrint;
    qrSmallMenuFactor.lblNumber.DataSet:=QPrint;
    qrSmallMenuFactor.lblSumRow.DataSet:=QPrint;
    qrSmallMenuFactor.lblSum.Caption:=QFactor['SumFactor'];
    qrSmallMenuFactor.lblToll.Caption:='0';
    qrSmallMenuFactor.lblEndSum.Caption:=QFactor['SumFactor'];
    qrSmallMenuFactor.lblCustomerName.Caption:='’‰œÊﬁ ·«»Ì';
    qrSmallMenuFactor.lblLocker.Caption:='';
    qrSmallMenuFactor.lblTime.Caption:=TimeToStr(Time);
    qrSmallMenuFactor.lblUserName.Caption:=UserInfo.UserName;
    qrSmallMenuFactor.lblDiscount.Caption:='0';
    qrSmallMenuFactor.lblMessage.Caption:=Parameter.factorMessage;
    qrSmallMenuFactor.lblCoNameAndAddress.Caption:=Parameter.CoName+' '+Parameter.CoAddress+'    ·›‰ '+Parameter.Tel;
    qrSmallMenuFactor.lblMod.Caption:='0';
    qrSmallMenuFactor.Prepare;
    qrSmallMenuFactor.Print;
    FreeAndNil(qrSmallMenuFactor);
end;

procedure TfrmLabiCashier.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmLabiCashier.mnuExitClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmLabiCashier.btnFactorClick(Sender: TObject);
begin
    QFactor.Close;
    QFactor.Parameters.ParamByName('SerialNumber').Value:=edtFactorID.Text;
    QFactor.Open;
    if QFactor['FactorID']=null then
    begin
        ShowMessage('›«ò Ê— „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        edtFactorID.SetFocus;
        Exit;
    end
    else
        if QFactor['ReceptionID']=1 then
        begin
            BtnPrint.Enabled:=False;
            BtnExport.SetFocus;
        end
        else
        begin
            ShowMessage('«Ì‰ ›«ò Ê— ﬁ»·«  «ÌÌœ ‘œÂ «” ');
            BtnPrint.Enabled:=True;
            BtnPrint.SetFocus;
        end;
end;

procedure TfrmLabiCashier.mnuStartClick(Sender: TObject);
begin
    SP_Start.Close;
    SP_Start.Parameters.ParamByName('@CustomerName').Value:='’‰œÊﬁ ·«»Ì';
    SP_Start.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
    SP_Start.Parameters.ParamByName('@ClosedID').Value:=-1;
    SP_Start.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Start.ExecProc;
    QReceptionID.Close;
    QReceptionID.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QReceptionID.Open;
    if QReceptionID['ReceptionID']<>null then
        ReceptionID:=QReceptionID['ReceptionID']
    else
        ReceptionID:=-1;
     Caption:=IntToStr(ReceptionID);
    ShowMessage('‘—Ê⁄ ’‰œÊﬁ À»  ê—œÌœ');
end;

procedure TfrmLabiCashier.FormCreate(Sender: TObject);
begin
    QReceptionID.Close;
    QReceptionID.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QReceptionID.Open;
    if QReceptionID['ReceptionID']<>null then
        ReceptionID:=QReceptionID['ReceptionID']
    else
        ReceptionID:=-1;
    Caption:=IntToStr(ReceptionID);
    QCreditList.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QCreditList.Open;
    QCreditList.Last;
end;

procedure TfrmLabiCashier.BtnExportClick(Sender: TObject);
begin
    SP_FactorAccept.Close;
    SP_FactorAccept.Parameters.ParamByName('@ReceptionID').Value:=ReceptionID;
    SP_FactorAccept.Parameters.ParamByName('@FactorID').Value:=QFactor['FactorID'];
    SP_FactorAccept.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_FactorAccept.ExecProc;
    if SP_FactorAccept.Parameters.ParamByName('@Status').Value=-1 then
        ShowMessage('›«ò Ê— „Ê—œ ‰Ÿ— ﬁ»·«  «ÌÌœ ‘œÂ «” ')
    else
        PrintFactor(QFactor['FactorID']);
    edtFactorID.Clear;
    QFactor.Close;
    QCreditList.Close;
    QCreditList.Open;
    QCreditList.Last;
    edtFactorID.SetFocus;

end;

procedure TfrmLabiCashier.BtnPrintClick(Sender: TObject);
begin
    PrintFactor(QFactor['FactorID']);
end;

procedure TfrmLabiCashier.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmLabiCashier.btnCreditClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCredit, frmCredit);
    frmCredit.ShowModal;
    FreeAndNil(frmCredit);
    QCreditList.Close;
    QCreditList.Open;
    QCreditList.Last;
end;

procedure TfrmLabiCashier.BtnDelClick(Sender: TObject);
begin
    if MessageBox(Self.Handle,'¬Ì« ›«ò Ê— „Ê—œ ‰Ÿ— Õ–› ê—œœø','Õ–› ›«ò Ê—',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrNo then Exit;    
    SP_Delete.Close;
    SP_Delete.Parameters.ParamByName('@FactorID').Value:=QFactor['FactorID'];
    SP_Delete.Parameters.ParamByName('@ReceptionID').Value:=Caption;
    SP_Delete.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Delete.ExecProc;
    QCreditList.Close;
    QCreditList.Open;
    QCreditList.Last;
    ShowMessage('›«ò Ê— „Ê—œ ‰Ÿ— Õ–› ê—œÌœ');
end;

end.
