unit IssueTicketUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, RpBase,
  RpSystem, RpDefine, RpRave, ActnList, Menus, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmIssueTicket = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    edtReceptionCode: TEdit;
    Label1: TLabel;
    edtEmail: TEdit;
    btnSearch: TBitBtn;
    Label2: TLabel;
    edtMobile: TEdit;
    Label3: TLabel;
    edtName: TEdit;
    dsVIP: TDataSource;
    DBGrid1: TDBGrid;
    QVIP: TADOQuery;
    BtnPrint: TBitBtn;
    BtnReturn: TBitBtn;
    RvProject: TRvProject;
    RvSystem: TRvSystem;
    spReception: TADOStoredProc;
    QPrint: TADOQuery;
    QCredit: TADOQuery;
    ActionList1: TActionList;
    NewCustomer: TAction;
    Save: TAction;
    ADOQuery1: TADOQuery;
    QCheckTime: TADOQuery;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuCredit: TMenuItem;
    chb2Person: TCheckBox;
    QTypeOfReception: TADOQuery;
    QUpdateUsageDateFactors: TADOQuery;
    QCheckReception: TADOQuery;
    IdHTTP1: TIdHTTP;
    procedure btnSearchClick(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure PrintReception(ReceptionID : Largeint);
    procedure ClearForm();
    procedure NewCustomerExecute(Sender: TObject);
    procedure SaveExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnuCreditClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIssueTicket: TfrmIssueTicket;

implementation

uses DMUnit, CalculatUnit, ShareUnit, CreditUnit;

{$R *.dfm}
procedure TfrmIssueTicket.ClearForm();
begin
    edtReceptionCode.Clear;
    edtEmail.Clear;
    edtMobile.Clear;
    edtName.Clear;
    QVIP.Close;
    edtReceptionCode.SetFocus;
end;
procedure TfrmIssueTicket.PrintReception(ReceptionID : Largeint);
var
Amanat, CustomerType, ReceptionType, TicketType : string;
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


    if (QPrint['KeyNumber'] <= 1016) or ((QPrint['KeyNumber'] >= 2631) and (QPrint['KeyNumber'] <= 2782)) or ((QPrint['KeyNumber'] >= 2783) and (QPrint['KeyNumber'] <= 2946)) then
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

    if QPrint['ReceptionType'] = 3 then
    begin
        QTypeOfReception.Close;
        QTypeOfReception.Parameters.ParamByName('id').Value := QPrint['other'];
        QTypeOfReception.Open;
        TicketType := QTypeOfReception['webReceptionType'];
    end
    else
        TicketType := '⁄«œÌ';
    RvProject.SetParam('ReceptionType','«Ì‰ —‰ Ì'+' -'+TicketType);
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
    RvProject.SetParam('NumberOfCustomer',QPrint['NumberOfAdult']+QPrint['NumberOfChild']);
    RvProject.ExecuteReport('EnterReport');
    RvProject.Close;

end;


procedure TfrmIssueTicket.btnSearchClick(Sender: TObject);
var
    strFilter : string;
    refundResult: string;
begin

    strFilter := '';

    if edtMobile.Text <> '' then
        strFilter := ' Mobile = '+QuotedStr(edtMobile.Text);

    if edtName.Text <> '' then
        strFilter := ' name like '+QuotedStr('%'+edtName.Text+'%');

    if edtEmail.Text <> '' then
        strFilter := ' email='+edtEmail.Text;

    if edtReceptionCode.Text <> '' then
        strFilter := ' ReceptionCode='+ QuotedStr(sha512(edtReceptionCode.Text));

    if strFilter <> '' then
    begin
        QVIP.Close;
        QVIP.SQL.Clear;
        QVIP.SQL.Add('select TFactors.*, service_centers.title serviceCenterTitle from TFactors inner join TWebReception on TFactors.TicketType = TWebReception.id');
        QVIP.SQL.Add('inner join service_centers on TFactors.service_center_id = service_centers.id');
        QVIP.SQL.Add('where isSuccess = 1 and UseDate>='+QuotedStr(CurrentDate)+' and '+strFilter);
        QVIP.Open;
    end
    else
    begin
        ShowMessage('·ÿ›« òœ Å–Ì—‘ —« Ê«—œ ‰„«ÌÌœ');
        ClearForm;
    end;
    if QVIP['id'] <> null then
        BtnPrint.Enabled := True
    else
    begin
        refundResult := IdHTTP1.get(Parameter.internetGate+'?voucher='+edtReceptionCode.Text+'&centerCode='+IntToStr(Parameter.centerCode));
        BtnPrint.Enabled := False;

    end;
end;

procedure TfrmIssueTicket.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmIssueTicket.BtnPrintClick(Sender: TObject);
var
 i, Price, numberOfLocker_2, numberOfLocker_1, numberOfChild : Integer;
 LastReceptionID, CurrentReceptionID : Largeint;
 Reception_adult, Reception_child :integer;
 printedAllTicket :Boolean;
begin
    BtnPrint.Enabled := False;
    LastReceptionID := -1;
    CurrentReceptionID := -1;
    Price:=0;
    if QVIP['name'] <> null then
    begin
      QCheckTime.Close;
      QCheckTime.Parameters.ParamByName('ticketType').Value := QVIP['TicketType'];
      QCheckTime.Open;



      if QCheckTime['nowTime'] < QCheckTime['StartTime'] then
      begin
          ShowMessage('‘Ì›  „Ê—œ ‰Ÿ— ›⁄«· ‰‘œÂ «” ');
          Exit;
      end;

      QUpdateUsageDateFactors.Close;
      QUpdateUsageDateFactors.Parameters.ParamByName('id').Value := QVIP['id'];
      QUpdateUsageDateFactors.Parameters.ParamByName('current_date').Value := CurrentDate;
      QUpdateUsageDateFactors.ExecSQL;

      QCheckReception.Close;
      QCheckReception.Parameters.ParamByName('Order_id').Value:=QVIP['id'];
      QCheckReception.Open;
      if QCheckReception['NumberOfAdult']<>null then
        Reception_adult := QCheckReception['NumberOfAdult']
      else
        Reception_adult := 0;

      if QCheckReception['NumberOfChild']<>null then
        Reception_child := QCheckReception['NumberOfChild']
      else
        Reception_child := 0;


      if (QVIP['number'] + QVIP['child_amount']) <= (Reception_adult + Reception_child) then
        printedAllTicket := True;

      if printedAllTicket then
      begin
          ShowMessage('»·Ìÿ «Ì‰ „ÌÂ„«‰ ﬁ»·« ’«œ— ê—œÌœÂ «” ');
          ClearForm;
          Exit;
      end;

      QVIP.Edit;
      QVIP['Used']:=1;
      QVIP.Post;

      spReception.Parameters.ParamByName('@JumpClosed').Value:=1;
      if QVIP['mobile'] <> null then
          spReception.Parameters.ParamByName('@mobile_number').Value:=QVIP['mobile']
      else
          spReception.Parameters.ParamByName('@mobile_number').Value:='';
      numberOfLocker_2 := 0;
      numberOfLocker_1 := 0;
      if chb2Person.Checked then
      begin
          numberOfLocker_2 := (QVIP['number']-Reception_adult) div 2;
          numberOfLocker_1 := (QVIP['number']-Reception_adult) mod 2;
      end
      else
      begin
          numberOfLocker_2 := 0;
          numberOfLocker_1 := QVIP['number']-Reception_adult;
      end;

      numberOfChild := QVIP['child_amount']-Reception_Child;

      for i:=1 to numberOfLocker_1 do
      begin
        spReception.Parameters.ParamByName('@CustomerName').Value:=QVIP['name'];
        spReception.Parameters.ParamByName('@CustomerType').Value:=1;
        spReception.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
        spReception.Parameters.ParamByName('@ReceptionType').Value:=3;
        spReception.Parameters.ParamByName('@Shift').Value:=Parameter.Shift;
        spReception.Parameters.ParamByName('@Credit').Value:=0;
        spReception.Parameters.ParamByName('@Mobile').Value:=0;
        spReception.Parameters.ParamByName('@Pool').Value:=0;
        spReception.Parameters.ParamByName('@Saat').Value:=0;
        spReception.Parameters.ParamByName('@AngoshtarPlak').Value:=0;
        spReception.Parameters.ParamByName('@Sooeech').Value:=0;
        spReception.Parameters.ParamByName('@Asnad').Value:=0;
        spReception.Parameters.ParamByName('@Pakhsh').Value:=0;
        spReception.Parameters.ParamByName('@KeefPool').Value:=0;
        spReception.Parameters.ParamByName('@Samsonet').Value:=0;

        spReception.Parameters.ParamByName('@Other').Value:= QVIP['TicketType'];

        spReception.Parameters.ParamByName('@Price').Value:= 0;
        spReception.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
        spReception.Parameters.ParamByName('@CardID').Value:=1;
        spReception.Parameters.ParamByName('@CardID2').Value:=1;
        spReception.Parameters.ParamByName('@CardID3').Value:=1;
        spReception.Parameters.ParamByName('@NumberOfAdult').Value:=1;

        if numberOfChild > 0 then
        begin
            spReception.Parameters.ParamByName('@NumberOfChild').Value:=1;
            numberOfChild := numberOfChild -1;
        end
        else
            spReception.Parameters.ParamByName('@NumberOfChild').Value:=0;
            
        spReception.Parameters.ParamByName('@Discount').Value:=0;
        spReception.Parameters.ParamByName('@OrderID').Value:= QVIP['id'];
        spReception.Parameters.ParamByName('@HotelReceptionID').Value:= 0;
        spReception.Parameters.ParamByName('@KinderGarten').Value:= 0;
        spReception.ExecProc;
        spReception.Parameters.ParamByName('@JumpClosed').Value:=0;
        CurrentReceptionID :=spReception.Parameters.ParamByName('@ReceptionID').Value;
        if CurrentReceptionID <> LastReceptionID then
        begin
    /////////////////// Charge Crdit ///////////////////////////////////
            {if strToInt(SG.Cells[3,i])>0 then
            begin
                SP_Credit.Parameters.ParamByName('@ReceptionID').Value:=spReception.Parameters.ParamByName('@ReceptionID').Value;
                SP_Credit.Parameters.ParamByName('@CreditID').Value:=-1;
                SP_Credit.Parameters.ParamByName('@Credit').Value:=SG.Cells[3,i];
                SP_Credit.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
                SP_Credit.Parameters.ParamByName('@Action').Value:='Insert';
                SP_Credit.ExecProc;
            end; }
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



      for i:=1 to numberOfLocker_2 do
      begin
        spReception.Parameters.ParamByName('@CustomerName').Value:=QVIP['name'];
        spReception.Parameters.ParamByName('@CustomerType').Value:=1;
        spReception.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
        spReception.Parameters.ParamByName('@ReceptionType').Value:=3;
        spReception.Parameters.ParamByName('@Shift').Value:=Parameter.Shift;
        spReception.Parameters.ParamByName('@Credit').Value:=0;
        spReception.Parameters.ParamByName('@Mobile').Value:=0;
        spReception.Parameters.ParamByName('@Pool').Value:=0;
        spReception.Parameters.ParamByName('@Saat').Value:=0;
        spReception.Parameters.ParamByName('@AngoshtarPlak').Value:=0;
        spReception.Parameters.ParamByName('@Sooeech').Value:=0;
        spReception.Parameters.ParamByName('@Asnad').Value:=0;
        spReception.Parameters.ParamByName('@Pakhsh').Value:=0;
        spReception.Parameters.ParamByName('@KeefPool').Value:=0;
        spReception.Parameters.ParamByName('@Samsonet').Value:=0;

        spReception.Parameters.ParamByName('@Other').Value:= QVIP['TicketType'];

        spReception.Parameters.ParamByName('@Price').Value:= 0;
        spReception.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
        spReception.Parameters.ParamByName('@CardID').Value:=1;
        spReception.Parameters.ParamByName('@CardID2').Value:=1;
        spReception.Parameters.ParamByName('@CardID3').Value:=1;
        spReception.Parameters.ParamByName('@NumberOfAdult').Value:=2;
        spReception.Parameters.ParamByName('@NumberOfChild').Value:=0;
        spReception.Parameters.ParamByName('@Discount').Value:=0;
        spReception.Parameters.ParamByName('@OrderID').Value:= 0;
        spReception.Parameters.ParamByName('@HotelReceptionID').Value:= 0;
        spReception.Parameters.ParamByName('@KinderGarten').Value:= 0;
        spReception.ExecProc;
        spReception.Parameters.ParamByName('@JumpClosed').Value:=0;
        CurrentReceptionID :=spReception.Parameters.ParamByName('@ReceptionID').Value;
        if CurrentReceptionID <> LastReceptionID then
        begin
    /////////////////// Charge Crdit ///////////////////////////////////
            {if strToInt(SG.Cells[3,i])>0 then
            begin
                SP_Credit.Parameters.ParamByName('@ReceptionID').Value:=spReception.Parameters.ParamByName('@ReceptionID').Value;
                SP_Credit.Parameters.ParamByName('@CreditID').Value:=-1;
                SP_Credit.Parameters.ParamByName('@Credit').Value:=SG.Cells[3,i];
                SP_Credit.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
                SP_Credit.Parameters.ParamByName('@Action').Value:='Insert';
                SP_Credit.ExecProc;
            end; }
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

      ////////////// »ﬁÌÂ Œ—œ”«·Â«
      numberOfLocker_2 := 0;
      numberOfLocker_1 := 0;
      if chb2Person.Checked  then
      begin
          numberOfLocker_2 := (numberOfChild) div 2;
          numberOfLocker_1 := (numberOfChild) mod 2;
      end
      else
      begin
          numberOfLocker_2 := 0;
          numberOfLocker_1 := numberOfChild;
      end;

      for i:=1 to numberOfLocker_1 do
      begin
        spReception.Parameters.ParamByName('@CustomerName').Value:=QVIP['name'];
        spReception.Parameters.ParamByName('@CustomerType').Value:=1;
        spReception.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
        spReception.Parameters.ParamByName('@ReceptionType').Value:=3;
        spReception.Parameters.ParamByName('@Shift').Value:=1;
        spReception.Parameters.ParamByName('@Credit').Value:=0;
        spReception.Parameters.ParamByName('@Mobile').Value:=0;
        spReception.Parameters.ParamByName('@Pool').Value:=0;
        spReception.Parameters.ParamByName('@Saat').Value:=0;
        spReception.Parameters.ParamByName('@AngoshtarPlak').Value:=0;
        spReception.Parameters.ParamByName('@Sooeech').Value:=0;
        spReception.Parameters.ParamByName('@Asnad').Value:=0;
        spReception.Parameters.ParamByName('@Pakhsh').Value:=0;
        spReception.Parameters.ParamByName('@KeefPool').Value:=0;
        spReception.Parameters.ParamByName('@Samsonet').Value:=0;

        spReception.Parameters.ParamByName('@Other').Value:= QVIP['TicketType'];

        spReception.Parameters.ParamByName('@Price').Value:= 0;
        spReception.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
        spReception.Parameters.ParamByName('@CardID').Value:=1;
        spReception.Parameters.ParamByName('@CardID2').Value:=1;
        spReception.Parameters.ParamByName('@CardID3').Value:=1;
        spReception.Parameters.ParamByName('@NumberOfAdult').Value:=0;

        spReception.Parameters.ParamByName('@NumberOfChild').Value:=1;

        spReception.Parameters.ParamByName('@Discount').Value:=0;
        spReception.Parameters.ParamByName('@OrderID').Value:= 0;
        spReception.Parameters.ParamByName('@HotelReceptionID').Value:= 0;
        spReception.Parameters.ParamByName('@KinderGarten').Value:= 0;
        spReception.ExecProc;
        spReception.Parameters.ParamByName('@JumpClosed').Value:=0;
        CurrentReceptionID :=spReception.Parameters.ParamByName('@ReceptionID').Value;
        if CurrentReceptionID <> LastReceptionID then
        begin
    /////////////////// Charge Crdit ///////////////////////////////////
            {if strToInt(SG.Cells[3,i])>0 then
            begin
                SP_Credit.Parameters.ParamByName('@ReceptionID').Value:=spReception.Parameters.ParamByName('@ReceptionID').Value;
                SP_Credit.Parameters.ParamByName('@CreditID').Value:=-1;
                SP_Credit.Parameters.ParamByName('@Credit').Value:=SG.Cells[3,i];
                SP_Credit.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
                SP_Credit.Parameters.ParamByName('@Action').Value:='Insert';
                SP_Credit.ExecProc;
            end; }
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


      for i:=1 to numberOfLocker_2 do
      begin
        spReception.Parameters.ParamByName('@CustomerName').Value:=QVIP['name'];
        spReception.Parameters.ParamByName('@CustomerType').Value:=1;
        spReception.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
        spReception.Parameters.ParamByName('@ReceptionType').Value:=3;
        spReception.Parameters.ParamByName('@Shift').Value:=1;
        spReception.Parameters.ParamByName('@Credit').Value:=0;
        spReception.Parameters.ParamByName('@Mobile').Value:=0;
        spReception.Parameters.ParamByName('@Pool').Value:=0;
        spReception.Parameters.ParamByName('@Saat').Value:=0;
        spReception.Parameters.ParamByName('@AngoshtarPlak').Value:=0;
        spReception.Parameters.ParamByName('@Sooeech').Value:=0;
        spReception.Parameters.ParamByName('@Asnad').Value:=0;
        spReception.Parameters.ParamByName('@Pakhsh').Value:=0;
        spReception.Parameters.ParamByName('@KeefPool').Value:=0;
        spReception.Parameters.ParamByName('@Samsonet').Value:=0;

        spReception.Parameters.ParamByName('@Other').Value:= QVIP['TicketType'];

        spReception.Parameters.ParamByName('@Price').Value:= 0;
        spReception.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
        spReception.Parameters.ParamByName('@CardID').Value:=1;
        spReception.Parameters.ParamByName('@CardID2').Value:=1;
        spReception.Parameters.ParamByName('@CardID3').Value:=1;
        spReception.Parameters.ParamByName('@NumberOfAdult').Value:=0;
        spReception.Parameters.ParamByName('@NumberOfChild').Value:=2;
        spReception.Parameters.ParamByName('@Discount').Value:=0;
        spReception.Parameters.ParamByName('@OrderID').Value:= 0;
        spReception.Parameters.ParamByName('@HotelReceptionID').Value:= 0;
        spReception.Parameters.ParamByName('@KinderGarten').Value:= 0;
        spReception.ExecProc;
        spReception.Parameters.ParamByName('@JumpClosed').Value:=0;
        CurrentReceptionID :=spReception.Parameters.ParamByName('@ReceptionID').Value;
        if CurrentReceptionID <> LastReceptionID then
        begin
    /////////////////// Charge Crdit ///////////////////////////////////
            {if strToInt(SG.Cells[3,i])>0 then
            begin
                SP_Credit.Parameters.ParamByName('@ReceptionID').Value:=spReception.Parameters.ParamByName('@ReceptionID').Value;
                SP_Credit.Parameters.ParamByName('@CreditID').Value:=-1;
                SP_Credit.Parameters.ParamByName('@Credit').Value:=SG.Cells[3,i];
                SP_Credit.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
                SP_Credit.Parameters.ParamByName('@Action').Value:='Insert';
                SP_Credit.ExecProc;
            end; }
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


      QVIP.Edit;
      QVIP['Used']:=1;
      QVIP.Post;      
    end;
    ClearForm;
end;

procedure TfrmIssueTicket.NewCustomerExecute(Sender: TObject);
begin
    ClearForm;
end;

procedure TfrmIssueTicket.SaveExecute(Sender: TObject);
begin
    BtnPrintClick(Sender);
end;

procedure TfrmIssueTicket.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmIssueTicket.mnuCreditClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCredit, frmCredit);
    frmCredit.ShowModal;
    FreeAndNil(frmCredit);
end;

procedure TfrmIssueTicket.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    {if (UserInfo.userType = IT) or (UserInfo.userType = Admin) or (UserInfo.userType = Supervisour) then
    begin

    end;}
    If QVIP['Used']=False then
      DBGrid1.Canvas.Brush.Color:=clTeal;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

end.
