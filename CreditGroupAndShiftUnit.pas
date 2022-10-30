unit CreditGroupAndShiftUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmCreditGroupAndShift = class(TForm)
    Panel1: TPanel;
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label11: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtGroupTitle: TEdit;
    btnGroup: TBitBtn;
    edtGroupId: TEdit;
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
    SP_GroupAndShift: TADOStoredProc;
    dsGroupAndShit: TDataSource;
    QGroupAndShift: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label1: TLabel;
    edtShiftTitle: TEdit;
    btnShift: TBitBtn;
    edtShiftId: TEdit;
    Label2: TLabel;
    edtSearchGroupTitle: TEdit;
    btnSearchGroup: TBitBtn;
    edtSearchGroupID: TEdit;
    Label3: TLabel;
    edtSearchShiftTitle: TEdit;
    btnSearchShift: TBitBtn;
    edtSearchShiftId: TEdit;
    BBtnAccept: TBitBtn;
    QDelete: TADOQuery;
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
    procedure btnGroupClick(Sender: TObject);
    procedure btnSearchGroupClick(Sender: TObject);
    procedure btnSearchShiftClick(Sender: TObject);
    procedure btnShiftClick(Sender: TObject);

  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;
var
  frmCreditGroupAndShift: TfrmCreditGroupAndShift;
  StatusRecord:String;

implementation

uses DMUnit, CreditCardGroupInfoUnit, ShiftInfoUnit;

{$R *.dfm}


{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmCreditGroupAndShift.SetEnabledDisable(BL:Boolean);
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
        edtGroupId.Clear;
        edtGroupTitle.Clear;
        edtShiftId.Clear;
        edtShiftTitle.Clear;
        btnGroup.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmCreditGroupAndShift.LoadSqlQuery;
Begin
    QGroupAndShift.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmCreditGroupAndShift.GetValue;
begin
    edtGroupId.Text:=QGroupAndShift['CreditGroupId'];
    edtGroupTitle.Text:=QGroupAndShift['CreditGroupName'];
    edtShiftId.Text:=QGroupAndShift['shiftId'];
    edtShiftTitle.Text:=QGroupAndShift['shiftTitle'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmCreditGroupAndShift.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmCreditGroupAndShift.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmCreditGroupAndShift.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmCreditGroupAndShift.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmCreditGroupAndShift.BtnSaveClick(Sender: TObject);
begin
    IF (edtGroupTitle.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtGroupTitle.SetFocus;
        Exit;
    End;
    SP_GroupAndShift.Parameters.ParamByName('@id').Value:=QGroupAndShift['id'];
    SP_GroupAndShift.Parameters.ParamByName('@creditGroupId').Value:=edtGroupId.Text;
    SP_GroupAndShift.Parameters.ParamByName('@shiftId').Value:=edtShiftId.Text;
    IF StatusRecord='Insert' then
        SP_GroupAndShift.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_GroupAndShift.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_GroupAndShift.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QGroupAndShift.Close;
    QGroupAndShift.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmCreditGroupAndShift.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmCreditGroupAndShift.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmCreditGroupAndShift.BtnEditClick(Sender: TObject);
begin
    IF (QGroupAndShift.RecNo<=0) OR (QGroupAndShift.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmCreditGroupAndShift.BtnDelClick(Sender: TObject);
begin
    IF ((QGroupAndShift.RecNo<=0) OR (QGroupAndShift.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QGroupAndShift['id'];
    QDelete.ExecSQL;
    QGroupAndShift.Close;
    QGroupAndShift.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmCreditGroupAndShift.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmCreditGroupAndShift.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QGroupAndShift.Close;
end;

procedure TfrmCreditGroupAndShift.BBtnAcceptClick(Sender: TObject);
var
  strFilter: string;
begin
  if edtSearchGroupID.Text <> '' then
      strFilter := 'TcreditGroup.creditGroupId ='+edtSearchGroupID.Text;

  if edtSearchShiftId.Text <> '' then
    if strFilter <> '' then
        strFilter := strFilter + ' and Tshift.id = '+edtSearchShiftId.Text;

  QGroupAndShift.Close;
  QGroupAndShift.SQL.Clear;
  QGroupAndShift.SQL.Add('select TCreditGroupAndShift.id, CreditGroupName, TCreditGroup.CreditGroupID, Tshift.title shiftTitle, shiftId');
  QGroupAndShift.SQL.Add('from TCreditGroupAndShift ');
  QGroupAndShift.SQL.Add('inner join TCreditGroup on TCreditGroupAndShift.creditGroupId = TCReditGroup.CreditGroupID');
  QGroupAndShift.SQL.Add('inner join TShift on TCreditGroupAndShift.shiftId = Tshift.id');
  if strFilter <> '' then
    QGroupAndShift.SQL.Add('where '+strFilter);
  QGroupAndShift.Open;
end;

procedure TfrmCreditGroupAndShift.btnGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardGroupInfo, frmCreditCardGroupInfo);
    frmCreditCardGroupInfo.ShowModal;
    if frmCreditCardGroupInfo.strKey='enter' then
    begin
        edtGroupId.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupID'];
        edtGroupTitle.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupName'];
        btnShift.SetFocus;
    end;
    FreeAndNil(frmCreditCardGroupInfo);
end;

procedure TfrmCreditGroupAndShift.btnSearchGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardGroupInfo, frmCreditCardGroupInfo);
    frmCreditCardGroupInfo.ShowModal;
    if frmCreditCardGroupInfo.strKey='enter' then
    begin
        edtSearchGroupID.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupID'];
        edtSearchGroupTitle.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmCreditCardGroupInfo);
end;

procedure TfrmCreditGroupAndShift.btnSearchShiftClick(Sender: TObject);
begin
    Application.CreateForm(TfrmShiftInfo, frmShiftInfo);
    frmShiftInfo.ShowModal;
    if frmShiftInfo.strKey='enter' then
    begin
        edtSearchShiftId.Text:=frmShiftInfo.QShift['id'];
        edtSearchShiftTitle.Text:=frmShiftInfo.QShift['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmShiftInfo);
end;

procedure TfrmCreditGroupAndShift.btnShiftClick(Sender: TObject);
begin
    Application.CreateForm(TfrmShiftInfo, frmShiftInfo);
    frmShiftInfo.ShowModal;
    if frmShiftInfo.strKey='enter' then
    begin
        edtShiftId.Text:=frmShiftInfo.QShift['id'];
        edtShiftTitle.Text:=frmShiftInfo.QShift['title'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmShiftInfo);
end;

end.
