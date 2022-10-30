unit EnrollmentUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ActnList, ADODB, DB, Menus, Grids, DBGrids,
  ComCtrls, Buttons, ExtCtrls;

type
  TfrmEnrollment = class(TForm)
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
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
    SP_Enrollment: TADOStoredProc;
    dsEnrollment: TDataSource;
    QEnrollment: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDelete: TADOQuery;
    Panel1: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    BBtnAccept: TBitBtn;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    gbLesson: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    lblLessonId: TLabel;
    lblLessonCode: TLabel;
    lblAgeCategory: TLabel;
    lblLessonType: TLabel;
    lblLessonGroup: TLabel;
    lblLessonPrice: TLabel;
    lblLessonCapacity: TLabel;
    lblLessonCapacityRemain: TLabel;
    lblLessonTitle: TLabel;
    btnLessonCode: TBitBtn;
    edtLessonCode: TEdit;
    QLesson: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
    SP_PaymentEnrollment: TADOStoredProc;
    QCreditCard: TADOQuery;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    edtCreditCardID: TEdit;
    btnSearchCreditCard: TBitBtn;
    edtNID: TEdit;
    edtGeneralCode: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    lblCreditCardId: TLabel;
    lblName: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtSearchCreditCardCode: TEdit;
    edtSearchNID: TEdit;
    edtSearchGeneralCode: TEdit;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    edtSearchLessonTitle: TEdit;
    edtSearchLessonId: TEdit;
    QCheckCanEnrollment: TADOQuery;
    chbDebtor: TCheckBox;
    btnPay: TBitBtn;
    procedure btnLessonCodeClick(Sender: TObject);
    procedure lessonInfo();
    procedure btnSearchCreditCardClick(Sender: TObject);
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
    procedure BitBtn1Click(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPayClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmEnrollment: TfrmEnrollment;
  StatusRecord:String;
implementation

uses DMUnit, CalculatUnit, LessonInfoUnit, TuitionPayUnit, DateUtils;

{$R *.dfm}

procedure TfrmEnrollment.lessonInfo();
begin
    Application.CreateForm(TfrmLessonInfo, frmLessonInfo);
    frmLessonInfo.ShowModal;
    if frmLessonInfo.strKey='enter' then
    begin
        lblLessonId.Caption := frmlessonInfo.QLesson['id'];
        lblLessonCode.Caption := frmlessonInfo.QLesson['code'];
        lblLessonTitle.Caption := frmlessonInfo.QLesson['title'];
        lblLessonType.Caption := frmlessonInfo.QLesson['lessonTypeTitle'];
        lblLessonGroup.Caption := frmlessonInfo.QLesson['lessonGroupTitle'];
        lblAgeCategory.Caption := frmlessonInfo.QLesson['agecategoryTitle'];
        lblLessonPrice.Caption := frmlessonInfo.QLesson['price'];
        lblLessonCapacity.Caption := frmlessonInfo.QLesson['capacity'];
        if frmlessonInfo.QLesson['enrollmentCount'] <> null then
              lblLessonCapacityRemain.Caption := frmlessonInfo.QLesson['capacity']-frmlessonInfo.QLesson['enrollmentCount']
            else
              lblLessonCapacityRemain.Caption := frmlessonInfo.QLesson['capacity'];
        edtCreditCardID.SetFocus
    end;
    FreeAndNil(frmLessonInfo);
end;

procedure TfrmEnrollment.btnLessonCodeClick(Sender: TObject);
begin
    if edtLessonCode.Text <> '' then
    begin
        QLesson.Close;
        QLesson.Parameters.ParamByName('lessonCode').Value := edtLessonCode.Text;
        QLesson.Open;
        if QLesson['id'] <> null then
        begin
            lblLessonId.Caption := QLesson['id'];
            lblLessonCode.Caption := QLesson['code'];
            lblLessonTitle.Caption := QLesson['title'];
            lblLessonType.Caption := QLesson['lessonTypeTitle'];
            lblLessonGroup.Caption := QLesson['lessonGroupTitle'];
            lblAgeCategory.Caption := QLesson['agecategoryTitle'];
            lblLessonPrice.Caption := QLesson['price'];
            lblLessonCapacity.Caption := QLesson['capacity'];
            if QLesson['enrollmentCount'] <> null then
              lblLessonCapacityRemain.Caption := QLesson['capacity']-QLesson['enrollmentCount']
            else
              lblLessonCapacityRemain.Caption := QLesson['capacity'];
        end
        else
          lessonInfo;
    end
    else
      lessonInfo;

    edtCreditCardID.SetFocus;
end;

procedure TfrmEnrollment.btnSearchCreditCardClick(Sender: TObject);
var
  strFilter : string;
begin
    if edtCreditCardID.Text <> '' then
      strFilter := 'CardID='+QuotedStr(edtCreditCardID.Text);

    if edtNID.Text <> '' then
      strFilter := 'NID='+QuotedStr(edtNID.Text);

    if edtGeneralCode.Text <> '' then
      strFilter := 'generalCode='+QuotedStr(edtGeneralCode.Text);

    QCreditCard.Close;
    QCreditCard.SQL.Clear;
    QCreditCard.SQL.Add('select * from TCreditCard where '+strFilter);
    QCreditCard.Open;
    if QCreditCard['id'] <> null then
    begin
      lblCreditCardId.Caption := QCreditCard['id'];
      lblName.Caption := QCreditCard['name']+' '+QCreditCard['lastName'];
      BtnSave.SetFocus;
    end
    else
    begin
        ShowMessage('‘Œ’ „Ê—œ ‰Ÿ— Ì«›  ‰‘œ');
    end;

end;

procedure TfrmEnrollment.SetEnabledDisable(BL:Boolean);
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
        edtLessonCode.Clear;
        edtCreditCardID.Clear;
        edtNID.Clear;
        edtGeneralCode.Clear;
        lblLessonId.Caption := '';
        lblLessonCode.Caption := '';
        lblLessonTitle.Caption := '';
        lblLessonType.Caption := '';
        lblLessonGroup.Caption := '';
        lblAgeCategory.Caption := '';
        lblLessonPrice.Caption := '';
        lblLessonCapacity.Caption := '';
        lblCreditCardId.Caption := '';
        lblName.Caption := '';
        edtLessonCode.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmEnrollment.LoadSqlQuery;
Begin
    QEnrollment.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmEnrollment.GetValue;
begin
    lblLessonId.Caption := QEnrollment['lessonId'];
    lblLessonCode.Caption := QEnrollment['lessonCode'];
    lblLessonTitle.Caption := QEnrollment['lessonTitle'];
    lblLessonType.Caption := QEnrollment['lessonTypeTitle'];
    lblLessonGroup.Caption := QEnrollment['lessonGroupTitle'];
    lblAgeCategory.Caption := QEnrollment['ageCategoryTitle'];
    lblLessonPrice.Caption := QEnrollment['enrollmentPrice'];
    lblLessonCapacity.Caption := QEnrollment['capacity'];
    lblCreditCardId.Caption := QEnrollment['creditCardId'];
    lblName.Caption := QEnrollment['name'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmEnrollment.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmEnrollment.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmEnrollment.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmEnrollment.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmEnrollment.BtnSaveClick(Sender: TObject);
begin
    IF (lblLessonId.Caption='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtLessonCode.SetFocus;
        Exit;
    End;
    QCheckCanEnrollment.Close;
    QCheckCanEnrollment.Parameters.ParamByName('lessonId').Value := lblLessonId.Caption;
    QCheckCanEnrollment.Parameters.ParamByName('creditCardId').Value := lblCreditCardId.Caption;
    QCheckCanEnrollment.Open;
    if QCheckCanEnrollment['id'] <> null then
    begin
        ShowMessage('À»  ‰«„ «Ì‰ ‘Œ’ ﬁ»·« «‰Ã«„ ‘œÂ «” ');
        Exit;
    end;
    SP_Enrollment.Parameters.ParamByName('@id').Value:=-1;
    SP_Enrollment.Parameters.ParamByName('@lessonId').Value:=lblLessonId.Caption;
    SP_Enrollment.Parameters.ParamByName('@creditCardId').Value:=lblCreditCardId.Caption;
    SP_Enrollment.Parameters.ParamByName('@enrollmentDate').Value:=CurrentDate;
    SP_Enrollment.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;
    SP_Enrollment.Parameters.ParamByName('@price').Value:=lblLessonPrice.Caption;
    IF StatusRecord='Insert' then
        SP_Enrollment.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Enrollment.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Enrollment.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QEnrollment.Close;
    QEnrollment.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmEnrollment.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmEnrollment.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmEnrollment.BtnEditClick(Sender: TObject);
begin
    IF (QEnrollment.RecNo<=0) OR (QEnrollment.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmEnrollment.BtnDelClick(Sender: TObject);
begin
    IF ((QEnrollment.RecNo<=0) OR (QEnrollment.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('enrollmentId').Value := QEnrollment['id'];
    QDelete.ExecSQL;
    QEnrollment.Close;
    QEnrollment.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmEnrollment.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmEnrollment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QEnrollment.Close;
end;

procedure TfrmEnrollment.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmLessonInfo, frmLessonInfo);
    frmLessonInfo.ShowModal;
    if frmLessonInfo.strKey='enter' then
    begin
        edtSearchLessonId.Text := frmlessonInfo.QLesson['id'];
        edtSearchLessonTitle.Text := frmlessonInfo.QLesson['title'];
        BBtnAccept.SetFocus
    end;
    FreeAndNil(frmLessonInfo);
end;

procedure TfrmEnrollment.BBtnAcceptClick(Sender: TObject);
var
strFilter : string;
begin
  if edtSearchLessonId.Text <> '' then
    strFilter := 'TEnrollment.lessonId = '+edtSearchLessonId.Text;

  if edtSearchCreditCardCode.Text <> '' then
    if strFilter <> '' then
        strFilter := strFilter + ' and TCreditCard.cardId = '+edtSearchCreditCardCode.Text
    else
        strFilter := 'TCreditCard.cardId = '+edtSearchCreditCardCode.Text;

  if edtSearchNID.Text <> '' then
    if strFilter <> '' then
        strFilter := strFilter + ' and TCreditCard.NID = '+edtSearchNID.Text
    else
        strFilter := 'TCreditCard.NID = '+edtSearchNID.Text;


  if edtSearchGeneralCode.Text <> '' then
    if strFilter <> '' then
        strFilter := strFilter + ' and TCreditCard.GeneralCode = '+edtSearchGeneralCode.Text
    else
        strFilter := 'TCreditCard.GeneralCode = '+edtSearchGeneralCode.Text;


  if edtStartDate.Text <> '1   /  /  ' then
    if strFilter <> '' then
        strFilter := strFilter + ' and enrollmentDate>='+edtStartDate.Text
    else
        strFilter := 'enrollmentDate >= '+edtStartDate.Text;

  if edtStartDate.Text <> '1   /  /  ' then
    if strFilter <> '' then
        strFilter := strFilter + ' and enrollmentDate<='+edtEndDate.Text
    else
        strFilter := 'enrollmentDate <= '+edtEndDate.Text;

  if chbDebtor.Checked then
    if strFilter <> '' then
      strFilter := strFilter + 'and (select isnull(sum(price), 0) from TPaymentEnrollment where enrollmentId = TEnrollment.id) < enrollmentPrice'
    else
      strFilter := '(select isnull(sum(price), 0) from TPaymentEnrollment where enrollmentId = TEnrollment.id) < TEnrollment.price';

  QEnrollment.Close;
  QEnrollment.SQL.Clear;
  QEnrollment.SQL.Add('select TEnrollment.id id, enrollmentDate, TLesson.id lessonId, TLesson.code ');
  QEnrollment.SQL.Add('lessonCode, TLesson.title lessonTitle, TLessonType.title lessonTypeTitle, ');
  QEnrollment.SQL.Add('TLessonGroup.title lessonGroupTitle, TageCategory.title ageCategoryTitle,');
  QEnrollment.SQL.Add('TEnrollment.price enrollmentPrice, capacity, TCreditCard.id creditCardId, ');
  QEnrollment.SQL.Add('TCreditCard.name+'' ''+TCreditCard.lastName name,');
  QEnrollment.SQL.Add('(select isnull(sum(price), 0) from TPaymentEnrollment where enrollmentId = TEnrollment.id) payment');
  QEnrollment.SQL.Add('from TEnrollment ');
  QEnrollment.SQL.Add('inner join TCreditCard on TEnrollment.creditCardId = TCreditCard.id');
  QEnrollment.SQL.Add('inner join TLesson on TEnrollment.lessonId = TLesson.id');
  QEnrollment.SQL.Add('inner join TLessonType on TLesson.lessonTypeId = TLessonType.id');
  QEnrollment.SQL.Add('inner join TLessonGroup on TLesson.lessonGroupId = TLessonGroup.id');
  QEnrollment.SQL.Add('inner join TageCategory on TLesson.ageCategoryId = TageCategory.id');
  if strFilter <> '' then
    QEnrollment.SQL.Add('where '+strFilter);
  QEnrollment.Open;

end;


procedure TfrmEnrollment.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If QEnrollment['enrollmentPrice'] > QEnrollment['payment'] then
      Grid.Canvas.Brush.Color:=clTeal;
    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmEnrollment.btnPayClick(Sender: TObject);
begin
   If QEnrollment['enrollmentPrice'] > QEnrollment['payment'] then
   begin
     Application.CreateForm(TfrmTuitionPay, frmTuitionPay);
     frmTuitionPay.lblEnrollmentId.Caption := IntToStr(QEnrollment['id']);
     frmTuitionPay.lblLessonCode.Caption := QEnrollment['lessonCode'];
     frmTuitionPay.lblLessonTitle.Caption := QEnrollment['lessonTitle'];
     frmTuitionPay.lblPrice.Caption := IntToStr(QEnrollment['enrollmentPrice']);
     frmTuitionPay.lblPayed.Caption := IntToStr(QEnrollment['payment']);
     frmTuitionPay.lblMustPay.Caption := IntToStr(QEnrollment['enrollmentPrice'] - QEnrollment['payment']);
     frmTuitionPay.edtPay.Text := IntToStr(QEnrollment['enrollmentPrice'] - QEnrollment['payment']);
     frmTuitionPay.ShowModal;
     FreeAndNil(frmTuitionPay);
     BBtnAcceptClick(Sender);
   end
   else
      ShowMessage('‘Â—ÌÂ Å—œ«Œ  ‘œÂ «” ');
end;

end.
