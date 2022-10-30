unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, DBCtrls, DB, ADODB, ExtCtrls,
  ShellApi;

type
  TFMain = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu: TMainMenu;
    BMnuFile: TMenuItem;
    N2: TMenuItem;
    MnuExit: TMenuItem;
    BMnuBaseInformation: TMenuItem;
    BMnuOptions: TMenuItem;
    MnuUser: TMenuItem;
    BMnuHelp: TMenuItem;
    MnuHelp: TMenuItem;
    N11: TMenuItem;
    MnuAbout: TMenuItem;
    BMnuReport: TMenuItem;
    MnuFirstOptions: TMenuItem;
    mnuOptions: TMenuItem;
    MnuCalculate: TMenuItem;
    N18: TMenuItem;
    ADOQuery1: TADOQuery;
    MnuChangeBackGround: TMenuItem;
    Image: TImage;
    Image1: TImage;
    Image4: TImage;
    PopupMenu1: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N20: TMenuItem;
    Image2: TImage;
    N5: TMenuItem;
    MnuPrinterSetup: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    N21: TMenuItem;
    N23: TMenuItem;
    mnuReception: TMenuItem;
    mnuCompany: TMenuItem;
    QExist: TADOQuery;
    N1: TMenuItem;
    mnuClosed: TMenuItem;
    mnuAddClosed: TMenuItem;
    mnuClosedStatus: TMenuItem;
    mnuDelClosed: TMenuItem;
    mnuCredit: TMenuItem;
    N4: TMenuItem;
    TParameter: TADOTable;
    N8: TMenuItem;
    mnuBy: TMenuItem;
    N9: TMenuItem;
    mnuViewReception: TMenuItem;
    N10: TMenuItem;
    mnuCard: TMenuItem;
    N12: TMenuItem;
    mnuKala: TMenuItem;
    mnuVahed: TMenuItem;
    mnuSales: TMenuItem;
    mnuMenu: TMenuItem;
    N14: TMenuItem;
    mnuSabegheMoshtary: TMenuItem;
    N15: TMenuItem;
    mnuEnter: TMenuItem;
    mnuWorkSection: TMenuItem;
    N16: TMenuItem;
    mnuManager: TMenuItem;
    mnuGeneralReport: TMenuItem;
    N17: TMenuItem;
    mnuLockerMap: TMenuItem;
    N19: TMenuItem;
    mnuFactor: TMenuItem;
    mnuMainCard: TMenuItem;
    mnuBargain: TMenuItem;
    mnuViewBargain: TMenuItem;
    N22: TMenuItem;
    mnuCheckCard: TMenuItem;
    mnuSalesFactor: TMenuItem;
    N24: TMenuItem;
    mnuCardReport: TMenuItem;
    N25: TMenuItem;
    mnuSaleReport: TMenuItem;
    mnuReceptionChat: TMenuItem;
    mnuBarcode: TMenuItem;
    mnuLockers: TMenuItem;
    mnuExpire: TMenuItem;
    mnuSubBargain: TMenuItem;
    mnuCheckSubBargain: TMenuItem;
    mnuDeActive: TMenuItem;
    N13: TMenuItem;
    mnuNotEnter: TMenuItem;
    mnuModCreditReport: TMenuItem;
    mnuTempBargain: TMenuItem;
    mnuNotActiveBargain: TMenuItem;
    N26: TMenuItem;
    mnuAmareForoosh: TMenuItem;
    mnuReport2: TMenuItem;
    N30: TMenuItem;
    mnuLabiCashier: TMenuItem;
    N31: TMenuItem;
    mnuCash: TMenuItem;
    mnuSendSMA: TMenuItem;
    mnuMenuList: TMenuItem;
    mnuSalesCard: TMenuItem;
    mnuSection: TMenuItem;
    mnuVisitor: TMenuItem;
    mnuCustomer: TMenuItem;
    mnuSell: TMenuItem;
    mnuEmployee: TMenuItem;
    mnuHealthCard: TMenuItem;
    N34: TMenuItem;
    mnuEnterOrder: TMenuItem;
    N35: TMenuItem;
    mnuExportFactor: TMenuItem;
    mnuAvgPrice: TMenuItem;
    N36: TMenuItem;
    mnuPQC: TMenuItem;
    mnuSetLockerAndUser: TMenuItem;
    N38: TMenuItem;
    mnuCheckEnter: TMenuItem;
    mnuLastEnter: TMenuItem;
    mnuHotels: TMenuItem;
    mnuHotelList: TMenuItem;
    mnuHotelReception: TMenuItem;
    mnuKarthayeTahvili: TMenuItem;
    N39: TMenuItem;
    mnuHotelReport: TMenuItem;
    N40: TMenuItem;
    N43: TMenuItem;
    mnuOrderGoods: TMenuItem;
    mnuSlide: TMenuItem;
    mnuIssueTicket: TMenuItem;
    mnuSlideReport: TMenuItem;
    mnuOnloneShop: TMenuItem;
    mnuTaxiService: TMenuItem;
    mnuTaxi: TMenuItem;
    mnuBargains: TMenuItem;
    mnuConfirmBargain: TMenuItem;
    mnuViewBargains: TMenuItem;
    mnuPrivateTaxi: TMenuItem;
    mnuCreditMenu: TMenuItem;
    mnuCreditGroup: TMenuItem;
    mnuIssueCard: TMenuItem;
    mnuCreditIssue: TMenuItem;
    mnuCreditCardIssueTicket: TMenuItem;
    mnuCreditcard: TMenuItem;
    mnuCreditCardDiscount: TMenuItem;
    mnuCreditDiscount: TMenuItem;
    mnuActiveTaxi: TMenuItem;
    mnuDailyReport1: TMenuItem;
    QService_centers: TADOQuery;
    QServiceSenterTitle: TADOQuery;
    mnuQueue: TMenuItem;
    mnuBookServiceProvider: TMenuItem;
    N46: TMenuItem;
    mnuManageQueue: TMenuItem;
    mnuUse: TMenuItem;
    mnuShowQueue: TMenuItem;
    mnuSpaceSlide: TMenuItem;
    mnuBoomrang: TMenuItem;
    mnuShuttel: TMenuItem;
    mnuTwister: TMenuItem;
    mnuKamikaz: TMenuItem;
    mnuLoop: TMenuItem;
    mnuPos: TMenuItem;
    mnuPcPos: TMenuItem;
    N47: TMenuItem;
    mnuComputer: TMenuItem;
    mnuHotelTicketing: TMenuItem;
    mnuWorksectionAccess: TMenuItem;
    N3: TMenuItem;
    QAppMenuAccess: TADOQuery;
    mnuReceptionSummary: TMenuItem;
    mnuCareditCardpriceGroup: TMenuItem;
    N28: TMenuItem;
    mnuReceptionCreditCardReport: TMenuItem;
    mnuReceptionCreditGroupReport: TMenuItem;
    N27: TMenuItem;
    mnuShift: TMenuItem;
    mnuGroupAndShift: TMenuItem;
    mnuLearning: TMenuItem;
    mnuAgeCategory: TMenuItem;
    mnuLessonType: TMenuItem;
    mnuLesson: TMenuItem;
    mnuLessonGroup: TMenuItem;
    mnuCreditCardList: TMenuItem;
    mnuEnrollment: TMenuItem;
    mnuPayTuitionList: TMenuItem;
    mnuPools: TMenuItem;
    mnuRent: TMenuItem;
    mnuSchoolEnrollment: TMenuItem;
    N32: TMenuItem;
    mnuStudent: TMenuItem;
    mnuSchool: TMenuItem;
    mnuTerm: TMenuItem;
    mnuPayedSchoolTuition: TMenuItem;
    mnuMenuINOut: TMenuItem;
    mnuEmployeeGroup: TMenuItem;
    mnuEmployees: TMenuItem;
    mnuInOut: TMenuItem;
    N29: TMenuItem;
    mnuInOutList: TMenuItem;
    mnuPoolSupervisor: TMenuItem;
    N33: TMenuItem;
    N37: TMenuItem;
    mnupoolAndSupervisor: TMenuItem;
    mnutermAndSupervisor: TMenuItem;
    mnuInstructor: TMenuItem;
    N41: TMenuItem;
    mnuCource: TMenuItem;
    mnuClass: TMenuItem;
    mnuAge: TMenuItem;
    mnuStudentAndClass: TMenuItem;
    N42: TMenuItem;
    mnuFinacialObligation: TMenuItem;
    N44: TMenuItem;
    mnuRollCall: TMenuItem;
    N45: TMenuItem;
    mnuHoliday: TMenuItem;
    mnuAutoEnrillment: TMenuItem;
    mnuLockerRoom: TMenuItem;
    mnuViewLockers: TMenuItem;
    mnuLockerManagement: TMenuItem;
    mnuComputerGroup: TMenuItem;
    mnuComputerAndGroup: TMenuItem;
    mnuUserAndComputerGroup: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MnuUserClick(Sender: TObject);
    procedure MnuExitClick(Sender: TObject);
    procedure MnuChangeBackGroundClick(Sender: TObject);
    procedure MnuPrinterSetupClick(Sender: TObject);
    procedure MnuCalculateClick(Sender: TObject);
    procedure mnuReceptionClick(Sender: TObject);
    procedure mnuCompanyClick(Sender: TObject);
    procedure mnuAddClosedClick(Sender: TObject);
    procedure mnuClosedStatusClick(Sender: TObject);
    procedure mnuDelClosedClick(Sender: TObject);
    procedure mnuCreditClick(Sender: TObject);
    procedure mnuByClick(Sender: TObject);
    procedure mnuViewReceptionClick(Sender: TObject);
    procedure mnuCardClick(Sender: TObject);
    procedure mnuKalaClick(Sender: TObject);
    procedure mnuVahedClick(Sender: TObject);
    procedure mnuMenuClick(Sender: TObject);
    procedure mnuSabegheMoshtaryClick(Sender: TObject);
    procedure mnuEnterClick(Sender: TObject);
    procedure MnuFirstOptionsClick(Sender: TObject);
    procedure mnuWorkSectionClick(Sender: TObject);
    procedure mnuManagerClick(Sender: TObject);
    procedure mnuLockerMapClick(Sender: TObject);
    procedure mnuFactorClick(Sender: TObject);
    procedure mnuBargainClick(Sender: TObject);
    procedure mnuViewBargainClick(Sender: TObject);
    procedure mnuCheckCardClick(Sender: TObject);
    procedure mnuSalesFactorClick(Sender: TObject);
    procedure mnuCardReportClick(Sender: TObject);
    procedure mnuSaleReportClick(Sender: TObject);
    procedure mnuReceptionChatClick(Sender: TObject);
    procedure mnuBarcodeClick(Sender: TObject);
    procedure mnuGroupClick(Sender: TObject);
    procedure mnuVIPClick(Sender: TObject);
    procedure mnuExpireClick(Sender: TObject);
    procedure mnuSubBargainClick(Sender: TObject);
    procedure mnuDeActiveClick(Sender: TObject);
    procedure mnuNotEnterClick(Sender: TObject);
    procedure mnuModCreditReportClick(Sender: TObject);
    procedure mnuTempBargainClick(Sender: TObject);
    procedure mnuNotActiveBargainClick(Sender: TObject);
    procedure mnuAmareForooshClick(Sender: TObject);
    procedure mnuLabiCashierClick(Sender: TObject);
    procedure mnuCashClick(Sender: TObject);
    procedure mnuSendSMAClick(Sender: TObject);
    procedure mnuMenuListClick(Sender: TObject);
    procedure mnuLockerWomenClick(Sender: TObject);
    procedure mnuSectionClick(Sender: TObject);
    procedure mnuVisitorClick(Sender: TObject);
    procedure mnuCustomerClick(Sender: TObject);
    procedure mnuSellClick(Sender: TObject);
    procedure mnuHealthCardClick(Sender: TObject);
    procedure mnuEnterOrderClick(Sender: TObject);
    procedure mnuExportFactorClick(Sender: TObject);
    procedure mnuAvgPriceClick(Sender: TObject);
    procedure mnuPQCClick(Sender: TObject);
    procedure mnuLockerMap2Click(Sender: TObject);
    procedure mnuSetLockerAndUserClick(Sender: TObject);
    procedure mnuCheckEnterClick(Sender: TObject);
    procedure mnuLastEnterClick(Sender: TObject);
    procedure mnuHotelListClick(Sender: TObject);
    procedure mnuHotelReceptionClick(Sender: TObject);
    procedure mnuHotelReportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuOrderGoodsClick(Sender: TObject);
    procedure mnuSlideClick(Sender: TObject);
    procedure mnuIssueTicketClick(Sender: TObject);
    procedure mnuSlideReportClick(Sender: TObject);
    procedure mnuOnloneShopClick(Sender: TObject);
    procedure mnuTaxiServiceClick(Sender: TObject);
    procedure mnuPrivateTaxiClick(Sender: TObject);
    procedure mnuCreditGroupClick(Sender: TObject);
    procedure mnuIssueCardClick(Sender: TObject);
    procedure mnuCreditIssueClick(Sender: TObject);
    procedure mnuCreditCardIssueTicketClick(Sender: TObject);
    procedure mnuCreditcardClick(Sender: TObject);
    procedure mnuCreditCardDiscountClick(Sender: TObject);
    procedure mnuCreditDiscountClick(Sender: TObject);
    procedure mnuActiveTaxiClick(Sender: TObject);
    procedure mnuDailyReport1Click(Sender: TObject);
    procedure mnuDailyReport2Click(Sender: TObject);
    procedure mnuLockerRoom2Click(Sender: TObject);
    procedure mnuBookServiceProviderClick(Sender: TObject);
    procedure mnuManageQueueClick(Sender: TObject);
    procedure mnuUseClick(Sender: TObject);
    procedure mnuSpaceSlideClick(Sender: TObject);
    procedure mnuBoomrangClick(Sender: TObject);
    procedure mnuShuttelClick(Sender: TObject);
    procedure mnuTwisterClick(Sender: TObject);
    procedure mnuKamikazClick(Sender: TObject);
    procedure mnuLoopClick(Sender: TObject);
    procedure mnuPosClick(Sender: TObject);
    procedure mnuWomanGroupLockerClick(Sender: TObject);
    procedure mnuLockerWomen2Click(Sender: TObject);
    procedure mnuPcPosClick(Sender: TObject);
    procedure mnuComputerClick(Sender: TObject);
    procedure mnuHotelTicketingClick(Sender: TObject);
    procedure mnuWorksectionAccessClick(Sender: TObject);
    procedure mnuReceptionSummaryClick(Sender: TObject);
    procedure mnuCareditCardpriceGroupClick(Sender: TObject);
    procedure mnuReceptionCreditCardReportClick(Sender: TObject);
    procedure mnuReceptionCreditGroupReportClick(Sender: TObject);
    procedure mnuShiftClick(Sender: TObject);
    procedure mnuGroupAndShiftClick(Sender: TObject);
    procedure mnuAgeCategoryClick(Sender: TObject);
    procedure mnuLessonTypeClick(Sender: TObject);
    procedure mnuLessonClick(Sender: TObject);
    procedure mnuLessonGroupClick(Sender: TObject);
    procedure mnuCreditCardListClick(Sender: TObject);
    procedure mnuEnrollmentClick(Sender: TObject);
    procedure mnuPayTuitionListClick(Sender: TObject);
    procedure mnuPoolsClick(Sender: TObject);
    procedure mnuRentClick(Sender: TObject);
    procedure mnuStudentClick(Sender: TObject);
    procedure mnuSchoolEnrollmentClick(Sender: TObject);
    procedure mnuTermClick(Sender: TObject);
    procedure mnuPayedSchoolTuitionClick(Sender: TObject);
    procedure mnuEmployeeGroupClick(Sender: TObject);
    procedure mnuEmployeesClick(Sender: TObject);
    procedure mnuInOutClick(Sender: TObject);
    procedure mnuInOutListClick(Sender: TObject);
    procedure mnuPoolSupervisorClick(Sender: TObject);
    procedure mnupoolAndSupervisorClick(Sender: TObject);
    procedure mnutermAndSupervisorClick(Sender: TObject);
    procedure mnuInstructorClick(Sender: TObject);
    procedure mnuCourceClick(Sender: TObject);
    procedure mnuAgeClick(Sender: TObject);
    procedure mnuClassClick(Sender: TObject);
    procedure mnuStudentAndClassClick(Sender: TObject);
    procedure mnuFinacialObligationClick(Sender: TObject);
    procedure mnuRollCallClick(Sender: TObject);
    procedure mnuHolidayClick(Sender: TObject);
    procedure mnuAutoEnrillmentClick(Sender: TObject);
    procedure mnuLockerRoomClick(Sender: TObject);
    procedure mnuViewLockersClick(Sender: TObject);
    procedure mnuLockerManagementClick(Sender: TObject);
    procedure mnuComputerGroupClick(Sender: TObject);
    procedure mnuComputerAndGroupClick(Sender: TObject);
    procedure mnuUserAndComputerGroupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses LoginUnit, CalculatUnit, DMUnit, UserUnit, FpictureUnit,
  ReceptionUnit, CompanyUnit, AddClosedUnit, ClosedUnit, DelClosedUnit,
  CreditUnit, ShareUnit, ShiftUnit, ByUnit, ViewReceptionUnit,
  CardTypeInfoUnit, CreateCardUnit, ProductUnit, VahedUnit, MenuUnit,
  SabegheMoshtariUnit, EnterUnit, ParameterUnit, WorkSectionUnit,
  ManagerUnit, GeneralReportUnit, LockerMapUnit, ViewFactorsUnit,
  BargainUnit, ViewBargainUnit, CheckCardUnit, SalesFactorUnit,
  CardReportUnit, SalesReportUnit, ReceptionChartUnit, BarCodeUnit,
  GroupUnit, VIPUnit, ExpireDateUnit, SubBargainUnit, DeActiveUnit,
  ModCreditReportUnit, TempBargainUnit, NotAcceptBargainUnit,
  AmareForooshUnit, LabiCashierUnit, CashUnit, SendSMSUnit, MenuListUnit,
  LockerWomenUnit, SectionUnit, VisitorUnit, CustomerUnit, SellUnit,
  HealthCardUnit, EnterOrderUnit, ExportFactorUnit, AvgPriceUnit, PQCUnit,
  ChangingRoom2Unit, SetLockerAndUserUnit, CheckEnterUnit, LastEnterUnit,
  HotelsUnit, HotelreceptionUnit, HotelReceptionReportUnit, MakedGoodsUnit,
  UserAttractionUnit, MessageUnit, IssueTicketUnit, SlidesReportUnit,
  WebReceptionUnit, TaxiUnit, PrivateTaxiInfoUnit, CreditGroupUnit,
  CreditCardUnit, CreditCardChargeUnit, CreditCardTicketUnit,
  CreditCardChargeReportUnit, CreditCardDiscountUnit, setActiveTaxiUnit,
  Math, LockerRoom2Unit, EnterQueueUnit, ManageOfUserUnit, ManageQueueUnit,
  UseQueueUnit, QueueTVUnit, PosUnit, GroupLockerMapPhaz2Unit,
  LockerWomen2Unit, PcPosUnit, ComputerUnit, HotelTicketingUnit,
  AppMenuAccessUnit, ReceptionSummaryReportUnit, SellByBarcodeUnit,
  CreditCardPriceGroupUnit, ReceptionCreditCardReportUnit,
  CreditCardGroupReceptionUnit, ManageShiftsUnit, CreditGroupAndShiftUnit,
  AgeCategoryUnit, LessonTypeUnit, LessonUnit, LessonGroupUnit,
  creditCardsListUnit, EnrollmentUnit, PayTuitionListUnit, PoolsUnit,
  RentUnit, studentUnit, StudentEnrollmentUnit, TermUnit,
  PayedSchoolTuitionUnit, EmployeeGroupUnit, EmployeeUnit, InOutUnit,
  InOutListUnit, PoolSupervisorUnit, PoolAndSupervisorUnit,
  TermAndSupervisorUnit, InstructorUnit, CourseUnit, ClassUnit,
  StudentAndClassUnit, FinacialObligationUnit, RollCallUnit, holidayUnit,
  AutoEnrollmentUnit, LockersUnit, LockerRoominfoUnit, LockerRoomUnit,
  ManageLockersUnit, ComputerGroupUnit, ComputerAndCompuetrGroupUnit,
  UserAndComputerGroupUnit;

{$R *.dfm}

procedure TFMain.FormCreate(Sender: TObject);
var
 F : TextFile;
 CS : String;
Result : string;
Obj: TObject;
begin

try
    Application.BiDiKeyboard:='00000429';
    Application.CreateForm(TDM,DM);

    AssignFile(F,'connection.str');
    {$I-}
    Reset(F);
    {$I+}
    if IOResult = 0 then
    begin
      Readln(F, CS);
      CloseFile(F);
      if CS<>'' then
      begin
        DM.ADOConnection.Connected:=False;
        DM.ADOConnection.ConnectionString:=CS;
        DM.ADOConnection.Connected:=True;
      end
      else
      begin
          ShowMessage('« ’«· »«‰ﬂ «ÿ·«⁄« Ì «“ »Ì‰ —› Â «” ');
          Application.Terminate;
      end;
    end
    else
    begin
      ShowMessage('« ’«· »« »«‰ﬂ «ÿ·«⁄« Ì »— ﬁ—«— ‰„Ì »«‘œ');
      Application.Terminate;
      Exit;
    end;

    {CS := 'Provider=SQLOLEDB.1;Password=Neginak20;Persist Security Info=True;User ID=sa;Initial Catalog=SMA;';
    CS := CS + 'Data Source=ITManager;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Use Encryption for Data=False;Tag with column collation when possible=False';

    DM.ADOConnection.Connected:=False;
    DM.ADOConnection.ConnectionString:= CS;
    DM.ADOConnection.Connected:=True;  }
    SystemParametersInfo(SPI_SETBEEP, 0, nil, SPIF_SENDWININICHANGE);
    Application.CreateForm(TFLogin,FLogin);
    FLogin.ShowModal;
    StatusBar1.Panels.Items[0].Text := '‰”ŒÂ: ' + IntToStr(FLogin.AppVersion);
    FreeAndNil(FLogin);

    IF UserName='' Then Halt;
    StatusBar1.Panels.Items[1].Text:=CurrentDate;
    StatusBar1.Panels.Items[2].Text:=' ﬂ«—»— :( '+UserName+' )';
    StatusBar1.Panels.Items[3].Text:= UserInfo.service_center;

    TParameter.Open;
    Parameter.Bozorgsal:=TParameter['Bozorgsal'];
    Parameter.khordsal:=TParameter['KhordSal'];
    if TParameter['factorMessage'] <> null then Parameter.factorMessage:=TParameter['factorMessage'];
    if TParameter['CoName'] <> null then Parameter.CoName:=TParameter['CoName'];
    if TParameter['CoAddress'] <> null then Parameter.CoAddress:=TParameter['CoAddress'];
    if TParameter['Tel'] <> null then Parameter.Tel:=TParameter['Tel'];
    if TParameter['PostCode'] <> null then Parameter.PostCode:=TParameter['PostCode'];
    if TParameter['Manager'] <> null then Parameter.Manager:=TParameter['Manager'];
    if TParameter['Email'] <> null then Parameter.Email:=TParameter['Email'];
    if TParameter['URL'] <> null then Parameter.URL:=TParameter['URL'];
    if TParameter['ExtraBaseTime'] <> null then Parameter.ExtraBaseTime:=TParameter['ExtraBaseTime'];
    if TParameter['ExtraBasePrice'] <> null then Parameter.ExtraBasePrice:=TParameter['ExtraBasePrice'];
    if TParameter['BaseTime'] <> null then Parameter.BaseTime:=TParameter['BaseTime'];
    if TParameter['MenuFont'] <> null then Parameter.MenuFontSize:=TParameter['MenuFont'];
    if TParameter['freeClosed'] <> null then Parameter.freeClosed:=TParameter['freeClosed'];
    if TParameter['BasePriceForBargain'] <> null then Parameter.BasePriceForBargain:=TParameter['BasePriceForBargain'];
    if TParameter['BasePriceForSpecialCompany'] <> null then Parameter.BasePriceForSpecialCompany:=TParameter['BasePriceForSpecialCompany'];
    if TParameter['PermitionForExit'] <> null then Parameter.PermitionForExit :=  TParameter['PermitionForExit'];
    if TParameter['CanIssueExit'] <> null then Parameter.CanIssueExit :=  TParameter['CanIssueExit'];
    if TParameter['URL_Pic'] <> null then Parameter.URL_Pic := TParameter['URL_Pic'];
    Parameter.hotelTicketExpiredIn := TParameter['hotelTicketExpiredIn'];
    Parameter.hotelAdultPrice := TParameter['hotelAdultPrice'];
    Parameter.hotelChildPrice := TParameter['hotelChildPrice'];
    Parameter.hotelAdultCommission := TParameter['hotelAdultCommission'];
    Parameter.hotelChildCommission := TParameter['hotelChildCommission'];
    Parameter.isHotelAllowed := TParameter['isHotelAllowed'];
    Parameter.isTaxiAllowed := TParameter['isTaxiAllowed'];
    Parameter.internetGate := TParameter['internetGate'];
    Parameter.centerCode := TParameter['centerCode'];
    Parameter.autoCreditInMenu := TParameter['autoCreditInMenu'];
    StatusBar1.Panels.Items[4].Text := Parameter.CoName;

    Application.CreateForm(TfrmShift, frmShift);
    frmShift.ShowModal;
    FreeAndNil(frmShift);
    if not UserInfo.UseMenu then
        mnuMenu.Enabled:=False;

    

    if(UserInfo.Permission <> 2) then
    begin
        QAppMenuAccess.Parameters.ParamByName('workSectionId').Value := UserInfo.WorkSectionID;
        QAppMenuAccess.Open;
        while not QAppMenuAccess.Eof do
        begin
          if Assigned(TMenuItem(FindComponent(QAppMenuAccess['menuName']))) then
          begin
            if QAppMenuAccess['access'] <> null then
                 TMenuItem(FindComponent(QAppMenuAccess['menuName'])).Visible := True
            else
                TMenuItem(FindComponent(QAppMenuAccess['menuName'])).Visible := False;
          end;
          QAppMenuAccess.Next;
        end;
    end;

    {if ((UserInfo.UserID = 239) or (UserInfo.UserID = 240) or (UserInfo.UserID = 255) or (UserInfo.UserID = 256)) then
        mnuTaxiService.Visible := Enabled;  }


    QExist.Close;
    QExist.Parameters.ParamValues['UserID']:=UserInfo.UserID;
    QExist.Prepared;
    QExist.Open;
    if QExist['Picture']<>null then
        Image.Picture.LoadFromFile(QExist['Picture']);
    if UserInfo.Shift=1 then
        Caption:=Caption+' - ‘Ì›  ¬ﬁ«Ì«‰'
    else
        Caption:=Caption+' - ‘Ì›  »«‰Ê«‰';

    QService_centers.Open;
    mnuDailyReport1.Caption := QService_centers['title'];
    QService_centers.Close;
Finally
  Close;
End;





end;

procedure TFMain.MnuUserClick(Sender: TObject);
begin
    Application.CreateForm(TFUser,FUser);
    FUser.ShowModal;
    FreeAndNil(FUser);
end;

procedure TFMain.MnuExitClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TFMain.MnuChangeBackGroundClick(Sender: TObject);
begin
    Application.CreateForm(TFPicture, FPicture);
    FPicture.ShowModal;
    FreeAndNil(FPicture);
end;

procedure TFMain.MnuPrinterSetupClick(Sender: TObject);
begin
    PrinterSetupDialog1.Execute;
end;

procedure TFMain.MnuCalculateClick(Sender: TObject);
begin
    ShellExecute (HWND(nil), 'open', 'calc','', '', SW_SHOWNORMAL);
end;

procedure TFMain.mnuReceptionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmReception, frmReception);
    frmReception.ShowModal;
    FreeAndNil(frmReception);
end;

procedure TFMain.mnuCompanyClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCompany, frmCompany);
    frmCompany.ShowModal;
    FreeAndNil(frmCompany);
end;

procedure TFMain.mnuAddClosedClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAddClosed, frmAddClosed);
    frmAddClosed.ShowModal;
    FreeAndNil(frmAddClosed);    
end;

procedure TFMain.mnuClosedStatusClick(Sender: TObject);
begin
    Application.CreateForm(TfrmClosed, frmClosed);
    frmClosed.ShowModal;
    FreeAndNil(frmClosed);
end;

procedure TFMain.mnuDelClosedClick(Sender: TObject);
begin
    Application.CreateForm(TfrmDelClosed, frmDelClosed);
    frmDelClosed.ShowModal;
    FreeAndNil(frmDelClosed);
end;

procedure TFMain.mnuCreditClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCredit, frmCredit);
    frmCredit.ShowModal;
    FreeAndNil(frmCredit);
end;

procedure TFMain.mnuByClick(Sender: TObject);
begin
    Application.CreateForm(TfrmBy, frmBy);
    frmBy.ShowModal;
    FreeAndNil(frmBy);
end;

procedure TFMain.mnuViewReceptionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmViewReception, frmViewReception);
    frmViewReception.ShowModal;
    FreeAndNil(frmViewReception);
end;

procedure TFMain.mnuCardClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreateCard, frmCreateCard);
    frmCreateCard.ShowModal;
    FreeAndNil(frmCreateCard);
end;

procedure TFMain.mnuKalaClick(Sender: TObject);
begin
    Application.CreateForm(TfrmProduct, frmProduct);
    frmProduct.ShowModal;
    FreeAndNil(frmProduct);
end;

procedure TFMain.mnuVahedClick(Sender: TObject);
begin
    Application.CreateForm(TfrmVahed, frmVahed);
    frmVahed.ShowModal;
    FreeAndNil(frmVahed);
end;

procedure TFMain.mnuMenuClick(Sender: TObject);
begin
    if UserInfo.saleByBarcode then
    begin
      Application.CreateForm(TfrmSaleByBarcode, frmSaleByBarcode);
      frmSaleByBarcode.ShowModal;
      FreeAndNil(frmSaleByBarcode);
    end
    else
    begin
      Application.CreateForm(TfrmMenu, frmMenu);
      frmMenu.ShowModal;
      FreeAndNil(frmMenu);
    end;
end;

procedure TFMain.mnuSabegheMoshtaryClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSabegheMoshtari, frmSabegheMoshtari);
    frmSabegheMoshtari.ShowModal;
    FreeAndNil(frmSabegheMoshtari);
end;

procedure TFMain.mnuEnterClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEnter, frmEnter);
    frmEnter.ShowModal;
    FreeAndNil(frmEnter);
end;

procedure TFMain.MnuFirstOptionsClick(Sender: TObject);
begin
    Application.CreateForm(TfrmParameter, frmParameter);
    frmParameter.ShowModal;
    FreeAndNil(frmParameter);
end;

procedure TFMain.mnuWorkSectionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmWorkSection, frmWorkSection);
    frmWorkSection.ShowModal;
    FreeAndNil(frmWorkSection);
end;

procedure TFMain.mnuManagerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmManager, frmManager);
    frmManager.ShowModal;
    FreeAndNil(frmManager);
end;

procedure TFMain.mnuLockerMapClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLockerMap, frmLockerMap);
    frmLockerMap.ShowModal;
    FreeAndNil(frmLockerMap);
end;

procedure TFMain.mnuFactorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmViewFactors, frmViewFactors);
    frmViewFactors.ShowModal;
    FreeAndNil(frmViewFactors);
end;

procedure TFMain.mnuBargainClick(Sender: TObject);
begin
    Application.CreateForm(TfrmBargain, frmBargain);
    frmBargain.ShowModal;
    FreeAndNil(frmBargain);
end;

procedure TFMain.mnuViewBargainClick(Sender: TObject);
begin
    Application.CreateForm(TfrmViewBargain, frmViewBargain);
    frmViewBargain.ShowModal;
    FreeAndNil(frmViewBargain);
end;

procedure TFMain.mnuCheckCardClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCheckCard, frmCheckCard);
    frmCheckCard.ShowModal;
    FreeAndNil(frmCheckCard);
end;

procedure TFMain.mnuSalesFactorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSalesFactor, frmSalesFactor);
    frmSalesFactor.ShowModal;
    FreeAndNil(frmSalesFactor);
end;

procedure TFMain.mnuCardReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCardReport, frmCardReport);
    frmCardReport.ShowModal;
    FreeAndNil(frmCardReport);
end;

procedure TFMain.mnuSaleReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSalesReport, frmSalesReport);
    frmSalesReport.edtStartDate.Text:=CurrentDate;
    frmSalesReport.edtEndDate.Text:=CurrentDate;
    frmSalesReport.ShowModal;
    FreeAndNil(frmSalesReport);
end;

procedure TFMain.mnuReceptionChatClick(Sender: TObject);
begin
    Application.CreateForm(TfrmReceptionChart, frmReceptionChart);
    frmReceptionChart.WindowState:=wsMaximized;
    frmReceptionChart.ShowModal;
    FreeAndNil(frmReceptionChart);
end;

procedure TFMain.mnuBarcodeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmBarCode, frmBarCode);
    frmBarCode.ShowModal;
    FreeAndNil(frmBarCode);
end;

procedure TFMain.mnuGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGroup, frmGroup);
    frmGroup.ShowModal;
    FreeAndNil(frmGroup);
end;

procedure TFMain.mnuVIPClick(Sender: TObject);
begin
    Application.CreateForm(TfrmVIP, frmVIP);
    frmVIP.ShowModal;
    FreeAndNil(frmVIP);
end;

procedure TFMain.mnuExpireClick(Sender: TObject);
begin
    Application.CreateForm(TfrmExpireDate, frmExpireDate);
    frmExpireDate.ShowModal;
    FreeAndNil(frmExpireDate);
end;

procedure TFMain.mnuSubBargainClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSubBargain, frmSubBargain);
    frmSubBargain.ShowModal;
    FreeAndNil(frmSubBargain);
end;

procedure TFMain.mnuDeActiveClick(Sender: TObject);
begin
    Application.CreateForm(TfrmDeActiveCard, frmDeActiveCard);
    frmDeActiveCard.ShowModal;
    FreeAndNil(frmDeActiveCard);
end;

procedure TFMain.mnuNotEnterClick(Sender: TObject);
begin
    //Application.CreateForm(TfrmNotEnter, frmNotEnter);
    //frmNotEnter.ShowModal;
    //FreeAndNil(frmNotEnter);
end;

procedure TFMain.mnuModCreditReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmModCreditReport, frmModCreditReport);
    frmModCreditReport.ShowModal;
    FreeAndNil(frmModCreditReport);
end;

procedure TFMain.mnuTempBargainClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTempBargain, frmTempBargain);
    frmTempBargain.ShowModal;
    FreeAndNil(frmTempBargain);
end;

procedure TFMain.mnuNotActiveBargainClick(Sender: TObject);
begin
    Application.CreateForm(TfrmNotAcceptBargain, frmNotAcceptBargain);
    frmNotAcceptBargain.ShowModal;
    FreeAndNil(frmNotAcceptBargain);
end;

procedure TFMain.mnuAmareForooshClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAmareForoosh, frmAmareForoosh);
    frmAmareForoosh.ShowModal;
    FreeAndNil(frmAmareForoosh);
end;

procedure TFMain.mnuLabiCashierClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLabiCashier, frmLabiCashier);
    frmLabiCashier.ShowModal;
    FreeAndNil(frmLabiCashier);
end;

procedure TFMain.mnuCashClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCash, frmCash);
    frmCash.lblBozorgsal.Caption:='';
    frmCash.lblKhordsal.Caption:='';
    frmCash.lblCard.Caption:='';
    frmCash.lblCharge.Caption:='';
    frmCash.lblSum.Caption:='';
    frmCash.ShowModal;
    FreeAndNil(frmCash);
end;

procedure TFMain.mnuSendSMAClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSendSMS, frmSendSMS);
    frmSendSMS.ShowModal;
    FreeAndNil(frmSendSMS);
end;

procedure TFMain.mnuMenuListClick(Sender: TObject);
begin
    Application.CreateForm(TfrmMenuList, frmMenuList);
    frmMenuList.ShowModal;
    FreeAndNil(frmMenuList);
end;

procedure TFMain.mnuLockerWomenClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLockerWomen, frmLockerWomen);
    frmLockerWomen.ShowModal;
    FreeAndNil(frmLockerWomen);
end;

procedure TFMain.mnuSectionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSection, frmSection);
    frmSection.ShowModal;
    FreeAndNil(frmSection);
end;

procedure TFMain.mnuVisitorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmVisitor, frmVisitor);
    frmVisitor.ShowModal;
    FreeAndNil(frmVisitor);
end;


procedure TFMain.mnuCustomerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCustomer, frmCustomer);
    frmCustomer.ShowModal;
    FreeAndNil(frmCustomer);
end;

procedure TFMain.mnuSellClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSell, frmSell);
    frmSell.ShowModal;
    FreeAndNil(frmSell);
end;

procedure TFMain.mnuHealthCardClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHealthCard, frmHealthCard);
    frmHealthCard.ShowModal;
    FreeAndNil(frmHealthCard);
end;

procedure TFMain.mnuEnterOrderClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEnterOrder, frmEnterOrder);
    frmEnterOrder.edtStartDate.Text := CurrentDate;
    frmEnterOrder.edtEndDate.Text := CurrentDate;
    frmEnterOrder.edtUserID.Text := IntToStr(UserInfo.UserID);

    if UserInfo.WorkSectionID = 1 then
    begin
        frmEnterOrder.gbSummery.Visible := True;
        frmEnterOrder.pnlSearch.Visible := True;
        frmEnterOrder.edtStartDate.Enabled := True;
        frmEnterOrder.edtEndDate.Enabled := True;
        frmEnterOrder.edtUserID.Clear;
    end;
    if (UserInfo.userType = IT) or (UserInfo.userType = Supervisour) then
    begin
        frmEnterOrder.gbSummery.Visible := True;
        frmEnterOrder.pnlSearch.Visible := True;
        frmEnterOrder.edtStartDate.Enabled := True;
        frmEnterOrder.edtEndDate.Enabled := True;
        frmEnterOrder.btnExportFactor.Visible := True;
        frmEnterOrder.edtUserID.Clear;
    end;
    if (UserInfo.userType = Admin) or (UserInfo.userType = Acc) then
    begin
        frmEnterOrder.pnlSearch.Visible := True;
        frmEnterOrder.edtStartDate.Enabled := True;
        frmEnterOrder.edtEndDate.Enabled := True;
        frmEnterOrder.gbSummery.Visible := True;
        frmEnterOrder.edtUserID.Clear;
        frmEnterOrder.edtUserName.Clear;
        frmEnterOrder.edtUserID.Enabled := True;
        frmEnterOrder.btnExportFactor.Visible := True;

    end;
    frmEnterOrder.BBtnAcceptClick(Sender);
    frmEnterOrder.ShowModal;
    FreeAndNil(frmEnterOrder);
end;

procedure TFMain.mnuExportFactorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmExportFactor, frmExportFactor);
    frmExportFactor.ShowModal;
    FreeAndNil(frmExportFactor);
end;

procedure TFMain.mnuAvgPriceClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAvgPrice, frmAvgPrice);
    frmAvgPrice.ShowModal;
    FreeAndNil(frmAvgPrice);
end;

procedure TFMain.mnuPQCClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPQC, frmPQC);
    frmPQC.ShowModal;
    FreeAndNil(frmPQC);
end;

procedure TFMain.mnuLockerMap2Click(Sender: TObject);
begin
    Application.CreateForm(TfrmChangingRooms2, frmChangingRooms2);
    frmChangingRooms2.ShowModal;
    FreeAndNil(frmChangingRooms2);
end;

procedure TFMain.mnuSetLockerAndUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSetLockerAndUser, frmSetLockerAndUser);
    frmSetLockerAndUser.ShowModal;
    FreeAndNil(frmSetLockerAndUser);
end;

procedure TFMain.mnuCheckEnterClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCheckEnter, frmCheckEnter);
    frmCheckEnter.ShowModal;
    FreeAndNil(frmCheckEnter);
end;

procedure TFMain.mnuLastEnterClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLastEnter, frmLastEnter);
    frmLastEnter.ShowModal;
    FreeAndNil(frmLastEnter);
end;

procedure TFMain.mnuHotelListClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotels, frmHotels);
    frmHotels.ShowModal;
    FreeAndNil(frmHotels);
end;

procedure TFMain.mnuHotelReceptionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelReception, frmHotelReception);
    frmHotelReception.ShowModal;
    FreeAndNil(frmHotelReception);
end;

procedure TFMain.mnuHotelReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelReceptionReport, frmHotelReceptionReport);
    frmHotelReceptionReport.edtStartDate.Text := CurrentDate;
    frmHotelReceptionReport.edtEndDate.Text := CurrentDate;
    frmHotelReceptionReport.ShowModal;
    FreeAndNil(frmHotelReceptionReport);
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SystemParametersInfo(SPI_SETBEEP, 1, nil, SPIF_SENDWININICHANGE);
end;

procedure TFMain.mnuOrderGoodsClick(Sender: TObject);
begin
    Application.CreateForm(TfrmMakedGoods, frmMakedGoods);
    frmMakedGoods.ShowModal;
    FreeAndNil(frmMakedGoods);
end;

procedure TFMain.mnuSlideClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUsedAttraction, frmUsedAttraction);
    frmUsedAttraction.ShowModal;
    FreeAndNil(frmUsedAttraction);
end;

procedure TFMain.mnuIssueTicketClick(Sender: TObject);
begin
    Application.CreateForm(TfrmIssueTicket, frmIssueTicket);
    frmIssueTicket.ShowModal;
    FreeAndNil(frmIssueTicket);
end;

procedure TFMain.mnuSlideReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSlidesReport, frmSlidesReport);
    frmSlidesReport.QSlides.Close;
    frmSlidesReport.QSlides.Parameters.ParamByName('CurrentDate').Value := CurrentDate;
    frmSlidesReport.QSlides.Open;
    frmSlidesReport.ShowModal;
    FreeAndNil(frmSlidesReport);
end;

procedure TFMain.mnuOnloneShopClick(Sender: TObject);
begin
    Application.CreateForm(TfrmWebReception, frmWebReception);
    if (UserInfo.userType = IT) or (UserInfo.userType = Supervisour) or (UserInfo.userType = Admin) then
        frmWebReception.gbName.Visible := True;
    frmWebReception.ShowModal;
    FreeAndNil(frmWebReception);
end;

procedure TFMain.mnuTaxiServiceClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTaxi, frmTaxi);
    frmTaxi.ShowModal;
    FreeAndNil(frmTaxi);
end;

procedure TFMain.mnuPrivateTaxiClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPrivateTaxiInfo, frmPrivateTaxiInfo);
    frmPrivateTaxiInfo.TPrivateTaxi.Open;
    frmPrivateTaxiInfo.ShowModal;
    FreeAndNil(frmPrivateTaxiInfo);
end;

procedure TFMain.mnuCreditGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditGroup, frmCreditGroup);
    frmCreditGroup.ShowModal;
    FreeAndNil(frmCreditGroup);
end;

procedure TFMain.mnuIssueCardClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCard, frmCreditCard);
    frmCreditCard.ShowModal;
    FreeAndNil(frmCreditCard);
end;

procedure TFMain.mnuCreditIssueClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardCharge, frmCreditCardCharge);
    frmCreditCardCharge.ShowModal;
    FreeAndNil(frmCreditCardCharge);
end;

procedure TFMain.mnuCreditCardIssueTicketClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardTicket, frmCreditCardTicket);
    frmCreditCardTicket.ShowModal;
    FreeAndNil(frmCreditCardTicket);
end;

procedure TFMain.mnuCreditcardClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardChargeReport, frmCreditCardChargeReport);
    frmCreditCardChargeReport.ShowModal;
    FreeAndNil(frmCreditCardChargeReport);
end;

procedure TFMain.mnuCreditCardDiscountClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCard_Discount, frmCreditCard_Discount);
    frmCreditCard_Discount.ShowModal;
    FreeAndNil(frmCreditCard_Discount);
end;

procedure TFMain.mnuCreditDiscountClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCard_Discount, frmCreditCard_Discount);
    frmCreditCard_Discount.ShowModal;
    FreeAndNil(frmCreditCard_Discount)
end;

procedure TFMain.mnuActiveTaxiClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSetActiveTaxi, frmSetActiveTaxi);
    frmSetActiveTaxi.ShowModal;
    FreeAndNil(frmSetActiveTaxi)
end;

procedure TFMain.mnuDailyReport1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmGeneralReport, frmGeneralReport);
    frmGeneralReport.edtStartDate.Text := CurrentDate;
    frmGeneralReport.edtEndDate.Text := CurrentDate;
    frmGeneralReport.ShowModal;
    FreeAndNil(frmGeneralReport);
end;

procedure TFMain.mnuDailyReport2Click(Sender: TObject);
begin
    if UserInfo.UserID = 70 then
    begin
        Application.CreateForm(TfrmCash, frmCash);
        frmCash.ShowModal;
        FreeAndNil(frmCash);
    end
    else
    begin
        Application.CreateForm(TfrmGeneralReport, frmGeneralReport);
        frmGeneralReport.ShowModal;
        FreeAndNil(frmGeneralReport);
    end;
end;

procedure TFMain.mnuLockerRoom2Click(Sender: TObject);
begin
    Application.CreateForm(TfrmLockerRoom2, frmLockerRoom2);
    frmLockerRoom2.ShowModal;
    FreeAndNil(frmLockerRoom2);
end;

procedure TFMain.mnuBookServiceProviderClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEnterQueue, frmEnterQueue);
    frmEnterQueue.ShowModal;
    FreeAndNil(frmEnterQueue);
end;

procedure TFMain.mnuManageQueueClick(Sender: TObject);
begin
    Application.CreateForm(TfrmManageQueue, frmManageQueue);
    frmManageQueue.ShowModal;
    FreeAndNil(frmManageQueue);
end;

procedure TFMain.mnuUseClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUseQueue, frmUseQueue);
    frmUseQueue.ShowModal;
    FreeAndNil(frmUseQueue);
end;

procedure TFMain.mnuSpaceSlideClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 1;
    frmQueueTV.lblTitle.Caption := '”—”—Â ç«·Â ›÷«ÌÌ';
    frmQueueTV.Show;
end;

procedure TFMain.mnuBoomrangClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 2;
    frmQueueTV.lblTitle.Caption := '”—”—Â »Ê„—‰ê';
    frmQueueTV.Show;
end;

procedure TFMain.mnuShuttelClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 3;
    frmQueueTV.lblTitle.Caption := '”—”—Â ”›Ì‰Â';
    frmQueueTV.Show;
end;

procedure TFMain.mnuTwisterClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 4;
    frmQueueTV.lblTitle.Caption := '”—”—Â  ÊÌ” —';
    frmQueueTV.Show;
end;

procedure TFMain.mnuKamikazClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 5;
    frmQueueTV.lblTitle.Caption := '”—”—Â ò«„Ìò«“';
    frmQueueTV.Show;
end;

procedure TFMain.mnuLoopClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 6;
    frmQueueTV.lblTitle.Caption := '”—”—Â ·ÊÅ';
    frmQueueTV.Show;
end;

procedure TFMain.mnuPosClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPos, frmPos);
    frmPos.ShowModal;
    FreeAndNil(frmPos);
end;

procedure TFMain.mnuWomanGroupLockerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGroupLockerMapPhaz2, frmGroupLockerMapPhaz2);
    frmGroupLockerMapPhaz2.ShowModal;
    FreeAndNil(frmGroupLockerMapPhaz2);
end;

procedure TFMain.mnuLockerWomen2Click(Sender: TObject);
begin
    Application.CreateForm(TfrmLockerWomen2, frmLockerWomen2);
    frmLockerWomen2.ShowModal;
    FreeAndNil(frmLockerWomen2);
end;

procedure TFMain.mnuPcPosClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPcPos, frmPcPos);
    frmPcPos.ShowModal;
    FreeAndNil(frmPcPos);
end;

procedure TFMain.mnuComputerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmComputer, frmComputer);
    frmComputer.ShowModal;
    FreeAndNil(frmComputer);
end;

procedure TFMain.mnuHotelTicketingClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelTicketing, frmHotelTicketing);
    frmHotelTicketing.ShowModal;
    FreeAndNil(frmHotelTicketing);
end;

procedure TFMain.mnuWorksectionAccessClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAppMenuAccess, frmAppMenuAccess);
    frmAppMenuAccess.ShowModal;
    FreeAndNil(frmAppMenuAccess);
end;

procedure TFMain.mnuReceptionSummaryClick(Sender: TObject);
begin
    Application.CreateForm(TfrmReceptionSummaryReport, frmReceptionSummaryReport);
    frmReceptionSummaryReport.ShowModal;
    FreeAndNil(frmReceptionSummaryReport);
end;

procedure TFMain.mnuCareditCardpriceGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardPriceGroup, frmCreditCardPriceGroup);
    frmCreditCardPriceGroup.ShowModal;
    FreeAndNil(frmCreditCardPriceGroup);
end;

procedure TFMain.mnuReceptionCreditCardReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmReceptionCreditCardReport, frmReceptionCreditCardReport);
    frmReceptionCreditCardReport.ShowModal;
    FreeAndNil(frmReceptionCreditCardReport);
end;

procedure TFMain.mnuReceptionCreditGroupReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardGroupReception, frmCreditCardGroupReception);
    frmCreditCardGroupReception.ShowModal;
    FreeAndNil(frmCreditCardGroupReception);
end;

procedure TFMain.mnuShiftClick(Sender: TObject);
begin
    Application.CreateForm(TfrmManageShift, frmManageShift);
    frmManageShift.ShowModal;
    FreeAndNil(frmManageShift);
end;

procedure TFMain.mnuGroupAndShiftClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditGroupAndShift, frmCreditGroupAndShift);
    frmCreditGroupAndShift.ShowModal;
    FreeAndNil(frmCreditGroupAndShift);
end;

procedure TFMain.mnuAgeCategoryClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAgeCategory, frmAgeCategory);
    frmAgeCategory.ShowModal;
    FreeAndNil(frmAgeCategory);
end;

procedure TFMain.mnuLessonTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLessonType, frmLessonType);
    frmLessonType.ShowModal;
    FreeAndNil(frmLessonType);
end;

procedure TFMain.mnuLessonClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLesson, frmLesson);
    frmLesson.ShowModal;
    FreeAndNil(frmLesson);
end;

procedure TFMain.mnuLessonGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLessonGroup, frmLessonGroup);
    frmLessonGroup.ShowModal;
    FreeAndNil(frmLessonGroup);
end;

procedure TFMain.mnuCreditCardListClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardsList, frmCreditCardsList);
    frmCreditCardsList.ShowModal;
    FreeAndNil(frmCreditCardsList);
end;

procedure TFMain.mnuEnrollmentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEnrollment, frmEnrollment);
    frmEnrollment.ShowModal;
    FreeAndNil(frmEnrollment);
end;

procedure TFMain.mnuPayTuitionListClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPayTuitionList, frmPayTuitionList);
    frmPayTuitionList.ShowModal;
    FreeAndNil(frmPayTuitionList);
end;

procedure TFMain.mnuPoolsClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPools, frmPools);
    frmPools.ShowModal;
    FreeAndNil(frmPools);
end;

procedure TFMain.mnuRentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmRent, frmRent);
    frmRent.ShowModal;
    FreeAndNil(frmRent);
end;

procedure TFMain.mnuStudentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStudent, frmStudent);
    frmStudent.ShowModal;
    FreeAndNil(frmStudent);
end;

procedure TFMain.mnuSchoolEnrollmentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStudentEnrollment, frmStudentEnrollment);
    frmStudentEnrollment.ShowModal;
    FreeAndNil(frmStudentEnrollment);
end;

procedure TFMain.mnuTermClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTerm, frmTerm);
    frmTerm.ShowModal;
    FreeAndNil(frmTerm);
end;

procedure TFMain.mnuPayedSchoolTuitionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPayedSchoolTuition, frmPayedSchoolTuition);
    frmPayedSchoolTuition.ShowModal;
    FreeAndNil(frmPayedSchoolTuition);
end;

procedure TFMain.mnuEmployeeGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEmployeeGroup, frmEmployeeGroup);
    frmEmployeeGroup.ShowModal;
    FreeAndNil(frmEmployeeGroup);
end;

procedure TFMain.mnuEmployeesClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEmployee, frmEmployee);
    frmEmployee.ShowModal;
    FreeAndNil(frmEmployee);
end;

procedure TFMain.mnuInOutClick(Sender: TObject);
begin
    Application.CreateForm(TfrmInOut, frmInOut);
    frmInOut.ShowModal;
    FreeAndNil(frmInOut);
end;

procedure TFMain.mnuInOutListClick(Sender: TObject);
begin
    Application.CreateForm(TfrmInOutList, frmInOutList);
    frmInOutList.ShowModal;
    FreeAndNil(frmInOutList);
end;

procedure TFMain.mnuPoolSupervisorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPoolSupervisor, frmPoolSupervisor);
    frmPoolSupervisor.ShowModal;
    FreeAndNil(frmPoolSupervisor);
end;

procedure TFMain.mnupoolAndSupervisorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPoolAndSupervisor, frmPoolAndSupervisor);
    frmPoolAndSupervisor.ShowModal;
    FreeAndNil(frmPoolAndSupervisor);
end;

procedure TFMain.mnutermAndSupervisorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTermAndSupervisor, frmTermAndSupervisor);
    frmTermAndSupervisor.ShowModal;
    FreeAndNil(frmTermAndSupervisor);
end;

procedure TFMain.mnuInstructorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmInstructor, frmInstructor);
    frmInstructor.ShowModal;
    FreeAndNil(frmInstructor);
end;

procedure TFMain.mnuCourceClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCourse, frmCourse);
    frmCourse.ShowModal;
    FreeAndNil(frmCourse);
end;

procedure TFMain.mnuAgeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAgeCategory, frmAgeCategory);
    frmAgeCategory.ShowModal;
    FreeAndNil(frmAgeCategory);
end;

procedure TFMain.mnuClassClick(Sender: TObject);
begin
    Application.CreateForm(TfrmClass, frmClass);
    frmClass.ShowModal;
    FreeAndNil(frmClass);
end;

procedure TFMain.mnuStudentAndClassClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStudentAndClass, frmStudentAndClass);
    frmStudentAndClass.ShowModal;
    FreeAndNil(frmStudentAndClass);
end;

procedure TFMain.mnuFinacialObligationClick(Sender: TObject);
begin
    Application.CreateForm(TfrmFinacialObligation, frmFinacialObligation);
    frmFinacialObligation.ShowModal;
    FreeAndNil(frmFinacialObligation);
end;

procedure TFMain.mnuRollCallClick(Sender: TObject);
begin
    Application.CreateForm(TfrmRollCall, frmRollCall);
    frmRollCall.ShowModal;
    FreeAndNil(frmRollCall);
end;

procedure TFMain.mnuHolidayClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHoliday, frmHoliday);
    frmHoliday.ShowModal;
    FreeAndNil(frmHoliday);
end;

procedure TFMain.mnuAutoEnrillmentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAutoEnrollment, frmAutoEnrollment);
    frmAutoEnrollment.ShowModal;
    FreeAndNil(frmAutoEnrollment);
end;

procedure TFMain.mnuLockerRoomClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLockerRoom, frmLockerRoom);
    frmLockerRoom.ShowModal;
    FreeAndNil(frmLockerRoom);
end;

procedure TFMain.mnuViewLockersClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLockers, frmLockers);
    frmLockers.ShowModal;
    FreeAndNil(frmLockers);
    
end;

procedure TFMain.mnuLockerManagementClick(Sender: TObject);
begin
    Application.CreateForm(TfrmManageLockers, frmManageLockers);
    frmManageLockers.ShowModal;
    FreeAndNil(frmManageLockers);
end;

procedure TFMain.mnuComputerGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmComputerGroup, frmComputerGroup);
    frmComputerGroup.ShowModal;
    FreeAndNil(frmComputerGroup);
end;

procedure TFMain.mnuComputerAndGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmComputerAndCompueterGroup, frmComputerAndCompueterGroup);
    frmComputerAndCompueterGroup.ShowModal;
    FreeAndNil(frmComputerAndCompueterGroup);
end;

procedure TFMain.mnuUserAndComputerGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserAndComputerGroup, frmUserAndComputerGroup);
    frmUserAndComputerGroup.ShowModal;
    FreeAndNil(frmUserAndComputerGroup);
end;

end.

