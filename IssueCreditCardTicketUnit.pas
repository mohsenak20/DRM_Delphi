unit IssueCreditCardTicketUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, RpBase, RpSystem, RpDefine, RpRave;

type
  TfrmIssueCreditCardTicket = class(TForm)
    Label2: TLabel;
    edtCreditCardID: TEdit;
    BtnPrint: TBitBtn;
    QCreditCard: TADOQuery;
    spReception: TADOStoredProc;
    RvProject: TRvProject;
    RvSystem: TRvSystem;
    QPrint: TADOQuery;
    QCredit: TADOQuery;
    QCheckIssueTicket: TADOQuery;
    procedure BtnPrintClick(Sender: TObject);
    procedure PrintReception(ReceptionID : Largeint);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIssueCreditCardTicket: TfrmIssueCreditCardTicket;

implementation

uses ShareUnit, CalculatUnit, DMUnit;

{$R *.dfm}

procedure TfrmIssueCreditCardTicket.BtnPrintClick(Sender: TObject);
begin
    QCreditCard.Close;
    QCreditCard.Parameters.ParamByName('CreditCardID').Value := edtCreditCardID.Text;
    QCreditCard.Parameters.ParamByName('NID').Value := '-1';
    QCreditCard.Open;
    if QCreditCard['CardID'] <> null then
    begin
        QCheckIssueTicket.Close;
        QCheckIssueTicket.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
        QCheckIssueTicket.Parameters.ParamByName('CreditCardID').Value := edtCreditCardID.Text;
        QCheckIssueTicket.Open;
        if QCheckIssueTicket['ReceptionID'] <> null then
        begin
            ShowMessage('»—«Ì «Ì‰ ò«—  œ—  «—ÌŒ Ã«—Ì »·Ìÿ ’«œ— ê—œÌœÂ «”  Ê «„ò«‰ ’œÊ— „Ãœœ »·Ìÿ ‰„Ì »«‘œ.');
            Exit;
            Close;
        end;

        if (QCreditCard['allSession']- QCreditCard['used'] < 1) then
        begin
            ShowMessage('·ÿ›« ò«—  —« ‘«—é ‰„«ÌÌœ.');
            Exit;
        end;

          spReception.Parameters.ParamByName('@JumpClosed').Value:=1;


          spReception.Parameters.ParamByName('@OrderID').Value:= 0;

          spReception.Parameters.ParamByName('@CustomerName').Value:= QCreditCard['Name'];
          spReception.Parameters.ParamByName('@CustomerType').Value:=1;
          spReception.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
          spReception.Parameters.ParamByName('@ReceptionType').Value:=4;
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

          spReception.Parameters.ParamByName('@Other').Value:= '';

          spReception.Parameters.ParamByName('@Price').Value:= 0;
          spReception.Parameters.ParamByName('@UserID').Value := UserInfo.UserID;
          spReception.Parameters.ParamByName('@CardID').Value:=1;
          spReception.Parameters.ParamByName('@CardID2').Value:=1;
          spReception.Parameters.ParamByName('@CardID3').Value:=1;
          spReception.Parameters.ParamByName('@NumberOfAdult').Value:=1;
          spReception.Parameters.ParamByName('@NumberOfChild').Value:=0;
          spReception.Parameters.ParamByName('@Discount').Value:=0;
          spReception.Parameters.ParamByName('@HotelReceptionID').Value:= 0;
          spReception.Parameters.ParamByName('@KinderGarten').Value:= 0;
          spReception.Parameters.ParamByName('@CreditCardID').Value:= QCreditCard['CardID'];
          spReception.ExecProc;
          PrintReception(spReception.Parameters.ParamByName('@ReceptionID').Value);
          Close;
    end;
end;

procedure TfrmIssueCreditCardTicket.PrintReception(ReceptionID : Largeint);
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
        TicketType := QPrint['other']
    else
        TicketType := '⁄«œÌ';
    RvProject.SetParam('ReceptionType','«⁄ »«—Ì'+' -'+TicketType);
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






end.
