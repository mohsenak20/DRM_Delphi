unit CreditCardTicketUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, RpRave,
  RpDefine, RpBase, RpSystem, Menus;

type
  TfrmCreditCardTicket = class(TForm)
    Panel1: TPanel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    lblCard: TLabel;
    DBGrid1: TDBGrid;
    SP_CreditCardCharge: TADOStoredProc;
    dsReception: TDataSource;
    QCreditCard: TADOQuery;
    Label1: TLabel;
    Label3: TLabel;
    edtSubSetNumber: TEdit;
    Label7: TLabel;
    Shape1: TShape;
    Image: TImage;
    Label2: TLabel;
    edtCreditCardID: TEdit;
    BBtnAccept: TBitBtn;
    btnSearch: TBitBtn;
    Shape2: TShape;
    subPic1: TImage;
    Shape3: TShape;
    subPic2: TImage;
    Shape4: TShape;
    subPic3: TImage;
    Label6: TLabel;
    Label8: TLabel;
    lblCardID: TLabel;
    lblAllSession: TLabel;
    lblUsed: TLabel;
    lblNID: TLabel;
    lblName: TLabel;
    Label4: TLabel;
    lblMod: TLabel;
    chb2Person: TCheckBox;
    spReception: TADOStoredProc;
    RvSystem: TRvSystem;
    RvProject: TRvProject;
    QPrint: TADOQuery;
    QCredit: TADOQuery;
    QReception: TADOQuery;
    QSubCreditCard: TADOQuery;
    edtNID: TEdit;
    Label5: TLabel;
    gbDiscount: TGroupBox;
    edtDiscount: TEdit;
    Label9: TLabel;
    chbDiscount: TCheckBox;
    Label10: TLabel;
    lblType: TLabel;
    Label12: TLabel;
    lblTypeTitle: TLabel;
    QAdultPrice: TADOQuery;
    SP_Order: TADOStoredProc;
    btnFreeTicket: TBitBtn;
    qFreeTicket: TADOQuery;
    qUpdateFreeTicket: TADOQuery;
    sp_Price: TADOStoredProc;
    Shape5: TShape;
    subPic4: TImage;
    Shape6: TShape;
    subPic5: TImage;
    Shape7: TShape;
    subPic6: TImage;
    Label11: TLabel;
    edtGeneralCode: TEdit;
    ADOQuery1: TADOQuery;
    Label13: TLabel;
    edtOwner: TEdit;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuDeposit: TMenuItem;
    QIsInShift: TADOQuery;
    Label14: TLabel;
    lblCreditCardType: TLabel;
    QCheckRestrictRule: TADOQuery;
    QGetDate: TADOQuery;
    lblSubSetName1: TLabel;
    lblSubSetName2: TLabel;
    lblSubSetName3: TLabel;
    lblSubSetName4: TLabel;
    lblSubSetName5: TLabel;
    lblSubSetName6: TLabel;
    lblCreditGroupTitle: TLabel;
    N2: TMenuItem;
    mnuNew: TMenuItem;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure ClearForm();
    procedure PrintReception(ReceptionID : Largeint);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure chbDiscountClick(Sender: TObject);
    procedure btnFreeTicketClick(Sender: TObject);
    procedure edtCreditCardIDExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnuDepositClick(Sender: TObject);
    function calcPrice(owner: integer; subSet: integer):integer;
    procedure btnSearchClick(Sender: TObject);
    procedure saveCredit(price: integer);
    procedure mnuNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreditCardTicket: TfrmCreditCardTicket;
  isNotInShift : Boolean;
implementation

uses DMUnit, CalculatUnit, ShareUnit, SpecialCreditCardReportUnit,
  CreditCardGroupInfoUnit, Math, CreditCardChargeUnit, enrollmentInfoUnit,
  UFarsiDate, CredeitCardInfoUnit;

{$R *.dfm}
procedure TfrmCreditCardTicket.saveCredit(price: integer);
begin
    SP_CreditCardCharge.Parameters.ParamByName('@CreditCardChargeID').Value:=-1;
    SP_CreditCardCharge.Parameters.ParamByName('@CreditCardID').Value:= lblCardID.Caption;
    SP_CreditCardCharge.Parameters.ParamByName('@Price').Value:=price;
    SP_CreditCardCharge.Parameters.ParamByName('@ChargeDate').Value:=CurrentDate;
    SP_CreditCardCharge.Parameters.ParamByName('@NumberOfSession').Value:= 0;
    SP_CreditCardCharge.Parameters.ParamByName('@ChargeGroupID').Value:= QCreditCard['CreditGroupID'];
    SP_CreditCardCharge.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_CreditCardCharge.Parameters.ParamByName('@Action').Value:='Insert';
    SP_CreditCardCharge.ExecProc;
end;

function TfrmCreditCardTicket.calcPrice(owner: integer; subSet: integer):integer;
var
price : integer;
begin
    price := 0;
    if isNotInShift then
      price := owner * QCreditCard['price2'] + subSet * QCreditCard['subSetPrice2']
    else
      price := owner * QCreditCard['price'] + subSet * QCreditCard['subSetPrice'];
    calcPrice := price;
end;

procedure TfrmCreditCardTicket.PrintReception(ReceptionID : Largeint);
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
    RvProject.SetParam('coName', Parameter.CoName);
    RvProject.SetParam('ReceptionDate',QPrint['ReceptionDate']);
    RvProject.SetParam('StartTime',QPrint['StartTime']);

    RvProject.SetParam('KeyNumber',IntToStr(QPrint['KeyNumber']));
    RvProject.SetParam('ChangingRoom','—Œ ò‰1');
    RvProject.SetParam('LockerCode','');
    RvProject.SetParam('RowNumber',' —œÌ›1 -');

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



procedure TfrmCreditCardTicket.ClearForm();
begin
    edtOwner.Clear;
    edtSubSetNumber.Clear;
    edtCreditCardID.Clear;
    lblCardID.Caption := '';
    lblName.Caption := '';
    lblNID.Caption := '';
    lblAllSession.Caption := '';
    lblUsed.Caption := '';
    lblMod.Caption := '';
    lblType.Caption := '';
    lblTypeTitle.Caption := '';
    lblCreditCardType.Caption := '';
    Image.Picture.LoadFromFile('');
    subPic1.Picture.LoadFromFile('');
    subPic2.Picture.LoadFromFile('');
    subPic3.Picture.LoadFromFile('');
    subPic4.Picture.LoadFromFile('');
    subPic5.Picture.LoadFromFile('');
    subPic6.Picture.LoadFromFile('');
    lblSubSetName1.Caption := '';
    lblSubSetName2.Caption := '';
    lblSubSetName3.Caption := '';
    lblSubSetName4.Caption := '';
    lblSubSetName5.Caption := '';
    lblSubSetName6.Caption := '';
    edtCreditCardID.SetFocus;
    edtNID.Clear;
    edtGeneralCode.Clear;
    lblCreditGroupTitle.Caption := '';
    BtnSave.Enabled := True;
end;

procedure TfrmCreditCardTicket.BBtnAcceptClick(Sender: TObject);
var
i, session : integer;
strFilter : string;

begin
    isNotInShift := False;
    if edtCreditCardID.Text <> '' then
      strFilter := 'CardID='+QuotedStr(edtCreditCardID.Text);

    if edtNID.Text <> '' then
      strFilter := 'NID='+QuotedStr(edtNID.Text);

    if edtGeneralCode.Text <> '' then
      strFilter := 'generalCode='+QuotedStr(edtGeneralCode.Text);

    QCreditCard.Close;
    QCreditCard.SQL.Clear;
    QCreditCard.SQL.Add('Declare @CardID nvarchar(10), @purchased int, @used int');
    QCreditCard.SQL.Add('select @CardID = CardID from TCreditCard');
    QCreditCard.SQL.Add('where '+strFilter);
    QCreditCard.SQL.Add('select @purchased = SUM(price) from TCreditCardCharge where CreditCardID = @CardID');
    QCreditCard.SQL.Add('if @purchased is null set @purchased = 0');
    QCreditCard.SQL.Add('select @used = SUM((creditCardOwnerPrice*creditCardOwner)+(creditCardSubSetPrice*creditCardSubSet)) from TReception where CreditCardID = @CardID');
    QCreditCard.SQL.Add('if @used is null set @used = 0');
    QCreditCard.SQL.Add('select TCreditCard.id creditCardId, CardID, Name+'' ''+lastName Name, NID, FatherName, Address, Tel, TCReditGroup.CreditGroupID, FreeTicket, price, subSetPrice,');
    QCreditCard.SQL.Add('Pic, IssueDate, IssueTime, UserID, Active, Type, TCreditCardType.Title, TCreditGroup.CreditGroupName ,PriceForReception, ');
    QCreditCard.SQL.Add('Comment, @used used, @purchased purchased, NumberOfCustomer, startFreeTicketDate, endFreeTicketDate, isRestrictForEachPerson,');
    QCreditCard.SQL.Add('TcreditCard.notActive notActive, canUseInOtherShift, price2, subSetPrice2, isLesson, isSession, hasRestrictRule, session, day');
    QCreditCard.SQL.Add('from TCreditCard inner join TCReditGroup on TCreditCard.CreditGroupID = TCReditGroup.CreditGroupID');
    QCreditCard.SQL.Add('inner join TCreditCardPriceGroup on TCReditGroup.priceGroupId = TCreditCardPriceGroup.id');
    QCreditCard.SQL.Add('inner join TCreditCardType on TCreditCard.Type = TCreditCardType.id');
    QCreditCard.SQL.Add('where CardID = @CardID');
    QCreditCard.Open;

    if QCreditCard['CardID'] <> null then
    begin

        if QCreditCard['hasRestrictRule'] then
        begin
            QGetDate.Close;
            QGetDate.Parameters.ParamByName('days').Value := QCreditCard['day'];
            QGetDate.Open;

            QCheckRestrictRule.Close;
            QCheckRestrictRule.Parameters.ParamByName('cardId').Value := QCreditCard['cardId'];
            QCheckRestrictRule.Parameters.ParamByName('baseDate').Value := TFarDate.MiladyToShamsistr(QGetDate['baseDate']);
            QCheckRestrictRule.Open;
            if QCreditCard['isRestrictForEachPerson'] then
              session := QCreditCard['session'] * (QCreditCard['NumberOfCustomer']+1)
            else
              session := QCreditCard['session'];

            if QCheckRestrictRule['ticketCount'] >= session then
            begin
                ShowMessage('„ÕœÊœÌ  «” ›«œÂ “„«‰Ì »—«Ì «Ì‰ „ÌÂ„«‰  ò„Ì· ‘œÂ «” ');
                ClearForm;
                Exit;
            end;

        end;

        QIsInShift.Close;
        QIsInShift.Parameters.ParamByName('CreditGroupID').Value := QCreditCard['CreditGroupID'];
        QIsInShift.Open;
        if QIsInShift['id'] = null then
        begin
            if not QCreditCard['canUseInOtherShift'] then
              ShowMessage('«„ò«‰ Å–Ì—‘ „ÌÂ„«‰ Œ«—Ã «“ ‘Ì›  ‰„Ì »«‘œ');
            isNotInShift := True;
        end;


        if ((QCreditCard['freeTicket'] = True) and (QCreditCard['startFreeTicketdate'] <= CurrentDate) and (QCreditCard['endFreeTicketDate'] >= CurrentDate)) then
        begin
            btnFreeTicket.Enabled := True;
            ShowMessage('«Ì‰ ò«—  ‘«„· Ìò Ã·”Â ÂœÌÂ „Ì »«‘œ.');
        end;
        lblCardID.Caption := QCreditCard['CardID'];
        lblName.Caption := QCreditCard['Name'];
        lblNID.Caption := QCreditCard['NID'];
        lblAllSession.Caption := FormatFloat('#,', QCreditCard['purchased']);
        lblUsed.Caption := FormatFloat('#,',QCreditCard['used']);
        lblMod.Caption := FormatFloat('#,',QCreditCard['purchased']-QCreditCard['used']);
        lblType.Caption := IntToStr(QCreditCard['Type']);
        lblTypeTitle.Caption := QCreditCard['Title'];
        lblCreditGroupTitle.Caption := QCreditCard['CreditGroupName'];
        if QCreditCard['isLesson'] then
        begin
          lblTypeTitle.Caption := lblTypeTitle.Caption + ' - ¬„Ê“‘Ì';
          lblCreditCardType.Caption := '¬„Ê“‘Ì';
          edtOwner.Text := '1';
        end
        else
        begin
          lblTypeTitle.Caption := lblTypeTitle.Caption + ' - ⁄÷ÊÌ ';
          lblCreditCardType.Caption := '⁄÷ÊÌ ';
          edtOwner.Clear;
        end;
        if lblType.Caption = '2' then
        begin
             ShowMessage('ò«— Â«Ì  Œ›Ì›Ì €Ì— ›⁄«· „Ì »«‘‰œ');
             ClearForm;
             Exit;
            //chbDiscount.Checked := True;
            //gbDiscount.Enabled := True;
        end
        else
        begin
            chbDiscount.Checked := False;
            gbDiscount.Enabled := False;
        end;
        QAdultPrice.Close;
        QAdultPrice.Open;
        if QAdultPrice['Bozorgsal']<>null then
            Parameter.Bozorgsal:= QAdultPrice['Bozorgsal'];
        if (Parameter.Bozorgsal-QCreditCard['PriceForReception'] <= 0) then
            edtDiscount.Text := '0'
        else
            edtDiscount.Text := Parameter.Bozorgsal-QCreditCard['PriceForReception'];

        Image.Picture.LoadFromFile('');
        subPic1.Picture.LoadFromFile('');
        subPic2.Picture.LoadFromFile('');
        subPic3.Picture.LoadFromFile('');
        subPic4.Picture.LoadFromFile('');
        subPic5.Picture.LoadFromFile('');
        subPic6.Picture.LoadFromFile('');

        if FileExists(Parameter.URL_Pic+'\'+QCreditCard['pic']) then
          Image.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QCreditCard['pic']);

        QSubCreditCard.Close;
        QSubCreditCard.Parameters.ParamByName('CreditCardID').Value := lblCardID.Caption;
        QSubCreditCard.Open;
        i := 1;
        while not QSubCreditCard.Eof do
        begin
            if (i=1) then lblSubSetName1.Caption := QSubCreditCard['name'];
            if (i=2) then lblSubSetName2.Caption := QSubCreditCard['name'];
            if (i=3) then lblSubSetName3.Caption := QSubCreditCard['name'];
            if (i=4) then lblSubSetName4.Caption := QSubCreditCard['name'];
            if (i=5) then lblSubSetName5.Caption := QSubCreditCard['name'];
            if (i=6) then lblSubSetName6.Caption := QSubCreditCard['name'];

            if (i=1)  and (FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic'])) then  subPic1.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            if (i=2)  and (FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic'])) then  subPic2.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            if (i=3)  and (FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic'])) then  subPic3.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            if (i=4)  and (FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic'])) then  subPic4.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            if (i=5)  and (FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic'])) then  subPic5.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            if (i=6)  and (FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic'])) then  subPic6.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            i := i+1;
            QSubCreditCard.Next;
        end;
        if QCreditCard['notActive'] then
        begin
            ShowMessage('«Ì‰ ò«—  €Ì— ›⁄«· „Ì »«‘œ.');
            ClearForm;
            Exit;
        end;
        
    end
    else
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— Ì«›  ‰‘œ');
        ClearForm;
    end;

    edtOwner.SetFocus;
end;

procedure TfrmCreditCardTicket.BtnSaveClick(Sender: TObject);
var
 i, Price, numberOfLocker_2, numberOfLocker_1 : Integer;
 LastReceptionID, CurrentReceptionID : Largeint;
 owner, subSet, ownerPrice, subSetPrice, creditNeed : integer;
 issuTickerForOwner: Boolean;
begin
    BtnSave.Enabled := False;
    if lblCardID.Caption = '' then Exit;
    if isNotInShift and not QCreditCard['canUseInOtherShift'] then
    begin
        ShowMessage('«„ò«‰ Å–Ì—‘ „ÌÂ„«‰ Œ«—Ã «“ ‘Ì›  ‰„Ì »«‘œ');
        Exit;
    end;
    issuTickerForOwner:= True;
    owner := StrToIntDef(edtOwner.Text, 0);
    subSet := StrToIntDef(edtSubSetNumber.Text, 0);
    if owner > 1 then
    begin
      ShowMessage('œ«—‰œÂ ò«—  Ìò ‰›— ’ÕÌÕ „Ì »«‘œ');
      Exit;
    end;
    if (owner + subSet) = 0 then
    begin
        ShowMessage('·ÿ›«  ⁄œ«œ —« »Â ’Ê—  ’ÕÌÕ Ê«—œ ‰„«ÌÌœ');
        Exit;
    end;
    if (owner = 1) then
        issuTickerForOwner := False;

    price := calcPrice(owner, subSet);

    if (Price > strToint(Money2Number(lblMod.Caption))) and (lblType.Caption='1') then
    begin
        creditNeed := Price - strToint(Money2Number(lblMod.Caption));
        if (MessageBox(Self.Handle, pchar('‘«—é «⁄ »«— ò„ — «“ Â“Ì‰Â Ê—ÊœÌ „Ì »«‘œ'+' ¬Ì« „»·€ '+intToStr(creditNeed)+' ‘«—é ‘Êœ') ,'‘«—é «⁄ »«—',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo) then
        begin
            ClearForm;
            Exit;
        end;
        saveCredit(creditNeed);
    end;
    LastReceptionID := -1;
    CurrentReceptionID := -1;


    if (subSet) >  QCreditCard['NumberOfCustomer'] then
    begin
        ShowMessage(' ⁄œ«œ Å–Ì—‘ »Ì‘ — «“  ⁄œ«œ „Ã«“ „Ì »«‘œ');
        Exit;
    end;
      spReception.Parameters.ParamByName('@lessonId').Value:= -1;
      spReception.Parameters.ParamByName('@JumpClosed').Value:=1;
      if QCreditCard['isLesson'] then
      begin
        Application.CreateForm(TfrmEnrollmentInfo, frmEnrollmentInfo);
        frmEnrollmentInfo.QEnrollment.Parameters.ParamByName('creditCardId').Value := QCreditCard['creditCardId'];
        frmEnrollmentInfo.QEnrollment.Open;
        frmEnrollmentInfo.ShowModal;
        if frmEnrollmentInfo.strKey='enter' then
        begin
          if frmEnrollmentInfo.QEnrollment['sessionUsed'] >= frmEnrollmentInfo.QEnrollment['sessionNumber'] then
          begin
              ShowMessage(' ⁄œ«œ Ã·”«  »Â « „«„ —”ÌœÂ «” ');
              Exit;
          end;
          if (frmEnrollmentInfo.QEnrollment['endDate'] <= CurrentDate) then
              if MessageBox(Self.Handle,'»«“Â “„«‰Ì ò·«” »Â « „«„ —”ÌœÂ «”  ¬Ì« Å–Ì—‘ «‰Ã«„ ê—œœø','« „«„ œÊ—Â ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo then Exit;

          spReception.Parameters.ParamByName('@lessonId').Value:= frmEnrollmentInfo.QEnrollment['lessonId'];

        end
        else
        begin
          ShowMessage('À»  ‰«„Ì ÃÂ  «” ›«œÂ Ì«›  ‰‘œ');
          ClearForm;
          Exit;
        end;
        FreeAndNil(frmCreditCardGroupInfo);
      end;
      numberOfLocker_2 := 0;
      numberOfLocker_1 := 0;
      if chb2Person.Checked then
      begin
          numberOfLocker_2 := (owner+subSet) div 2;
          numberOfLocker_1 := (owner+subSet) mod 2;
      end
      else
      begin
          numberOfLocker_2 := 0;
          numberOfLocker_1 := owner+subSet;
      end;


      if lblType.Caption = '2' then
      begin
          SP_Order.Parameters.ParamByName('@OrderID').Value:=-1;
          SP_Order.Parameters.ParamByName('@PersonOrder').Value:='ò«—   Œ›Ì›Ì';
          SP_Order.Parameters.ParamByName('@CustomerName').Value:=lblName.Caption;
          SP_Order.Parameters.ParamByName('@Adult').Value:=owner+subSet;
          SP_Order.Parameters.ParamByName('@Child').Value:=0;
          SP_Order.Parameters.ParamByName('@AdultDiscount').Value:=edtDiscount.Text;
          SP_Order.Parameters.ParamByName('@ChildDiscount').Value:=0;
          SP_Order.Parameters.ParamByName('@Comment').Value:='';
          SP_Order.Parameters.ParamByName('@OrderDate').Value:=CurrentDate;
          SP_Order.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
          SP_Order.Parameters.ParamByName('@AdultPrice').Value:=Parameter.Bozorgsal;
          SP_Order.Parameters.ParamByName('@ChildPrice').Value:=Parameter.khordsal;
          SP_Order.Parameters.ParamByName('@CustomerID').Value:='-1';
          SP_Order.Parameters.ParamByName('@OrderType').Value:=10;
          SP_Order.Parameters.ParamByName('@Action').Value:='Insert';
          SP_Order.ExecProc;
          spReception.Parameters.ParamByName('@OrderID').Value:= SP_Order.Parameters.ParamByName('@OutOrderID').Value;
      end
      else
          spReception.Parameters.ParamByName('@OrderID').Value:= 0;

      if isNotInShift then
      begin
          spReception.Parameters.ParamByName('@creditCardOwnerPrice').Value:= QCreditCard['price2'];
          spReception.Parameters.ParamByName('@creditCardSubSetPrice').Value:=QCreditCard['subSetPrice2'];
          ownerPrice := QCreditCard['price2'];
          subSetPrice := QCreditCard['subSetPrice2'];
      end
      else
      begin
          spReception.Parameters.ParamByName('@creditCardOwnerPrice').Value:= QCreditCard['price'];
          spReception.Parameters.ParamByName('@creditCardSubSetPrice').Value:=QCreditCard['subSetPrice'];
          ownerPrice := QCreditCard['price'];
          subSetPrice := QCreditCard['subSetPrice'];
      end;

      for i:=1 to numberOfLocker_1 do
      begin
        spReception.Parameters.ParamByName('@CustomerName').Value:= lblName.Caption;
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

        if issuTickerForOwner = false then
        begin
            spReception.Parameters.ParamByName('@creditCardOwner').Value:=1;
            spReception.Parameters.ParamByName('@creditCardSubSet').Value:=0;
            spReception.Parameters.ParamByName('@Price').Value:= ownerPrice;

            issuTickerForOwner := True;
        end
        else
        begin
            spReception.Parameters.ParamByName('@Price').Value:= subSetPrice;
            spReception.Parameters.ParamByName('@creditCardOwner').Value:=0;
            spReception.Parameters.ParamByName('@creditCardSubSet').Value:=1;
        end;
        spReception.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
        spReception.Parameters.ParamByName('@CardID').Value:=1;
        spReception.Parameters.ParamByName('@CardID2').Value:=1;
        spReception.Parameters.ParamByName('@CardID3').Value:=1;
        spReception.Parameters.ParamByName('@NumberOfAdult').Value:=1;
        spReception.Parameters.ParamByName('@NumberOfChild').Value:=0;
        spReception.Parameters.ParamByName('@Discount').Value:=0;
        //spReception.Parameters.ParamByName('@OrderID').Value:= 0;
        spReception.Parameters.ParamByName('@HotelReceptionID').Value:= 0;
        spReception.Parameters.ParamByName('@KinderGarten').Value:= 0;
        spReception.Parameters.ParamByName('@CreditCardID').Value:= lblCardID.Caption;
        spReception.ExecProc;
        spReception.Parameters.ParamByName('@JumpClosed').Value:=0;
        CurrentReceptionID :=spReception.Parameters.ParamByName('@ReceptionID').Value;
        if CurrentReceptionID <> LastReceptionID then
        begin

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
        spReception.Parameters.ParamByName('@CustomerName').Value:=lblName.Caption;
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
        if issuTickerForOwner = false then
        begin
            spReception.Parameters.ParamByName('@creditCardOwner').Value:=1;
            spReception.Parameters.ParamByName('@creditCardSubSet').Value:=1;
            spReception.Parameters.ParamByName('@Price').Value:= ownerPrice+subSetPrice;
            issuTickerForOwner := True;
        end
        else
        begin
            spReception.Parameters.ParamByName('@Price').Value:= subSetPrice*2;
            spReception.Parameters.ParamByName('@creditCardOwner').Value:=0;
            spReception.Parameters.ParamByName('@creditCardSubSet').Value:=2;
        end;
        spReception.Parameters.ParamByName('@Price').Value:= 2*Price;
        spReception.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
        spReception.Parameters.ParamByName('@CardID').Value:=1;
        spReception.Parameters.ParamByName('@CardID2').Value:=1;
        spReception.Parameters.ParamByName('@CardID3').Value:=1;
        spReception.Parameters.ParamByName('@NumberOfAdult').Value:=2;
        spReception.Parameters.ParamByName('@NumberOfChild').Value:=0;
        spReception.Parameters.ParamByName('@Discount').Value:=0;
        //spReception.Parameters.ParamByName('@OrderID').Value:= 0;
        spReception.Parameters.ParamByName('@HotelReceptionID').Value:= 0;
        spReception.Parameters.ParamByName('@KinderGarten').Value:= 0;
        spReception.Parameters.ParamByName('@CreditCardID').Value:= lblCardID.Caption;        
        spReception.ExecProc;
        spReception.Parameters.ParamByName('@JumpClosed').Value:=0;
        CurrentReceptionID :=spReception.Parameters.ParamByName('@ReceptionID').Value;
        if CurrentReceptionID <> LastReceptionID then
        begin

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
    QReception.Close;
    QReception.Open;
    ClearForm;
end;

procedure TfrmCreditCardTicket.FormShow(Sender: TObject);
begin
    ClearForm;
    QReception.Close;
    QReception.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QReception.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QReception.Open;
end;

procedure TfrmCreditCardTicket.BtnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCreditCardTicket.chbDiscountClick(Sender: TObject);
begin
    gbDiscount.Enabled := chbDiscount.Checked;
end;

procedure TfrmCreditCardTicket.btnFreeTicketClick(Sender: TObject);
begin
      btnFreeTicket.Enabled := False;
      spReception.Parameters.ParamByName('@CustomerName').Value:= lblName.Caption;
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
      spReception.Parameters.ParamByName('@Other').Value:= lblCardID.Caption;
      spReception.Parameters.ParamByName('@Price').Value:= 0;
      spReception.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
      spReception.Parameters.ParamByName('@CardID').Value:=1;
      spReception.Parameters.ParamByName('@CardID2').Value:=1;
      spReception.Parameters.ParamByName('@CardID3').Value:=1;
      spReception.Parameters.ParamByName('@NumberOfAdult').Value:=1;
      spReception.Parameters.ParamByName('@NumberOfChild').Value:=0;
      spReception.Parameters.ParamByName('@Discount').Value:=0;
      spReception.Parameters.ParamByName('@HotelReceptionID').Value:= 0;
      spReception.Parameters.ParamByName('@KinderGarten').Value:= 0;
      spReception.Parameters.ParamByName('@CreditCardID').Value:= 'freeTicket';
      spReception.Parameters.ParamByName('@OrderID').Value:= 0;
      spReception.ExecProc;
      qUpdateFreeTicket.Close;
      qUpdateFreeTicket.Parameters.ParamByName('CreditCardID').Value := lblCardID.Caption;
      qUpdateFreeTicket.ExecSQL;
      PrintReception(spReception.Parameters.ParamByName('@ReceptionID').Value);
end;

procedure TfrmCreditCardTicket.edtCreditCardIDExit(Sender: TObject);
begin
    BBtnAccept.SetFocus;
end;

procedure TfrmCreditCardTicket.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmCreditCardTicket.mnuDepositClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardCharge, frmCreditCardCharge);
    frmCreditCardCharge.ShowModal;
    FreeAndNil(frmCreditCardCharge);
end;

procedure TfrmCreditCardTicket.btnSearchClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardInfo, frmCreditCardInfo);
    frmCreditCardInfo.ShowModal;
    if frmCreditCardInfo.strKey='enter' then
    begin
        edtCreditCardID.Text:=frmCreditCardInfo.QCreditCard['CardId'];
        BBtnAcceptClick(Sender);
    end;
    FreeAndNil(frmCreditCardInfo);

end;

procedure TfrmCreditCardTicket.mnuNewClick(Sender: TObject);
begin
    ClearForm;
end;

end.
