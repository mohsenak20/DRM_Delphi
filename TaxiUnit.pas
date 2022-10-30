unit TaxiUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmTaxi = class(TForm)
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label2: TLabel;
    edtLicensePlate: TEdit;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    MainMenuUnit: TMainMenu;
    MnuFile: TMenuItem;
    MnuInsert: TMenuItem;
    N2: TMenuItem;
    MnuReturn: TMenuItem;
    PopupMenuUnit: TPopupMenu;
    MnuPopInsert: TMenuItem;
    MnuPopNone1: TMenuItem;
    SP_Taxi: TADOStoredProc;
    dsTaxi: TDataSource;
    QTaxi: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionReturn: TAction;
    Label1: TLabel;
    edtDriverName: TEdit;
    Label3: TLabel;
    edtDriverMobile: TEdit;
    Label4: TLabel;
    edtPrice: TEdit;
    Label5: TLabel;
    edtPassenger: TEdit;
    Label6: TLabel;
    edtPassengerMobile: TEdit;
    Label7: TLabel;
    edtServicePoint: TEdit;
    Label8: TLabel;
    edtSLicensePlate: TEdit;
    Label9: TLabel;
    edtSDriverMobile: TEdit;
    Label10: TLabel;
    edtSPassengerMobile: TEdit;
    Label11: TLabel;
    edtSDriverName: TEdit;
    Label12: TLabel;
    edtSServicePoint: TEdit;
    BitBtn1: TBitBtn;
    QDelete: TADOQuery;
    rbTaxi: TRadioButton;
    rbPrivateTaxi: TRadioButton;
    SP_TaxiInfo: TADOStoredProc;
    QSearchTaxiInfo: TADOQuery;
    QLastReception: TADOQuery;
    QSearchPrivateTaxi: TADOQuery;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure edtLicensePlateExit(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;


var
  frmTaxi: TfrmTaxi;
  StatusRecord:String;

implementation

uses DMUnit, CalculatUnit, qrTaxiUnit, ShareUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmTaxi.SetEnabledDisable(BL:Boolean);
Begin
    Grid.Enabled:=BL;
    PanelButton.Enabled:=BL;
    MnuInsert.Enabled:=BL;
    MnuPopInsert.Enabled:=BL;
    GroupBox.Visible:=Not BL;
    IF Not BL Then
    Begin
        edtLicensePlate.Clear;
        edtLicensePlate.SetFocus;
        edtDriverName.Clear;
        edtDriverMobile.Clear;
        edtPrice.Clear;
        edtPassenger.Clear;
        edtPassengerMobile.Clear;
        edtServicePoint.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmTaxi.LoadSqlQuery;
Begin
    QTaxi.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmTaxi.GetValue;
begin
    edtLicensePlate.Text:=QTaxi.fieldByName('LicensePlate').Text;
    edtDriverName.Text:=QTaxi.fieldByName('DriverName').Text;
    edtDriverMobile.Text:=QTaxi.fieldByName('DriverMobile').Text;
    edtPrice.Text:=QTaxi.fieldByName('Price').Text;
    edtPassenger.Text:=QTaxi.fieldByName('Passenger').Text;
    edtPassengerMobile.Text := QTaxi.fieldByName('PassengerMobile').Text;
    edtServicePoint.Text := QTaxi.fieldByName('ServicePoint').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmTaxi.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmTaxi.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmTaxi.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmTaxi.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmTaxi.BtnSaveClick(Sender: TObject);
var
  ReceptionDate, receptionTime :string;
begin
    IF (edtLicensePlate.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtLicensePlate.SetFocus;
        Exit;
    End;

    QLastReception.Close;
    QLastReception.Parameters.ParamByName('LicensePlate').Value := edtLicensePlate.Text;
    QLastReception.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QLastReception.Open;
    if QLastReception['id'] <> null then
    begin
        ReceptionDate := QLastReception['IssueDate'];
        receptionTime := QLastReception['IssueTime'];
        if ReceptionDate = CurrentDate then
        begin
            if (Time()>=StrToTime(receptionTime)) and (Time()-StrToTime(receptionTime) < StrToTime('4:00')) then
            begin
                ShowMessage('Õœ«ﬁ· “„«‰ ﬁ«»· ﬁ»Ê· »Ì‰ œÊ Å–Ì—‘ Ìò  «ò”Ì ò„ — «“ Ìò ”«⁄  ‰»«Ìœ »«‘œ.');
                Exit;
            end;
        end;

    end;


    SP_Taxi.Parameters.ParamByName('@id').Value:=QTaxi['id'];
    SP_Taxi.Parameters.ParamByName('@LicensePlate').Value:=edtLicensePlate.Text;
    SP_Taxi.Parameters.ParamByName('@DriverName').Value:=edtDriverName.Text;
    SP_Taxi.Parameters.ParamByName('@DriverMobile').Value:=edtDriverMobile.Text;
    SP_Taxi.Parameters.ParamByName('@Price').Value:=edtPrice.Text;
    SP_Taxi.Parameters.ParamByName('@Passenger').Value:=edtPassenger.Text;
    SP_Taxi.Parameters.ParamByName('@issueDate').Value:=CurrentDate;
    SP_Taxi.Parameters.ParamByName('@UserID').Value:= UserInfo.UserID;
    SP_Taxi.Parameters.ParamByName('@PassengerMobile').Value:=edtPassengerMobile.Text;
    SP_Taxi.Parameters.ParamByName('@ServicePoint').Value:=edtServicePoint.Text;
    IF StatusRecord='Insert' then
        SP_Taxi.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Taxi.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Taxi.ExecProc;


    if rbTaxi.Checked then
    begin
        SP_TaxiInfo.Parameters.ParamByName('@LicensePlate').Value:=edtLicensePlate.Text;
        SP_TaxiInfo.Parameters.ParamByName('@DriverName').Value:=edtDriverName.Text;
        SP_TaxiInfo.Parameters.ParamByName('@DriverMobile').Value:=edtDriverMobile.Text;
        SP_TaxiInfo.ExecProc;
    end;
    StatusRecord:='';
    SetEnabledDisable(True);
    QTaxi.Close;
    QTaxi.SQL.Clear;
    QTaxi.SQL.Add('select * from TTaxi inner join TUser ');
    QTaxi.SQL.Add(' on TTaxi.UserID = TUser.UserID');
    QTaxi.SQL.Add(' order by id DESC ');
    QTaxi.Open;
    Grid.SetFocus;
    BtnPrintClick(Sender);

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmTaxi.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmTaxi.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmTaxi.BtnEditClick(Sender: TObject);
begin
    IF (QTaxi.RecNo<=0) OR (QTaxi.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmTaxi.BtnDelClick(Sender: TObject);
begin
    IF ((QTaxi.RecNo<=0) OR (QTaxi.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QTaxi['id'];
    QDelete.ExecSQL;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmTaxi.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmTaxi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QTaxi.Close;
end;

procedure TfrmTaxi.BtnPrintClick(Sender: TObject);
begin
    application.CreateForm(TqrTaxi, qrTaxi);
    qrTaxi.lblCoName.Caption := Parameter.CoName;
    qrTaxi.lblIssueDate.Caption := QTaxi['issueDate'];
    qrTaxi.lblDriverName.Caption := QTaxi['DriverName'];
    qrTaxi.lblPassenger.Caption := QTaxi['Passenger'];
    qrTaxi.lblDriverMobile.Caption := QTaxi['DriverMobile'];
    qrTaxi.lblPrice.Caption := QTaxi['Price'];
    qrTaxi.lblUser.Caption := UserInfo.UserName;
    qrTaxi.lblLicensePlate.Caption := QTaxi['LicensePlate'];
    qrTaxi.lblID.Caption := QTaxi['id'];
    qrTaxi.Preview;
    FreeAndNil(qrTaxi);
end;

procedure TfrmTaxi.BitBtn1Click(Sender: TObject);
var
strFilter : string;
begin
    if edtSLicensePlate.Text <> '' then
      strFilter := ' LicensePlate like'+QuotedStr('%'+edtSLicensePlate.Text+'%');

    if edtSDriverMobile.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and DriverMobile like'+QuotedStr('%'+edtSDriverMobile.Text+'%')
        else
            strFilter := ' DriverMobile like'+QuotedStr('%'+edtSDriverMobile.Text+'%');

    if edtSDriverName.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and DriverName like'+QuotedStr('%'+edtSDriverName.Text+'%')
        else
            strFilter := ' DriverName like'+QuotedStr('%'+edtSDriverName.Text+'%');

    if edtSPassengerMobile.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and PassengerMobile like'+QuotedStr('%'+edtSPassengerMobile.Text+'%')
        else
            strFilter := ' PassengerMobile like'+QuotedStr('%'+edtSPassengerMobile.Text+'%');

    if edtSServicePoint.Text <> '' then
        if strFilter <> '' then
            strFilter := strFilter + ' and ServicePoint like'+QuotedStr('%'+edtSServicePoint.Text+'%')
        else
            strFilter := ' ServicePoint like'+QuotedStr('%'+edtSServicePoint.Text+'%');


    QTaxi.Close;
    QTaxi.SQL.Clear;
    QTaxi.SQL.Add('select * from TTaxi inner join TUser ');
    QTaxi.SQL.Add(' on TTaxi.UserID = TUser.UserID');
    if strFilter <> '' then
        QTaxi.SQL.Add(' where '+strFilter);
    QTaxi.SQL.Add(' order by id DESC ');
    QTaxi.Open;
end;

procedure TfrmTaxi.edtLicensePlateExit(Sender: TObject);
begin
    if rbTaxi.Checked then
    begin
        QSearchTaxiInfo.Close;
        QSearchTaxiInfo.Parameters.ParamByName('LicensePlate').Value := edtLicensePlate.Text;
        QSearchTaxiInfo.Open;
        if QSearchTaxiInfo['LicensePlate'] <> null then
        begin
            if not QSearchTaxiInfo['isActive'] then
            begin
                ShowMessage(' «ò”Ì „Ê—œ ‰Ÿ— €Ì—›⁄«· „Ì »«‘œ');
                edtLicensePlate.Clear;
                edtLicensePlate.SetFocus;
                Exit;
            end;
            edtDriverName.Text := QSearchTaxiInfo['DriverName'];
            edtDriverMobile.Text := QSearchTaxiInfo['DriverMobile'];
            edtPrice.SetFocus;
        end;
    end
    else
    begin
        QSearchPrivateTaxi.Close;
        QSearchPrivateTaxi.Parameters.ParamByName('LicensePlate').Value := edtLicensePlate.Text;
        QSearchPrivateTaxi.Open;
        if QSearchPrivateTaxi['LicensePlate1'] <> null then
        begin
            edtDriverName.Text := QSearchPrivateTaxi['DriverName'];
            edtDriverMobile.Text := '‘Œ’Ì';
            edtPrice.SetFocus;
        end
        else
        begin
            ShowMessage('„‘Œ’«  «Ì‰ ŒÊœ—Ê À»  ‰„Ì »«‘œ');
            Exit;
        end;

    end;

end;

end.
