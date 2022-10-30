unit SabegheMoshtariUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, Buttons, QuickRpt,
  ActnList, Menus, RpBase, RpSystem, RpDefine, RpRave;

type
  TfrmSabegheMoshtari = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    DBGrid3: TDBGrid;
    Panel7: TPanel;
    BtnReturn: TBitBtn;
    BtnSave: TBitBtn;
    BtnPrint: TBitBtn;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblReceptionID: TLabel;
    lblKeyNumber: TLabel;
    lblCustomerName: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblCredit: TLabel;
    Label6: TLabel;
    lblStartTime: TLabel;
    Label9: TLabel;
    lblNumber: TLabel;
    btnSearch: TBitBtn;
    BitBtn1: TBitBtn;
    chbMobile: TCheckBox;
    chbPool: TCheckBox;
    chbSaat: TCheckBox;
    chbAngoshtar: TCheckBox;
    chbSooeech: TCheckBox;
    chbAsnad: TCheckBox;
    chbPakhsh: TCheckBox;
    chbKeefPool: TCheckBox;
    chbSamsonet: TCheckBox;
    edtOther: TEdit;
    Panel4: TPanel;
    Panel8: TPanel;
    DBGrid1: TDBGrid;
    Panel9: TPanel;
    DBGrid2: TDBGrid;
    Panel10: TPanel;
    Label7: TLabel;
    lbl1: TLabel;
    Label8: TLabel;
    lblSumCredit: TLabel;
    lblSumPayment: TLabel;
    BitBtn2: TBitBtn;
    btnCustomerExit2: TBitBtn;
    btnCustomerExit1: TBitBtn;
    QFactor: TADOQuery;
    QSubFactor: TADOQuery;
    QCredit: TADOQuery;
    dsCredit: TDataSource;
    dsSubFactor: TDataSource;
    dsFactor: TDataSource;
    QRCompositeReport1: TQRCompositeReport;
    QReception: TADOQuery;
    QExit: TADOQuery;
    QSumWorkSection: TADOQuery;
    QSumCredit: TADOQuery;
    QSumFactor: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
    QSumPayment: TADOQuery;
    ActionList1: TActionList;
    Return: TAction;
    summery: TAction;
    SP_Exit: TADOStoredProc;
    QCard: TADOQuery;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuCharge: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    QSearch: TADOQuery;
    SP_DeleteCredit: TADOStoredProc;
    DBGrid4: TDBGrid;
    dsLastExit: TDataSource;
    QLastExit: TADOQuery;
    QReturnMoney: TADOQuery;
    ExitReport: TRvProject;
    RvSystem: TRvSystem;
    QSpecialGuestCredit: TADOQuery;
    QExtraPrice: TADOQuery;
    procedure btnSearchClick(Sender: TObject);
    procedure QFactorAfterScroll(DataSet: TDataSet);
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure SumPayment();
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuChargeClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    Procedure CustomerExit(OneOrTow : integer);
    procedure PrintExitDoc(OneOrTow : integer);
    procedure btnCustomerExit1Click(Sender: TObject);
    procedure btnCustomerExit2Click(Sender: TObject);
    procedure summeryExecute(Sender: TObject);
    procedure QCreditBeforeDelete(DataSet: TDataSet);
    procedure QFactorBeforeDelete(DataSet: TDataSet);
    procedure QSubFactorBeforeDelete(DataSet: TDataSet);
    procedure QLastExitBeforeDelete(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    ExitUserID : integer;
  end;

var
  frmSabegheMoshtari: TfrmSabegheMoshtari;

implementation

uses SearchCustomerUnit, DMUnit, qrExitReportUnit, qrExitReport2Unit,
  qrExitUnit, CalculatUnit, ShareUnit, CreditUnit, FactorPrintUnit, Math;

{$R *.dfm}

procedure TfrmSabegheMoshtari.PrintExitDoc(OneOrTow : integer);
begin
    CustomerExit(OneOrTow);

    QReception.Close;
    QReception.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
    QReception.Open;
    if QReception['ReceptionID']<>Null then
    begin
        Application.CreateForm(TqrExit, qrExit);
        qrExit.lblCardID.Caption:='';
        qrExit.lblCompanyName.Caption:='';
        qrExit.lblReceptionID.Caption:=lblReceptionID.Caption;
        qrExit.lblKeyNumber.Caption:=lblKeyNumber.Caption;
        qrExit.lblName.Caption:=lblCustomerName.Caption;
        qrExit.lblReceptionDate.Caption:=QReception['Receptiondate'];
        qrExit.lblUser.Caption:=UserInfo.UserName;
        qrExit.lblStartTime.Caption:=QReception['StartTime'];
        qrExit.lblCreditMod.Caption:='';
        qrExit.lblCredit.Caption:='';
        qrExit.lblNumberOfCustomer.Caption:='1';        
        if OneOrTow=1 then
            qrExit.lblEndTime.Caption:=QReception['ExitTime1']
        else
            if OneOrTow=2 then
               qrExit.lblEndTime.Caption:=QReception['ExitTime2'];

            if QReception['CardID']=1 then
                qrExit.lblReceptionType.Caption:='⁄«œÌ'
            else
            begin
                QCard.Close;
                QCard.Parameters.ParamByName('CardID').Value:=QReception['CardID'];
                QCard.Open;
                if QCard['CompanyName']<>null then
                begin
                    qrExit.lblCompanyName.Caption:=QCard['CompanyName'];
                    qrExit.lblReceptionType.Caption:='ò«— Ì';
                    qrExit.lblCardID.Caption:=QReception['CardID'];
                end;
            end;

            if QReception['CustomerType']=1 then
                qrExit.lblType.Caption:='»“—ê”«·'
            else
                qrExit.lblType.Caption:='Œ—œ”«·';
                            
            qrExit.lblCoName.Caption:=Parameter.CoName;
            qrExit.lblMessage.Caption:=Parameter.factorMessage;
            qrExit.Print;
            FreeAndNil(qrExit);
        end;
    if OneOrTow=1 then
        btnCustomerExit1.Enabled:=False;

    if OneOrTow=2 then
        btnCustomerExit2.Enabled:=False;

end;

Procedure TfrmSabegheMoshtari.CustomerExit(OneOrTow : integer);
var
  QUpdateCustomerExit :TADOQuery;
begin
  QUpdateCustomerExit:=TADOQuery.Create(nil);
  QUpdateCustomerExit.Connection:=DM.ADOConnection;
  if OneOrTow=1 then
    QUpdateCustomerExit.SQL.Text:='Update TReception set CustomerExit1=1, ExitTime1=dbo.FormatTimeString(cast(Datepart(hh, Getdate()) as char(2))+'+QuotedStr(':')+'+cast(Datepart(n, Getdate()) as char(2))) where ReceptionID='+lblReceptionID.Caption
  else
      if OneOrTow=2 then
        QUpdateCustomerExit.SQL.Text:='Update TReception set CustomerExit2=1,  ExitTime2=dbo.FormatTimeString(cast(Datepart(hh, Getdate()) as char(2))+'+QuotedStr(':')+'+cast(Datepart(n, Getdate()) as char(2))) where ReceptionID='+lblReceptionID.Caption;
  QUpdateCustomerExit.ExecSQL;
end;


Procedure TfrmSabegheMoshtari.SumPayment();
var
SumFactor, SumCharge : integer;
begin
    QSumPayment.Close;
    QSumPayment.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QSumPayment.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QSumPayment.Open;
    if QSumPayment['Charge']<>Null then
        lblSumCredit.Caption:=FormatFloat('###,', QSumPayment['Charge'])
    else
        lblSumCredit.Caption:='0';

    if QSumPayment['SumFactor']<>Null then
        SumFactor:=QSumPayment['SumFactor']
    else
        SumFactor:=0;

    if QSumPayment['SumCharge']<>Null then
        SumCharge:=QSumPayment['SumCharge']
    else
        SumCharge:=0;

    lblSumPayment.Caption:=FormatFloat('###,', SumCharge-SumFactor);
end;

procedure TfrmSabegheMoshtari.btnSearchClick(Sender: TObject);
var
  NumberOfCustomer : integer;
begin
    lblReceptionID.Caption:='';
    lblKeyNumber.Caption:='';
    lblCustomerName.Caption:='';
    lblCredit.Caption:='0';
    lblStartTime.Caption:='';
    QCredit.Close;
    QFactor.Close;

    lblCredit.Caption := '0';
    Application.CreateForm(TfrmSearchKeyNumber, frmSearchKeyNumber);
    frmSearchKeyNumber.ShowModal;
    if frmSearchKeyNumber.QSearch.Active = false then Exit;

    if (frmSearchKeyNumber.QSearch['EnterTime'] = '99:99') and not (Parameter.PermitionForExit) then
        ShowMessage(' „ÌÂ„«‰ „Ê—œ ‰Ÿ— Ê—Êœ ‰ŒÊ—œÂ «”  Ê ‘„« „Ã«“ »Â Œ—ÊÃ “œ‰ «Ì‰ „ÌÂ„«‰ ‰„Ì »«‘Ìœ')
    else

    if (frmSearchKeyNumber.strKey='enter') and (frmSearchKeyNumber.lblReceptionID.Caption<>'') then
    begin
        lblReceptionID.Caption:=frmSearchKeyNumber.lblReceptionID.Caption;
        lblKeyNumber.Caption:=frmSearchKeyNumber.edtKeyNumber.Text;
        lblCustomerName.Caption:=frmSearchKeyNumber.lblCustomerName.Caption;
        lblCredit.Caption:=frmSearchKeyNumber.lblCurrentCredit.Caption;
        chbMobile.Checked:=frmSearchKeyNumber.QSearch['Mobile'];
        chbPool.Checked:=frmSearchKeyNumber.QSearch['Pool'];
        chbSaat.Checked:=frmSearchKeyNumber.QSearch['Saat'];
        chbSooeech.Checked:=frmSearchKeyNumber.QSearch['Sooeech'];
        chbAngoshtar.Checked:=frmSearchKeyNumber.QSearch['AngoshtarPlak'];
        chbAsnad.Checked:=frmSearchKeyNumber.QSearch['Asnad'];
        chbPakhsh.Checked:=frmSearchKeyNumber.QSearch['Pakhsh'];
        chbSamsonet.Checked:=frmSearchKeyNumber.QSearch['Samsonet'];
        chbKeefPool.Checked:=frmSearchKeyNumber.QSearch['KeefPool'];
        edtOther.Text:=frmSearchKeyNumber.QSearch['Other'];

        lblStartTime.Caption:=frmSearchKeyNumber.QSearch['StartTime'];
        lblNumber.Caption := frmSearchKeyNumber.QSearch['NumberOfAdult']+frmSearchKeyNumber.QSearch['NumberOfChild'];

        QFactor.Close;
        QFactor.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
        QFactor.Open;

        QCredit.Close;
        QCredit.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
        QCredit.Open;
        BtnSave.SetFocus;
        NumberOfCustomer:=frmSearchKeyNumber.QSearch['NumberOfChild']+frmSearchKeyNumber.QSearch['NumberOfAdult'];
        case NumberOfCustomer of
        1:
          begin
              btnCustomerExit1.Enabled:=False;
              btnCustomerExit2.Enabled:=False;
          end;
        2:
          begin
              btnCustomerExit2.Enabled:=False;
              If frmSearchKeyNumber.QSearch['CustomerExit1'] then
                  btnCustomerExit1.Enabled:=False
              else
                  btnCustomerExit1.Enabled:=True;
          end;
        3:
          begin
              If frmSearchKeyNumber.QSearch['CustomerExit1'] then
                  btnCustomerExit1.Enabled:=False
              else
                  btnCustomerExit1.Enabled:=True;
              If frmSearchKeyNumber.QSearch['CustomerExit2'] then
                  btnCustomerExit2.Enabled:=False
              else
                  btnCustomerExit2.Enabled:=True;
          end;

        end;
        if NumberOfCustomer>1 then
            frmSearchKeyNumber.QSearch['CustomerExit1']
    end;
    FreeAndNil(frmSearchKeyNumber);
end;

procedure TfrmSabegheMoshtari.QFactorAfterScroll(DataSet: TDataSet);
begin
    QSubFactor.Close;
    QSubFactor.Parameters.ParamByName('FactorID').Value:=QFactor['FactorID'];
    QSubFactor.Open;
end;

procedure TfrmSabegheMoshtari.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSabegheMoshtari.BtnPrintClick(Sender: TObject);
begin
    QReception.Close;
    QReception.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
    QReception.Open;
    if QReception['ReceptionID']<>Null then
    begin
        Application.CreateForm(TqrExit, qrExit);

        qrExit.lblReceptionID.Caption:=lblReceptionID.Caption;
        qrExit.lblKeyNumber.Caption:=lblKeyNumber.Caption;
        qrExit.lblName.Caption:=lblCustomerName.Caption;
        qrExit.lblReceptionDate.Caption:=QReception['Receptiondate'];
        qrExit.lblUser.Caption:=UserInfo.UserName;
        qrExit.lblStartTime.Caption:=QReception['StartTime'];
        qrExit.lblEndTime.Caption:=QReception['EndTime'];
        qrExit.lblReceptionType.Caption:='⁄«œÌ';
        /////////////////////  Resturent ///////////////////
        {QSumWorkSection.Close;
        QSumWorkSection.Parameters.ParamByName('WorkSectionID').Value:=2;
        QSumWorkSection.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
        QSumWorkSection.Open;
        if QSumWorkSection['SumPrice']<>Null then
            qrExit.lblResturent.Caption:=QSumWorkSection['SumPrice']
        else
            qrExit.lblResturent.Caption:='0';
        //////////////////// cafee shop ///////////////////
        QSumWorkSection.Close;
        QSumWorkSection.Parameters.ParamByName('WorkSectionID').Value:=3;
        QSumWorkSection.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
        QSumWorkSection.Open;
        if QSumWorkSection['SumPrice']<>Null then
            qrExit.lblCofeeShop.Caption:=QSumWorkSection['SumPrice']
        else
            qrExit.lblCofeeShop.Caption:='0';

        //////////////////// cafee shop Sona  //////////////////
        QSumWorkSection.Close;
        QSumWorkSection.Parameters.ParamByName('WorkSectionID').Value:=4;
        QSumWorkSection.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
        QSumWorkSection.Open;
        if QSumWorkSection['SumPrice']<>Null then
            qrExit.lblSonaCofeeShop.Caption:=QSumWorkSection['SumPrice']
        else
            qrExit.lblSonaCofeeShop.Caption:='0';

        //////////////////// cafee shop Sona  //////////////////
        QSumWorkSection.Close;
        QSumWorkSection.Parameters.ParamByName('WorkSectionID').Value:=7;
        QSumWorkSection.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
        QSumWorkSection.Open;
        if QSumWorkSection['SumPrice']<>Null then
            qrExit.lblPhoto.Caption:=QSumWorkSection['SumPrice']
        else
            qrExit.lblPhoto.Caption:='0'; }



        {qrExit.lblCreditMod.Caption:=lblCredit.Caption;
        QSumCredit.Close;
        QSumCredit.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
        QSumCredit.Open;
        if QSumCredit['SumCredit']<>Null then
            qrExit.lblCredit.Caption:=QSumCredit['SumCredit']
        else
            qrExit.lblCredit.Caption:='0'; }

        //qrExit.lblEnter.Caption:=QReception['Price'];
        qrExit.lblCoName.Caption:=Parameter.CoName;
        qrExit.lblMessage.Caption:=Parameter.factorMessage;
        //qrExit.lblExtraPrice.Caption:='';
        SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
        SP_GetCurrentCredit.ExecProc;
        qrExit.lblCreditMod.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
        qrExit.lblCreditMod.Caption:='';
        //qrExit.lblPayment.Caption:='';
        qrExit.lblCompanyName.Caption:='';
        qrExit.Preview;
        FreeAndNil(qrExit);
    end;
end;

procedure TfrmSabegheMoshtari.QRCompositeReport1AddReports(
  Sender: TObject);
begin
    QRCompositeReport1.Reports.Add(qrExitReport);
    QRCompositeReport1.Reports.Add(qrExitReport2);
end;

procedure TfrmSabegheMoshtari.BtnSaveClick(Sender: TObject);
var
ExtraPriceInExit, Payment, SumCredit, CreditMod : integer;
QChangingRoom : TADOQuery;
begin
    QSpecialGuestCredit.Close;
    QSpecialGuestCredit.Parameters.ParamByName('ReceptionID').Value := lblReceptionID.Caption;
    QSpecialGuestCredit.Open;
    if QSpecialGuestCredit['Credit']<>null then
    begin
        ShowMessage('«Ì‰ ò„œ „—»Êÿ »Â „ÌÂ„«‰ ÊÌéÂ „Ì »«‘œ Ê ‰Ì«“ »Â Œ—ÊÃ ‰œ«—œ.');
        Exit;
    end;

    QChangingRoom := TADOQuery.Create(nil);
    QChangingRoom.Connection := DM.ADOConnection;
    QChangingRoom.SQL.Text := 'select CanIssueExit from TChangingRoom where '+lblKeyNumber.Caption+ '>=StartLockerID and '+lblKeyNumber.Caption+'<=EndLockerID ' ;
    QChangingRoom.Open;
    if QChangingRoom['CanIssueExit']<>null then
        Parameter.CanIssueExit := QChangingRoom['CanIssueExit'];

    if not Parameter.CanIssueExit then
    begin
        ShowMessage('‘„« „Ã«“ »Â À»  Œ—ÊÃÌ ‰„Ì »«‘Ìœ');
        Exit;
    end;
    if lblReceptionID.Caption='' then Exit;
    if (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ ⁄„·Ì«  Œ—ÊÃ À»  ê—œœø','Œ—ÊÃ «“ „Ã„Ê⁄Â',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=lblReceptionID.Caption;
    SP_GetCurrentCredit.ExecProc;
    CreditMod:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    if (Time()>StrToTime(lblStartTime.Caption)) and (Time()-StrToTime(lblStartTime.Caption) < StrToTime('1:00')) then
        if (MessageBox(Self.Handle,'ÕŸÊ— „‘ —Ì œ— „Ã„Ê⁄Â ò„ — «“ 2 ”«⁄  „Ì »«‘œ ¬Ì« „Ì ŒÊ«ÂÌœ ⁄„·Ì«  Œ—ÊÃ À»  ê—œœø','Œ—ÊÃ «“ „Ã„Ê⁄Â',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;

    SP_Exit.Parameters.ParamByName('@ReceptionID').Value:=lblReceptionID.Caption;
    SP_Exit.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Exit.Parameters.ParamByName('@extraPrice').Value := 0;
    QSearch.Close;
    QSearch.Parameters.ParamByName('receptionId').Value:=lblReceptionID.Caption;
    QSearch.Open;
    if QSearch['ReceptionID']=Null then
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— ﬁ»·« Œ—ÊÃ ŒÊ—œÂ «” ')
    else
    begin
        if (Parameter.BaseTime > 0) or (QSearch['restrictUsingTime']) then
        begin
          QExtraPrice.Close;
          QExtraPrice.Parameters.ParamByName('receptionID').Value := QSearch['ReceptionID'];
          QExtraPrice.Open;
          if QExtraPrice['extraPrice'] <> null then
            SP_Exit.Parameters.ParamByName('@extraPrice').Value:=QExtraPrice['extraPrice'];
        end;
        SP_Exit.ExecProc;
        QReception.Close;
        QReception.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
        QReception.Open;

        if QReception['ReceptionID']<>Null then
        begin
            QReturnMoney.Close;
            QReturnMoney.Parameters.ParamByName('ReceptionID').Value := lblReceptionID.Caption;
            QReturnMoney.Parameters.ParamByName('CreditMode').Value := CreditMod;
            QReturnMoney.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
            QReturnMoney.ExecSQL;
////////////////////////////////
            ExitReport.Open;
            ExitReport.SetParam('ExitTime',QReception['EndTime']);
            ExitReport.SetParam('ReceptionDate',QReception['ReceptionDate']);
            ExitReport.SetParam('Credit',FormatFloat('###,',StrToIntDef(Money2Number(IntToStr(CreditMod)), 0)));
            ExitReport.SetParam('KeyNumber',QReception['ClosedID']);
            ExitReport.SetParam('ReceptionID',QReception['ReceptionID']);
            ExitReport.SetParam('CustomerName',QReception['CustomerName']);
            ExitReport.SetParam('EnterTime', QReception['StartTime']);
            ExitReport.SetParam('UserName',UserInfo.UserName);
            ExitReport.SetParam('NumberOfCustomer',QReception['NumberOfCustomerThatNotExit']);

            QSumCredit.Close;
            QSumCredit.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
            QSumCredit.Open;
            if QSumCredit['SumCredit']<>Null then
                ExitReport.SetParam('FirstCredit',QSumCredit['SumCredit'])
            else
                ExitReport.SetParam('FirstCredit','0');
            ExitReport.ExecuteReport('ExitReport');
            ExitReport.Close;
/////////////////////////////////////////

            {Application.CreateForm(TqrExit, qrExit);

            if QReception['Code'] <> -1 then
                qrExit.lblLockerCode.Caption:= QReception['Code']
            else
                qrExit.lblLockerCode.Caption:= '';
            qrExit.lblCardID.Caption:='';
            qrExit.lblCompanyName.Caption:='';
            qrExit.lblReceptionID.Caption:=lblReceptionID.Caption;
            qrExit.lblKeyNumber.Caption:=lblKeyNumber.Caption;
            qrExit.lblName.Caption:=lblCustomerName.Caption;
            qrExit.lblReceptionDate.Caption:=QReception['Receptiondate'];
            qrExit.lblUser.Caption:=UserInfo.UserName;
            qrExit.lblStartTime.Caption:=QReception['StartTime'];
            qrExit.lblEndTime.Caption:=QReception['EndTime'];
            qrExit.lblNumberOfCustomer.Caption:=QReception['NumberOfCustomerThatNotExit'];
            if QReception['CardID']=1 then
                qrExit.lblReceptionType.Caption:='⁄«œÌ'
            else
            begin
                QCard.Close;
                QCard.Parameters.ParamByName('CardID').Value:=QReception['CardID'];
                QCard.Open;
                if QCard['CompanyName']<>null then
                begin
                    qrExit.lblCompanyName.Caption:=QCard['CompanyName'];
                    qrExit.lblReceptionType.Caption:='ò«— Ì';
                    qrExit.lblCardID.Caption:=QReception['CardID'];
                end;
            end;

            qrExit.lblCreditMod.Caption:=FormatFloat('###,',StrToIntDef(Money2Number(IntToStr(CreditMod)), 0));
            QSumCredit.Close;
            QSumCredit.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
            QSumCredit.Open;

            if QSumCredit['SumCredit']<>Null then
                SumCredit:=QSumCredit['SumCredit']
            else
                SumCredit:=0;
            qrExit.lblCredit.Caption:=IntToStr(SumCredit);

            QSumFactor.Close;
            QSumFactor.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
            QSumFactor.Open;

            if QSumFactor['SumPrice']<>Null then
                SumCredit:=SumCredit-QSumFactor['SumPrice'];

            if QReception['CustomerType']=1 then
                qrExit.lblType.Caption:='»“—ê”«·'
            else
                qrExit.lblType.Caption:='Œ—œ”«·';

            ExtraPriceInExit:=ExtraPrice(QReception['StartTime'], QReception['EndTime'], Parameter.ExtraBasePrice, Parameter.BaseTime);
            Payment:=SumCredit-ExtraPriceInExit;
            qrExit.lblCoName.Caption:=Parameter.CoName;
            qrExit.lblMessage.Caption:=Parameter.factorMessage;
            qrExit.Print;
            FreeAndNil(qrExit); }
        end;
    end;

    lblReceptionID.Caption:='';
    lblKeyNumber.Caption:='';
    lblCustomerName.Caption:='';
    lblCredit.Caption:='';
    lblStartTime.Caption:='';
    QFactor.Close;
    QCredit.Close;
    SumPayment;
    QLastExit.Close;
    QLastExit.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QLastExit.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QLastExit.Open;
    btnSearchClick(Sender);
end;

procedure TfrmSabegheMoshtari.FormCreate(Sender: TObject);
begin
    if UserInfo.Permission<>2 then
        BtnPrint.Visible:=False;
    lblReceptionID.Caption:='';
    lblKeyNumber.Caption:='';
    lblCustomerName.Caption:='';
    lblCredit.Caption:='';
    lblStartTime.Caption:='';
    SumPayment;
    QLastExit.Close;
    QLastExit.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QLastExit.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QLastExit.Open;
end;

procedure TfrmSabegheMoshtari.BitBtn2Click(Sender: TObject);
begin
    QReception.Close;
    QReception.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
    QReception.Open;
    Application.CreateForm(TqrExitReport, qrExitReport);
    qrExitReport.lblReceptionID.Caption:=lblReceptionID.Caption;
    qrExitReport.lblKeyNumber.Caption:=lblKeyNumber.Caption;
    qrExitReport.lblName.Caption:=lblCustomerName.Caption;
    qrExitReport.lblEndTime.Caption:=QReception['EndTime'];
    qrExitReport.lblStartTime.Caption:=QReception['StartTime'];
    qrExitReport.lblReceptionDate.Caption:=QReception['ReceptionDate'];
    qrExitReport.lblCreditMod.Caption:=lblCredit.Caption;
    qrExitReport.QSubFactor.Close;
    qrExitReport.QSubFactor.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
    qrExitReport.QSubFactor.Open;
    Application.CreateForm(TqrExitReport2, qrExitReport2);
    QRCompositeReport1.Preview;
    FreeAndNil(qrExitReport2);
    FreeAndNil(qrExitReport);
end;

procedure TfrmSabegheMoshtari.FormShow(Sender: TObject);
begin
    btnSearch.SetFocus;
end;

procedure TfrmSabegheMoshtari.mnuChargeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCredit, frmCredit);
    frmCredit.ShowModal;
    FreeAndNil(frmCredit);
end;

procedure TfrmSabegheMoshtari.N4Click(Sender: TObject);
begin
    Application.CreateForm(TfrmFactorPrint, frmFactorPrint);
    if lblKeyNumber.Caption <> '' then
    begin
        frmFactorPrint.edtKeyNumber.Text := lblKeyNumber.Caption;
    end;
    frmFactorPrint.ShowModal;
    FreeAndNil(frmFactorPrint);
end;

procedure TfrmSabegheMoshtari.btnCustomerExit1Click(Sender: TObject);
begin
    PrintExitDoc(1);
    btnSearchClick(Sender);
end;

procedure TfrmSabegheMoshtari.btnCustomerExit2Click(Sender: TObject);
begin
    PrintExitDoc(2);
    btnSearchClick(Sender);
end;

procedure TfrmSabegheMoshtari.summeryExecute(Sender: TObject);
begin
    N4Click(Sender);
end;

procedure TfrmSabegheMoshtari.QCreditBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

procedure TfrmSabegheMoshtari.QFactorBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

procedure TfrmSabegheMoshtari.QSubFactorBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

procedure TfrmSabegheMoshtari.QLastExitBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

end.
