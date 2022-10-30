unit MenuUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus, DB, ADODB, Grids,
  DBGrids, DBCtrls, Mask, ActnList, Printers;

type
  TfrmMenu = class(TForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    PanelButtom: TPanel;
    TabSheet2: TTabSheet;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    Edit17: TEdit;
    UpDown17: TUpDown;
    Edit18: TEdit;
    UpDown18: TUpDown;
    Edit19: TEdit;
    UpDown19: TUpDown;
    UpDown20: TUpDown;
    Edit20: TEdit;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    Edit21: TEdit;
    UpDown21: TUpDown;
    Edit22: TEdit;
    UpDown22: TUpDown;
    Edit23: TEdit;
    UpDown23: TUpDown;
    Edit24: TEdit;
    UpDown24: TUpDown;
    Edit25: TEdit;
    UpDown25: TUpDown;
    Edit26: TEdit;
    UpDown26: TUpDown;
    Edit27: TEdit;
    UpDown27: TUpDown;
    Edit28: TEdit;
    UpDown28: TUpDown;
    Edit29: TEdit;
    UpDown29: TUpDown;
    UpDown30: TUpDown;
    Edit30: TEdit;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    Edit31: TEdit;
    UpDown31: TUpDown;
    Edit32: TEdit;
    UpDown32: TUpDown;
    MainMenu: TMainMenu;
    mnuExit: TMenuItem;
    mnuSetMenu: TMenuItem;
    gbEditMenu: TGroupBox;
    Label1: TLabel;
    edtKalaID: TEdit;
    Label2: TLabel;
    edtCaption: TEdit;
    btnKalaID: TBitBtn;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    QSearchKalaID: TADOQuery;
    SP_Menu: TADOStoredProc;
    Label3: TLabel;
    lblButtonNumber: TLabel;
    btnDelet: TBitBtn;
    QDelMenu: TADOQuery;
    mnuMenuTitle: TMenuItem;
    gbMenuTitle: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnSaveMenuTitle: TBitBtn;
    btnMenuTitleCancel: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    dsMenuTitle: TDataSource;
    BtnReset: TBitBtn;
    TabSheet10: TTabSheet;
    Label14: TLabel;
    edtFactorDate: TMaskEdit;
    Label15: TLabel;
    edtSumPriceMenu1: TEdit;
    edtDiscount: TEdit;
    Label16: TLabel;
    btnExportFactor: TBitBtn;
    SP_Factor: TADOStoredProc;
    SP_SubFactor: TADOStoredProc;
    SP_Exist: TADOStoredProc;
    SP_Storage: TADOStoredProc;
    SP_Artic: TADOStoredProc;
    SP_Doc: TADOStoredProc;
    QCustomerID: TADOQuery;
    QNtt: TADOQuery;
    QAnalyze: TADOQuery;
    QStorage: TADOQuery;
    QStorageTitle: TADOQuery;
    QCustomer: TADOQuery;
    EditP17: TEdit;
    EditP18: TEdit;
    EditP19: TEdit;
    EditP20: TEdit;
    EditP21: TEdit;
    EditP22: TEdit;
    EditP23: TEdit;
    EditP24: TEdit;
    EditP25: TEdit;
    EditP26: TEdit;
    EditP27: TEdit;
    EditP28: TEdit;
    EditP29: TEdit;
    EditP30: TEdit;
    EditP31: TEdit;
    EditP32: TEdit;
    EditM17: TEdit;
    EditM18: TEdit;
    EditM19: TEdit;
    EditM20: TEdit;
    EditM21: TEdit;
    EditM22: TEdit;
    EditM23: TEdit;
    EditM24: TEdit;
    EditM32: TEdit;
    EditM31: TEdit;
    EditM30: TEdit;
    EditM29: TEdit;
    EditM28: TEdit;
    EditM27: TEdit;
    EditM26: TEdit;
    EditM25: TEdit;
    TabSheet3: TTabSheet;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    BitBtn45: TBitBtn;
    BitBtn46: TBitBtn;
    BitBtn47: TBitBtn;
    BitBtn48: TBitBtn;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    BitBtn49: TBitBtn;
    BitBtn50: TBitBtn;
    BitBtn51: TBitBtn;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    BitBtn54: TBitBtn;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    BitBtn59: TBitBtn;
    BitBtn60: TBitBtn;
    BitBtn61: TBitBtn;
    BitBtn62: TBitBtn;
    BitBtn63: TBitBtn;
    BitBtn64: TBitBtn;
    Edit49: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    Edit57: TEdit;
    Edit58: TEdit;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit61: TEdit;
    Edit62: TEdit;
    Edit63: TEdit;
    Edit64: TEdit;
    UpDown33: TUpDown;
    UpDown34: TUpDown;
    UpDown35: TUpDown;
    UpDown36: TUpDown;
    UpDown37: TUpDown;
    UpDown38: TUpDown;
    UpDown39: TUpDown;
    UpDown40: TUpDown;
    UpDown41: TUpDown;
    UpDown42: TUpDown;
    UpDown43: TUpDown;
    UpDown44: TUpDown;
    UpDown45: TUpDown;
    UpDown46: TUpDown;
    UpDown47: TUpDown;
    UpDown48: TUpDown;
    UpDown49: TUpDown;
    UpDown50: TUpDown;
    UpDown51: TUpDown;
    UpDown52: TUpDown;
    UpDown53: TUpDown;
    UpDown54: TUpDown;
    UpDown55: TUpDown;
    UpDown56: TUpDown;
    UpDown57: TUpDown;
    UpDown58: TUpDown;
    UpDown59: TUpDown;
    UpDown60: TUpDown;
    UpDown61: TUpDown;
    UpDown62: TUpDown;
    UpDown63: TUpDown;
    UpDown64: TUpDown;
    EditM33: TEdit;
    EditP33: TEdit;
    EditM34: TEdit;
    EditP34: TEdit;
    EditM35: TEdit;
    EditP35: TEdit;
    EditM36: TEdit;
    EditP36: TEdit;
    EditM37: TEdit;
    EditP37: TEdit;
    EditM38: TEdit;
    EditP38: TEdit;
    EditM39: TEdit;
    EditP39: TEdit;
    EditM40: TEdit;
    EditP40: TEdit;
    EditM41: TEdit;
    EditM42: TEdit;
    EditP42: TEdit;
    EditM43: TEdit;
    EditP43: TEdit;
    EditM44: TEdit;
    EditP44: TEdit;
    EditM45: TEdit;
    EditP45: TEdit;
    EditM46: TEdit;
    EditP46: TEdit;
    EditM47: TEdit;
    EditP47: TEdit;
    EditM48: TEdit;
    EditP48: TEdit;
    EditM49: TEdit;
    EditP49: TEdit;
    EditM50: TEdit;
    EditP50: TEdit;
    EditM51: TEdit;
    EditP51: TEdit;
    EditM52: TEdit;
    EditP52: TEdit;
    EditM53: TEdit;
    EditP53: TEdit;
    EditM54: TEdit;
    EditP54: TEdit;
    EditM55: TEdit;
    EditP55: TEdit;
    EditM56: TEdit;
    EditP56: TEdit;
    EditM57: TEdit;
    EditP57: TEdit;
    EditM58: TEdit;
    EditP58: TEdit;
    EditM59: TEdit;
    EditP59: TEdit;
    EditM60: TEdit;
    EditP60: TEdit;
    EditM61: TEdit;
    EditP61: TEdit;
    EditM62: TEdit;
    EditP62: TEdit;
    EditM63: TEdit;
    EditP63: TEdit;
    EditM64: TEdit;
    EditP64: TEdit;
    EditP41: TEdit;
    BitBtn65: TBitBtn;
    BitBtn66: TBitBtn;
    BitBtn67: TBitBtn;
    BitBtn68: TBitBtn;
    BitBtn69: TBitBtn;
    BitBtn70: TBitBtn;
    BitBtn71: TBitBtn;
    BitBtn72: TBitBtn;
    BitBtn73: TBitBtn;
    BitBtn74: TBitBtn;
    BitBtn75: TBitBtn;
    BitBtn76: TBitBtn;
    BitBtn77: TBitBtn;
    BitBtn78: TBitBtn;
    BitBtn79: TBitBtn;
    BitBtn80: TBitBtn;
    BitBtn81: TBitBtn;
    BitBtn82: TBitBtn;
    BitBtn83: TBitBtn;
    BitBtn84: TBitBtn;
    BitBtn85: TBitBtn;
    BitBtn86: TBitBtn;
    BitBtn87: TBitBtn;
    BitBtn88: TBitBtn;
    BitBtn89: TBitBtn;
    BitBtn90: TBitBtn;
    BitBtn91: TBitBtn;
    BitBtn92: TBitBtn;
    BitBtn93: TBitBtn;
    BitBtn94: TBitBtn;
    BitBtn95: TBitBtn;
    BitBtn96: TBitBtn;
    Edit65: TEdit;
    UpDown65: TUpDown;
    Edit66: TEdit;
    UpDown66: TUpDown;
    Edit67: TEdit;
    UpDown67: TUpDown;
    Edit68: TEdit;
    UpDown68: TUpDown;
    Edit69: TEdit;
    UpDown69: TUpDown;
    Edit70: TEdit;
    UpDown70: TUpDown;
    Edit71: TEdit;
    UpDown71: TUpDown;
    Edit72: TEdit;
    UpDown72: TUpDown;
    Edit73: TEdit;
    UpDown73: TUpDown;
    Edit74: TEdit;
    UpDown74: TUpDown;
    Edit75: TEdit;
    UpDown75: TUpDown;
    Edit76: TEdit;
    UpDown76: TUpDown;
    Edit77: TEdit;
    UpDown77: TUpDown;
    Edit78: TEdit;
    UpDown78: TUpDown;
    Edit79: TEdit;
    UpDown79: TUpDown;
    Edit80: TEdit;
    UpDown80: TUpDown;
    Edit81: TEdit;
    UpDown81: TUpDown;
    Edit82: TEdit;
    UpDown82: TUpDown;
    Edit83: TEdit;
    UpDown83: TUpDown;
    Edit84: TEdit;
    UpDown84: TUpDown;
    Edit85: TEdit;
    UpDown85: TUpDown;
    Edit86: TEdit;
    UpDown86: TUpDown;
    Edit87: TEdit;
    UpDown87: TUpDown;
    Edit88: TEdit;
    UpDown88: TUpDown;
    Edit89: TEdit;
    UpDown89: TUpDown;
    Edit90: TEdit;
    UpDown90: TUpDown;
    Edit91: TEdit;
    UpDown91: TUpDown;
    Edit92: TEdit;
    UpDown92: TUpDown;
    Edit93: TEdit;
    UpDown93: TUpDown;
    Edit94: TEdit;
    UpDown94: TUpDown;
    Edit95: TEdit;
    UpDown95: TUpDown;
    Edit96: TEdit;
    UpDown96: TUpDown;
    EditM65: TEdit;
    EditP65: TEdit;
    EditM66: TEdit;
    EditP66: TEdit;
    EditM67: TEdit;
    EditP67: TEdit;
    EditM68: TEdit;
    EditP68: TEdit;
    EditM69: TEdit;
    EditP69: TEdit;
    EditM70: TEdit;
    EditP70: TEdit;
    EditM71: TEdit;
    EditP71: TEdit;
    EditM72: TEdit;
    EditP72: TEdit;
    EditM73: TEdit;
    EditP73: TEdit;
    EditM74: TEdit;
    EditP74: TEdit;
    EditM75: TEdit;
    EditP75: TEdit;
    EditM76: TEdit;
    EditP76: TEdit;
    EditM77: TEdit;
    EditP77: TEdit;
    EditM78: TEdit;
    EditP78: TEdit;
    EditM79: TEdit;
    EditP79: TEdit;
    EditM80: TEdit;
    EditP80: TEdit;
    EditM81: TEdit;
    EditP81: TEdit;
    EditM82: TEdit;
    EditP82: TEdit;
    EditM83: TEdit;
    EditP83: TEdit;
    EditM84: TEdit;
    EditP84: TEdit;
    EditM85: TEdit;
    EditP85: TEdit;
    EditM86: TEdit;
    EditP86: TEdit;
    EditM87: TEdit;
    EditP87: TEdit;
    EditM88: TEdit;
    EditP88: TEdit;
    EditM89: TEdit;
    EditP89: TEdit;
    EditM90: TEdit;
    EditP90: TEdit;
    EditM91: TEdit;
    EditP91: TEdit;
    EditM92: TEdit;
    EditP92: TEdit;
    EditM93: TEdit;
    EditP93: TEdit;
    EditM94: TEdit;
    EditP94: TEdit;
    EditM95: TEdit;
    EditP95: TEdit;
    EditM96: TEdit;
    EditP96: TEdit;
    Label20: TLabel;
    cboToll: TComboBox;
    QProductPrice: TADOQuery;
    QMaterialPrice: TADOQuery;
    QPrint: TADOQuery;
    Label21: TLabel;
    edtDescriptionInfo: TDBEdit;
    dsOption: TDataSource;
    ActionList1: TActionList;
    ASave: TAction;
    Discount: TAction;
    mnuExist: TMenuItem;
    QUpdateExist: TADOQuery;
    Label22: TLabel;
    edtSumPriceOtherMenu: TEdit;
    Label23: TLabel;
    edtService: TEdit;
    Label24: TLabel;
    edtSumPrice: TEdit;
    N2: TMenuItem;
    Exit1: TMenuItem;
    btnStorage: TBitBtn;
    Label25: TLabel;
    edtStorageTitleID: TDBEdit;
    QSaveToll: TADOQuery;
    Panel1: TPanel;
    SG: TStringGrid;
    btnSearchCustomer: TBitBtn;
    edtSerialNumber: TEdit;
    Label13: TLabel;
    QSerialNumber: TADOQuery;
    QEditFactor: TADOQuery;
    Label26: TLabel;
    lblAct: TLabel;
    QFindPosButton: TADOQuery;
    BtnPrint: TBitBtn;
    btnDelFactor: TBitBtn;
    QProduct: TADOQuery;
    QDelete: TADOQuery;
    QPrintFactorID: TADOQuery;
    Label17: TLabel;
    edtDescription: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    edtBarcode: TEdit;
    Label29: TLabel;
    edtNafar: TEdit;
    Label12: TLabel;
    N1: TMenuItem;
    mnuPrinter1: TMenuItem;
    mnuPrinter2: TMenuItem;
    mnuPrinter3: TMenuItem;
    QDelSubFactor: TADOQuery;
    QFindFactorID: TADOQuery;
    GroupBox1: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edtMesage1: TEdit;
    edtMesage2: TEdit;
    edtMesage3: TEdit;
    btnPrintMessage1: TBitBtn;
    btnPrintMessage2: TBitBtn;
    btnPrintMessage3: TBitBtn;
    btnMseeage: TBitBtn;
    Label33: TLabel;
    edtNumPrint: TEdit;
    chbToll: TCheckBox;
    QMenuTitle: TADOQuery;
    QMenu: TADOQuery;
    edtSalon: TEdit;
    Label7: TLabel;
    pnlReception: TPanel;
    pnlKeyNumber: TPanel;
    pnlCustomerName: TPanel;
    pnlCredit: TPanel;
    QDeleteSubFactor: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
    mnuReport: TMenuItem;
    mnuSalesReport: TMenuItem;
    N4: TMenuItem;
    mnuDelete: TMenuItem;
    chbPrint: TCheckBox;
    SP_FactorAccept: TADOStoredProc;
    QReceptionID: TADOQuery;
    SP_Start: TADOStoredProc;
    ActiveMenu1: TAction;
    ActiveMenu2: TAction;
    SearchNewCustomer: TAction;
    QisIssueExit: TADOQuery;
    QUsedInternetGift: TADOQuery;
    QDelEmptyFactor: TADOQuery;
    QSpecialGuestCredit: TADOQuery;
    SaveZero: TAction;
    QBarcode: TADOQuery;
    chbPrice2: TCheckBox;
    procedure mnuSetMenuClick(Sender: TObject);
    procedure BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnKalaIDClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure btnDeletClick(Sender: TObject);
    procedure btnMenuTitleCancelClick(Sender: TObject);
    procedure mnuMenuTitleClick(Sender: TObject);
    procedure btnSaveMenuTitleClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure btnExportFactorClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DiscountExecute(Sender: TObject);
    procedure mnuExistClick(Sender: TObject);
    procedure calcPrice();
    procedure Exit1Click(Sender: TObject);
    procedure edtDiscountExit(Sender: TObject);
    procedure btnStorageClick(Sender: TObject);
    procedure addToSG(bNum :Integer; btnCaption :String; Number :Integer; Price :String);
    function Search(btnNum :Integer):integer;
    procedure Del(btnNum :Integer);
    procedure edtSerialNumberExit(Sender: TObject);
    procedure edtSerialNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDelFactorClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PrintFromMenu(PrintNumber :Integer);
    procedure btnMseeageClick(Sender: TObject);
    procedure btnSearchCustomerClick(Sender: TObject);
    procedure mnuSalesReportClick(Sender: TObject);
    procedure mnuDeleteClick(Sender: TObject);
    Function CreditMod(ReceptionID : Largeint): integer;
    procedure ActiveMenu1Execute(Sender: TObject);
    procedure ActiveMenu2Execute(Sender: TObject);
    procedure ASaveExecute(Sender: TObject);
    procedure SaveZeroExecute(Sender: TObject);
    procedure addToSGByBarcode(barcode: string);
  private
    { Private declarations }
    EnableMenu : Boolean;
    isZero: Boolean;
  public
    { Public declarations }
  end;

type BtnRow = record
  btnNumber : integer;
  Row       : integer;
end;

var
  frmMenu: TfrmMenu;
  Statusrecord : String;
  ButtonNumber, SumPrice : Integer;
  positionArray : array [1..100] of btnRow;
  ReceptionID : Largeint;
implementation

uses DMUnit, CalculatUnit, KalaInfoUnit, PrePrintUnit,
  qrSmallMenuFactorUnit, Math, ShareUnit, DescriptionInfoUnit,
  SearchCustomerUnit, SalesReportUnit, MenuPasswordUnit;

{$R *.dfm}

Function TfrmMenu.CreditMod(ReceptionID : Largeint) : integer;
var QCreditMod : TADOQuery;
begin
    QCreditMod:=TADOQuery.Create(nil);
    QCreditMod.Connection:=DM.ADOConnection;
    QCreditMod.SQL.Text:='Declare @ReceptionID Bigint';
    QCreditMod.SQL.Add('set @ReceptionID ='+IntToStr(ReceptionID));
    QCreditMod.SQL.Add('select (case when sum(Credit) is null then 0 else sum(Credit) end)- ');
    QCreditMod.SQL.Add('(select (case when sum(Number*VahedPRice) is null then 0 else sum(Number*VahedPRice) end)');
    QCreditMod.SQL.Add('from TFactor inner join TSubFactor on TFactor.FactorID=TSubFactor.FactorID where ReceptionID= @ReceptionID) as CreditMod from');
    QCreditMod.SQL.Add('TCredit where ReceptionID= @ReceptionID');
    QCreditMod.Open;
    if QCreditMod['CreditMod']<>null then
        CreditMod:=QCreditMod['CreditMod']
    else
        CreditMod:=0;

end;

procedure TfrmMenu.PrintFromMenu(PrintNumber :Integer);
var
Toll, i : Integer;
begin
    Toll:=0;
    SumPrice:=0;
    QPrintFactorID.Close;
    QPrintFactorID.Parameters.ParamByName('SerialNumber').Value:=edtSerialNumber.Text;
    QPrintFactorID.Open;
    if QPrintFactorID['FactorID']=Null then
    begin
        ShowMessage('›«ò Ê— „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        Exit;
    end;
    QPrint.Close;
    QPrint.Parameters.ParamByName('FactorID').Value:=QPrintFactorID['FactorID'];
    QPrint.Open;
    while QPrint.Eof=False do
    begin
        SumPrice:=SumPrice+QPrint['SubFactorPrice'];
        QPrint.Next;
    end;
    Application.CreateForm(TqrSmallMenuFactor, qrSmallMenuFactor);
    qrSmallMenuFactor.lblSum.Caption:=IntToStr(SumPrice);
    Toll:=QPrint['Cost1'];
    qrSmallMenuFactor.lblToll.Caption:=IntToStr(Toll);
    qrSmallMenuFactor.lblEndSum.Caption:=IntToStr(SumPrice+Toll-QPrint['Discount']);

    qrSmallMenuFactor.lblCustomerName.Caption:=pnlCustomerName.Caption;
    qrSmallMenuFactor.lblTime.Caption:=TimeToStr(Time);
    //qrSmallMenuFactor.lblSalon.Caption:=edtSalon.Text;
    //qrSmallMenuFactor.lblMiz.Caption:=edtMiz.Text;
    //qrSmallMenuFactor.lblNafar.Caption:=edtNafar.Text;
    qrSmallMenuFactor.lblUserName.Caption:=UserInfo.UserName;
    qrSmallMenuFactor.lblDiscount.Caption:=edtDiscount.Text;

    qrSmallMenuFactor.lblMessage.Caption:=Parameter.factorMessage;
    qrSmallMenuFactor.lblCoNameAndAddress.Caption:=Parameter.CoName+' '+Parameter.CoAddress+'    ·›‰ '+Parameter.Tel;
    qrSmallMenuFactor.Prepare;
    qrSmallMenuFactor.Print;
    FreeAndNil(qrSmallMenuFactor);

    if MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ ›«ò Ê— ÃœÌœ À»  ‰„«ÌÌœ ø','’œÊ— ›«ò Ê—',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo Then Exit;
    for i:=1 to 96 do
        TEdit(FindComponent('Edit'+IntToStr(i))).Text:='0';
    for i:=1 to 100 do
    begin
        SG.Cells[0, i]:='';
        SG.Cells[1, i]:='';
        SG.Cells[2, i]:='';
        SG.Cells[3, i]:='';
        SG.Cells[4, i]:='';
        positionArray[i].btnNumber:=-1;
        positionArray[i].Row:=-1;
    end;
    QSerialNumber.Close;
    QSerialNumber.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QSerialNumber.Open;
    if QSerialNumber['SerialNumber']<>Null then
        edtSerialNumber.Text:=IntToStr(QSerialNumber['SerialNumber'])
    else
        edtSerialNumber.Text:='1';
    edtDiscount.Text:='0';
    lblAct.Caption:='œ—Ã';
    pnlKeyNumber.Caption:='';
    pnlCustomerName.Caption:='';
    pnlReception.Caption:='';
    pnlCredit.Caption:='0';
end;

function TfrmMenu.Search(btnNum :Integer): integer;
var
i : integer;
begin
    for i:=1 to 100 do
        if positionArray[i].btnNumber=btnNum then
        begin
            Search:=i;
            Exit;
        end;
    Search:=-1;
end;
procedure TfrmMenu.Del(btnNum: Integer);
var
i, p : integer;
begin
    p:=Search(btnNum);
    for i:=positionArray[p].Row to 99 do
    begin
        SG.Cells[1,i]:=SG.Cells[1,i+1];
        SG.Cells[2,i]:=SG.Cells[2,i+1];
        SG.Cells[3,i]:=SG.Cells[3,i+1];
        SG.Cells[4,i]:=SG.Cells[4,i+1];
    end;
    positionArray[p].btnNumber:=-1;
    positionArray[p].Row:=-1;
end;

procedure TfrmMenu.addToSG(bNum :Integer; btnCaption :String; Number :Integer; Price :String);
var
i, j :integer;
begin
   if Number=0 then
      Del(bNum)
   else
      if Search(bNum)<>-1 then
      begin
          SG.Cells[0, positionArray[Search(bNum)].Row]:=IntToStr(positionArray[Search(bNum)].Row);
          SG.Cells[1, positionArray[Search(bNum)].Row]:=btnCaption;
          SG.Cells[2, positionArray[Search(bNum)].Row]:=IntToStr(Number);
          SG.Cells[3, positionArray[Search(bNum)].Row]:=Money2Number(Price);
          SG.Cells[4, positionArray[Search(bNum)].Row]:=IntToStr(Number*strtoint(Money2Number(Price)));
      end
      else
      begin
          for j:=1 to 100 do
              if SG.Cells[1,j]='' then break;
          SG.Cells[0, j]:=IntToStr(j);
          SG.Cells[1, j]:=btnCaption;
          SG.Cells[2, j]:=IntToStr(Number);
          SG.Cells[3, j]:=Money2Number(Price);
          SG.Cells[4, j]:=IntToStr(Number*strtoint(Money2Number(Price)));
          for i:=1 to 100 do
              if positionArray[i].btnNumber=-1 then
              begin
                  positionArray[i].btnNumber:=bNum;
                  positionArray[i].Row:=j;
                  break;
              end;
      end;

end;

procedure TfrmMenu.addToSGByBarcode(barcode: string);
begin
    QBarcode.Close;
    QBarcode.Parameters.ParamByName('Barcode').Value := edtBarcode.Text;
    QBarcode.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QBarcode.Open;
    if QBarcode['Barcode']<>null then
    begin


    end;
end;

procedure TfrmMenu.calcPrice();
var
i, SumMenu1, SumOtherMenu, Discount, Service, Sum  : integer;
begin
    SumMenu1:=0;
    SumOtherMenu:=0;
    Service:=0;
    Discount:=0;
    for i:=1 to 32 do
        SumMenu1:=SumMenu1+StrToIntDef(TEdit(FindComponent('Edit'+IntToStr(i))).Text,0)*StrToIntDef(Money2Number(TEdit(FindComponent('EditP'+IntToStr(i))).Text),0);
    for i:=33 to 96 do
        SumOtherMenu:=SumOtherMenu+StrToIntDef(TEdit(FindComponent('Edit'+IntToStr(i))).Text,0)*StrToIntDef(Money2Number(TEdit(FindComponent('EditP'+IntToStr(i))).Text),0);
    Discount:=StrToIntDef(Money2Number(edtDiscount.Text), 0);
    for i:=1 to 96 do
        if StrToIntDef(TEdit(FindComponent('Edit'+IntToStr(i))).Text, 0)>0 then
        begin
            QSearchKalaID.Close;
            QSearchKalaID.Parameters.ParamByName('ButtonNumber').Value:=i;
            QSearchKalaID.Open;
            if QSearchKalaID['Toll']>0 then
                Service:=Service+round((StrToIntDef(TEdit(FindComponent('Edit'+IntToStr(i))).Text,0)*StrToIntDef(Money2Number(TEdit(FindComponent('EditP'+IntToStr(i))).Text),0))*QSearchKalaID['Toll']/100);
        end;
        if Service>0 then
            edtService.Text:=FormatFloat('###,', Service)
        else
            edtService.Text:='0';

    edtSumPriceMenu1.Text:=FormatFloat('###,', SumMenu1);
    if edtSumPriceMenu1.Text='' then edtSumPriceMenu1.Text:='0';
    edtSumPriceOtherMenu.Text:=FormatFloat('###,', SumOtherMenu);
    if edtSumPriceOtherMenu.Text='' then edtSumPriceOtherMenu.Text:='0';
    Sum:=SumMenu1+SumOtherMenu+Service-Discount;
    if Sum>0 then
        edtSumPrice.Text:=FormatFloat('###,', Sum)
    else
        edtSumPrice.Text:='0';
    if Discount>0 then
        edtDiscount.Text:=FormatFloat('###,', Discount)
    else
        edtDiscount.Text:='0';
end;

procedure TfrmMenu.mnuSetMenuClick(Sender: TObject);
begin
    mnuSetMenu.Checked:=not(mnuSetMenu.Checked);
end;

procedure TfrmMenu.BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
ButtonName, UpdownName : String;
begin
    if mnuSetMenu.Checked then
        if Button=mbRight then Exit;
    ButtonName:=ActiveControl.Name;
    ButtonNumber:=StrToInt(Copy(ButtonName, 7,Length(ButtonName)));
    lblButtonNumber.Caption:=IntToStr(ButtonNumber);
    if mnuSetMenu.Checked then
    begin
        gbEditMenu.Visible:=True;
        edtKalaID.Clear;
        edtCaption.Clear;
        cboToll.Text:='0';
        PageControl.Enabled:=False;
        PanelButtom.Enabled:=False;
        QSearchKalaID.Close;
        QSearchKalaID.Parameters.ParamByName('ButtonNumber').Value:=ButtonNumber;
        QSearchKalaID.Open;
        if QSearchKalaID['KalaID']<>Null then
        begin
            edtKalaID.Text:=QSearchKalaID['KalaID'];
            edtCaption.Text:=QSearchKalaID['ButtonCaption'];
            cboToll.Text:=QSearchKalaID['Toll'];
            Statusrecord:='Update';
        end
        else
            Statusrecord:='Insert';
    end
    else
    begin
        if TButton(FindComponent('Bitbtn'+IntToStr(ButtonNumber))).Caption='' then Exit;
        UpdownName:='UpDown'+IntToStr(ButtonNumber);
        if Button=mbLeft then
            TUpDown(FindComponent(UpdownName)).Position:=TUpDown(FindComponent(UpdownName)).Position+1
        else
            if Button=mbRight then
                TUpDown(FindComponent(UpdownName)).Position:=TUpDown(FindComponent(UpdownName)).Position-1;
    end;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
var
i : integer;
begin
    SG.Cells[0,0]:='—œÌ›';
    SG.Cells[1,0]:='‰«„';
    SG.Cells[2,0]:=' ⁄œ«œ';
    SG.Cells[3,0]:='ﬁÌ„ ';
    SG.Cells[4,0]:='Ã„⁄';
    for i:=1 to 100 do
    begin
        positionArray[i].btnNumber:=-1;
        positionArray[i].Row:=-1;
    end;
    QSerialNumber.Close;
    QSerialNumber.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QSerialNumber.Open;
    if QSerialNumber['SerialNumber']<>Null then
        edtSerialNumber.Text:=IntToStr(QSerialNumber['SerialNumber'])
    else
        edtSerialNumber.Text:='1';
    QMenu.Close;
    QMenu.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QMenu.Open;
    while QMenu.Eof=False do
    begin
        TButton(FindComponent('BitBtn'+IntToStr(QMenu['ButtonNumber']))).Caption:=QMenu['ButtonCaption'];
        QProductPrice.Close;
        QProductPrice.Parameters.ParamByName('KalaID').Value:=QMenu['KalaID'];
        QProductPrice.Open;
        if QProductPrice['VahedPrice']<>Null then
            TEdit(FindComponent('EditP'+IntToStr(QMenu['ButtonNumber']))).Text:=FormatFloat('###,',QProductPrice['VahedPrice']);
        TEdit(FindComponent('EditM'+IntToStr(QMenu['ButtonNumber']))).Text:=QMenu['Exist'];
        QMenu.Next;
    end;

    QMenuTitle.Close;
    QMenuTitle.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QMenuTitle.Open;
    for i:=1 to 3 do
    begin
        if QMenuTitle['Active'+IntToStr(i)] then
        begin
            TTabSheet(FindComponent('TabSheet'+IntToStr(i))).TabVisible:=True;
            TTabSheet(FindComponent('TabSheet'+IntToStr(i))).Caption:=QMenuTitle['TCaption'+IntToStr(i)];
        end
        else
            TTabSheet(FindComponent('TabSheet'+IntToStr(i))).TabVisible:=False;
    end;
    edtFactorDate.Text:=CurrentDate;
    mnuExist.Enabled:=True
end;


procedure TfrmMenu.btnKalaIDClick(Sender: TObject);
begin
    Application.CreateForm(TfrmKalaInfo, frmKalaInfo);
    frmKalaInfo.ShowModal;
    if frmKalaInfo.strKey='enter' then
    begin
        edtKalaID.Text:=frmKalaInfo.QKala['KalaID'];
        edtCaption.Text:=frmKalaInfo.QKala['KalaName'];
        edtCaption.SetFocus;
    end;
    FreeAndNil(frmKalaInfo);

end;

procedure TfrmMenu.BtnCancelClick(Sender: TObject);
begin
    PageControl.Enabled:=True;
    PanelButtom.Enabled:=True;
    gbEditMenu.Visible:=False;
end;

procedure TfrmMenu.BtnSaveClick(Sender: TObject);
begin
    IF (edtKalaID.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtKalaID.SetFocus;
        Exit;
    End;

    SP_Menu.Parameters.ParamByName('@ButtonNumber').Value:=ButtonNumber;
    SP_Menu.Parameters.ParamByName('@KalaID').Value:=edtKalaID.Text;
    SP_Menu.Parameters.ParamByName('@ButtonCaption').Value:=edtCaption.Text;
    SP_Menu.Parameters.ParamByName('@Toll').Value:=cboToll.Text;
    SP_Menu.Parameters.ParamByName('@uid').Value:= UserInfo.UserID;
    IF StatusRecord='Insert' then
    begin
        SP_Menu.Parameters.ParamByName('@Action').Value:='Insert';
    end
    Else
    IF StatusRecord='Update' then Begin
    begin
        SP_Menu.Parameters.ParamByName('@Action').Value:='Update';
    end;
    End;
    SP_Menu.ExecProc;
    StatusRecord:='';
    PageControl.Enabled:=True;
    PanelButtom.Enabled:=True;
    TButton(FindComponent('BitBtn'+lblButtonNumber.Caption)).Caption:=edtCaption.Text;

    QProductPrice.Close;
    QProductPrice.Parameters.ParamByName('KalaID').Value:=edtKalaID.Text;
    QProductPrice.Open;
    if QProductPrice['VahedPrice']<>Null then
        TEdit(FindComponent('EditP'+IntToStr(ButtonNumber))).Text:=FormatFloat('###,',QProductPrice['VahedPrice']);
    TEdit(FindComponent('EditM'+IntToStr(QMenu['ButtonNumber']))).Text:='0';

    gbEditMenu.Visible:=False;
end;

procedure TfrmMenu.btnDeletClick(Sender: TObject);
begin
        QDelMenu.Close;
        QDelMenu.Parameters.ParamByName('ButtonNumber').Value:=ButtonNumber;
        QDelMenu.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
        QDelMenu.ExecSQL;
        TButton(FindComponent('BitBtn'+lblButtonNumber.Caption)).Caption:='';
        TEdit(FindComponent('Edit'+lblButtonNumber.Caption)).Text:='0';
        TEdit(FindComponent('EditM'+lblButtonNumber.Caption)).Text:='0';
        TEdit(FindComponent('EditP'+lblButtonNumber.Caption)).Text:='0';
        BtnCancelClick(Sender);
end;

procedure TfrmMenu.btnMenuTitleCancelClick(Sender: TObject);
begin
    gbMenuTitle.Visible:=False;
    PageControl.Enabled:=True;
    PanelButtom.Enabled:=True;
    QMenuTitle.Close;
end;

procedure TfrmMenu.mnuMenuTitleClick(Sender: TObject);
begin
    gbMenuTitle.Visible:=True;
    PageControl.Enabled:=False;
    PanelButtom.Enabled:=False;
    QMenuTitle.Open;
    QMenuTitle.Edit;
end;

procedure TfrmMenu.btnSaveMenuTitleClick(Sender: TObject);
var
i : integer;
begin
    QMenuTitle.Post;
    for i:=1 to 3 do
    begin
        if QMenuTitle['Active'+IntToStr(i)] then
        begin
            TTabSheet(FindComponent('TabSheet'+IntToStr(i))).TabVisible:=True;
            TTabSheet(FindComponent('TabSheet'+IntToStr(i))).Caption:=QMenuTitle['TCaption'+IntToStr(i)];
        end
        else
            TTabSheet(FindComponent('TabSheet'+IntToStr(i))).TabVisible:=False;
    end;
    gbMenuTitle.Visible:=False;
    PageControl.Enabled:=True;
    PanelButtom.Enabled:=True;
    QMenuTitle.Close;
end;

procedure TfrmMenu.BtnResetClick(Sender: TObject);
var
i : integer;
begin
    for i:=1 to 96 do
        TEdit(FindComponent('Edit'+IntToStr(i))).Text:='0';
    for i:=1 to 100 do
    begin
        SG.Cells[0, i]:='';
        SG.Cells[1, i]:='';
        SG.Cells[2, i]:='';
        SG.Cells[3, i]:='';
        SG.Cells[4, i]:='';
        positionArray[i].btnNumber:=-1;
        positionArray[i].Row:=-1;
    end;
    QSerialNumber.Close;
    QSerialNumber.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QSerialNumber.Open;
    if QSerialNumber['SerialNumber']<>Null then
        edtSerialNumber.Text:=IntToStr(QSerialNumber['SerialNumber'])
    else
        edtSerialNumber.Text:='1';
    edtDiscount.Text:='0';
    
    pnlReception.Caption:='';
    pnlKeyNumber.Caption:='';
    pnlCustomerName.Caption:='';
    isZero := False;
    lblAct.Caption:='œ—Ã';
end;

procedure TfrmMenu.btnExportFactorClick(Sender: TObject);
var
ProductPrice :Real;
i, Toll, Discount : Integer;
SumMenu1, SumOtherMenu, Service, Sum, CurrentCredit  : integer;
begin
    QisIssueExit.Close;
    QisIssueExit.Parameters.ParamByName('ReceptionID').Value := pnlReception.Caption;
    QisIssueExit.Open;
    if QisIssueExit['ExitUserID']<>null then
    begin
        ShowMessage('„ÌÂ„«‰ „Ê—œ ‰Ÿ— «“ „Ã„Ê⁄Â Œ«—Ã ‘œÂ «”  Ê‘ „« „Ã«“ »Â ’œÊ— ›«ò Ê— ‰„Ì »«‘Ìœ');
        Exit;
    end;
    Sum:=0;
    if UserInfo.WorkSectionID<>18 then
        if pnlReception.Caption='' then
        begin
            ShowMessage('·ÿ›« „‘ —Ì „Ê—œ ‰Ÿ— —« „‘Œ’ ‰„«ÌÌœ');
            Exit;
        end;
    for i:=1 to 96 do
        if StrToIntDef(TEdit(FindComponent('Edit'+IntToStr(i))).Text, 0)>0 then
            Break;
    if i>96 then
    begin
        ShowMessage('.›«ò Ê— Œ«·Ì „Ì »«‘œ');
        Exit;
    end;
    if MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ ›«ò Ê— ’«œ— ‘Êœø','’œÊ— ›«ò Ê—',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo Then Exit;

    if isZero then
      if MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ ›«ò Ê— »« „»·€ ’›— –ŒÌ—Â ê—œœø','›«ò Ê— ÊÌéÂ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo Then Exit;

    for i:=1 to 96 do
        Sum:=Sum+StrToIntDef(TEdit(FindComponent('Edit'+IntToStr(i))).Text,0)*StrToIntDef(Money2Number(TEdit(FindComponent('EditP'+IntToStr(i))).Text),0);
    if UserInfo.WorkSectionID<>18 then
    begin
        QSpecialGuestCredit.Close;
        QSpecialGuestCredit.Parameters.ParamByName('ReceptionID').Value := pnlReception.Caption;
        QSpecialGuestCredit.Open;
        if QSpecialGuestCredit['Credit']<>null then
        begin
            if sum > CurrentCredit then
            begin
                ShowMessage('«Ì‰ ò„œ „—»Êÿ »Â „ÌÂ„«‰ ÊÌéÂ „Ì »«‘œ. «„« „Ì“«‰ „’—› «“ «⁄ »«— œ— ‰Ÿ— ê—› Â »Ì‘ — „Ì »«‘œ ·ÿ›« »« „œÌ—Ì   „«” ê—› Â ‘Êœ.');
                Exit;
            end;

        end
        else
        begin
            SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=pnlReception.Caption;
            SP_GetCurrentCredit.ExecProc;
            CurrentCredit:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
            if not isZero then
              if sum > CurrentCredit then
              begin
                  ShowMessage('„»·€ ›«ò Ê— »Ì‘ — «“ ‘«—é „Ì »«‘œ');
                  Exit;
              end;
        end;
    end;
    Toll:=0;
    SumPrice:=0;
    ProductPrice:=0;
    Discount:=0;
    if UserInfo.WorkSectionID<>18 then
        SP_Factor.Parameters.ParamByName('@ReceptionID').Value:=pnlReception.Caption
    else
        SP_Factor.Parameters.ParamByName('@ReceptionID').Value:=-1;

    SP_Factor.Parameters.ParamByName('@isZero').Value := isZero;
    SP_Factor.Parameters.ParamByName('@Description').Value:=edtDescription.Text;
    SP_Factor.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Factor.Parameters.ParamByName('@Discount').Value:=edtDiscount.Text;
    SP_Factor.Parameters.ParamByName('@FactorID').Value:=-1;
    SP_Factor.Parameters.ParamByName('@Active').Value:=True;
    SP_Factor.Parameters.ParamByName('@PercentDiscount').Value:=0;
    SP_Factor.Parameters.ParamByName('@Documentation').Value:=False;

    IF chbPrice2.Checked then
      IF (MessageBox(Self.Handle,'¬Ì« „ÌÂ„«‰ ÊÌéÂ „Ê—œ  «ÌÌœ «” ø','„ÌÂ„«‰ ÊÌéÂ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    SP_Factor.Parameters.ParamByName('@specialGuest').Value:=chbPrice2.Checked;

    if lblAct.Caption='œ—Ã' then
        SP_Factor.Parameters.ParamByName('@Action').Value:='Insert'
    else
    begin
        QEditFactor.First;
        if (QEditFactor['Documentation']) or (QEditFactor['EndTime']<>'99:99') then
        begin
            ShowMessage('‘„« „Ã«“ »Â ÊÌ—«Ì‘ «Ì‰ ›«ò Ê— ‰„Ì »«‘Ìœ ·Ÿ›« »« Õ”«»œ«— ŒÊœ  „«” »êÌ—Ìœ ');
            Exit;
        end;
        SP_Factor.Parameters.ParamByName('@Action').Value:='Update';
        QFindFactorID.Close;
        QFindFactorID.Parameters.ParamByName('SerialNumber').Value:=edtSerialNumber.Text;
        QFindFactorID.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
        QFindFactorID.Open;
        QDeleteSubFactor.Close;
        QDeleteSubFactor.Parameters.ParamByName('FactorID').Value:=QFindFactorID['FactorID'];
        QDeleteSubFactor.ExecSQL;
        SP_Factor.Parameters.ParamByName('@FactorID').Value:=QFindFactorID['FactorID'];
    end;
    SP_Factor.ExecProc;
    for i:=1 to 96 do
    begin
        if (TEdit(FindComponent('Edit'+IntToStr(i))).Text<>'0')
         and (TButton(FindComponent('BitBtn'+IntToStr(i))).Caption<>'') then
        begin
            SP_SubFactor.Parameters.ParamByName('@FactorID').Value:=SP_Factor.Parameters.ParamByName('@OutFactorID').Value;
            QSearchKalaID.Close;
            QSearchKalaID.Parameters.ParamByName('ButtonNumber').Value:=i;
            QSearchKalaID.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
            QSearchKalaID.Open;

            SP_SubFactor.Parameters.ParamByName('@ProductID').Value:=QSearchKalaID['KalaID'];
            

            //////////check for internet

            if ((UserInfo.UserID = 281) or (UserInfo.UserID = 285)) and ((QSearchKalaID['KalaID'] = 893) or (QSearchKalaID['KalaID'] = 895)) then
            begin
                QUsedInternetGift.Close;
                QUsedInternetGift.Parameters.ParamByName('ReceptionID').Value := pnlReception.Caption;
                QUsedInternetGift.Open;
                if QUsedInternetGift['Used']<>null then
                begin
                    if QUsedInternetGift['used'] = 1 then
                    begin
                        ShowMessage('ﬁ»·« ÂœÌÂ «Ì‰ —‰ Ì «” ›«œÂ ‘œÂ «”  Ê „Ãœœ À»  ‰„Ì ò—œœ');
                        QUsedInternetGift.Close;
                        Exit;
                    end
                    else
                        if QUsedInternetGift['used'] = 0 then
                        begin

                            if TEdit(FindComponent('Edit'+IntToStr(i))).Text > IntToStr(QUsedInternetGift['NumberOfAdult']) then
                            begin
                                ShowMessage('‘„« „Ã«“ »Â À»  »Ì‘ — «“  ⁄œ«œ ‰›—«  œ— Ìò ò„œ ÃÂ  ÂœÌÂ «Ì‰ —‰ Ì ‰„Ì »«‘Ìœ');
                                QUsedInternetGift.Close;
                                Exit;
                            end;
                        end
                        else
                        begin
                            ShowMessage('‘„« „Ã«“ »Â À»  ÂœÌÂ «Ì‰ —‰ Ì ÃÂ  «Ì‰ „ÌÂ„«‰ ‰„Ì »«‘Ìœ.');
                            QUsedInternetGift.Close;
                            Exit;
                        end;
                end;
            end;

            SP_SubFactor.Parameters.ParamByName('@Number').Value:=TEdit(FindComponent('Edit'+IntToStr(i))).Text;

            if isZero then
                SP_SubFactor.Parameters.ParamByName('@VahedPrice').Value:= 0
            else
                SP_SubFactor.Parameters.ParamByName('@VahedPrice').Value:= TEdit(FindComponent('EditP'+IntToStr(i))).Text;
            QUsedInternetGift.Close;

            SP_SubFactor.Parameters.ParamByName('@Description').Value:='';
            QMenuTitle.Open;
            SP_SubFactor.Parameters.ParamByName('@StorageTitleID').Value:=QMenuTitle['SalesStorage'];
            SP_SubFactor.Parameters.ParamByName('@Active').Value:=True;
            SP_SubFactor.Parameters.ParamByName('@specialGuest').Value:=chbPrice2.Checked;
            SP_SubFactor.Parameters.ParamByName('@Action').Value:='Insert';
            SP_SubFactor.ExecProc;
        end;
    end;
    if UserInfo.WorkSectionID = 18 then
    begin
        SP_FactorAccept.Close;
        SP_FactorAccept.Parameters.ParamByName('@ReceptionID').Value:=ReceptionID;
        SP_FactorAccept.Parameters.ParamByName('@FactorID').Value:=SP_Factor.Parameters.ParamByName('@OutFactorID').Value;;
        SP_FactorAccept.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
        SP_FactorAccept.ExecProc;
        if SP_FactorAccept.Parameters.ParamByName('@Status').Value=-1 then
            ShowMessage('›«ò Ê— „Ê—œ ‰Ÿ— ﬁ»·«  «ÌÌœ ‘œÂ «” ');
    end;
    if not chbToll.Checked then
        Toll:=0;
    QSaveToll.Close;
    QSaveToll.Parameters.ParamByName('Toll').Value:=Toll;
    QSaveToll.Parameters.ParamByName('FactorID').Value:=SP_Factor.Parameters.ParamByName('@OutFactorID').Value;
    QSaveToll.ExecSQL;
    if MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ ›«ò Ê— ç«Å ‘Êœø','ç«Å ›«ò Ê—',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo Then
    begin
        BtnResetClick(Sender);

        pnlKeyNumber.Caption:='';
        pnlCustomerName.Caption:='';
        pnlReception.Caption:='';
        pnlCredit.Caption:='0';
        Exit;
    end;
    QPrint.Close;
    QPrint.Parameters.ParamByName('FactorID').Value:=SP_Factor.Parameters.ParamByName('@OutFactorID').Value;
    QPrint.Open;
    while QPrint.Eof=False do
    begin
        SumPrice:=SumPrice+QPrint['SubFactorPrice'];
        QPrint.Next;
    end;
    //Application.CreateForm(TfrmPrePrint, frmPrePrint);
    //frmPrePrint.lblFactorID.Caption:=QPrint['SerialNumber'];
    //frmPrePrint.edtFactorDate.Text:=QPrint['ExportDate'];
    //frmPrePrint.edtEndSum.Text:=IntToStr(SumPrice);
    //frmPrePrint.ShowModal;
    Application.CreateForm(TqrSmallMenuFactor, qrSmallMenuFactor);
    qrSmallMenuFactor.lblSum.Caption:=IntToStr(SumPrice);
    if chbToll.Checked then
    begin
        qrSmallMenuFactor.lblToll.Caption:=IntToStr(Toll);
    end
    else
    begin
        qrSmallMenuFactor.lblToll.Caption:='0';
        Toll:=0;
    end;
    qrSmallMenuFactor.lblRePrint.Caption := '';
    qrSmallMenuFactor.lblEndSum.Caption:=IntToStr(SumPrice+Toll-QPrint['Discount']);
    qrSmallMenuFactor.lblCustomerName.Caption:=pnlCustomerName.Caption;
    qrSmallMenuFactor.lblLocker.Caption:=pnlKeyNumber.Caption;
    qrSmallMenuFactor.lblTime.Caption:=TimeToStr(Time);
    //qrSmallMenuFactor.lblSalon.Caption:=edtSalon.Text;
    //qrSmallMenuFactor.lblMiz.Caption:=edtMiz.Text;
    //qrSmallMenuFactor.lblNafar.Caption:=edtNafar.Text;
    qrSmallMenuFactor.lblUserName.Caption:=UserInfo.UserName;
    qrSmallMenuFactor.lblDiscount.Caption:=edtDiscount.Text;

    qrSmallMenuFactor.lblMessage.Caption:=Parameter.factorMessage;
    qrSmallMenuFactor.lblCoNameAndAddress.Caption:=Parameter.CoName+' '+Parameter.CoAddress+'    ·›‰ '+Parameter.Tel;
    if UserInfo.WorkSectionID<>18 then
        qrSmallMenuFactor.lblMod.Caption:=FormatFloat('###,', CreditMod(StrToInt64(pnlReception.Caption)))
    else
        qrSmallMenuFactor.lblMod.Caption:='';


    qrSmallMenuFactor.Prepare;
    if chbPrint.Checked then
    begin
        if UserInfo.UserID=51 then
                qrSmallMenuFactor.Print;
        qrSmallMenuFactor.Print;
    end
    else
        qrSmallMenuFactor.Preview;
    
    FreeAndNil(qrSmallMenuFactor);
    //FreeAndNil(frmPrePrint);
    BtnResetClick(Sender);
    pnlKeyNumber.Caption:='';
    pnlCustomerName.Caption:='';
    pnlReception.Caption:='';
    pnlCredit.Caption:='0';
    edtSalon.Clear;
    edtBarcode.Clear;
    edtNafar.Clear;
    chbPrice2.Checked := False;
    if UserInfo.WorkSectionID<>18 then
        btnSearchCustomerClick(Sender);
end;

procedure TfrmMenu.Edit1Change(Sender: TObject);
var
  EditName, UpDownName :String;
begin
    calcPrice;
    if TEdit(FindComponent('Edit'+IntToStr(ButtonNumber))).Text<>'' then
    begin
        if ActiveControl.ClassType=TEdit then
        begin
            EditName:=ActiveControl.Name;
            ButtonNumber:=StrToInt(Copy(EditName, 5,Length(EditName)));
        end;
        if (TEdit(FindComponent('Edit'+IntToStr(ButtonNumber))).Text='0') and (Search(ButtonNumber)=-1) then Exit;
        addToSG(ButtonNumber, TButton(FindComponent('Bitbtn'+IntToStr(ButtonNumber))).Caption, strToint(TEdit(FindComponent('Edit'+IntToStr(ButtonNumber))).Text), TEdit(FindComponent('EditP'+IntToStr(ButtonNumber))).Text);
    end;
    {edtSumPriceMenu1.Text:='0';
    edtSumPriceOtherMenu.Text:='0';
    for i:=1 to 32 do
        edtSumPriceMenu1.Text:=IntToStr(StrToIntDef(edtSumPriceMenu1.Text,0)+StrToIntDef(TEdit(FindComponent('Edit'+IntToStr(i))).Text,0)*StrToIntDef(Money2Number(TEdit(FindComponent('EditP'+IntToStr(i))).Text),0));
    edtSumPriceMenu1.Text:=FormatFloat('###,', StrToInt(edtSumPriceMenu1.Text));
    if edtSumPriceMenu1.Text='' then edtSumPriceMenu1.Text:='0';
    for i:=33 to 96 do
        edtSumPriceOtherMenu.Text:=IntToStr(StrToIntDef(edtSumPriceOtherMenu.Text,0)+StrToIntDef(TEdit(FindComponent('Edit'+IntToStr(i))).Text,0)*StrToIntDef(Money2Number(TEdit(FindComponent('EditP'+IntToStr(i))).Text),0));
    edtSumPriceOtherMenu.Text:=FormatFloat('###,', StrToInt(edtSumPriceOtherMenu.Text));
    if edtSumPriceOtherMenu.Text='' then edtSumPriceOtherMenu.Text:='0';
    edtSumPrice.Text:=IntToStr(StrToInt(Money2Number(edtSumPriceMenu1.Text))+StrToInt(Money2Number(edtSumPriceOtherMenu.Text)));}
end;

procedure TfrmMenu.DiscountExecute(Sender: TObject);
begin
    edtDiscount.SetFocus;
end;

procedure TfrmMenu.mnuExistClick(Sender: TObject);
var
i : integer;
begin
    for i:=1 to 96  do
        if TButton(FindComponent('BitBtn'+IntToStr(i))).Caption<>'' then
        begin
            QSearchKalaID.Close;
            QSearchKalaID.Parameters.ParamByName('ButtonNumber').Value:=i;
            QSearchKalaID.Open;
            QUpdateExist.Close;
            QUpdateExist.Parameters.ParamByName('Exist').Value:=TEdit(FindComponent('EditM'+ IntToStr(i))).Text;
            QUpdateExist.Parameters.ParamByName('ButtonNumber').Value:=i;
            QUpdateExist.ExecSQL;
        end;
    ShowMessage('.„ÊÃÊœÌ „Õ’Ê·«  –ŒÌ—Â ê—œÌœ');
end;

procedure TfrmMenu.Exit1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmMenu.edtDiscountExit(Sender: TObject);
begin
    calcPrice;
end;

procedure TfrmMenu.btnStorageClick(Sender: TObject);
begin
    {Application.CreateForm(TfrmStorageInfo, frmStorageInfo);
    frmStorageInfo.ShowModal;
    if frmStorageInfo.strKey='enter' then
    begin
        edtStorageTitleID.Text:=frmStorageInfo.QStorage['StorageTitleID'];
        btnSaveMenuTitle.SetFocus;
    end;
    FreeAndNil(frmStorageInfo);}
end;

procedure TfrmMenu.edtSerialNumberExit(Sender: TObject);
begin
    edtSerialNumber.Text:=IntToStr(StrToIntDef(edtSerialNumber.Text, 0));
    QEditFactor.Close;
    QEditFactor.Parameters.ParamByName('SerialNumber').Value:=edtSerialNumber.Text;
    QEditFactor.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QEditFactor.Open;
    if QEditFactor['FactorID']<>Null then
    begin
        if (QEditFactor['Documentation']) then
        begin
            ShowMessage('‘„« „Ã«“ »Â ÊÌ—«Ì‘ «Ì‰ ›«ò Ê— ‰„Ì »«‘Ìœ ·Ÿ›« »« Õ”«»œ«— ŒÊœ  „«” »êÌ—Ìœ ');
            Exit;
        end;


        BtnResetClick(Sender);
        edtSerialNumber.Text:=IntToStr(QEditFactor['SerialNumber']);
        lblAct.Caption:='ÊÌ—«Ì‘';
        if QEditFactor['ReceptionID']<>-1 then
        begin
            pnlReception.Caption:=QEditFactor['ReceptionID'];
            pnlKeyNumber.Caption:=QEditFactor['KeyNumber'];
            pnlCustomerName.Caption:=QEditFactor['CustomerName'];
        end
        else
        begin
            pnlKeyNumber.Caption:='';
            pnlCustomerName.Caption:='';
            pnlReception.Caption:='';
            pnlCredit.Caption:='0';
        end;

        edtFactorDate.Text:=QEditFactor['ReceptionDate'];
        while Not(QEditFactor.Eof) do
        begin
            QFindPosButton.Close;
            QFindPosButton.Parameters.ParamByName('KalaID').Value:=QEditFactor['ProductID'];
            QFindPosButton.Open;
            if QFindPosButton['ButtonNumber']=null then
            begin
                ShowMessage('»—«Ì '+QEditFactor['RizName']+'œò„Â «Ì —«  ‰ŸÌ„ ‰‰„ÊœÂ «Ìœ');
                BtnResetClick(Sender);
                Exit;
            end;
            ButtonNumber:=QFindPosButton['ButtonNumber'];
            TEdit(FindComponent('Edit'+IntToStr(ButtonNumber))).Text:=IntToStr(QEditFactor['Number']);

            {SG.Cells[0, QEditFactor.RecNo]:=IntToStr(QEditFactor.RecNo);
            SG.Cells[1,QEditFactor.RecNo]:=QEditFactor['RizName'];
            SG.Cells[2,QEditFactor.RecNo]:=QEditFactor['Number'];
            SG.Cells[3,QEditFactor.RecNo]:=QEditFactor['PriceInFactor'];
            SG.Cells[4,QEditFactor.RecNo]:=QEditFactor['SubFactorPrice'];}
            QEditFactor.Next;
        end;
        QEditFactor.First;
        if QEditFactor['Discount']>0 then
        begin
            edtDiscount.Text:=IntToStr(QEditFactor['Discount']);
            edtDiscountExit(Sender);
        end;
        //edtCosts.Text:=QEditFactor['Cost1']+QEditFactor['Cost2']+QEditFactor['Cost3'];

    end
    else
    begin
        QSerialNumber.Close;
        QSerialNumber.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
        QSerialNumber.Open;
        if QSerialNumber['SerialNumber']<>StrToInt(edtSerialNumber.Text) then
        begin
            edtSerialNumber.Text:=IntToStr(QSerialNumber['SerialNumber']);
            ShowMessage('‘„«—Â ›«ò Ê— „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
            BtnResetClick(Sender);
        end;
        lblAct.Caption:='œ—Ã';
    end;
end;

procedure TfrmMenu.edtSerialNumberKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=13 then BtnPrint.SetFocus;
end;

procedure TfrmMenu.btnDelFactorClick(Sender: TObject);
begin
    try
        if lblAct.Caption='œ—Ã' then Exit;
        if QEditFactor['Documentation'] then
        begin
            ShowMessage('.›«ò Ê— „Ê—œ ‰Ÿ— „” ‰œ ”«“Ì ‘œÂ «”  Ê „Ã«“ »Â Õ–› ¬‰ ‰Ì” Ìœ');
            Exit;
        end;
        if lblAct.Caption<>'ÊÌ—«Ì‘' then Exit;
        QDelete.Close;
        QDelete.Parameters.ParamByName('SerialNumber').Value:=edtSerialNumber.Text;
        QDelete.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
        QDelete.ExecSQL;
        BtnResetClick(Sender);
        ShowMessage('›«ò Ê— „Ê—œ ‰Ÿ— Õ–› ê—œÌœ');
    Except
        ShowMessage('Œÿ« œ— Â‰ê«„ Õ–› ›«ò Ê—');
    end;

end;

procedure TfrmMenu.BtnPrintClick(Sender: TObject);
var
Toll : Integer;
begin
    Toll:=0;
    SumPrice:=0;
    QPrintFactorID.Close;
    QPrintFactorID.Parameters.ParamByName('SerialNumber').Value:=edtSerialNumber.Text;
    QPrintFactorID.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QPrintFactorID.Open;
    if QPrintFactorID['FactorID']=Null then
    begin
        ShowMessage('›«ò Ê— „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        Exit;
    end;
    QPrint.Close;
    QPrint.Parameters.ParamByName('FactorID').Value:=QPrintFactorID['FactorID'];
    QPrint.Open;
    while QPrint.Eof=False do
    begin
        SumPrice:=SumPrice+QPrint['SubFactorPrice'];
        QPrint.Next;
    end;
    //Application.CreateForm(TfrmPrePrint, frmPrePrint);
    //frmPrePrint.lblFactorID.Caption:=QPrint['SerialNumber'];
    //frmPrePrint.edtFactorDate.Text:=QPrint['ExportDate'];
    //frmPrePrint.edtEndSum.Text:=IntToStr(SumPrice);
    //frmPrePrint.ShowModal;
    Application.CreateForm(TqrSmallMenuFactor, qrSmallMenuFactor);
    qrSmallMenuFactor.lblSum.Caption:=IntToStr(SumPrice);
    qrSmallMenuFactor.lblRePrint.Caption := '--«·„À‰Ì--';
    //Toll:=QPrint['Cost1'];
    qrSmallMenuFactor.lblToll.Caption:=IntToStr(Toll);
    qrSmallMenuFactor.lblEndSum.Caption:=IntToStr(SumPrice+Toll-QPrint['Discount']);

    qrSmallMenuFactor.lblCustomerName.Caption:=pnlCustomerName.Caption;
    qrSmallMenuFactor.lblLocker.Caption:=pnlKeyNumber.Caption;
    qrSmallMenuFactor.lblTime.Caption:=TimeToStr(Time);
    //qrSmallMenuFactor.lblSalon.Caption:=edtSalon.Text;
    //qrSmallMenuFactor.lblMiz.Caption:=edtMiz.Text;
    //qrSmallMenuFactor.lblNafar.Caption:=edtNafar.Text;
    qrSmallMenuFactor.lblUserName.Caption:=UserInfo.UserName;
    qrSmallMenuFactor.lblDiscount.Caption:=edtDiscount.Text;

    qrSmallMenuFactor.lblMessage.Caption:=Parameter.factorMessage;
    qrSmallMenuFactor.lblCoNameAndAddress.Caption:=Parameter.CoName+' '+Parameter.CoName+'    ·›‰ '+Parameter.Tel;
    qrSmallMenuFactor.lblMod.Caption:=FormatFloat('###,', CreditMod(StrToInt64(pnlReception.Caption)));
    qrSmallMenuFactor.Prepare;
    qrSmallMenuFactor.Preview;
    FreeAndNil(qrSmallMenuFactor);

    BtnResetClick(Sender);
    pnlKeyNumber.Caption:='';
    pnlCustomerName.Caption:='';
    pnlReception.Caption:='';
    pnlCredit.Caption:='0';
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
    ButtonNumber:=0;
    isZero := False;
    chbPrice2.Checked := False;
    if not((UserInfo.WorkSectionID=6) or (UserInfo.WorkSectionID=8)) then
    begin
        mnuSetMenu.Visible:=False;
        mnuMenuTitle.Visible:=False;
    end;
    if UserInfo.WorkSectionID  = 18 then
    begin
        SP_Start.Close;
        SP_Start.Parameters.ParamByName('@CustomerName').Value:='’‰œÊﬁ ·«»Ì';
        SP_Start.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
        SP_Start.Parameters.ParamByName('@ClosedID').Value:=-1;
        SP_Start.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
        SP_Start.ExecProc;
        //btnDelFactor.Enabled:=True;
        QReceptionID.Close;
        QReceptionID.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
        QReceptionID.Open;
        if QReceptionID['ReceptionID']<>null then
            ReceptionID:=QReceptionID['ReceptionID']
        else
            ReceptionID:=-1;
        Caption:=IntToStr(ReceptionID);
    end;
    EnableMenu := False;
end;

procedure TfrmMenu.btnMseeageClick(Sender: TObject);
begin
    Application.CreateForm(TfrmDescriptionInfo, frmDescriptionInfo);
    frmDescriptionInfo.ShowModal;
    if frmDescriptionInfo.strKey='enter' then
    begin
        edtDescriptionInfo.Text:=frmDescriptionInfo.QDescription['Description'];
        btnSaveMenuTitle.SetFocus;
    end;
    FreeAndNil(frmDescriptionInfo);
end;

procedure TfrmMenu.btnSearchCustomerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSearchKeyNumber, frmSearchKeyNumber);
    frmSearchKeyNumber.ShowModal;
    if (frmSearchKeyNumber.strKey='enter') and (frmSearchKeyNumber.lblReceptionID.Caption<>'') then
    begin
        pnlReception.Caption:=frmSearchKeyNumber.lblReceptionID.Caption;
        pnlKeyNumber.Caption:=frmSearchKeyNumber.edtKeyNumber.Text;
        pnlCustomerName.Caption:=frmSearchKeyNumber.lblCustomerName.Caption;
        pnlCredit.Caption:=frmSearchKeyNumber.lblCurrentCredit.Caption;
    end
    else
    begin
        BtnResetClick(Sender);
        pnlKeyNumber.Caption:='';
        pnlCustomerName.Caption:='';
        pnlReception.Caption:='';
        pnlCredit.Caption:='0';
        edtSalon.Clear;
        edtBarcode.Clear;
        edtNafar.Clear;
    end;
    FreeAndNil(frmSearchKeyNumber);
end;

procedure TfrmMenu.mnuSalesReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmMenuPassword, frmMenuPassword);
    frmMenuPassword.Acction:='Print';
    frmMenuPassword.ShowModal;
    FreeAndNil(frmMenuPassword);
end;

procedure TfrmMenu.mnuDeleteClick(Sender: TObject);
begin
    Application.CreateForm(TfrmMenuPassword, frmMenuPassword);
    frmMenuPassword.Caption:='—„“ Õ–› ›«ò Ê—';
    frmMenuPassword.Acction:='Delete';
    frmMenuPassword.ShowModal;
    FreeAndNil(frmMenuPassword);
end;

procedure TfrmMenu.ActiveMenu1Execute(Sender: TObject);
begin
    EnableMenu :=True;
end;

procedure TfrmMenu.ActiveMenu2Execute(Sender: TObject);
begin
    if EnableMenu = True then
    begin
        mnuSetMenu.Visible := True;
        mnuMenuTitle.Visible := True;
    end;
end;

procedure TfrmMenu.ASaveExecute(Sender: TObject);
begin
    isZero := False;
    btnExportFactorClick(Sender);
end;

procedure TfrmMenu.SaveZeroExecute(Sender: TObject);
begin
    isZero := True;
    btnExportFactorClick(Sender);
end;

end.

