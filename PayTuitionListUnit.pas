unit PayTuitionListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Mask, Grids, DBGrids,
  ComCtrls, Buttons, ExtCtrls;

type
  TfrmPayTuitionList = class(TForm)
    PanelButton: TPanel;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    Panel1: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    BBtnAccept: TBitBtn;
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
    SP_Enrollment: TADOStoredProc;
    dsPaymentEnrollment: TDataSource;
    QPaymentEnrollment: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDelete: TADOQuery;
    Label4: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtSearchCreditCardCode: TEdit;
    edtSearchNID: TEdit;
    edtSearchGeneralCode: TEdit;
    QSum: TADOQuery;
    Label2: TLabel;
    lblSum: TLabel;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPayTuitionList: TfrmPayTuitionList;

implementation

uses CalculatUnit, UserInfoUnit, DMUnit;

{$R *.dfm}

procedure TfrmPayTuitionList.BBtnAcceptClick(Sender: TObject);
var
strFilter : string;
begin
  strFilter := 'paymentDate >= '+QuotedStr(edtStartDate.Text)+' and paymentDate <='+QuotedStr(edtEndDate.Text);

  if edtUserID.Text <> '' then
    strFilter := strFilter + ' and TPaymentEnrollment.userId = '+edtUserID.Text;

  if edtSearchCreditCardCode.Text <> '' then
      strFilter := strFilter + ' and TCreditCard.cardId = '+edtSearchCreditCardCode.Text;

  if edtSearchNID.Text <> '' then
      strFilter := strFilter + ' and TCreditCard.NID = '+edtSearchNID.Text;

  if edtSearchGeneralCode.Text <> '' then
      strFilter := strFilter + ' and TCreditCard.GeneralCode = '+edtSearchGeneralCode.Text;


  QPaymentEnrollment.Close;
  QPaymentEnrollment.SQL.Clear;
  QPaymentEnrollment.SQL.Add('select TPaymentEnrollment.id, TPaymentEnrollment.price payment, UserName, paymentDate, TLesson.Title, ');
  QPaymentEnrollment.SQL.Add('TEnrollment.price enrollmentPrice, TCreditCard.name+'' ''+TCreditCard.lastName name, TCreditCard.Tel');
  QPaymentEnrollment.SQL.Add('from TPaymentEnrollment');
  QPaymentEnrollment.SQL.Add('inner join TEnrollment on TPaymentEnrollment.enrollmentId = TEnrollment.id');
  QPaymentEnrollment.SQL.Add('inner join TCreditCard on TEnrollment.creditCardId = TCreditCard.id');
  QPaymentEnrollment.SQL.Add('inner join TLesson on TEnrollment.lessonId = TLesson.id');
  QPaymentEnrollment.SQL.Add('inner join TUser on TPaymentEnrollment.userId = TUser.UserID');
  QPaymentEnrollment.SQL.Add('where '+strFilter);
  QPaymentEnrollment.Open;

  QSum.Close;
  QSum.SQL.Clear;
  QSum.SQL.Add('select isNull(sum(TPaymentEnrollment.price), 0) sumPayment');
  QSum.SQL.Add('from TPaymentEnrollment');
  QSum.SQL.Add('inner join TEnrollment on TPaymentEnrollment.enrollmentId = TEnrollment.id');
  QSum.SQL.Add('inner join TCreditCard on TEnrollment.creditCardId = TCreditCard.id');
  QSum.SQL.Add('inner join TLesson on TEnrollment.lessonId = TLesson.id');
  QSum.SQL.Add('inner join TUser on TPaymentEnrollment.userId = TUser.UserID');
  QSum.SQL.Add('where '+strFilter);
  QSum.Open;

  if QSum['sumPayment'] <> null then
    lblSum.Caption := FormatFloat('#,', QSum['sumPayment']);



end;

procedure TfrmPayTuitionList.FormCreate(Sender: TObject);
begin
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
    BBtnAcceptClick(Sender);
end;

procedure TfrmPayTuitionList.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPayTuitionList.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

end.
