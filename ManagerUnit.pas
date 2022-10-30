unit ManagerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Menus;

type
  TfrmManager = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    lblCustomerName: TLabel;
    lblStartTme: TLabel;
    Label17: TLabel;
    lblReceptionID: TLabel;
    Label12: TLabel;
    edtReceptionID: TEdit;
    btnSearch: TBitBtn;
    BtnEnter: TBitBtn;
    Label1: TLabel;
    lblNewClosedID: TLabel;
    BitBtn1: TBitBtn;
    QReception: TADOQuery;
    QReturn: TADOQuery;
    QChangeKey: TADOQuery;
    Label2: TLabel;
    lblClosedID: TLabel;
    Label3: TLabel;
    lblEndTime: TLabel;
    Label7: TLabel;
    lblReceptionDate: TLabel;
    Label6: TLabel;
    edtKeyNumber: TEdit;
    BitBtn2: TBitBtn;
    QSearch: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
    Label8: TLabel;
    lblCurrentCredit: TLabel;
    QCheckLocker: TADOQuery;
    gbSendCharge: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    lblSourceCustomerName: TLabel;
    Label11: TLabel;
    lblSourceReceptionID: TLabel;
    Label14: TLabel;
    lblSourceClosedID: TLabel;
    Label16: TLabel;
    lblDestinationCustomerName: TLabel;
    Label19: TLabel;
    lblDestinationReceptionID: TLabel;
    Label21: TLabel;
    lblDestinationClosedID: TLabel;
    bbtnAccept: TBitBtn;
    Label24: TLabel;
    edtDestinationClosedID: TEdit;
    btnDestinatyion: TBitBtn;
    Label23: TLabel;
    edtSourceClosedID: TEdit;
    btnSource: TBitBtn;
    lblSourceModCharge: TLabel;
    Label13: TLabel;
    lblDestinationModCharge: TLabel;
    Label15: TLabel;
    QTrans: TADOQuery;
    QTrancAccept: TADOQuery;
    MainMenu1: TMainMenu;
    mnuFile: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SP_Start: TADOStoredProc;
    N5: TMenuItem;
    mnuSpecialLocker: TMenuItem;
    gbChangeLocker: TGroupBox;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    lblSourceChangeLockerCustomerName: TLabel;
    lblSourceChangeLockerReceptionID: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edtSourceChangeLocker: TEdit;
    BitBtn3: TBitBtn;
    GroupBox6: TGroupBox;
    Label30: TLabel;
    lblDestinationChangeLockerCustomerName: TLabel;
    lblDestinationChangeLockerReceptionID: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    BitBtn4: TBitBtn;
    edtDestinationChangeLocker: TEdit;
    BitBtn5: TBitBtn;
    QChangeLocker: TADOQuery;
    QCheckUserID: TADOQuery;
    QCheckServiceCenter: TADOQuery;
    procedure btnSearchClick(Sender: TObject);
    procedure BtnEnterClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnSourceClick(Sender: TObject);
    procedure btnDestinatyionClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure mnuSpecialLockerClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure bbtnAcceptClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManager: TfrmManager;

implementation

uses DMUnit, ActiveLockerUnit, ChargeManagerUnit, SearchCustomerUnit,
  CalculatUnit, qrSendChargeUnit, qrChangeLockerUnit, qrReturnFromExitUnit;

{$R *.dfm}

procedure TfrmManager.btnSearchClick(Sender: TObject);
begin
    if edtReceptionID.Text='' then Exit;
    QReception.Close;
    QReception.Parameters.ParamByName('ReceptionID').Value:=edtReceptionID.Text;
    QReception.Parameters.ParamByName('serviceCenterId').Value:= UserInfo.Service_center_id;
    if UserInfo.userType = IT then
      QReception.Parameters.ParamByName('checkServiceCenter').Value:= 0
    else
      QReception.Parameters.ParamByName('checkServiceCenter').Value:= 1;
    QReception.Parameters.ParamByName('ReceptionDate').Value:= CurrentDate;
    QReception.Open;
    if QReception['ReceptionID']<>Null then
    begin
        lblReceptionID.Caption:=QReception['ReceptionID'];
        lblClosedID.Caption:=QReception['ClosedID'];
        lblCustomerName.Caption:=QReception['CustomerName'];
        lblStartTme.Caption:=QReception['StartTime'];
    end
    else
    begin
        ShowMessage('òœ Å–Ì—‘ „⁄ »— ‰„Ì »«‘œ');
        Exit;
    end;
end;

procedure TfrmManager.BtnEnterClick(Sender: TObject);
begin
    if MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ «‰ ﬁ«· «‰Ã«„ ‘Êœ ø','«‰ ﬁ«· ò„œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo  then Exit;
    QChangeKey.Close;
    QChangeKey.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
    QChangeKey.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QChangeKey.Open;

    QReception.Close;
    QReception.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
    QReception.Open;
    if QReception['ClosedID']<>Null then
        lblNewClosedID.Caption:=IntToStr(QReception['ClosedID'])
    else
        lblNewClosedID.Caption:='';

    Application.CreateForm(TqrChangeLocker, qrChangeLocker);

    qrChangeLocker.Preview;
    FreeAndNil(qrChangeLocker);
end;

procedure TfrmManager.BitBtn1Click(Sender: TObject);
begin
    if MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ«Ì‰ „‘ —Ì »Â ”Ì” „ »—ê—œœø','»—ê‘  Œ—ÊÃ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo  then Exit;
    QCheckLocker.Close;
    QCheckLocker.Parameters.ParamByName('ClosedID').Value:=lblClosedID.Caption;
    QCheckLocker.Parameters.ParamByName('serviceCenterID').Value := UserInfo.Service_center_id;
    QCheckLocker.Open;

    if (UserInfo.WorkSection = 5) then
    begin
        QCheckUserID.Close;
        QCheckUserID.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
        QCheckUserID.Parameters.ParamByName('ExitUserID').Value:= UserInfo.UserID;
        QCheckUserID.Open;
        if QCheckUserID['ReceptionID'] = null then
        begin
            ShowMessage('‘„« „Ã«“ »Â »—ê—œ«‰œ‰ «Ì‰ „‘ —Ì ‰Ì” Ìœ ');
            Exit;
        end;
    end;

    if QCheckLocker['ClosedID']<>Null then
    begin
        ShowMessage('‘„« „Ã«“ »Â »—ê—œ«‰œ‰ «Ì‰ „‘ —Ì ‰Ì” Ìœ “Ì—« ò„œ ÊÌ «‘€«· ‘œÂ «” ');
        Exit;
    end;
    QReturn.Close;
    QReturn.Parameters.ParamByName('ClosedID').Value:=lblClosedID.Caption;
    QReturn.Parameters.ParamByName('ReceptionID').Value:=lblReceptionID.Caption;
    QReturn.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QReturn.Parameters.ParamByName('serviceCenterID').Value:=UserInfo.Service_center_id;
    QReturn.Open;

    Application.CreateForm(TqrReturnFromExit, qrReturnFromExit);
    qrReturnFromExit.Preview;
    FreeAndNil(qrReturnFromExit);
    ShowMessage('»—ê‘  »« „Ê›ﬁÌ‰ «‰Ã«„ ê—œÌœ');
end;

procedure TfrmManager.FormCreate(Sender: TObject);
begin
    lblReceptionID.Caption:='';
    lblClosedID.Caption:='';
    lblCustomerName.Caption:='';
    lblStartTme.Caption:='';
    if (UserInfo.userType = Admin) or (UserInfo.userType = Supervisour) or (UserInfo.userType = IT) then
    begin
        mnuFile.Visible := True;
        gbSendCharge.Enabled := True;
        gbChangeLocker.Enabled := True;
        BitBtn1.Enabled := True;
        gbSendCharge.Enabled := True;
    end;
end;

procedure TfrmManager.BitBtn2Click(Sender: TObject);
begin
    if edtKeyNumber.Text='' then Exit;
    QSearch.Close;
    QSearch.Parameters.ParamByName('ClosedID').Value:=edtKeyNumber.Text;
    QSearch.Open;
    if QSearch['ReceptionID']<>Null then
    begin
        lblReceptionID.Caption:=IntToStr(QSearch['ReceptionID']);
        lblCustomerName.Caption:=QSearch['CustomerName'];
        SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QSearch['ReceptionID'];
        SP_GetCurrentCredit.ExecProc;
        lblCurrentCredit.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    end
    else
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        Exit;
    end;

end;

procedure TfrmManager.btnSourceClick(Sender: TObject);
begin
    if edtSourceClosedID.Text='' then Exit;
    QTrans.Close;
    QTrans.Parameters.ParamByName('KeyNumber').Value:=edtSourceClosedID.Text;
    QTrans.Parameters.ParamByName('serviceCenterID').Value:=UserInfo.Service_center_id;
    QTrans.Open;
    if QTrans['ReceptionID']<>Null then
    begin
        lblSourceReceptionID.Caption:=IntToStr(QTrans['ReceptionID']);
        lblSourceCustomerName.Caption:=QTrans['CustomerName'];
        lblSourceClosedID.Caption:=QTrans['ClosedID'];
        SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QTrans['ReceptionID'];
        SP_GetCurrentCredit.ExecProc;
        lblSourceModCharge.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    end
    else
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        lblSourceReceptionID.Caption:='';
        lblSourceCustomerName.Caption:='';
        lblSourceClosedID.Caption:='';
        lblSourceModCharge.Caption:='';
        Exit;
    end;
end;

procedure TfrmManager.btnDestinatyionClick(Sender: TObject);
begin
    if edtDestinationClosedID.Text='' then Exit;
    QTrans.Close;
    QTrans.Parameters.ParamByName('KeyNumber').Value:=edtDestinationClosedID.Text;
    QTrans.Parameters.ParamByName('serviceCenterID').Value:=UserInfo.Service_center_id;
    QTrans.Open;
    if QTrans['ReceptionID']<>Null then
    begin
        lblDestinationReceptionID.Caption:=IntToStr(QTrans['ReceptionID']);
        lblDestinationCustomerName.Caption:=QTrans['CustomerName'];
        lblDestinationClosedID.Caption:=QTrans['ClosedID'];
        SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QTrans['ReceptionID'];
        SP_GetCurrentCredit.ExecProc;
        lblDestinationModCharge.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    end
    else
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        lblDestinationReceptionID.Caption:='';
        lblDestinationClosedID.Caption:='';
        lblDestinationCustomerName.Caption:='';
        lblDestinationModCharge.Caption:='';
        Exit;
    end;
end;

procedure TfrmManager.N2Click(Sender: TObject);
begin
    Application.CreateForm(TfrmActiveLocker, frmActiveLocker);
    frmActiveLocker.ShowModal;
    FreeAndNil(frmActiveLocker);
end;

procedure TfrmManager.N4Click(Sender: TObject);
begin
    Application.CreateForm(TfrmSearchKeyNumber, frmSearchKeyNumber);
    frmSearchKeyNumber.ShowModal;
    if (frmSearchKeyNumber.strKey='enter') and (frmSearchKeyNumber.lblReceptionID.Caption<>'') then
    begin
        Application.CreateForm(TfrmChargeManager, frmChargeManager);
        frmChargeManager.lblCustomerName.Caption:=frmSearchKeyNumber.lblCustomerName.Caption;
        frmChargeManager.lblLocker.Caption:=frmSearchKeyNumber.edtKeyNumber.Text;
        frmChargeManager.QCharge.Close;
        frmChargeManager.QCharge.Parameters.ParamByName('ReceptionID').Value:=frmSearchKeyNumber.lblReceptionID.Caption;
        frmChargeManager.QCharge.Open;
        if frmChargeManager.QCharge['CreditID']<>null then
            frmChargeManager.ShowModal;
        FreeAndNil(frmChargeManager);
    end
    else
    begin
        Close;
    end;
    FreeAndNil(frmSearchKeyNumber);
end;

procedure TfrmManager.mnuSpecialLockerClick(Sender: TObject);
begin
    SP_Start.Close;
    SP_Start.Parameters.ParamByName('@CustomerName').Value:='„Â«ÌÌ';
    SP_Start.Parameters.ParamByName('@ReceptionDate').Value:=CurrentDate;
    SP_Start.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Start.Parameters.ParamByName('@ClosedID').Value:=0;
    SP_Start.ExecProc;
    ShowMessage('«ÌÃ«œ ò„œ »« „Ê›ﬁÌ  «‰Ã«„ ê—œÌœ');
end;

procedure TfrmManager.BitBtn3Click(Sender: TObject);
begin
    if edtSourceChangeLocker.Text='' then Exit;
    QTrans.Close;
    QTrans.Parameters.ParamByName('KeyNumber').Value:=edtSourceChangeLocker.Text;
    QTrans.Parameters.ParamByName('serviceCenterID').Value:=UserInfo.Service_center_id;
    QTrans.Open;
    if QTrans['ReceptionID']<>Null then
    begin
        lblSourceReceptionID.Caption:=IntToStr(QTrans['ReceptionID']);
        lblSourceCustomerName.Caption:=QTrans['CustomerName'];
        lblSourceClosedID.Caption:=QTrans['ClosedID'];
        SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QTrans['ReceptionID'];
        SP_GetCurrentCredit.ExecProc;
        lblSourceModCharge.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    end
    else
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        lblSourceReceptionID.Caption:='';
        lblSourceCustomerName.Caption:='';
        lblSourceClosedID.Caption:='';
        lblSourceModCharge.Caption:='';
        Exit;
    end;
end;

procedure TfrmManager.BitBtn5Click(Sender: TObject);
begin
    if edtDestinationClosedID.Text='' then Exit;
    QTrans.Close;
    QTrans.Parameters.ParamByName('KeyNumber').Value:=edtDestinationClosedID.Text;
    QTrans.Parameters.ParamByName('serviceCenterID').Value:=UserInfo.Service_center_id;
    QTrans.Open;
    if QTrans['ReceptionID']<>Null then
    begin
        lblDestinationReceptionID.Caption:=IntToStr(QTrans['ReceptionID']);
        lblDestinationCustomerName.Caption:=QTrans['CustomerName'];
        lblDestinationClosedID.Caption:=QTrans['ClosedID'];
        SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QTrans['ReceptionID'];
        SP_GetCurrentCredit.ExecProc;
        lblDestinationModCharge.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    end
    else
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        lblDestinationReceptionID.Caption:='';
        lblDestinationClosedID.Caption:='';
        lblDestinationCustomerName.Caption:='';
        lblDestinationModCharge.Caption:='';
        Exit;
    end;
end;

procedure TfrmManager.bbtnAcceptClick(Sender: TObject);
var
strMessage : string;
begin
    if (lblSourceReceptionID.Caption<>'') and (lblDestinationReceptionID.Caption<>'') then
    begin

        QCheckServiceCenter.Close;
        QCheckServiceCenter.Parameters.ParamByName('source_reception_id').Value := lblSourceReceptionID.Caption;
        QCheckServiceCenter.Parameters.ParamByName('destination_reception_id').Value := lblDestinationReceptionID.Caption;
        QCheckServiceCenter.Open;
        if QCheckServiceCenter['result']<>null then
        begin
            if QCheckServiceCenter['result']<>1 then
            begin
                ShowMessage('„ÌÂ„«‰«‰ «“ Ìò „Ã„Ê⁄Â ‰„Ì »«‘‰œ Ê «„ò«‰ «‰ ﬁ«· ‘«—é ‰„Ì »«‘œ.');
                Exit;
            end;
        end
        else
        begin
            ShowMessage('«„ò«‰ «‰ ﬁ«· „ﬁœÊ— ‰Ì” .');
            Exit;
        end;


        if MessageBox(Self.Handle,'«‰ ﬁ«· ‘«—é «‰Ã«„ ‘Êœø','«‰ ﬁ«· ‘«—é',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo  then Exit;
        QTrancAccept.Close;
        QTrancAccept.Parameters.ParamByName('SourceReceptionID').Value:=lblSourceReceptionID.Caption;
        QTrancAccept.Parameters.ParamByName('DestinationReceptionID').Value:=lblDestinationReceptionID.Caption;
        QTrancAccept.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
        QTrancAccept.Open;

        Application.CreateForm(TqrSendCharge, qrSendCharge);
        qrSendCharge.Preview;
        FreeAndNil(qrSendCharge);

        ShowMessage('«‰ ﬁ«· »« „Ê›ﬁÌ  «‰Ã«„ ‘œ');



        lblSourceReceptionID.Caption:='';
        lblSourceCustomerName.Caption:='';
        lblSourceClosedID.Caption:='';
        lblSourceModCharge.Caption:='';

        lblDestinationReceptionID.Caption:='';
        lblDestinationClosedID.Caption:='';
        lblDestinationCustomerName.Caption:='';
        lblDestinationModCharge.Caption:='';
    end
    else
        ShowMessage('«ÿ·«⁄«  ÃÂ  «‰ ﬁ«· ò«„· ‰„Ì »«‘œ');

end;

procedure TfrmManager.BitBtn4Click(Sender: TObject);
begin
    QChangeLocker.Close;
    QChangeLocker.Parameters.ParamByName('SourceLocker').Value:= edtSourceChangeLocker.Text;
    QChangeLocker.Parameters.ParamByName('SourceReceptionID').Value:= lblSourceChangeLockerReceptionID.Caption;
    QChangeLocker.Parameters.ParamByName('DestinationLocker').Value:= edtDestinationChangeLocker.Text;
    QChangeLocker.Parameters.ParamByName('DestinationReceptionID').Value:= lblDestinationChangeLockerReceptionID.Caption;
    QChangeLocker.ExecSQL;
    ShowMessage(' ⁄ÊÌ÷ ò„œ »« „Ê›ﬁÌ  »Â « „«„ —”Ìœ');
end;

end.
