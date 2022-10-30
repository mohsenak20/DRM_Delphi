unit ReceptionListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, RpBase, RpSystem, RpDefine, RpRave;

type
  TfrmReceptionList = class(TForm)
    PanelButton: TPanel;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    MainMenuUnit: TMainMenu;
    MnuFile: TMenuItem;
    MnuEdit: TMenuItem;
    MnuDelete: TMenuItem;
    N2: TMenuItem;
    MnuReturn: TMenuItem;
    PopupMenuUnit: TPopupMenu;
    MnuPopEdit: TMenuItem;
    MnuPopNone1: TMenuItem;
    MnuPopDelete: TMenuItem;
    SP_Reception: TADOStoredProc;
    dsReception: TDataSource;
    QReception: TADOQuery;
    ActionList: TActionList;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    Panel1: TPanel;
    Label4: TLabel;
    edtSCustomerName: TEdit;
    edtReceptionID: TEdit;
    Label5: TLabel;
    BBtnAccept: TBitBtn;
    RvProject: TRvProject;
    RvSystem: TRvSystem;
    QPrint: TADOQuery;
    GroupBox: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
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
    edtCustomerName: TEdit;
    rbBozorgsal: TRadioButton;
    rbKhordsal: TRadioButton;
    QReceptionReceptionID: TLargeintField;
    QReceptionCustomerName: TWideStringField;
    QReceptionCustomerType: TSmallintField;
    QReceptionReceptionDate: TStringField;
    QReceptionReceptionType: TSmallintField;
    QReceptionShift: TSmallintField;
    QReceptionStartTime: TStringField;
    QReceptionEndTime: TStringField;
    QReceptionCredit: TIntegerField;
    QReceptionActive: TBooleanField;
    QReceptionMobile: TBooleanField;
    QReceptionPool: TBooleanField;
    QReceptionSaat: TBooleanField;
    QReceptionAngoshtarPlak: TBooleanField;
    QReceptionSooeech: TBooleanField;
    QReceptionAsnad: TBooleanField;
    QReceptionPakhsh: TBooleanField;
    QReceptionKeefPool: TBooleanField;
    QReceptionSamsonet: TBooleanField;
    QReceptionOther: TWideStringField;
    QReceptionPrice: TIntegerField;
    QReceptionCardID: TLargeintField;
    QReceptionUserID: TIntegerField;
    QReceptionEnter: TBooleanField;
    QReceptionstrMobile: TStringField;
    QReceptionstrPool: TStringField;
    QReceptionstrSaat: TStringField;
    QReceptionstrAngoshtarPlak: TStringField;
    QReceptionstrSooeech: TStringField;
    QReceptionstrAsnad: TStringField;
    QReceptionstrPakhsh: TStringField;
    QReceptionstrKeefPool: TStringField;
    QReceptionstrSamsonet: TStringField;
    QReceptionClosedID: TIntegerField;
    QCredit: TADOQuery;
    Label7: TLabel;
    lblBozorgsal: TLabel;
    lblKhordsal: TLabel;
    Label10: TLabel;
    QTedad: TADOQuery;
    lblSumReception: TLabel;
    Label9: TLabel;
    chbCard: TCheckBox;
    QReceptionCardID2: TLargeintField;
    QReceptionCardID3: TLargeintField;
    QDelete: TADOQuery;
    Label6: TLabel;
    edtCard1: TEdit;
    Label8: TLabel;
    edtCard2: TEdit;
    SP_DelReception: TADOStoredProc;
    Label11: TLabel;
    edtCard3: TEdit;
    Label12: TLabel;
    lblNumberOfChild: TLabel;
    Label14: TLabel;
    lblNumberOfAdult: TLabel;
    QNumberOfReception: TADOQuery;
    N1: TMenuItem;
    mnuChange: TMenuItem;
    QWarmDelete: TADOQuery;
    QUpdateReception: TADOQuery;
    QReceptionExitUserID: TIntegerField;
    QReceptionNumberOfAdult: TIntegerField;
    QReceptionNumberOfChild: TIntegerField;
    QReceptionCheckedCard1: TBooleanField;
    QReceptionCheckedCard2: TBooleanField;
    QReceptionCheckedCard3: TBooleanField;
    QReceptionCustomerExit1: TBooleanField;
    QReceptionCustomerExit2: TBooleanField;
    QReceptionExitTime1: TStringField;
    QReceptionExitTime2: TStringField;
    QReceptionEnterTime: TWideStringField;
    QReceptionReceptionDiscount: TIntegerField;
    QReceptionOrderNumber: TIntegerField;
    QReceptionFactorNumber: TIntegerField;
    QReceptionAdultPrice: TIntegerField;
    QReceptionChildPrice: TIntegerField;
    QReceptionkindergarten: TBooleanField;
    QReceptionTicketType: TIntegerField;
    QReceptionHostName: TWideStringField;
    QReceptionNetAddress: TWideStringField;
    QReceptionCreditCardID: TWideStringField;
    QReceptionorder_id: TIntegerField;
    QReceptionmobile_number: TWideStringField;
    QReceptionservice_center_id: TIntegerField;
    QReceptionwarmDelete: TBooleanField;
    N3: TMenuItem;
    mnuChangeKeyNumber: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnPrintClick(Sender: TObject);
    procedure QReceptionCalcFields(DataSet: TDataSet);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure mnuChangeClick(Sender: TObject);
    procedure QReceptionBeforeDelete(DataSet: TDataSet);
    procedure mnuChangeKeyNumberClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmReceptionList: TfrmReceptionList;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, MainUnit, ShareUnit, ChangeToUnit,
  qrWarmDeleteUnit, ChangingLockerNumberUnit;

{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmReceptionList.SetEnabledDisable(BL:Boolean);
Begin
    Grid.Enabled:=BL;
    PanelButton.Enabled:=BL;
    MnuEdit.Enabled:=BL;
    MnuDelete.Enabled:=BL;
    MnuPopEdit.Enabled:=BL;
    MnuPopDelete.Enabled:=BL;
    GroupBox.Visible:=Not BL;
    IF Not BL Then
    Begin
        edtCustomerName.Clear;
        edtCustomerName.SetFocus;
        edtOther.Clear;
        chbMobile.Checked:=False;
        chbPool.Checked:=False;
        chbSaat.Checked:=False;
        chbAngoshtar.Checked:=False;
        chbSooeech.Checked:=False;
        chbAsnad.Checked:=False;
        chbPakhsh.Checked:=False;
        chbKeefPool.Checked:=False;
        chbSamsonet.Checked:=False;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmReceptionList.LoadSqlQuery;
Begin
    QReception.Close;
    QReception.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QReception.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QReception.Open;

    QTedad.Close;
    QTedad.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QTedad.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QTedad.Open;
    if QTedad['Bozorgsal']<>Null then
        lblBozorgsal.Caption:=IntToStr(QTedad['Bozorgsal'])
    else
        lblBozorgsal.Caption:='0';

    if QTedad['Khordsal']<>Null then
        lblKhordsal.Caption:=IntToStr(QTedad['Khordsal'])
    else
        lblKhordsal.Caption:='0';

    if QTedad['SumReception']<>Null then
        lblSumReception.Caption:=FormatFloat('###,',  QTedad['SumReception'])
    else
        lblSumReception.Caption:='0';


End;

{*******************  GetValue  ***********************}
procedure TfrmReceptionList.GetValue;
begin
    edtCustomerName.Text:=QReception.fieldByName('CustomerName').Text;
    if QReception['CustomerType']=1 then
        rbBozorgsal.Checked:=True
    else
        rbKhordsal.Checked:=True;
    if QReception['Mobile'] then chbMobile.Checked:=True;
    if QReception['Pool'] then chbPool.Checked:=True;
    if QReception['Saat'] then chbSaat.Checked:=True;
    if QReception['AngoshtarPlak'] then chbAngoshtar.Checked:=True;
    if QReception['Sooeech'] then chbSooeech.Checked:=True;
    if QReception['Asnad'] then chbAsnad.Checked:=True;
    if QReception['Pakhsh'] then chbPakhsh.Checked:=True;
    if QReception['KeefPool'] then chbKeefPool.Checked:=True;
    if QReception['Samsonet'] then chbSamsonet.Checked:=True;
    edtOther.Text:=QReception['Other'];
    edtCard1.Text:=QReception['CardID'];
    edtCard2.Text:=QReception['CardID2'];
    edtCard3.Text:=QReception['CardID3'];

end;

{*******************  FormCreate  ***********************}
procedure TfrmReceptionList.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
    if UserInfo.Permission=2 then
        BtnPrint.Enabled:=True;

    lblNumberOfChild.Caption := '';
    lblNumberOfAdult.Caption := '';
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmReceptionList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmReceptionList.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmReceptionList.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmReceptionList.BtnSaveClick(Sender: TObject);
begin
    IF (edtCustomerName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtCustomerName.SetFocus;
        Exit;
    End;
    SP_Reception.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
    SP_Reception.Parameters.ParamByName('@CustomerName').Value:=edtCustomerName.Text;
    if rbBozorgsal.Checked then
        SP_Reception.Parameters.ParamByName('@CustomerType').Value:=1
    else
        SP_Reception.Parameters.ParamByName('@CustomerType').Value:=2;
    SP_Reception.Parameters.ParamByName('@ReceptionDate').Value:=QReception['ReceptionDate'];
    SP_Reception.Parameters.ParamByName('@ReceptionType').Value:=QReception['ReceptionType'];
    SP_Reception.Parameters.ParamByName('@Shift').Value:=QReception['Shift'];
    SP_Reception.Parameters.ParamByName('@ClosedID').Value:=QReception['ClosedID'];
    SP_Reception.Parameters.ParamByName('@StartTime').Value:=QReception['StartTime'];
    SP_Reception.Parameters.ParamByName('@EndTime').Value:=QReception['EndTime'];
    SP_Reception.Parameters.ParamByName('@Credit').Value:=QReception['Credit'];
    SP_Reception.Parameters.ParamByName('@Active').Value:=QReception['Active'];
    SP_Reception.Parameters.ParamByName('@Mobile').Value:=chbMobile.Checked;
    SP_Reception.Parameters.ParamByName('@Pool').Value:=chbPool.Checked;
    SP_Reception.Parameters.ParamByName('@Saat').Value:=chbSaat.Checked;
    SP_Reception.Parameters.ParamByName('@AngoshtarPlak').Value:=chbAngoshtar.Checked;
    SP_Reception.Parameters.ParamByName('@Sooeech').Value:=chbSooeech.Checked;
    SP_Reception.Parameters.ParamByName('@Asnad').Value:=chbAsnad.Checked;
    SP_Reception.Parameters.ParamByName('@Pakhsh').Value:=chbPakhsh.Checked;
    SP_Reception.Parameters.ParamByName('@KeefPool').Value:=chbKeefPool.Checked;
    SP_Reception.Parameters.ParamByName('@Samsonet').Value:=chbSamsonet.Checked;
    SP_Reception.Parameters.ParamByName('@Other').Value:=edtOther.Text;
    SP_Reception.Parameters.ParamByName('@CardID').Value:=edtCard1.Text;
    SP_Reception.Parameters.ParamByName('@CardID2').Value:=edtCard2.Text;
    SP_Reception.Parameters.ParamByName('@CardID3').Value:=edtCard3.Text;
    {if QReception['CardID']=1 then
    begin
        if rbBozorgsal.Checked then
            SP_Reception.Parameters.ParamByName('@Price').Value:=Parameter.Bozorgsal
        else
            SP_Reception.Parameters.ParamByName('@Price').Value:=Parameter.khordsal;
    end
    else
        SP_Reception.Parameters.ParamByName('@Price').Value:=QReception['Price'];}
    SP_Reception.Parameters.ParamByName('@Price').Value:=QReception['Price'];
    SP_Reception.Parameters.ParamByName('@Action').Value:='Update';
    SP_Reception.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QReception.Close;
    QReception.Open;
    Grid.SetFocus;
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmReceptionList.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmReceptionList.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmReceptionList.BtnEditClick(Sender: TObject);
begin
    IF (QReception.RecNo<=0) OR (QReception.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmReceptionList.BtnDelClick(Sender: TObject);
begin
    {if QReception['EnterTime'] then
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— Ê«—œ „Ã„Ê⁄Â ‘œÂ «”  Ê ‘„« ﬁ«œ— »Â Õ–› «Ì‰ Å–Ì—‘ ‰Ì” Ìœ');
        Exit;
    end;}
    IF ((QReception.RecNo<=0) OR (QReception.IsEmpty)) Or (Qreception['warmDelete']=1) or(MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    IF (QReception['ReceptionDate'] < CurrentDate) then
    begin
        ShowMessage('‘„« „Ã«“ »Â Õ–› «Ì‰ —òÊ—œ ‰„Ì »«‘Ìœ');
        Exit;
    end;
    if (QReception['EndTime']<>'99:99') then
        IF (MessageBox(Self.Handle,'„‘ —Ì „Ê—œ ‰Ÿ— «“ „Ã„Ê⁄Â Œ«—Ã ‘œÂ «”  ¬Ì« „Ì ŒÊ«ÂÌœ «Ê —« Õ–› ò‰Ìœø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;

    QDelete.Close;
    QDelete.Parameters.ParamByName('REceptionID').Value:=QReception['ReceptionID'];
    QDelete.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QDelete.Open;
    if QDelete['Result']= 1 then
    begin
        ShowMessage('⁄„·Ì«  Õ–› »« „Ê›ﬁÌ  «‰Ã«„ ê—œÌœ');
        ShowMessage('„»·€ »—ê‘ Ì'+FormatFloat('###,', QDelete['PayMoney'])+' „Ì »«‘œ');
        QReception.Close;
        QReception.Open;
    end
    else
        if QDelete['Result']= 2 then
            ShowMessage('»—«Ì „‘ —Ì „Ê—œ ‰Ÿ— ›«ò Ê— ’«œ— ê—œÌœÂ «”  Ê ‘„« „Ã«“ »Â Õ–› „‘ —Ì „Ê—œ ‰Ÿ— ‰„Ì »«‘Ìœ')
        else
            if QDelete['Result']=3 then
                ShowMessage('ò«—»— œÌê—Ì »—«Ì «Ì‰ „‘ —Ì ‘«—é ‰„ÊœÂ «”  Ê ‘„« „Ã«“ »Â Õ–› «Ì‰ „‘ —Ì ‰„Ì »«‘Ìœ')
            else
                if QDelete['Result']=4 then
                begin
                    QWarmDelete.Close;
                    QWarmDelete.Parameters.ParamByName('ReceptionID').Value := QReception['ReceptionID'];
                    QWarmDelete.ExecSQL;
                    QUpdateReception.Close;
                    QUpdateReception.Parameters.ParamByName('ReceptionID').Value :=  QReception['ReceptionID'];
                    QUpdateReception.ExecSQL;
                    Application.CreateForm(TqrWarmDelete, qrWarmDelete);
                    qrWarmDelete.lblUserName.Caption := UserInfo.UserName;
                    qrWarmDelete.PreviewModal;
                    FreeAndNil(qrWarmDelete);
                    //ShowMessage('Œ—ÊÃÌ ÃÂ  „ÌÂ„«‰ „Ê—œ ‰Ÿ— À»  ê—œÌœÂ «”  Ê ‘„« „Ã«“ »Â Õ–› «Ì‰ „ÌÂ„«‰ ‰„Ì »«‘Ìœ');

                end
                else
                    ShowMessage('Œÿ« œ— Â‰ê«„ Õ–› „ÌÂ„«‰');
end;

{*******************  Form Show  ***********************}
procedure TfrmReceptionList.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmReceptionList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QReception.Close;
end;

procedure TfrmReceptionList.BtnPrintClick(Sender: TObject);
var
Amanat, CustomerType : string;
begin
    if QReception['Enter'] then
    begin
        ShowMessage('‘„« „Ã«“ »Â ç«Å „ÃœœÌ «Ì‰ »·Ìÿ ‰„Ì »«‘Ìœ');
        Exit;
    end;
    CustomerType:='';
    QPrint.Close;
    QPrint.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
    QPrint.Open;
    RvProject.Open;
    RvProject.SetParam('ReceptionDate',QPrint['ReceptionDate']);
    RvProject.SetParam('StartTime',QPrint['StartTime']);
    RvProject.SetParam('KeyNumber',IntToStr(QPrint['KeyNumber']));
    if (QPrint['KeyNumber'] <= 1016) or ((QPrint['KeyNumber'] >= 2631) and (QPrint['KeyNumber'] <= 2782)) then
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
    RvProject.SetParam('ReceptionType', QPrint['CardTypeName']);

    QCredit.Close;
    QCredit.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
    QCredit.Open;
    if QCredit['Credit']<>Null then
        RvProject.SetParam('Credit',QCredit['Credit'])
    else
        RvProject.SetParam('Credit','0');
    if QPrint['CardID']<>1 then
    begin
        RvProject.SetParam('CardNumber',IntToStr(QPrint['CardID'])+','+IntToStr(QPrint['CardID2'])+','+IntToStr(QPrint['CardID3']));
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
    if QPrint['Mobile']         then Amanat:='„Ê»«Ì·';
    if QPrint['Pool']           then Amanat:=Amanat+' °'+'ÅÊ·';
    if QPrint['Saat']           then Amanat:=Amanat+' °'+'”«⁄ ';
    if QPrint['AngoshtarPlak']  then Amanat:=Amanat+' °'+'«‰ê‘ — Ê Å·«ﬂ';
    if QPrint['Sooeech']        then Amanat:=Amanat+' °'+'”Ê∆Ìç';
    if QPrint['Asnad']          then Amanat:=Amanat+' °'+'«”‰«œ';
    if QPrint['Pakhsh']         then Amanat:=Amanat+' °'+'ÅŒ‘ « Ê„»Ì·';
    if QPrint['KeefPool']       then Amanat:=Amanat+' °'+'ﬂÌ› ÅÊ·';
    if QPrint['Samsonet']       then Amanat:=Amanat+' °'+'”«„”Ê‰ ';
    if QPrint['Other']<>'' then
        if Amanat<>'' then
            Amanat:=Amanat+' °'+QPrint['Other']
        else
            Amanat:=QPrint['Other'];


    RvProject.SetParam('Amanat',Amanat);
    RvProject.ExecuteReport('EnterReport');
    RvProject.Close;
end;

procedure TfrmReceptionList.QReceptionCalcFields(DataSet: TDataSet);
begin
    if QReception['Mobile']         then QReception['strMobile']:='*';
    if QReception['Pool']           then QReception['strPool']:='*';
    if QReception['Saat']           then QReception['strSaat']:='*';
    if QReception['AngoshtarPlak']  then QReception['strAngoshtarPlak']:='*';
    if QReception['Sooeech']        then QReception['strSooeech']:='*';
    if QReception['Asnad']          then QReception['strAsnad']:='*';
    if QReception['Pakhsh']         then QReception['strPakhsh']:='*';
    if QReception['KeefPool']       then QReception['strKeefPool']:='*';
    if QReception['Samsonet']       then QReception['strSamsonet']:='*';
end;

procedure TfrmReceptionList.BBtnAcceptClick(Sender: TObject);
var
strFilter : string;
begin
    strFilter:='';
    if edtReceptionID.Text<>'' then
        strFilter:=' and ReceptionID='+edtReceptionID.Text
    else
    begin
        if edtSCustomerName.Text<>'' then
            strFilter:=' and CustomerName like '+QuotedStr('%'+edtSCustomerName.Text+'%');

        if chbCard.Checked then
                strFilter:=strFilter+' and CardID<>1';
    end;

    QReception.Close;
    QReception.SQL.Clear;
    QReception.SQL.Add('Select * From TReception');
    QReception.SQL.Add('where UserID= :UserID and  ReceptionDate >= :ReceptionDate  and ((warmDelete is null) or (warmDelete <>1))');
    if strFilter<>'' then
        QReception.SQL.Add(strFilter);
    QReception.SQL.Add('order by ReceptionID');

    QReception.Close;
    QReception.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QReception.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QReception.Open;

    QTedad.Close;
    QTedad.SQL.Clear;
    QTedad.SQL.Add('Declare @UserID int');
    QTedad.SQL.Add('Declare @ReceptionDate Char(10)');
    QTedad.SQL.Add('set @UserID= :UserID');
    QTedad.SQL.Add('set @ReceptionDate= :Receptiondate');
    QTedad.SQL.Add('Select Count(ReceptionID) as Bozorgsal, (Select Count(ReceptionID) from TReception');
    QTedad.SQL.Add('where UserID= @UserID and ReceptionDate= @ReceptionDate and CustomerType=2');
    if strFilter<>'' then
        QTedad.SQL.Add(strFilter);
    QTedad.SQL.Add(' ) as Khordsal,');
    QTedad.SQL.Add('(select Sum(Price) from TReception where UserID= @UserID and ReceptionDate= @ReceptionDate ');
    if strFilter<>'' then
        QTedad.SQL.Add(strFilter);

    QTedad.SQL.Add(') as SumReception');
    QTedad.SQL.Add('from TReception');
    QTedad.SQL.Add('where UserID= @UserID and ReceptionDate= @ReceptionDate and CustomerType=1');
    if strFilter<>'' then
        QTedad.SQL.Add(strFilter);

    QTedad.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QTedad.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QTedad.Open;
    if (QTedad['Bozorgsal']<>Null) and (QTedad['Bozorgsal'] >= 15)  then
        lblBozorgsal.Caption:=IntToStr(QTedad['Bozorgsal'])
    else
        lblBozorgsal.Caption:='0';

    if QTedad['Khordsal']<>Null then
        lblKhordsal.Caption:=IntToStr(QTedad['Khordsal'])
    else
        lblKhordsal.Caption:='0';

    if QTedad['SumReception']<>Null then
        lblSumReception.Caption:=FormatFloat('###,',  QTedad['SumReception'])
    else
        lblSumReception.Caption:='0';

    QTedad.Open;

    if Length(edtSCustomerName.Text) >= 3 then
    begin
        QNumberOfReception.Close;
        QNumberOfReception.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
        QNumberOfReception.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
        QNumberOfReception.Parameters.ParamByName('CustomerName').Value := '%'+ edtSCustomerName.Text + '%';
        QNumberOfReception.Open;
        if QNumberOfReception['NumberOfAdult']<> null then
            lblNumberOfAdult.Caption:=FormatFloat('###,',  QNumberOfReception['NumberOfAdult'])
        else
            lblNumberOfAdult.Caption:='0';

        if QNumberOfReception['NumberOfChild']<> null then
            lblNumberOfChild.Caption:=FormatFloat('###,',  QNumberOfReception['NumberOfChild'])
        else
            lblNumberOfChild.Caption:='0';
    end
    else
    begin
        lblNumberOfChild.Caption:='0';
        lblNumberOfAdult.Caption:='0';
    end;
end;

procedure TfrmReceptionList.mnuChangeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmChangeTo, frmChangeTo);
    frmChangeTo.edtKeyNumber.Text := IntToStr(QReception['ClosedID']);
    frmChangeTo.btnSearchClick(Sender);
    frmChangeTo.ShowModal;
    FreeAndNil(frmChangeTo);
end;

procedure TfrmReceptionList.QReceptionBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

procedure TfrmReceptionList.mnuChangeKeyNumberClick(Sender: TObject);
begin
    Application.CreateForm(TfrmChangingLockerNumber, frmChangingLockerNumber);
    frmChangingLockerNumber.lblName.Caption := QReception['CustomerName'];
    frmChangingLockerNumber.lblReceptionId.Caption := IntToStr(QReception['ReceptionID']);
    frmChangingLockerNumber.edtFirst.Text := IntToStr(QReception['ClosedID']);
    frmChangingLockerNumber.ShowModal;
    FreeAndNil(frmChangingLockerNumber);
    QReception.Close;
    QReception.Open;
end;

end.
