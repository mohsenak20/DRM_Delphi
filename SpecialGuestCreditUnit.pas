unit SpecialGuestCreditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Mask, Grids, DBGrids,
  ComCtrls, Buttons, ExtCtrls;

type
  TfrmSpecialGuestCredit = class(TForm)
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
    Panel1: TPanel;
    BBtnAccept: TBitBtn;
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
    SP_SpecialGuestCredit: TADOStoredProc;
    dsGuestCredit: TDataSource;
    QSpecialGuestCredit: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDel: TADOQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblReceptionID: TLabel;
    lblKeyNumber: TLabel;
    lblCustomerName: TLabel;
    Label6: TLabel;
    lblStartTime: TLabel;
    Label9: TLabel;
    lblNumber: TLabel;
    btnSearch: TBitBtn;
    edtCredit: TEdit;
    Label4: TLabel;
    chbdisable: TCheckBox;
    edtComment: TEdit;
    lblComment: TLabel;
    Label7: TLabel;
    edtReceptionDate: TMaskEdit;
    Label5: TLabel;
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
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmSpecialGuestCredit: TfrmSpecialGuestCredit;
    StatusRecord:String;

implementation

uses CalculatUnit, SearchCustomerUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmSpecialGuestCredit.SetEnabledDisable(BL:Boolean);
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
        btnSearch.SetFocus;
        edtCredit.Text := '2000000';
        edtComment.Clear;
        chbdisable.Checked := False;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmSpecialGuestCredit.LoadSqlQuery;
Begin
    QSpecialGuestCredit.Parameters.ParamByName('Receptiondate').Value := CurrentDate;
    QSpecialGuestCredit.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmSpecialGuestCredit.GetValue;
begin
    edtCredit.Text:=QSpecialGuestCredit.fieldByName('Credit').Text;
    edtComment.Text:=QSpecialGuestCredit.fieldByName('Comment').Text;
    chbdisable.Checked := not QSpecialGuestCredit['is_active'];
    lblReceptionID.Caption:= QSpecialGuestCredit['ReceptionID'];
    lblKeyNumber.Caption:= QSpecialGuestCredit.fieldByName('ClosedID').Text;;
    lblCustomerName.Caption:= QSpecialGuestCredit.fieldByName('CustomerName').Text;;
    lblStartTime.Caption:= QSpecialGuestCredit.fieldByName('StartTime').Text;;

end;

{*******************  FormCreate  ***********************}
procedure TfrmSpecialGuestCredit.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmSpecialGuestCredit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmSpecialGuestCredit.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmSpecialGuestCredit.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmSpecialGuestCredit.BtnSaveClick(Sender: TObject);

begin
    IF (edtCredit.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtComment.SetFocus;
        Exit;
    End;
    if QSpecialGuestCredit['id'] <> null then
        SP_SpecialGuestCredit.Parameters.ParamByName('@id').Value:=QSpecialGuestCredit['id']
    else
        SP_SpecialGuestCredit.Parameters.ParamByName('@id').Value:='-1';
    SP_SpecialGuestCredit.Parameters.ParamByName('@ReceptionID').Value:=lblReceptionID.Caption;
    SP_SpecialGuestCredit.Parameters.ParamByName('@UserID').Value:= UserInfo.UserID;
    SP_SpecialGuestCredit.Parameters.ParamByName('@Credit').Value:=edtCredit.Text;
    SP_SpecialGuestCredit.Parameters.ParamByName('@is_active').Value:=not chbdisable.Checked;
    SP_SpecialGuestCredit.Parameters.ParamByName('@Comment').Value:=edtComment.Text;
    IF StatusRecord='Insert' then
        SP_SpecialGuestCredit.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_SpecialGuestCredit.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_SpecialGuestCredit.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QSpecialGuestCredit.Close;
    QSpecialGuestCredit.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QSpecialGuestCredit.Open;
    Grid.SetFocus;
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmSpecialGuestCredit.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmSpecialGuestCredit.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmSpecialGuestCredit.BtnEditClick(Sender: TObject);
begin
    IF (QSpecialGuestCredit.RecNo<=0) OR (QSpecialGuestCredit.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmSpecialGuestCredit.BtnDelClick(Sender: TObject);
begin
    IF ((QSpecialGuestCredit.RecNo<=0) OR (QSpecialGuestCredit.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDel.Close;
    QDel.Parameters.ParamByName('id').Value:=QSpecialGuestCredit['id'];
    QDel.ExecSQL;
    QSpecialGuestCredit.Close;
    QSpecialGuestCredit.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QSpecialGuestCredit.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmSpecialGuestCredit.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmSpecialGuestCredit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QSpecialGuestCredit.Close;
end;


procedure TfrmSpecialGuestCredit.BBtnAcceptClick(Sender: TObject);
begin
    QSpecialGuestCredit.Close;
    if edtReceptionDate.Text <> '1   /  /  ' then
        QSpecialGuestCredit.Parameters.ParamByName('ReceptionDate').Value := edtReceptionDate.Text
    else
        QSpecialGuestCredit.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QSpecialGuestCredit.Open;

end;

procedure TfrmSpecialGuestCredit.btnSearchClick(Sender: TObject);
begin
    lblReceptionID.Caption:='';
    lblKeyNumber.Caption:='';
    lblCustomerName.Caption:='';
    lblStartTime.Caption:='';

    Application.CreateForm(TfrmSearchKeyNumber, frmSearchKeyNumber);
    frmSearchKeyNumber.ShowModal;
    if frmSearchKeyNumber.QSearch.Active = false then Exit;

    if (frmSearchKeyNumber.strKey='enter') and (frmSearchKeyNumber.lblReceptionID.Caption<>'') then
    begin
        lblReceptionID.Caption:=frmSearchKeyNumber.lblReceptionID.Caption;
        lblKeyNumber.Caption:=frmSearchKeyNumber.edtKeyNumber.Text;
        lblCustomerName.Caption:=frmSearchKeyNumber.lblCustomerName.Caption;
        lblStartTime.Caption:=frmSearchKeyNumber.QSearch['StartTime'];
        lblNumber.Caption := frmSearchKeyNumber.QSearch['NumberOfAdult']+frmSearchKeyNumber.QSearch['NumberOfChild'];
        edtComment.SetFocus;
    end;
    FreeAndNil(frmSearchKeyNumber);
end;

end.
