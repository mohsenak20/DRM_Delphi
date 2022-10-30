unit ReceptionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Menus, ShareUnit, DB, ADODB, Grids,
  ExtCtrls, ActnList, RpBase, RpSystem, RpDefine, RpRave, Mask, DBGrids, RpDevice;
type
  TfrmReception = class(TForm)
    StatusBar: TStatusBar;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    mnuReturn: TMenuItem;
    spReception: TADOStoredProc;
    QFree: TADOQuery;
    N2: TMenuItem;
    mnuFreeClosed: TMenuItem;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtSumPrice: TEdit;
    btnNewGroup: TBitBtn;
    btnNewCustomer: TBitBtn;
    BtnReturn: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    gb1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtCustomerName: TEdit;
    cboType: TComboBox;
    gb2: TGroupBox;
    Label3: TLabel;
    chbMobile: TCheckBox;
    chbPool: TCheckBox;
    chbSaat: TCheckBox;
    chbAngoshtar: TCheckBox;
    chbSooeech: TCheckBox;
    chbAsnad: TCheckBox;
    chbPakhsh: TCheckBox;
    chbKeefPool: TCheckBox;
    edtOther: TEdit;
    chbSamsonet: TCheckBox;
    SG: TStringGrid;
    BtnSave: TBitBtn;
    btnSaveInGrid: TBitBtn;
    ActionList1: TActionList;
    NewCustomer: TAction;
    NewGroup: TAction;
    SaveInGrid: TAction;
    Save: TAction;
    Label6: TLabel;
    edtCredit: TEdit;
    Label7: TLabel;
    QPrint: TADOQuery;
    Label9: TLabel;
    lblShift: TLabel;
    btnReceptionList: TBitBtn;
    RvProject: TRvProject;
    RvSystem: TRvSystem;
    SP_Credit: TADOStoredProc;
    BtnDelLine: TBitBtn;
    PopupMenu: TPopupMenu;
    mnuDelLine: TMenuItem;
    QCredit: TADOQuery;
    lblCredit: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    QCard: TADOQuery;
    QSearchCard: TADOQuery;
    QCheckDate: TADOQuery;
    QCheckGetMoney: TADOQuery;
    pnlCompany: TPanel;
    btnCardType: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    lblReception: TLabel;
    lblCharge: TLabel;
    rbAA: TRadioButton;
    rbAC: TRadioButton;
    rbNormal: TRadioButton;
    Label14: TLabel;
    edtCardID2: TEdit;
    pnlCompany2: TPanel;
    btnCardType2: TBitBtn;
    Label15: TLabel;
    edtCardID3: TEdit;
    pnlCompany3: TPanel;
    btnCardType3: TBitBtn;
    rbCC: TRadioButton;
    chb2: TCheckBox;
    edtCardID: TEdit;
    rbCCC: TRadioButton;
    rbACC: TRadioButton;
    rbAAC: TRadioButton;
    rbAAA: TRadioButton;
    rbAAAA: TRadioButton;
    Label8: TLabel;
    lblFreeClosed: TLabel;
    Label16: TLabel;
    edtCardID4: TEdit;
    pnlCompany4: TPanel;
    btnCardType4: TBitBtn;
    btnGroup: TBitBtn;
    edtGroup: TEdit;
    Label17: TLabel;
    SP_Price: TADOStoredProc;
    mnuCharge: TMenuItem;
    Charge: TAction;
    Label18: TLabel;
    Label19: TLabel;
    edtDiscount: TEdit;
    Label20: TLabel;
    edtOrderNumber: TEdit;
    N3: TMenuItem;
    mnuChangeTo: TMenuItem;
    RadioButton1: TRadioButton;
    btnSelectOrder: TBitBtn;
    QOrder: TADOQuery;
    mnuOrder: TMenuItem;
    QCheckOrderNumber: TADOQuery;
    dbgReceptionList: TDBGrid;
    QReceptionList: TADOQuery;
    dsReceptionList: TDataSource;
    chbkindergarten: TCheckBox;
    QCheckAfternoon: TADOQuery;
    QCheckTime: TADOQuery;
    internet: TAction;
    Action2: TAction;
    mnuInternetReception: TMenuItem;
    Andisheh: TAction;
    chbAndisheh: TCheckBox;
    QSMS: TADOQuery;
    QParameter: TADOQuery;
    QCheckEndTime: TADOQuery;
    mnuHotel: TMenuItem;
    mnuHotelReport: TMenuItem;
    edtPrinter: TEdit;
    refreshReceptionList: TAction;
    gbHotelInfo: TGroupBox;
    Label21: TLabel;
    lblHotelReceptionID: TLabel;
    Label23: TLabel;
    lblReceptionName: TLabel;
    lblHotelName: TLabel;
    Label24: TLabel;
    mnuMembership: TMenuItem;
    mnuDeposit: TMenuItem;
    N4: TMenuItem;
    mnuStartReception: TMenuItem;
    depositCreditCard: TAction;
    CreditCardIssuTicket: TAction;
    QCurrentShift: TADOQuery;
    N5: TMenuItem;
    mnuLockers: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnReturnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuReturnClick(Sender: TObject);
    procedure btnNewCustomerClick(Sender: TObject);
    procedure ClearForm();
    procedure btnNewGroupClick(Sender: TObject);
    procedure BtnDelLineClick(Sender: TObject);
    procedure PrintReception(ReceptionID : Largeint);
    procedure mnuFreeClosedClick(Sender: TObject);
    procedure btnCartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    Procedure GridClear();
    procedure fillFormFromGrid();
    procedure SGClick(Sender: TObject);
    Procedure AddToGrid(RowGrid : Integer);
    procedure btnSaveInGridClick(Sender: TObject);
    procedure Sum();
    procedure btnReceptionListClick(Sender: TObject);
    procedure edtCreditExit(Sender: TObject);
    procedure delLine(LineNo : integer);
    procedure mnuDelLineClick(Sender: TObject);
    procedure edtCreditChange(Sender: TObject);
    procedure edtCardIDExit(Sender: TObject);
    procedure btnCardTypeClick(Sender: TObject);
    procedure btnCardType2Click(Sender: TObject);
    procedure btnCardType3Click(Sender: TObject);
    procedure rbAAClick(Sender: TObject);
    procedure edtCardID2Change(Sender: TObject);
    Procedure rbClick();
    procedure edtCardID3Change(Sender: TObject);
    procedure btnCardType4Click(Sender: TObject);
    procedure btnGroupClick(Sender: TObject);
    procedure mnuChargeClick(Sender: TObject);
    procedure mnuChangeToClick(Sender: TObject);
    procedure btnSelectOrderClick(Sender: TObject);
    procedure mnuOrderClick(Sender: TObject);
    procedure mnuInternetReceptionClick(Sender: TObject);
    procedure AndishehExecute(Sender: TObject);
    procedure mnuHotelReportClick(Sender: TObject);
    procedure edtOrderNumberExit(Sender: TObject);
    procedure refreshReceptionListExecute(Sender: TObject);
    procedure mnuMembershipClick(Sender: TObject);
    procedure mnuDepositClick(Sender: TObject);
    procedure mnuStartReceptionClick(Sender: TObject);
    procedure mnuLockersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sPrinterName : string;

  end;


var
  frmReception: TfrmReception;
  ReceptionArray : array[1..100] of Reception;
  ReceptionCount : Smallint=0;
  ReceptionPoss  : Smallint=0;
  const KinderGartenCol = 8;

implementation

uses DMUnit, CalculatUnit, CardTypeInfoUnit, Math, qrReceptionUnit,
  ReceptionListUnit, CreditUnit, ChangeToUnit, OrderSelectUnit, OrderUnit,
  HotelsInfoUnit, VIPUnit, IssueTicketUnit, HotelReceptionReportUnit,
  CreditCardTicketUnit, CreditCardChargeUnit, StartShiftUnit,
  OrderDiscountInfoUnit, ManageLockersUnit;


{$R *.dfm}

Procedure TfrmReception.rbClick();
begin
    {if (edtCardID.Text<>'')  and (edtCardID2.Text='') then
        rbNormal.Checked:=True
    else
        if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='') then
            rbAA.Checked:=True
        else
            if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') then
                rbAAA.Checked:=True; }
end;

procedure TfrmReception.delLine(LineNo : integer);
var
i : integer;
begin
    if LineNo<>0 then
    begin
        for i:=LineNo to 100 do
        begin
            with SG do
            begin
                if Cells[0,i+1]<>'' then
                    Cells[0,i]:=IntToStr(i)
                else
                Cells[0,i]:='';
                Cells[1,i]:=Cells[1,i+1];
                Cells[2,i]:=Cells[2,i+1];
                Cells[3,i]:=Cells[3,i+1];
                Cells[4,i]:=Cells[4,i+1];
                Cells[5,i]:=Cells[5,i+1];
                Cells[6,i]:=Cells[6,i+1];
                Cells[7,i]:=Cells[7,i+1];
                Cells[KinderGartenCol,i]:=Cells[KinderGartenCol,i+1];
            end;
        end;
    end;
end;



procedure TfrmReception.Sum();
var
i, price, Credit, BasePriceForBargain, NumberOfAddult, NumberOfChild : integer;
QSpecialCompany : TADOQuery;
begin
    price:=0;
    Credit:=0;
    QSpecialCompany:=TADOQuery.Create(nil);
    QSpecialCompany.Connection:=DM.ADOConnection;
    for i:=1 to ReceptionCount do
    begin
      NumberOfAddult:=0;
      NumberOfChild:=0;
      if SG.Cells[5, i]='1'  then begin If SG.Cells[2, i]='»' then NumberOfAddult:=1 else NumberOfChild:=1; end;
      if SG.Cells[5, i]='AA' then begin  NumberOfAddult:=2; NumberOfChild:=0  end;
      if SG.Cells[5, i]='AC' then begin  NumberOfAddult:=1; NumberOfChild:=1  end;
      if SG.Cells[5, i]='CC' then begin  NumberOfAddult:=0; NumberOfChild:=2  end;
      if SG.Cells[5, i]='AAA'then begin  NumberOfAddult:=3; NumberOfChild:=0  end;
      if SG.Cells[5, i]='AAC'then begin  NumberOfAddult:=2; NumberOfChild:=1  end;
      if SG.Cells[5, i]='ACC'then begin  NumberOfAddult:=1; NumberOfChild:=2  end;
      if SG.Cells[5, i]='CCC'then begin  NumberOfAddult:=0; NumberOfChild:=3  end;

      SP_Price.Close;
      SP_Price.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
      SP_Price.Parameters.ParamByName('@CardID1').Value:=StrToIntDef(SG.Cells[4, i], 1);
      SP_Price.Parameters.ParamByName('@CardID2').Value:=StrToIntDef(SG.Cells[6, i], 1);
      SP_Price.Parameters.ParamByName('@CardID3').Value:=StrToIntDef(SG.Cells[7, i], 1);
      SP_Price.Parameters.ParamByName('@NumberOfAddult').Value:=NumberOfAddult;
      SP_Price.Parameters.ParamByName('@NumberOfChild').Value:=NumberOfChild;
      SP_Price.ExecProc;
      price:=price+SP_Price.Parameters.ParamByName('@Price').Value-NumberOfAddult*StrToInt(edtDiscount.Text);
      Credit:=Credit+StrToIntDef(SG.Cells[3, i], 0);
    end;
    if price+Credit<>0 then
        edtSumPrice.Text:=FormatFloat('###,', price+Credit)
    else
        edtSumPrice.Text:='0';

    if price<>0 then
        lblReception.Caption:=FormatFloat('###,', price)
    else
        lblReception.Caption:='0';

    if Credit<>0 then
        lblCharge.Caption:=FormatFloat('###,', Credit)
    else
        lblCharge.Caption:='0';



end;

Procedure TfrmReception.AddToGrid(RowGrid :Integer);
begin
    if (edtCustomerName.Text='') and (RowGrid > 1)then
        SG.Cells[1, RowGrid]:=SG.Cells[0, ReceptionCount-1]
    else
        SG.Cells[1, RowGrid]:=edtCustomerName.Text;


    if cboType.Text='»“—ê”«·' then
    begin
        edtSumPrice.Text:=IntToStr(StrToIntDef(edtSumPrice.Text, 0)+Parameter.Bozorgsal);
        SG.Cells[2, RowGrid]:='»';
    end
    else
    begin
        edtSumPrice.Text:=IntToStr(StrToIntDef(edtSumPrice.Text, 0)+Parameter.khordsal);
        SG.Cells[2, RowGrid]:='Œ';
    end;

    SG.Cells[3, RowGrid]:=IntToStr(strToIntDef(edtCredit.Text, 0));
    pnlCompany.Caption:='';
end;

procedure TfrmReception.fillFormFromGrid();
begin
    ClearForm;
    if SG.Cells[2, sg.Row]='' then Exit;
    edtCustomerName.Text:=SG.Cells[1, sg.Row];
    if SG.Cells[2, sg.Row]='»' then
        cboType.Text:='»“—ê”«·'
    else
        cboType.Text:='Œ—œ”«·';


    if SG.Cells[5, SG.Row]='AA' then
        rbAA.Checked:=True
    else
        if SG.Cells[5, SG.Row]='AC' then
            rbAC.Checked:=True
        else
            if SG.Cells[5, SG.Row]='CC' then
                rbCC.Checked:=True
            else
                if SG.Cells[5, SG.Row]='AAA' then
                    rbAAA.Checked:=True
                else
                    if SG.Cells[5, SG.Row]='AAC' then
                        rbAAC.Checked:=True
                    else
                        if SG.Cells[5, SG.Row]='ACC' then
                            rbACC.Checked:=True
                        else
                            if SG.Cells[5, SG.Row]='CCC' then
                                rbCCC.Checked:=True
                            else
                                rbNormal.Checked:=True;


    edtCredit.Text:=SG.Cells[3, SG.Row];
    edtCardID.Text:=SG.Cells[4, SG.Row];
    QCheckDate.Close;
    QCheckDate.Parameters.ParamByName('CardID').Value:=StrToIntDef(edtCardID.Text, 0);
    QCheckDate.Open;
    if QCheckDate['CompanyName']<>null then
        pnlCompany.Caption:=QCheckDate['CompanyName'];

    edtCardID2.Text:=SG.Cells[6, SG.Row];
    QCheckDate.Close;
    QCheckDate.Parameters.ParamByName('CardID').Value:=StrToIntDef(edtCardID2.Text, 0);
    QCheckDate.Open;
    if QCheckDate['CompanyName']<>null then
        pnlCompany2.Caption:=QCheckDate['CompanyName'];

    edtCardID3.Text:=SG.Cells[7, SG.Row];
    if SG.Cells[7, SG.Row] = '*' then
    begin
        chbkindergarten.Enabled := True;
        chbkindergarten.Checked := True;

    end;
    QCheckDate.Close;
    QCheckDate.Parameters.ParamByName('CardID').Value:=StrToIntDef(edtCardID3.Text, 0);
    QCheckDate.Open;
    if QCheckDate['CompanyName']<>null then
        pnlCompany3.Caption:=QCheckDate['CompanyName'];
    if SG.Cells[kinderGartenCol, SG.Row] = '*' then
    begin
        chbkindergarten.Checked := True;
        chbkindergarten.Enabled := True;
    end;

end;

Procedure TfrmReception.GridClear();
var
  i : integer;
begin
    for i:=1 to 100 do
    begin
        SG.Cells[0,i]:='';
        SG.Cells[1,i]:='';
        SG.Cells[2,i]:='';
        SG.Cells[3,i]:='';
        SG.Cells[4,i]:='';
        SG.Cells[5,i]:='';
        SG.Cells[6,i]:='';
        SG.Cells[7,i]:='';
        SG.Cells[KinderGartenCol,i]:='';
    end;
end;


procedure TfrmReception.PrintReception(ReceptionID : Largeint);
var
Amanat, CustomerType, ReceptionType : string;
begin
    if ReceptionID <= 0 then begin  ShowMessage('⁄œ„ «Œ ’«’ ò„œ'); Exit; end;
    CustomerType:='';
    ReceptionType:='';
    QPrint.Close;
    QPrint.Parameters.ParamByName('ReceptionID').Value:=ReceptionID;
    QPrint.Open;
    RvProject.Open;
    RvProject.SetParam('ReceptionDate',QPrint['ReceptionDate']);
    RvProject.SetParam('StartTime',QPrint['StartTime']);

    RvProject.SetParam('KeyNumber',IntToStr(QPrint['KeyNumber']));


    if (QPrint['ClosedID'] <= 1016) or ((QPrint['ClosedID'] >= 2631) and (QPrint['ClosedID'] <= 2782)) or ((QPrint['ClosedID'] >= 2783) and (QPrint['ClosedID'] <= 2946)) then
    begin
        RvProject.SetParam('ChangingRoom','—Œ ò‰1');
        RvProject.SetParam('LockerCode','');
    end
    else
    begin
        RvProject.SetParam('ChangingRoom','—Œ ò‰2');
        RvProject.SetParam('LockerCode','LC - '+IntToStr(QPrint['Code']));
    end;


    case QPrint['PositionClosed']-2 of
      1: RvProject.SetParam('RowNumber','   —œÌ›1 -');
      2: RvProject.SetParam('RowNumber','   —œÌ›2 -');
      3: RvProject.SetParam('RowNumber','   —œÌ›3 -');
      4: RvProject.SetParam('RowNumber','   —œÌ›4 -');
      5: RvProject.SetParam('RowNumber','   —œÌ›5 -');
      6: RvProject.SetParam('RowNumber','   —œÌ›6 -');
      7: RvProject.SetParam('RowNumber','   —œÌ›7 -');
      8: RvProject.SetParam('RowNumber','   —œÌ›8 -');
      9: RvProject.SetParam('RowNumber','   —œÌ›9 -');
      10: RvProject.SetParam('RowNumber','  —œÌ›10 -');
      11: RvProject.SetParam('RowNumber','  —œÌ›11 -');
      12: RvProject.SetParam('RowNumber','  —œÌ›12 -');
      else
          RvProject.SetParam('RowNumber',' —œÌ›1 -')
      end;
    RvProject.SetParam('ReceptionID',QPrint['ReceptionID']);
    RvProject.SetParam('CustomerName',QPrint['CustomerName']);
    if QPrint['NumberOfAdult']=1 then
        CustomerType:='»“—ê”«·'
    else
        if QPrint['NumberOfAdult']=2 then
            CustomerType:='»“—ê”«·'+'+'+'»“—ê”«·'
        else
            if QPrint['NumberOfAdult']=3 then
                CustomerType:='»“—ê”«·'+'+'+'»“—ê”«·'+'+'+'»“—ê”«·';


    if QPrint['NumberOfChild']=1 then
        if CustomerType<>'' then
          if QPrint['KinderGarten'] then
            CustomerType:=CustomerType+'+'+'Œ—œ”«· „ÂœòÊœò'
          else
            CustomerType:=CustomerType+'+'+'Œ—œ”«·'
        else
            CustomerType:='Œ—œ”«·'
    else
        if QPrint['NumberOfChild']=2 then
            if CustomerType<>'' then
                CustomerType:=CustomerType+'+'+'Œ—œ”«·'+'+'+'Œ—œ”«·'
            else
                CustomerType:='Œ—œ”«·'+'+'+'Œ—œ”«·'
        else
            if QPrint['NumberOfChild']=3 then
                CustomerType:='Œ—œ”«·'+'+'+'Œ—œ”«·'+'+'+'Œ—œ”«·';

    RvProject.SetParam('orderNumber',QPrint['OrderNumber']);
    RvProject.SetParam('CustomerType',CustomerType);
    if QPrint['NumberOfChild']+QPrint['NumberOfAdult']=1 then
    begin
        if QPrint['CardID']=1  then ReceptionType:=' ⁄«œÌ '                else ReceptionType:='ò«— Ì';
    end
    else
        if QPrint['NumberOfChild']+QPrint['NumberOfAdult']=2 then
        begin
            if QPrint['CardID']=1  then ReceptionType:=' ⁄«œÌ '                else ReceptionType:='ò«— Ì';
            if QPrint['CardID2']=1 then ReceptionType:=ReceptionType+' ⁄«œÌ '  else ReceptionType:=ReceptionType+' ò«— Ì ';
        end
        else
            if QPrint['NumberOfChild']+QPrint['NumberOfAdult']=3 then
            begin
                if QPrint['CardID']=1  then ReceptionType:=' ⁄«œÌ '                else ReceptionType:='ò«— Ì';
                if QPrint['CardID2']=1 then ReceptionType:=ReceptionType+' ⁄«œÌ '  else ReceptionType:=ReceptionType+' ò«— Ì ';
                if QPrint['CardID3']=1 then ReceptionType:=ReceptionType+' ⁄«œÌ '  else ReceptionType:=ReceptionType+' ò«— Ì ';
            end;
    if QPrint['KinderGarten']=1 then
        RvProject.SetParam('KinderGarten', '„Âœ òÊœò');
    RvProject.SetParam('ReceptionType',QPrint['CardTypeName']);
    QCredit.Close;
    QCredit.Parameters.ParamByName('ReceptionID').Value:=ReceptionID;
    QCredit.Open;
    if QCredit['Credit']<>Null then
        RvProject.SetParam('Credit',QCredit['Credit'])
    else
        RvProject.SetParam('Credit','0');

    if QPrint['CardID']<>1 then
    begin
        RvProject.SetParam('CardNumber', IntToStr(QPrint['CardID'])+','+IntToStr(QPrint['CardID2'])+','+IntToStr(QPrint['CardID3']));
        RvProject.SetParam('CompanyName', QPrint['CompanyName']);
    end
    else
    begin
        RvProject.SetParam('CardNumber','');
        RvProject.SetParam('CompanyName','');
    end;
    RvProject.SetParam('DayOfWeak',Number2WeakDay(DayOfWeek(Now())));
    RvProject.SetParam('UserName',UserInfo.UserName);
    RvProject.SetParam('ServiceCenter','');
    RvProject.SetParam('NumberOfCustomer',QPrint['NumberOfAdult']+QPrint['NumberOfChild']);
    RvProject.ExecuteReport('EnterReport');
    RvProject.Close;

end;

procedure TfrmReception.ClearForm();
var
  i : integer;
begin
    edtCustomerName.Clear;
    cboType.Text:='»“—ê”«·';
    chbMobile.Checked:=False;
    chbPool.Checked:=False;
    chbSaat.Checked:=False;
    chbAngoshtar.Checked:=False;
    chbSooeech.Checked:=False;
    chbAsnad.Checked:=False;
    chbPakhsh.Checked:=False;
    chbKeefPool.Checked:=False;
    chbSamsonet.Checked:=False;
    chbkindergarten.Enabled := False;
    chbkindergarten.Checked := False;
    edtOther.Clear;

    edtCardID.OnChange:=nil;
    edtCardID2.OnChange:=nil;

    edtCredit.Clear;
    edtCardID.Clear;
    edtCardID2.Clear;
    edtCardID3.Clear;

    edtCardID.OnChange:=edtCardID2Change;
    edtCardID2.OnChange:=edtCardID2Change;

    pnlCompany.Caption:='';
    pnlCompany2.Caption:='';
    pnlCompany3.Caption:='';
    lblCharge.Caption:='';
    rbNormal.Checked;

end;
procedure TfrmReception.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmReception.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmReception.FormShow(Sender: TObject);
begin
    //RpDev.PrinterSetupDialog;
    //sPrinterName := RpDev.Device;
    //RpDev.SelectPrinter(sPrinterName, False);
    edtCustomerName.SetFocus;
    ReceptionCount:=0;
    QFree.Close;
    QFree.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QFree.Open;
    if QFree['FreeClosed']<>Null then
    begin
        if QFree['FreeClosed']<20 then
            lblFreeClosed.Caption:=IntToStr(QFree['FreeClosed'])
        else
            lblFreeClosed.Caption:='';
    end
    else
        lblFreeClosed.Caption:='0';
    chbkindergarten.Enabled := False;
    chbkindergarten.Checked := False;
    lblCharge.Caption:='';
    lblReception.Caption:='';
    lblReceptionName.Caption := '';
    lblHotelReceptionID.Caption := '';
    lblHotelName.Caption := '';

    QReceptionList.Close;
    QReceptionList.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QReceptionList.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QReceptionList.Open;
end;

procedure TfrmReception.mnuReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmReception.btnNewCustomerClick(Sender: TObject);
begin
    if (UserInfo.amrieh) and (edtOrderNumber.Text = '') then
    begin
          ShowMessage('·ÿ›« ‘„«—Â «„—ÌÂ —« Ê«—œ ‰„«ÌÌœ.');
          Exit;
    end;
    if (trim(edtCustomerName.Text)='') and (ReceptionCount=0) then
    begin
        ShowMessage('·ÿ›« ‰«„ „‘ —Ì —« „‘Œ’ ‰„«ÌÌœ');
        Exit;
    end;

    if ((edtCardID.Text<>'') and (pnlCompany.Caption='')) or ((edtCardID2.Text<>'') and (pnlCompany2.Caption='')) or ((edtCardID3.Text<>'') and (pnlCompany3.Caption='')) then
        Exit;

    if SG.Row<=ReceptionCount then
    begin
        ClearForm;
        SG.Row:=ReceptionCount+1;
        Exit;
    end;

    if edtOrderNumber.Text = '' then
        edtDiscount.text := '0';
    ReceptionCount:=ReceptionCount+1;
    SG.Cells[0, ReceptionCount]:=IntToStr(ReceptionCount);
    if edtCustomerName.Text='' then
        SG.Cells[1, ReceptionCount]:=SG.Cells[1, ReceptionCount-1]
    else
        SG.Cells[1, ReceptionCount]:=edtCustomerName.Text;


    if cboType.Text='»“—ê”«·' then
    begin
        edtSumPrice.Text:=IntToStr(StrToIntDef(edtSumPrice.Text, 0)+Parameter.Bozorgsal);
        SG.Cells[2, ReceptionCount]:='»';
    end
    else
    begin
        edtSumPrice.Text:=IntToStr(StrToIntDef(edtSumPrice.Text, 0)+Parameter.khordsal);
        SG.Cells[2, ReceptionCount]:='Œ';
    end;

    SG.Cells[3, ReceptionCount]:=IntToStr(strToIntDef(edtCredit.Text, 0));
    if StrToIntDef(edtCardID.Text, -1)=-1 then
        edtCardID.Clear;
    SG.Cells[4, ReceptionCount]:=edtCardID.Text;
    if StrToIntDef(edtCardID2.Text, -1)=-1 then
        edtCardID2.Clear;
    SG.Cells[6, ReceptionCount]:=edtCardID2.Text;
    if StrToIntDef(edtCardID3.Text, -1)=-1 then
        edtCardID3.Clear;
    SG.Cells[7, ReceptionCount]:=edtCardID3.Text;
    if rbNormal.Checked then
        SG.Cells[5, ReceptionCount]:='1'
    else
        if rbAA.Checked then
            SG.Cells[5, ReceptionCount]:='AA'
        else
            if rbAC.Checked then
                SG.Cells[5, ReceptionCount]:='AC'
            else
                if rbCC.Checked then
                    SG.Cells[5, ReceptionCount]:='CC'
                else
                    if rbAAA.Checked then
                        SG.Cells[5, ReceptionCount]:='AAA'
                    else
                        if rbAAC.Checked then
                            SG.Cells[5, ReceptionCount]:='AAC'
                        else
                            if rbACC.Checked then
                                SG.Cells[5, ReceptionCount]:='ACC'
                            else
                                SG.Cells[5, ReceptionCount]:='CCC';

    if chbkindergarten.Checked then
        SG.Cells[KinderGartenCol, ReceptionCount] := '*';
    ReceptionPoss:=ReceptionCount;
    ClearForm;
    //edtReceptionCount.Text:=IntToStr(ReceptionCount);
    ReceptionPoss:=ReceptionCount;
    edtCardID.SetFocus;
    SG.Row:=ReceptionCount+1;
    pnlCompany.Caption:='';
    rbNormal.Checked:=True;
    //cboType.ItemIndex:=0;
    Sum;
end;

procedure TfrmReception.btnNewGroupClick(Sender: TObject);
begin
    ClearForm;
    GridClear;
    edtSumPrice.Text:='0';
    SG.Row:=1;
    ReceptionCount:=0;
    edtCustomerName.SetFocus;
    lblReception.Caption:='';
    lblCredit.Caption:='';
    chbkindergarten.Enabled := False;
    chbkindergarten.Checked := False;
    chbAndisheh.Checked := False;
end;

procedure TfrmReception.BtnDelLineClick(Sender: TObject);
begin
    with SG do
    IF (Cells[1,Row]<>'') then
    begin
        if (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ Œÿ Õ–› ‘Êœ ø','Õ–› Œÿ',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrYes)  Then
        begin
            delLine(SG.Row);
            ReceptionCount:=ReceptionCount-1;
            SG.Row := ReceptionCount+1;
            rbNormal.Checked := True;
        end;
    end;
end;

procedure TfrmReception.mnuFreeClosedClick(Sender: TObject);
begin
    QFree.Close;
    QFree.Open;
    if QFree['FreeClosed']<>Null then
        if QFree['FreeClosed']<40 then
            lblFreeClosed.Caption:=IntToStr(QFree['FreeClosed'])
        else
            lblFreeClosed.Caption:=''
    else
        lblFreeClosed.Caption:='0';
end;


procedure TfrmReception.btnCartClick(Sender: TObject);
begin
    QCard.Close;
    QCard.Parameters.ParamByName('CardID').Value:=edtCardID.Text;
    QCard.Open;
    if QCard['ReceptionID']<>Null then
    begin
        ShowMessage('«Ì‰ ò«—  ﬁ»·« «” ›«œÂ ‘œÂ «” ');
        edtCardID.Clear;
        Exit;
    end;

    QSearchCard.Close;
    QCard.Parameters.ParamByName('CardID').Value:=edtCardID.Text;
    QCard.Open;
    if QCard['CardID']=Null then
    begin
        ShowMessage('«Ì‰ ‘„«—Â ò«—  „⁄ »— ‰„Ì »«‘œ');
        edtCardID.Clear;
        Exit;
    end;
end;

procedure TfrmReception.FormCreate(Sender: TObject);
begin
    if not Parameter.isHotelAllowed then
    begin
        mnuHotel.Visible := False;
        gbHotelInfo.Visible := False;
    end;
    SG.Cells[0,0]:='—œÌ›';
    SG.Cells[1,0]:='‰«„';
    SG.Cells[2,0]:='‰Ê⁄';
    SG.Cells[3,0]:='‘«—é «Ê·ÌÂ';
    SG.Cells[4,0]:='‘„«—Â ò«— ';
    SG.Cells[5,0]:=' ⁄œ«œ ';
    SG.Cells[6,0]:='ò«— 2';
    SG.Cells[7,0]:='ò«— 3';
    SG.Cells[KinderGartenCol,0]:='„Âœ òÊœò';


    if UserInfo.Shift=1 then
        lblShift.Caption:='¬ﬁ‹‹‹‹‹«Ì‹‹‹‹«‰'
    else
        lblShift.Caption:='»‹‹‹«‰‹‹‹‹‹Ê«‰';
        
    lblCredit.Caption:='';
    pnlCompany.Caption:='';
    QCurrentShift.Open;
    if QCurrentShift['title'] <> null then
      lblShift.Caption := QCurrentShift['title']
    else
      lblShift.Caption := '';
end;

procedure TfrmReception.BtnSaveClick(Sender: TObject);
var
 i, Price, BasePriceForBargain, NumberOfAddult, NumberOfChild : Integer;
 KeyNumbers : array[1..200] of integer;
 QSpecialCompany :TADOQuery;
 LastReceptionID, CurrentReceptionID : Largeint;
 mobile_number : string;
begin
    if StrToInt(StringReplace(edtSumPrice.Text, ',' , '',[rfReplaceAll,rfIgnoreCase])) > 0 then
    if PosInfo.isPosActive then
    begin
      if MessageBox(Self.Handle,'¬Ì« Å–Ì—‘ «“ ÿ—Ìﬁ ÅÊ“ «‰Ã«„ „Ì‘Êœø','ÅÌ ”Ì ÅÊ“',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrYes  Then
      begin
        case PosInfo.PSP of
            BEHPARDAKHT:
              if posPayment(StrToInt(StringReplace(edtSumPrice.Text, ',' , '',[rfReplaceAll,rfIgnoreCase]))) = 0 then
              begin
                ShowMessage('Œÿ« œ— Å—œ«Œ ');
                BtnSave.Enabled := True;
                Exit;
              end;
            SADAD:
              if SadadPeyment(StrToInt(StringReplace(edtSumPrice.Text, ',' , '',[rfReplaceAll,rfIgnoreCase]))) = 0 then
              begin
                ShowMessage('Œÿ« œ— Å—œ«Œ ');
                BtnSave.Enabled := True;
                Exit;
              end;
        end;
      end;
    end;
    LastReceptionID := -1;
    CurrentReceptionID := -1;
    Price:=0;
    QSpecialCompany:=TADOQuery.Create(nil);
    QSpecialCompany.Connection:=DM.ADOConnection;


    mobile_number:=InputBox('„Ê»«Ì·', '·ÿ›« ‘„«—Â „Ê»«Ì· „ÌÂ„«‰ —« Ê«—œ ‰„«ÌÌœ', '');
    if MessageBox(Self.Handle,'Å–Ì—‘ «‰Ã«„ ‘Êœø','Å–Ì—‘',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo  Then Exit;

    QParameter.Close;
    QParameter.Open;
    if QParameter['is_active_sms'] then
    begin
        QSMS.Close;
        QSMS.Parameters.ParamByName('name').Value := SG.Cells[1,1];
        QSMS.Parameters.ParamByName('mobile').Value := mobile_number;
        QSMS.ExecSQL;
    end;
    spReception.Parameters.ParamByName('@mobile_number').Value:=mobile_number;
    if edtCustomerName.Text<>'' then  btnNewCustomerClick(Sender);
    spReception.Parameters.ParamByName('@JumpClosed').Value:=1;

    for i:=1 to ReceptionCount do
    begin
        spReception.Parameters.ParamByName('@CustomerName').Value:=SG.Cells[1,i];
        if SG.Cells[2,i]='»' then
            spReception.Parameters.ParamByName('@CustomerType').Value:=1
        else
            spReception.Parameters.ParamByName('@CustomerType').Value:=2;
        spReception.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;

        if SG.Cells[4, i]<>'' then
            spReception.Parameters.ParamByName('@ReceptionType').Value:=2
        else
          if edtOrderNumber.Text <> '' then
            spReception.Parameters.ParamByName('@ReceptionType').Value:=4
          else
            spReception.Parameters.ParamByName('@ReceptionType').Value:=1;
        spReception.Parameters.ParamByName('@Shift').Value:=Parameter.Shift;
        spReception.Parameters.ParamByName('@Credit').Value:=0;
        if SG.Cells[3,i]='*' then
            spReception.Parameters.ParamByName('@Mobile').Value:=1
        else
            spReception.Parameters.ParamByName('@Mobile').Value:=0;

        if SG.Cells[4,i]='*' then
            spReception.Parameters.ParamByName('@Pool').Value:=1
        else
            spReception.Parameters.ParamByName('@Pool').Value:=0;

        if SG.Cells[5,i]='*' then
            spReception.Parameters.ParamByName('@Saat').Value:=1
        else
            spReception.Parameters.ParamByName('@Saat').Value:=0;

        if SG.Cells[6,i]='*' then
            spReception.Parameters.ParamByName('@AngoshtarPlak').Value:=1
        else
            spReception.Parameters.ParamByName('@AngoshtarPlak').Value:=0;

        if SG.Cells[7,i]='*' then
            spReception.Parameters.ParamByName('@Sooeech').Value:=1
        else
            spReception.Parameters.ParamByName('@Sooeech').Value:=0;

        if SG.Cells[8,i]='*' then
            spReception.Parameters.ParamByName('@Asnad').Value:=1
        else
            spReception.Parameters.ParamByName('@Asnad').Value:=0;

        if SG.Cells[9,i]='*' then
            spReception.Parameters.ParamByName('@Pakhsh').Value:=1
        else
            spReception.Parameters.ParamByName('@Pakhsh').Value:=0;

        if SG.Cells[10,i]='*' then
            spReception.Parameters.ParamByName('@KeefPool').Value:=1
        else
            spReception.Parameters.ParamByName('@KeefPool').Value:=0;

        if chbAndisheh.Checked then
            spReception.Parameters.ParamByName('@Samsonet').Value:=1
        else
            spReception.Parameters.ParamByName('@Samsonet').Value:=0;

        spReception.Parameters.ParamByName('@Other').Value:=SG.Cells[12,i];

      NumberOfAddult:=0;
      NumberOfChild:=0;
      if SG.Cells[5, i]='1'  then begin If SG.Cells[2, i]='»' then NumberOfAddult:=1 else NumberOfChild:=1; end;
      if SG.Cells[5, i]='AA' then begin  NumberOfAddult:=2; NumberOfChild:=0  end;
      if SG.Cells[5, i]='AC' then begin  NumberOfAddult:=1; NumberOfChild:=1  end;
      if SG.Cells[5, i]='CC' then begin  NumberOfAddult:=0; NumberOfChild:=2  end;
      if SG.Cells[5, i]='AAA'then begin  NumberOfAddult:=3; NumberOfChild:=0  end;
      if SG.Cells[5, i]='AAC'then begin  NumberOfAddult:=2; NumberOfChild:=1  end;
      if SG.Cells[5, i]='ACC'then begin  NumberOfAddult:=1; NumberOfChild:=2  end;
      if SG.Cells[5, i]='CCC'then begin  NumberOfAddult:=0; NumberOfChild:=3  end;

      SP_Price.Close;
      SP_Price.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
      SP_Price.Parameters.ParamByName('@CardID1').Value:=StrToIntDef(SG.Cells[4, i], 1);
      SP_Price.Parameters.ParamByName('@CardID2').Value:=StrToIntDef(SG.Cells[6, i], 1);
      SP_Price.Parameters.ParamByName('@CardID3').Value:=StrToIntDef(SG.Cells[7, i], 1);
      SP_Price.Parameters.ParamByName('@NumberOfAddult').Value:=NumberOfAddult;
      SP_Price.Parameters.ParamByName('@NumberOfChild').Value:=NumberOfChild;
      SP_Price.ExecProc;
      price:=price+SP_Price.Parameters.ParamByName('@Price').Value;

        spReception.Parameters.ParamByName('@Price').Value:=price;
        spReception.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
        spReception.Parameters.ParamByName('@CardID').Value:=StrToIntDef(SG.Cells[4,i], 1);
        spReception.Parameters.ParamByName('@CardID2').Value:=StrToIntDef(SG.Cells[6,i], 1);
        spReception.Parameters.ParamByName('@CardID3').Value:=StrToIntDef(SG.Cells[7,i], 1);
        spReception.Parameters.ParamByName('@NumberOfAdult').Value:=NumberOfAddult;
        spReception.Parameters.ParamByName('@NumberOfChild').Value:=NumberOfChild;

        if edtOrderNumber.Text <> '' then
        begin
            spReception.Parameters.ParamByName('@OrderID').Value:=edtOrderNumber.Text;
            if edtDiscount.Text <> '' then
            spReception.Parameters.ParamByName('@Discount').Value:=edtDiscount.Text
        else
            spReception.Parameters.ParamByName('@Discount').Value:= 0;
        end
        else
        begin
            edtDiscount.Clear;
            spReception.Parameters.ParamByName('@OrderID').Value:= 0;
            spReception.Parameters.ParamByName('@Discount').Value:= 0;
        end;

        if lblHotelReceptionID.Caption <> '' then
            spReception.Parameters.ParamByName('@HotelReceptionID').Value:=lblHotelReceptionID.Caption
        else
            spReception.Parameters.ParamByName('@HotelReceptionID').Value:= 0;
        if  SG.Cells[KinderGartenCol,i] = '*' then
            spReception.Parameters.ParamByName('@KinderGarten').Value:= 1
        else
            spReception.Parameters.ParamByName('@KinderGarten').Value:= 0;
        spReception.ExecProc;
        spReception.Parameters.ParamByName('@JumpClosed').Value:=0;


        CurrentReceptionID :=spReception.Parameters.ParamByName('@ReceptionID').Value;
        if CurrentReceptionID <> LastReceptionID then
        begin
    /////////////////// Charge Crdit ///////////////////////////////////
            if strToInt(SG.Cells[3,i])>0 then
            begin
                SP_Credit.Parameters.ParamByName('@ReceptionID').Value:=spReception.Parameters.ParamByName('@ReceptionID').Value;
                SP_Credit.Parameters.ParamByName('@CreditID').Value:=-1;
                SP_Credit.Parameters.ParamByName('@Credit').Value:=SG.Cells[3,i];
                SP_Credit.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
                SP_Credit.Parameters.ParamByName('@Action').Value:='Insert';
                SP_Credit.ExecProc;
            end;
    ////////////////////////////////////////////////////////////////////
            PrintReception(spReception.Parameters.ParamByName('@ReceptionID').Value);
            spReception.Parameters.ParamByName('@ReceptionID').Value := '-9999';
            LastReceptionID := CurrentReceptionID;
        end
        else
        begin
            ShowMessage('Œÿ« œ— À»  «ÿ·«⁄« ');
            Exit;
        end;
    end;
    ReceptionCount:=0;
    ClearForm;
    edtSumPrice.Text:='0';
    edtCardID.SetFocus;
    QFree.Close;
    QFree.Open;
    if QFree['FreeClosed']<>Null then
    begin
        if QFree['FreeClosed']<20 then
            lblFreeClosed.Caption:=IntToStr(QFree['FreeClosed'])
        else
            lblFreeClosed.Caption:='';
    end
    else
        lblFreeClosed.Caption:='0';
   btnNewGroupClick(Sender);
    edtCredit.Text:='';
    lblCredit.Caption:='';
    edtDiscount.Text := '0';
    edtOrderNumber.Clear;
    lblReceptionName.Caption := '';
    lblHotelReceptionID.Caption := '';
    lblHotelName.Caption := '';
    edtGroup.Clear;
    QReceptionList.Close;
    QReceptionList.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QReceptionList.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QReceptionList.Open;
    chbkindergarten.Enabled := False;

end;

procedure TfrmReception.SGClick(Sender: TObject);
begin
    fillFormFromGrid;
end;

procedure TfrmReception.btnSaveInGridClick(Sender: TObject);
begin
    if SG.Cells[1, SG.Row]='' then Exit;
    AddToGrid(SG.Row);
    SG.Row:=ReceptionCount+1;
    Sum;
end;

procedure TfrmReception.btnReceptionListClick(Sender: TObject);
begin
    Application.CreateForm(TfrmReceptionList, frmReceptionList);
    frmReceptionList.ShowModal;
    FreeAndNil(frmReceptionList);
end;

procedure TfrmReception.edtCreditExit(Sender: TObject);
begin
    if StrToIntDef(edtCredit.Text, 0) > 300000 then
        ShowMessage('„»·€ ‘«—é »Ì‘ — «“ 300000 —Ì«· „Ì »«‘œ');
end;

procedure TfrmReception.mnuDelLineClick(Sender: TObject);
begin
    BtnDelLineClick(Sender);
    edtCustomerName.Clear;
    Sum;
end;

procedure TfrmReception.edtCreditChange(Sender: TObject);
begin
    lblCredit.Caption:=FormatFloat('###,', StrToIntDef(edtCredit.Text, 0));
end;

procedure TfrmReception.edtCardIDExit(Sender: TObject);
var
i : integer;
begin
    if TEdit(Sender).Text='' then
    begin
        if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='')and (edtCardID4.Text='') then
            rbAA.Checked:=True
        else
            if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') and (edtCardID4.Text='') then
                rbAAA.Checked:=True
            else
                if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') and (edtCardID4.Text<>'') then
                    rbAAAA.Checked:=True
                else
                    rbNormal.Checked:=True;

        if edtCardID.Text='' then pnlCompany.Caption:='';
        if edtCardID2.Text='' then pnlCompany2.Caption:='';
        if edtCardID3.Text='' then pnlCompany3.Caption:='';
        if edtCardID4.Text='' then pnlCompany4.Caption:='';
        Exit;
    end
    else
    begin
        QCheckAfternoon.Close;
        QCheckAfternoon.Parameters.ParamByName('CardID').Value := TEdit(Sender).Text;
        QCheckAfternoon.Open;
        if QCheckAfternoon['SpecialForAfternoon']  then
        begin
            QCheckTime.Close;
            QCheckTime.Open;
            if QCheckTime['ActivePreEndPrice'] = null then
            begin
                ShowMessage('«Ì‰ ò«—  „Œ’Ê’ ‘Ì›  ⁄’— „Ì »«‘œ');
                TEdit(Sender).Clear;
                Exit;
            end;

        end;
        if QCheckAfternoon['SpecialForNight']  then
        begin
            QCheckEndTime.Close;
            QCheckEndTime.Open;
            if QCheckEndTime['ActiveEndPrice'] = null then
            begin
                ShowMessage('«Ì‰ ò«—  „Œ’Ê’ ‘Ì›  ‘» „Ì »«‘œ');
                TEdit(Sender).Clear;
                Exit;
            end;

        end;


    end;
    if StrToIntDef(TEdit(Sender).Text, -1)=-1 then
    begin
        ShowMessage('‘„«—Â ò«—  „⁄ »— ‰„Ì »«‘œ');
        TEdit(Sender).Clear;

        if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='')and (edtCardID4.Text='') then
            rbAA.Checked:=True
        else
            if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') and (edtCardID4.Text='') then
                rbAAA.Checked:=True
            else
                if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') and (edtCardID4.Text<>'') then
                    rbAAAA.Checked:=True
                else
                    rbNormal.Checked:=True;

        if edtCardID.Text='' then pnlCompany.Caption:='';
        if edtCardID2.Text='' then pnlCompany2.Caption:='';
        if edtCardID3.Text='' then pnlCompany3.Caption:='';
        if edtCardID4.Text='' then pnlCompany4.Caption:='';
        Exit;
    end;

    if SG.Cells[1, SG.Row]='' then
    begin
        for i:=1 to ReceptionCount do
            if ((SG.Cells[4, i]=TEdit(Sender).Text) or (SG.Cells[6, i]=TEdit(Sender).Text) or (SG.Cells[7, i]=TEdit(Sender).Text)) and  (SG.Cells[4, i]<>'4') then
            begin
                ShowMessage('«Ì‰ ò«—  ﬁ»·« œ— ·Ì”  Ê«—œ ‘œÂ «” ');
                TEdit(Sender).Clear;
                if TEdit(Sender).Name='edtCardID' then
                    pnlCompany.Caption:=''
                else
                    if TEdit(Sender).Name='edtCardID2' then
                        pnlCompany2.Caption:=''
                    else
                        if TEdit(Sender).Name='edtCardID3' then
                            pnlCompany3.Caption:='';
                if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='') then
                    rbAA.Checked:=True
                else
                    if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') then
                        rbAAA.Checked
                    else
                        rbNormal.Checked:=True;
                if edtCardID.Text='' then pnlCompany.Caption:='';
                if edtCardID2.Text='' then pnlCompany2.Caption:='';
                Exit;
            end;
    end
    else
        for i:=1 to ReceptionCount do
            if i=SG.Row then
                Continue
            else
                if (SG.Cells[4, i]=TEdit(Sender).Text) or (SG.Cells[6, i]=TEdit(Sender).Text) or (SG.Cells[7, i]=TEdit(Sender).Text) then
                begin
                    ShowMessage('«Ì‰ ò«—  ﬁ»·« œ— ·Ì”  Ê«—œ ‘œÂ «” ');
                    TEdit(Sender).Clear;
                    if TEdit(Sender).Name='edtCardID' then
                        pnlCompany.Caption:=''
                    else
                        if TEdit(Sender).Name='edtCardID2' then
                            pnlCompany2.Caption:=''
                        else
                            if TEdit(Sender).Name='edtCardID3' then
                                pnlCompany3.Caption:='';
                    if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='') then
                        rbAA.Checked:=True
                    else
                        if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') then
                            rbAAA.Checked:=True
                        else
                            rbNormal.Checked:=True;
                    if edtCardID.Text='' then pnlCompany.Caption:='';
                    if edtCardID2.Text='' then pnlCompany2.Caption:='';
                    Exit;
                end;
    if TEdit(Sender).Text='' then
    begin
        if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='') then
            rbAA.Checked:=True
        else
            if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') then
                rbAAA.Checked:=True
            else
                rbNormal.Checked:=True;
        if edtCardID.Text='' then pnlCompany.Caption:='';
        if edtCardID2.Text='' then pnlCompany2.Caption:='';
        Exit;
    end;
    QCard.Close;
    QCard.Parameters.ParamByName('CardID').Value:=StrToIntDef(TEdit(Sender).Text, 0);
    QCard.Open;
    if QCard['ReceptionID']<>Null then
    begin
        ShowMessage('«Ì‰ ò«—  ﬁ»·« «” ›«œÂ ‘œÂ «” ');
        TEdit(Sender).Clear;
        if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='') then
            rbAA.Checked:=True
        else
            if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') then
                rbAAA.Checked:=True
            else
                rbNormal.Checked:=True;
        if edtCardID.Text='' then pnlCompany.Caption:='';
        if edtCardID2.Text='' then pnlCompany2.Caption:='';
        Exit;
    end;

    QSearchCard.Close;
    QSearchCard.Parameters.ParamByName('CardID').Value:=StrToIntDef(TEdit(Sender).Text, 0);
    QSearchCard.Open;
    if QSearchCard['CardID']=Null then
    begin
        if TEdit(Sender).Text='4' then
            pnlCompany.Caption:='”›—ò«— '
        else
        begin
            ShowMessage('«Ì‰ ‘„«—Â ò«—  „⁄ »— ‰„Ì »«‘œ');
            TEdit(Sender).Clear;
            if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='') then
                rbAA.Checked:=True
            else
                if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') then
                    rbAAA.Checked:=True
                else
                    rbNormal.Checked:=True;
            if edtCardID.Text='' then pnlCompany.Caption:='';
            if edtCardID2.Text='' then pnlCompany2.Caption:='';
            Exit;
        end;
    end
    else
    begin
        if QSearchCard['Active']=False then
        begin
            ShowMessage('¬Ì‰ ò«—  €Ì— ›⁄«· „Ì »«‘œ');
            TEdit(Sender).Clear;
            if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='') then
                rbAA.Checked:=True
            else
                if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') then
                    rbAAA.Checked:=True
                else
                    rbNormal.Checked:=True;
            if edtCardID.Text='' then pnlCompany.Caption:='';
            if edtCardID2.Text='' then pnlCompany2.Caption:='';
            Exit;
        end;
        QCheckDate.Close;
        //QCheckDate.Parameters.ParamByName('CurrentDate').Value:=CurrentDate;
        QCheckDate.Parameters.ParamByName('CardID').Value:=StrToIntDef(TEdit(Sender).Text, 0);
        QCheckDate.Open;
        if  not((QCheckDate['CreateDate'] <= CurrentDate) and (QCheckDate['ExpireDate'] >= CurrentDate)) and (QCheckDate['GetMoney']) then
        begin
        ///////////////////////////////////////////////////////////////

        ///////////////////////////////////////////////////////////////
            ShowMessage('«⁄ »«— «Ì‰ ò«—  »Â Å«Ì«‰ —”ÌœÂ «” ');
            TEdit(Sender).Clear;
            if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='') then
                rbAA.Checked:=True
            else
                if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') then
                    rbAAA.Checked:=True
                else
                    rbNormal.Checked:=True;
            if edtCardID.Text='' then pnlCompany.Caption:='';
            if edtCardID2.Text='' then pnlCompany2.Caption:='';
            Exit;
        end
        else
        begin
            if  not((QCheckDate['CreateDate'] <= CurrentDate) and (QCheckDate['ExpireDate'] >= CurrentDate)) and (not QCheckDate['GetMoney']) then
                ShowMessage('«Ì‰ ò«—  ‘«„· Å—œ«Œ  Ã—Ì„Â œÌ—ò—œ „Ì ‘Êœ');

            if TEdit(Sender).Name='edtCardID' then
                pnlCompany.Caption:=QCheckDate['CompanyName']
            else
                if TEdit(Sender).Name='edtCardID2' then
                    pnlCompany2.Caption:=QCheckDate['CompanyName']
                else
                    if TEdit(Sender).Name='edtCardID3' then
                        pnlCompany3.Caption:=QCheckDate['CompanyName'];
            end;
    end;
    if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text='') then
        rbAA.Checked:=True
    else
        if (edtCardID.Text<>'') and (edtCardID2.Text<>'') and (edtCardID3.Text<>'') then
            rbAAA.Checked:=True
        else
            rbNormal.Checked:=True;

    IF ((edtCardID.Text<>'') and ((edtCardID.Text=edtCardID2.Text) or (edtCardID.Text=edtCardID3.Text)))
        or ((edtCardID2.Text<>'') and (edtCardID2.Text=edtCardID3.Text)) then
    begin
        ShowMessage('‘„«—Â ò«— Â«Ì Ê«—œÂ „‘«»Â „Ì »«‘œ');
        edtCardID3.Clear;
        pnlCompany3.Caption:='';
        edtCardID2.Clear;
        pnlCompany2.Caption:='';
        edtCardID.Clear;
        pnlCompany.Caption:='';
        edtCardID.SetFocus;
        Exit;
    end;

    if (TEdit(Sender).Name='edtCardID') and (chb2.Checked) then
        edtCardID2.SetFocus
    else
        edtCustomerName.SetFocus;
end;

procedure TfrmReception.btnCardTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCardTypeInfo, frmCardTypeInfo);
    frmCardTypeInfo.ShowModal;
    if frmCardTypeInfo.strKey='enter' then
    begin
        edtCardID.Text:=frmCardTypeInfo.QCardTypeInfo['CardTypeID'];
        pnlCompany.Caption:=frmCardTypeInfo.QCardTypeInfo['CardTypeName'];
        edtCustomerName.SetFocus;
    end;
    FreeAndNil(frmCardTypeInfo);
end;

procedure TfrmReception.btnCardType2Click(Sender: TObject);
begin
    Application.CreateForm(TfrmCardTypeInfo, frmCardTypeInfo);
    frmCardTypeInfo.ShowModal;
    if frmCardTypeInfo.strKey='enter' then
    begin
        edtCardID2.Text:=frmCardTypeInfo.QCardTypeInfo['CardTypeID'];
        pnlCompany2.Caption:=frmCardTypeInfo.QCardTypeInfo['CardTypeName'];
        edtCustomerName.SetFocus;
    end;
    FreeAndNil(frmCardTypeInfo);
end;

procedure TfrmReception.btnCardType3Click(Sender: TObject);
begin
    Application.CreateForm(TfrmCardTypeInfo, frmCardTypeInfo);
    frmCardTypeInfo.ShowModal;
    if frmCardTypeInfo.strKey='enter' then
    begin
        edtCardID3.Text:=frmCardTypeInfo.QCardTypeInfo['CardTypeID'];
        pnlCompany3.Caption:=frmCardTypeInfo.QCardTypeInfo['CardTypeName'];
        edtCustomerName.SetFocus;
    end;
    FreeAndNil(frmCardTypeInfo);
end;

procedure TfrmReception.rbAAClick(Sender: TObject);
begin
    chbkindergarten.Enabled := True;
    rbClick;

end;

procedure TfrmReception.edtCardID2Change(Sender: TObject);
begin
    if (edtCardID.Text='') and (edtCardID2.Text<>'') then
    begin
        ShowMessage('·ÿ›« ‘„«—Â ò«—  «Ê· —« œ— ﬁ”„  ‘„«—Â ò«—  1 Ê«—œ ‰„«ÌÌœ');
        edtCardID2.Clear;
        edtCardID.SetFocus;
        Exit;
    end;
end;

procedure TfrmReception.edtCardID3Change(Sender: TObject);
begin
    if (edtCardID.Text='') and (edtCardID2.Text='') and (edtCardID3.Text<>'') then
    begin
        ShowMessage('·ÿ›« ‘„«—Â ò«—  «Ê· —« œ— ﬁ”„  ‘„«—Â ò«—  1 Ê«—œ ‰„«ÌÌœ');
        edtCardID2.Clear;
        edtCardID.SetFocus;
        Exit;
    end;
end;

procedure TfrmReception.btnCardType4Click(Sender: TObject);
begin
    Application.CreateForm(TfrmCardTypeInfo, frmCardTypeInfo);
    frmCardTypeInfo.ShowModal;
    if frmCardTypeInfo.strKey='enter' then
    begin
        edtCardID3.Text:=frmCardTypeInfo.QCardTypeInfo['CardTypeID'];
        pnlCompany3.Caption:=frmCardTypeInfo.QCardTypeInfo['CardTypeName'];
        edtCustomerName.SetFocus;
    end;
    FreeAndNil(frmCardTypeInfo);
end;

procedure TfrmReception.btnGroupClick(Sender: TObject);
var
  i : integer;
begin
  SG.OnClick:=nil;
  for i:=1 to StrToIntDef(edtGroup.Text, 0) do
  begin
    if (edtCustomerName.Text='') and (ReceptionCount=0) then
    begin
        ShowMessage('·ÿ›« ‰«„ „‘ —Ì —« „‘Œ’ ‰„«ÌÌœ');
        Exit;
    end;

    if ((edtCardID.Text<>'') and (pnlCompany.Caption='')) or ((edtCardID2.Text<>'') and (pnlCompany2.Caption='')) or ((edtCardID3.Text<>'') and (pnlCompany3.Caption='')) then
        Exit;

    if SG.Row<=ReceptionCount then
    begin
        ClearForm;
        SG.Row:=ReceptionCount+1;
        Exit;
    end;

    ReceptionCount:=ReceptionCount+1;
    SG.Cells[0, ReceptionCount]:=IntToStr(ReceptionCount);
    if edtCustomerName.Text='' then
        SG.Cells[1, ReceptionCount]:=SG.Cells[1, ReceptionCount-1]
    else
        SG.Cells[1, ReceptionCount]:=edtCustomerName.Text;


    if cboType.Text='»“—ê”«·' then
    begin
        edtSumPrice.Text:=IntToStr(StrToIntDef(edtSumPrice.Text, 0)+Parameter.Bozorgsal);
        SG.Cells[2, ReceptionCount]:='»';
    end
    else
    begin
        edtSumPrice.Text:=IntToStr(StrToIntDef(edtSumPrice.Text, 0)+Parameter.khordsal);
        SG.Cells[2, ReceptionCount]:='Œ';
    end;

    SG.Cells[3, ReceptionCount]:=IntToStr(strToIntDef(edtCredit.Text, 0));
    if StrToIntDef(edtCardID.Text, -1)=-1 then
        edtCardID.Clear;
    SG.Cells[4, ReceptionCount]:=edtCardID.Text;
    if StrToIntDef(edtCardID2.Text, -1)=-1 then
        edtCardID2.Clear;
    SG.Cells[6, ReceptionCount]:=edtCardID2.Text;
    if StrToIntDef(edtCardID3.Text, -1)=-1 then
        edtCardID3.Clear;
    SG.Cells[7, ReceptionCount]:=edtCardID3.Text;
    if rbNormal.Checked then
        SG.Cells[5, ReceptionCount]:='1'
    else
        if rbAA.Checked then
            SG.Cells[5, ReceptionCount]:='AA'
        else
            if rbAC.Checked then
                SG.Cells[5, ReceptionCount]:='AC'
            else
                if rbCC.Checked then
                    SG.Cells[5, ReceptionCount]:='CC'
                else
                    if rbAAA.Checked then
                        SG.Cells[5, ReceptionCount]:='AAA'
                    else
                        if rbAAC.Checked then
                            SG.Cells[5, ReceptionCount]:='AAC'
                        else
                            if rbACC.Checked then
                                SG.Cells[5, ReceptionCount]:='ACC'
                            else
                                SG.Cells[5, ReceptionCount]:='CCC';


    ReceptionPoss:=ReceptionCount;
    SG.Row:=ReceptionCount+1;
  end;
    SG.OnClick:=SGClick;
    edtCardID.SetFocus;
    pnlCompany.Caption:='';
    rbNormal.Checked:=True;
    Sum;
    edtCustomerName.Clear;
    //ClearForm;

end;

procedure TfrmReception.mnuChargeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCredit, frmCredit);
    frmCredit.ShowModal;
    FreeAndNil(frmCredit);
end;

procedure TfrmReception.mnuChangeToClick(Sender: TObject);
begin
    Application.CreateForm(TfrmChangeTo, frmChangeTo);
    frmChangeTo.ShowModal;
    FreeAndNil(frmChangeTo);
end;

procedure TfrmReception.btnSelectOrderClick(Sender: TObject);
begin
    {Application.CreateForm(TfrmOrderSelect, frmOrderSelect);
    frmOrderSelect.ShowModal;
    FreeAndNil(frmOrderSelect);}
    if edtOrderNumber.Text = '' then
    begin
      Application.CreateForm(TfrmOrderDiscountInfo, frmOrderDiscountInfo);
      frmOrderDiscountInfo.ShowModal;
      if frmOrderDiscountInfo.strKey='enter' then
      begin
          edtOrderNumber.Text:=frmOrderDiscountInfo.QOrderDiscount['OrderID'];
      end;
      FreeAndNil(frmOrderDiscountInfo);
    end;
    if edtOrderNumber.Text = '' then Exit;
    QCheckOrderNumber.Close;

    QOrder.Close;
    QOrder.Parameters.ParamByName('OrderNumber').Value := edtOrderNumber.Text;
    QOrder.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QOrder.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QOrder.Open;
    if QOrder['ModReception'] > 0 then
        edtGroup.Text := IntToStr(QOrder['ModReception']);
    edtCustomerName.Text := QOrder['CustomerName'];
    edtDiscount.Text := QOrder['Discount'];
    if QOrder['CustomerID'] = 2 then
    begin
        Application.CreateForm(TfrmHotelsInfo, frmHotelsInfo);
        frmHotelsInfo.HotelReception := 1;
        frmHotelsInfo.ShowModal;
        if frmHotelsInfo.strKey='enter' then
        begin
            lblHotelReceptionID.Caption := IntToStr(frmHotelsInfo.HotelReceptionID);
            lblReceptionName.Caption := frmHotelsInfo.ReceptionName;
            lblHotelName.Caption := frmHotelsInfo.QHotel['HotelName'];
        end;
        FreeAndNil(frmHotelsInfo);
    end;

end;

procedure TfrmReception.mnuOrderClick(Sender: TObject);
begin
    Application.CreateForm(TfrmOrder, frmOrder);
    frmOrder.edtID.Text := '-1';
    frmOrder.ShowModal;
    FreeAndNil(frmOrder);
end;

procedure TfrmReception.mnuInternetReceptionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmIssueTicket, frmIssueTicket);
    frmIssueTicket.ShowModal;
    FreeAndNil(frmIssueTicket);
end;

procedure TfrmReception.AndishehExecute(Sender: TObject);
begin
    chbAndisheh.Checked := True;
end;

procedure TfrmReception.mnuHotelReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelReceptionReport, frmHotelReceptionReport);
    frmHotelReceptionReport.edtStartDate.Text := CurrentDate;
    frmHotelReceptionReport.edtEndDate.Text := CurrentDate;
    frmHotelReceptionReport.edtStartDate.Enabled := False;
    frmHotelReceptionReport.edtEndDate.Enabled := False;
    frmHotelReceptionReport.ExportToExcel.Enabled := False;
    frmHotelReceptionReport.btnSummery.Enabled := False;
    frmHotelReceptionReport.BtnPrint.Enabled := False;
    frmHotelReceptionReport.edtUserID.Text := IntToStr(UserInfo.UserID);
    frmHotelReceptionReport.edtUserName.Text := UserInfo.UserName;
    frmHotelReceptionReport.edtUserID.Enabled := False;
    frmHotelReceptionReport.btnUser.Enabled := False;
    frmHotelReceptionReport.BBtnAcceptClick(Sender);
    frmHotelReceptionReport.ShowModal;
    FreeAndNil(frmHotelReceptionReport);
end;

procedure TfrmReception.edtOrderNumberExit(Sender: TObject);
begin
    if edtOrderNumber.Text <> '' then
    begin
        QCheckOrderNumber.Close;
        QCheckOrderNumber.Parameters.ParamByName('OrderNumber').Value := edtOrderNumber.Text;
        QCheckOrderNumber.Parameters.ParamByName('UserId').Value := UserInfo.UserID;
        QCheckOrderNumber.Parameters.ParamByName('OrderDate').Value := CurrentDate;
        QCheckOrderNumber.Open;
        if QCheckOrderNumber['OrderId'] = null then
        begin
          ShowMessage('‘„«—Â «„—ÌÂ „⁄ »— ‰„Ì »«‘œ');
          edtOrderNumber.Clear;
        end;
    end;
end;

procedure TfrmReception.refreshReceptionListExecute(Sender: TObject);
begin
    QReceptionList.Close;
    QReceptionList.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QReceptionList.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QReceptionList.Open;
    ShowMessage('·Ì”  Å–Ì—‘ »Â —Ê“ —”«‰Ì ê—œÌœ');
end;

procedure TfrmReception.mnuMembershipClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardTicket, frmCreditCardTicket);
    frmCreditCardTicket.ShowModal;
    FreeAndNil(frmCreditCardTicket);
    refreshReceptionListExecute(Sender);
end;

procedure TfrmReception.mnuDepositClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardCharge, frmCreditCardCharge);
    frmCreditCardCharge.ShowModal;
    FreeAndNil(frmCreditCardCharge);
end;

procedure TfrmReception.mnuStartReceptionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStartShift, frmStartShift);
    frmStartShift.ShowModal;
    FreeAndNil(frmStartShift);
    QCurrentShift.Close;
    QCurrentShift.Open;
    if QCurrentShift['title'] <> null then
      lblShift.Caption := QCurrentShift['title']
    else
      lblShift.Caption := '';
end;

procedure TfrmReception.mnuLockersClick(Sender: TObject);
begin
    Application.CreateForm(TfrmManageLockers, frmManageLockers);
    frmManageLockers.ShowModal;
    FreeAndNil(frmManageLockers);
end;

end.
