unit PoolAndSupervisorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmPoolAndSupervisor = class(TForm)
    Label5: TLabel;
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label16: TLabel;
    Label3: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    edtPoolId: TEdit;
    edtPoolTitle: TEdit;
    btnPool: TBitBtn;
    edtSupervisorId: TEdit;
    edtSupervisorName: TEdit;
    btnSupervisor: TBitBtn;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    BBtnAccept: TBitBtn;
    edtSPoolId: TEdit;
    edtSPoolTitle: TEdit;
    btnSPool: TBitBtn;
    edtSPoolSupervisorId: TEdit;
    edtSPoolSupervisorName: TEdit;
    btnSPoolSupervisor: TBitBtn;
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
    SP_PoolAndSupervisor: TADOStoredProc;
    dsPoolAndSupervisor: TDataSource;
    QPoolAndSupervisor: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
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
    procedure btnSPoolClick(Sender: TObject);
    procedure btnPoolClick(Sender: TObject);
    procedure btnSupervisorClick(Sender: TObject);
    procedure btnSPoolSupervisorClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;


var
  frmPoolAndSupervisor: TfrmPoolAndSupervisor;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, PoolInfoUnit, PoolSupervisorInfoUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmPoolAndSupervisor.SetEnabledDisable(BL:Boolean);
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
        edtPoolId.Clear;
        edtPoolTitle.Clear;
        edtSupervisorId.Clear;
        edtSupervisorName.Clear;
        btnPool.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmPoolAndSupervisor.LoadSqlQuery;
Begin
    QPoolAndSupervisor.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmPoolAndSupervisor.GetValue;
begin
    edtPoolId.Text:=QPoolAndSupervisor['poolId'];
    edtPoolTitle.Text:=QPoolAndSupervisor['poolTitle'];
    edtSupervisorId.Text:=QPoolAndSupervisor['poolSupervisorId'];
    edtSupervisorName.Text:=QPoolAndSupervisor['poolSupervisorName'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmPoolAndSupervisor.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmPoolAndSupervisor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmPoolAndSupervisor.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmPoolAndSupervisor.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmPoolAndSupervisor.BtnSaveClick(Sender: TObject);
begin
    IF (edtPoolId.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        btnPool.SetFocus;
        Exit;
    End;
    SP_PoolAndSupervisor.Parameters.ParamByName('@id').Value:=QPoolAndSupervisor['id'];
    SP_PoolAndSupervisor.Parameters.ParamByName('@poolId').Value:=edtPoolId.Text;
    SP_PoolAndSupervisor.Parameters.ParamByName('@poolSupervisorId').Value:=edtSupervisorId.Text;

    IF StatusRecord='Insert' then
        SP_PoolAndSupervisor.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_PoolAndSupervisor.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_PoolAndSupervisor.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QPoolAndSupervisor.Close;
    QPoolAndSupervisor.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmPoolAndSupervisor.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmPoolAndSupervisor.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmPoolAndSupervisor.BtnEditClick(Sender: TObject);
begin
    IF (QPoolAndSupervisor.RecNo<=0) OR (QPoolAndSupervisor.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmPoolAndSupervisor.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QPoolAndSupervisor.RecNo<=0) OR (QPoolAndSupervisor.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QPoolAndSupervisor['id'];
    QDelete.ExecSQL;
    QPoolAndSupervisor.Close;
    QPoolAndSupervisor.Open;
    Grid.SetFocus;
  except
   ShowMessage('Œÿ« œ— Õ–› «ÿ·«⁄« ');
  end;    
end;

{*******************  Form Show  ***********************}
procedure TfrmPoolAndSupervisor.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmPoolAndSupervisor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QPoolAndSupervisor.Close;
end;


procedure TfrmPoolAndSupervisor.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
begin

  if edtSPoolId.Text <> '' then
      strFilter := 'poolId='+edtSPoolId.Text;


  if edtSPoolSupervisorId.Text <> '' then
      if strFilter <> '' then
          strFilter := strFilter + ' and poolSupervisorId='+edtSPoolSupervisorId.Text
      else
          strFilter := 'poolSupervisorId='+edtSPoolSupervisorId.Text;


  QPoolAndSupervisor.Close;
  QPoolAndSupervisor.SQL.Clear;
  QPoolAndSupervisor.SQL.Add('select TPoolAndSupervisor.*, TPool.title poolTitle, TPoolSupervisor.name supervisorName from TPoolAndSupervisor');
  QPoolAndSupervisor.SQL.Add('inner join TPool on TPoolAndSupervisor.poolId = TPool.id');
  QPoolAndSupervisor.SQL.Add('inner join TPoolSupervisor on TPoolAndSupervisor.poolSupervisorId = TPoolSupervisor.id');
  if  strFilter <> '' then
    QPoolAndSupervisor.SQL.Add('where '+strFilter);
  QPoolAndSupervisor.Open;
end;

procedure TfrmPoolAndSupervisor.btnSPoolClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPoolsInfo, frmPoolsInfo);
    frmPoolsInfo.ShowModal;
    if frmPoolsInfo.strKey='enter' then
    begin
        edtSPoolId.Text:=frmPoolsInfo.QPool['id'];
        edtSPoolTitle.Text:=frmPoolsInfo.QPool['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmPoolsInfo);
end;

procedure TfrmPoolAndSupervisor.btnPoolClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPoolsInfo, frmPoolsInfo);
    frmPoolsInfo.ShowModal;
    if frmPoolsInfo.strKey='enter' then
    begin
        edtPoolId.Text:=frmPoolsInfo.QPool['id'];
        edtPoolTitle.Text:=frmPoolsInfo.QPool['title'];
        btnSupervisor.SetFocus;
    end;
    FreeAndNil(frmPoolsInfo);
end;

procedure TfrmPoolAndSupervisor.btnSupervisorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPoolSupervisorInfo, frmPoolSupervisorInfo);
    frmPoolSupervisorInfo.ShowModal;
    if frmPoolSupervisorInfo.strKey='enter' then
    begin
        edtSupervisorId.Text:=frmPoolSupervisorInfo.QPoolSupervisor['id'];
        edtSupervisorName.Text:=frmPoolSupervisorInfo.QPoolSupervisor['name'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmPoolSupervisorInfo);
end;

procedure TfrmPoolAndSupervisor.btnSPoolSupervisorClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPoolSupervisorInfo, frmPoolSupervisorInfo);
    frmPoolSupervisorInfo.ShowModal;
    if frmPoolSupervisorInfo.strKey='enter' then
    begin
        edtSPoolSupervisorId.Text:=frmPoolSupervisorInfo.QPoolSupervisor['id'];
        edtSPoolSupervisorName.Text:=frmPoolSupervisorInfo.QPoolSupervisor['name'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmPoolSupervisorInfo);
end;

end.
