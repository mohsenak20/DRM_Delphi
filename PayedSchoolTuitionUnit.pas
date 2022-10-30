unit PayedSchoolTuitionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Mask, Grids, DBGrids,
  ComCtrls, Buttons, ExtCtrls;

type
  TfrmPayedSchoolTuition = class(TForm)
    PanelButton: TPanel;
    Label2: TLabel;
    lblSum: TLabel;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    Panel1: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label4: TLabel;
    BBtnAccept: TBitBtn;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
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
    dsSchoolPayment: TDataSource;
    QSchoolPayment: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDelete: TADOQuery;
    QSum: TADOQuery;
    Label1: TLabel;
    edtStudentId: TEdit;
    edtStudentName: TEdit;
    btnStudent: TBitBtn;
    Label3: TLabel;
    edtTermId: TEdit;
    edtTermTitle: TEdit;
    btnTerm: TBitBtn;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnStudentClick(Sender: TObject);
    procedure btnTermClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPayedSchoolTuition: TfrmPayedSchoolTuition;

implementation

uses CalculatUnit, UserInfoUnit, DMUnit, StudentInfoUnit, TermInfoUnit;

{$R *.dfm}

procedure TfrmPayedSchoolTuition.BBtnAcceptClick(Sender: TObject);
var
strFilter : string;
begin
  strFilter := 'paymentDate >= '+QuotedStr(edtStartDate.Text)+' and paymentDate <='+QuotedStr(edtEndDate.Text);

  if edtUserID.Text <> '' then
    strFilter := strFilter + ' and TSchoolPayment.userId = '+edtUserID.Text;

  if edtStudentId.Text <> '' then
      strFilter := strFilter + ' and TStudentEnrollment.studentId = '+edtStudentId.Text;

  if edtTermId.Text <> '' then
      strFilter := strFilter + ' and TTerm.id = '+edtTermId.Text;


  QSchoolPayment.Close;
  QSchoolPayment.SQL.Clear;
  QSchoolPayment.SQL.Add('select TSchoolPayment.id, TSchoolPayment.price payment, UserName, paymentDate, TTerm.Title termTitle,');
  QSchoolPayment.SQL.Add('TStudentEnrollment.price enrollmentPrice, TPool.title poolTitle, TStudent.name +'' ''+TStudent.family studentName');
  QSchoolPayment.SQL.Add('from TSchoolPayment');
  QSchoolPayment.SQL.Add('inner join TStudentEnrollment on TSchoolPayment.studentEnrollmentId = TStudentEnrollment.id');
  QSchoolPayment.SQL.Add('inner join TTerm on TStudentEnrollment.termId = TTerm.id');
  QSchoolPayment.SQL.Add('inner join TStudent on TStudentEnrollment.studentId = TStudent.id');
  QSchoolPayment.SQL.Add('inner join TRentPool on TTerm.rentPoolId = TRentPool.id');
  QSchoolPayment.SQL.Add('inner join TPool on TRentPool.poolId = TPool.id');
  QSchoolPayment.SQL.Add('inner join TUser on TSchoolPayment.userId = TUser.UserID');
  QSchoolPayment.SQL.Add('where '+strFilter);
  QSchoolPayment.Open;

  QSum.Close;
  QSum.SQL.Clear;
  QSum.SQL.Add('select isNull(sum(TSchoolPayment.price), 0) sumPayment');
  QSum.SQL.Add('from TSchoolPayment');
  QSum.SQL.Add('inner join TStudentEnrollment on TSchoolPayment.studentEnrollmentId = TStudentEnrollment.id');
  QSum.SQL.Add('inner join TTerm on TStudentEnrollment.termId = TTerm.id');
  QSum.SQL.Add('inner join TRentPool on TTerm.rentPoolId = TRentPool.id');
  QSum.SQL.Add('inner join TPool on TRentPool.poolId = TPool.id');
  QSum.SQL.Add('inner join TUser on TSchoolPayment.userId = TUser.UserID');
  QSum.SQL.Add('where '+strFilter);
  QSum.Open;

  if QSum['sumPayment'] <> null then
    lblSum.Caption := FormatFloat('#,', QSum['sumPayment']);

end;

procedure TfrmPayedSchoolTuition.FormCreate(Sender: TObject);
begin
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
    BBtnAcceptClick(Sender);
end;

procedure TfrmPayedSchoolTuition.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPayedSchoolTuition.btnUserClick(Sender: TObject);
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

procedure TfrmPayedSchoolTuition.btnStudentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStudentInfo, frmStudentInfo);
    frmStudentInfo.ShowModal;
    if frmStudentInfo.strKey='enter' then
    begin
        edtStudentId.Text:=frmStudentInfo.QStudent['id'];
        edtStudentName.Text:=frmStudentInfo.QStudent['name']+' '+frmStudentInfo.QStudent['family'];
        btnTerm.SetFocus;
    end;
    FreeAndNil(frmStudentInfo);
end;

procedure TfrmPayedSchoolTuition.btnTermClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTermInfo, frmTermInfo);
    frmTermInfo.ShowModal;
    if frmTermInfo.strKey='enter' then
    begin
        edtTermId.Text:=frmTermInfo.QTerm['id'];
        edtTermTitle.Text:=frmTermInfo.QTerm['title'];
        edtStartDate.SetFocus;
    end;
    FreeAndNil(frmTermInfo);
end;

end.
