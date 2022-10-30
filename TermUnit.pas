unit TermUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, Mask, StdCtrls, Grids, DBGrids,
  ComCtrls, Buttons, ExtCtrls, DateUtils;

type term = record
    termId : integer;
    startDate: string;
    endDate: string;
    startTime: string;
    endTime: string;
    saturday: Boolean;
    sunday: Boolean;
    mondey: Boolean;
    tuesday: Boolean;
    wednesday: Boolean;
    thursday: Boolean;
    friday: Boolean;
end;

type
  TfrmTerm = class(TForm)
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label16: TLabel;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtRentPoolId: TEdit;
    edtRentPoolTitle: TEdit;
    btnRentPool: TBitBtn;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    MainMenuUnit: TMainMenu;
    MnuFile: TMenuItem;
    MnuInsert: TMenuItem;
    MnuEdit: TMenuItem;
    MnuDelete: TMenuItem;
    N2: TMenuItem;
    MnuReturn: TMenuItem;
    PopupMenuUnit: TPopupMenu;
    MnuPopInsert: TMenuItem;
    MnuPopEdit: TMenuItem;
    MnuPopNone1: TMenuItem;
    MnuPopDelete: TMenuItem;
    SP_Term: TADOStoredProc;
    dsTerm: TDataSource;
    QTerm: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label5: TLabel;
    QDelete: TADOQuery;
    Label1: TLabel;
    edtTitle: TEdit;
    Label2: TLabel;
    edtSessionNumber: TEdit;
    Label3: TLabel;
    edtPriceForSession: TEdit;
    Label4: TLabel;
    edtPrice: TEdit;
    QTermSchedule: TADOQuery;
    SP_TermSchedule: TADOStoredProc;
    QRentPool: TADOQuery;
    Label6: TLabel;
    edtCode: TEdit;
    QHoliday: TADOQuery;
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
    procedure btnRentPoolClick(Sender: TObject);
    procedure scheduledTerm(termId: integer);
    function sessionNumber(rentPoolId: integer; startDate: string; endDate: string): integer;
    procedure edtEndDateExit(Sender: TObject);
    procedure edtCodeExit(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;


var
  frmTerm: TfrmTerm;
  StatusRecord:String;

implementation

uses DMUnit, CalculatUnit, RentPoolInfoUnit, Math, StrUtils, MyDate,
  UFarsiDate;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

function TfrmTerm.sessionNumber(rentPoolId: integer; startDate: string; endDate: string):integer;
var
  CurrDate : TDateTime;
  daysOfWeek: string;
  fs: TFormatSettings;
  sn: integer;
begin
  sn := 0;
  QRentPool.Close;
  QRentPool.Parameters.ParamByName('id').Value := rentPoolId;
  QRentPool.Open;
  if QRentPool['id']<>null then
  begin
    if QRentPool['monday']    then daysOfWeek := daysOfWeek + '1';
    if QRentPool['tuesday']   then daysOfWeek := daysOfWeek + '2';
    if QRentPool['wednesday'] then daysOfWeek := daysOfWeek + '3';
    if QRentPool['thursday']  then daysOfWeek := daysOfWeek + '4';
    if QRentPool['friday']    then daysOfWeek := daysOfWeek + '5';
    if QRentPool['saturday']  then daysOfWeek := daysOfWeek + '6';
    if QRentPool['sunday']    then daysOfWeek := daysOfWeek + '7';

    GetLocaleFormatSettings(GetSystemDefaultLCID, fs);
    fs.DateSeparator := '/';
    fs.ShortDateFormat := 'yyyy/MM/dd';

    CurrDate := StrToDate(Date_SolarToGregorian(startDate), fs);
    while (CurrDate <= StrToDate(Date_SolarToGregorian(endDate), fs)) do
    begin
      if (Pos(intToStr(DayOfTheWeek(CurrDate)), daysOfWeek)) > 0 then
      begin
        QHoliday.Close;
        QHoliday.Parameters.ParamByName('holiday').Value := TFarDate.MiladyToShamsistr(CurrDate);
        QHoliday.Open;
        if QHoliday['id'] = null then sn := sn + 1;
      end;
      CurrDate := CurrDate + 1;
    end;
  end;
  sessionNumber := sn;

end;


procedure TfrmTerm.scheduledTerm(termId: integer);
var
  CurrDate : TDateTime;
  daysOfWeek: string;
  fs: TFormatSettings;
begin

  QTermSchedule.Close;
  QTermSchedule.Parameters.ParamByName('termId').Value := termId;
  QTermSchedule.Open;
  if QTermSchedule['id']<>null then
  begin
    if QTermSchedule['monday']    then daysOfWeek := daysOfWeek + '1';
    if QTermSchedule['tuesday']   then daysOfWeek := daysOfWeek + '2';
    if QTermSchedule['wednesday'] then daysOfWeek := daysOfWeek + '3';
    if QTermSchedule['thursday']  then daysOfWeek := daysOfWeek + '4';
    if QTermSchedule['friday']    then daysOfWeek := daysOfWeek + '5';
    if QTermSchedule['saturday']  then daysOfWeek := daysOfWeek + '6';
    if QTermSchedule['sunday']    then daysOfWeek := daysOfWeek + '7';

    GetLocaleFormatSettings(GetSystemDefaultLCID, fs);
    fs.DateSeparator := '/';
    fs.ShortDateFormat := 'yyyy/MM/dd';

    CurrDate := StrToDate(Date_SolarToGregorian(QTermSchedule['startDate']), fs);
    while (CurrDate <= StrToDate(Date_SolarToGregorian(QTermSchedule['EndDate']), fs)) do
    begin
      if (Pos(intToStr(DayOfTheWeek(CurrDate)), daysOfWeek)) > 0 then
      begin
          QHoliday.Close;
          QHoliday.Parameters.ParamByName('holiday').Value := TFarDate.MiladyToShamsistr(CurrDate);
          QHoliday.Open;
          if QHoliday['id'] = null then
          begin
              SP_TermSchedule.Parameters.ParamByName('@termId').Value := termId;
              SP_TermSchedule.Parameters.ParamByName('@sessionDate').Value := TFarDate.MiladyToShamsistr(CurrDate);
              SP_TermSchedule.Parameters.ParamByName('@Action').Value := 'Insert';
              SP_TermSchedule.ExecProc;
          end;
      end;
      CurrDate := CurrDate + 1;
    end;
  end;

end;

{*******************  SetEnabledDisable  ***********************}
procedure TfrmTerm.SetEnabledDisable(BL:Boolean);
Begin
    Grid.Enabled:=BL;
    PanelButton.Enabled:=BL;
    MnuInsert.Enabled:=BL;
    MnuEdit.Enabled:=BL;
    MnuDelete.Enabled:=BL;
    MnuPopInsert.Enabled:=BL;
    MnuPopEdit.Enabled:=BL;
    MnuPopDelete.Enabled:=BL;
    GroupBox.Visible:=Not BL;
    IF Not BL Then
    Begin
        edtCode.Clear;
        edtRentPoolId.Clear;
        edtRentPoolTitle.Clear;
        edtTitle.Clear;
        edtStartDate.Clear;
        edtEndDate.Clear;
        edtSessionNumber.Clear;
        edtPriceForSession.Clear;
        edtPrice.Clear;
        edtCode.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmTerm.LoadSqlQuery;
Begin
    QTerm.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmTerm.GetValue;
begin
    edtCode.Text:=QTerm['code'];
    edtRentPoolId.Text:=QTerm['rentPoolId'];
    edtRentPoolTitle.Text:=QTerm['rentPoolTitle'];
    edtTitle.Text:=QTerm['title'];
    edtStartDate.Text:=QTerm['startDate'];
    edtEndDate.Text:=QTerm['endDate'];
    edtSessionNumber.Text:=QTerm['sessionNumber'];
    edtPriceForSession.Text:=QTerm['priceForSession'];
    edtPrice.Text:=QTerm['price'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmTerm.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmTerm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmTerm.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmTerm.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmTerm.BtnSaveClick(Sender: TObject);
begin
    IF (edtRentPoolId.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        btnRentPool.SetFocus;
        Exit;
    End;
    SP_Term.Parameters.ParamByName('@id').Value:=QTerm['id'];
    SP_Term.Parameters.ParamByName('@code').Value:=edtCode.Text;
    SP_Term.Parameters.ParamByName('@rentPoolId').Value:=edtRentPoolId.Text;
    SP_Term.Parameters.ParamByName('@title').Value:=edtTitle.Text;
    SP_Term.Parameters.ParamByName('@startDate').Value:=edtStartDate.Text;
    SP_Term.Parameters.ParamByName('@endDate').Value:=edtEndDate.Text;
    SP_Term.Parameters.ParamByName('@sessionNumber').Value:=edtSessionNumber.Text;
    SP_Term.Parameters.ParamByName('@priceForSession').Value:=edtPriceForSession.Text;
    SP_Term.Parameters.ParamByName('@price').Value:=edtPrice.Text;
    IF StatusRecord='Insert' then
        SP_Term.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Term.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Term.ExecProc;

    ////// Scheduled ////////////
    IF StatusRecord='Insert' then scheduledTerm(SP_Term.Parameters.ParamByName('@termId').Value);
    StatusRecord:='';
    SetEnabledDisable(True);
    QTerm.Close;
    QTerm.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmTerm.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmTerm.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmTerm.BtnEditClick(Sender: TObject);
begin
    IF (QTerm.RecNo<=0) OR (QTerm.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmTerm.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QTerm.RecNo<=0) OR (QTerm.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QTerm['id'];
    QDelete.ExecSQL;
    QTerm.Close;
    QTerm.Open;
    Grid.SetFocus;
  except
   ShowMessage('Œÿ« œ— Õ–› «ÿ·«⁄« ');
  end;    
end;

{*******************  Form Show  ***********************}
procedure TfrmTerm.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
    //ShowMessage(Date_SolarToGregorian(CurrentDate));

end;

{*******************  Form Close  ***********************}
procedure TfrmTerm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QTerm.Close;
end;


procedure TfrmTerm.btnRentPoolClick(Sender: TObject);
begin
    Application.CreateForm(TfrmRentPoolInfo, frmRentPoolInfo);
    frmRentPoolInfo.ShowModal;
    if frmRentPoolInfo.strKey='enter' then
    begin
        edtRentPoolId.Text:=frmRentPoolInfo.QRent['id'];
        edtRentPoolTitle.Text:=frmRentPoolInfo.QRent['title'];
        edtTitle.SetFocus;
    end;
    FreeAndNil(frmRentPoolInfo);
end;

procedure TfrmTerm.edtEndDateExit(Sender: TObject);
begin
    if (edtStartDate.Text <> '1   /  /  ') and (edtEndDate.Text <> '1   /  /  ') and (edtRentPoolId.Text <> '') then
      edtSessionNumber.Text := IntToStr(sessionNumber(StrToIntDef(edtRentPoolId.Text, 0), edtStartDate.Text, edtEndDate.Text))
end;

procedure TfrmTerm.edtCodeExit(Sender: TObject);
begin
  btnRentPool.SetFocus;
end;

end.
