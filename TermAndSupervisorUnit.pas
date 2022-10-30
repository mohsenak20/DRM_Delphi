unit TermAndSupervisorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmTermAndSupervisor = class(TForm)
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
    edtTermId: TEdit;
    edtTermTitle: TEdit;
    btnTerm: TBitBtn;
    edtSupervisorId: TEdit;
    edtSupervisorName: TEdit;
    btnSupervisor: TBitBtn;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    BBtnAccept: TBitBtn;
    edtSTermId: TEdit;
    edtSTermTitle: TEdit;
    btnSTerm: TBitBtn;
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
    SP_TermAndSupervisor: TADOStoredProc;
    dsTermAndSupervisor: TDataSource;
    QTermAndSupervisor: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDelete: TADOQuery;
    QPoolAndSupervisor: TADOQuery;
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
    procedure btnSupervisorClick(Sender: TObject);
    procedure btnSPoolSupervisorClick(Sender: TObject);
    procedure btnTermClick(Sender: TObject);
    procedure btnSTermClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;

var
  frmTermAndSupervisor: TfrmTermAndSupervisor;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, PoolSupervisorInfoUnit, TermInfoUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmTermAndSupervisor.SetEnabledDisable(BL:Boolean);
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
        edtTermId.Clear;
        edtTermTitle.Clear;
        edtSupervisorId.Clear;
        edtSupervisorName.Clear;
        btnTerm.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmTermAndSupervisor.LoadSqlQuery;
Begin
    QTermAndSupervisor.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmTermAndSupervisor.GetValue;
begin
    edtTermId.Text:=QTermAndSupervisor['TermId'];
    edtSupervisorName.Text:=QTermAndSupervisor['TermTitle'];
    edtSupervisorId.Text:=QTermAndSupervisor['poolSupervisorId'];
    edtSupervisorName.Text:=QTermAndSupervisor['poolSupervisorName'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmTermAndSupervisor.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmTermAndSupervisor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmTermAndSupervisor.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmTermAndSupervisor.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmTermAndSupervisor.BtnSaveClick(Sender: TObject);
begin
    IF (edtTermId.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        btnTerm.SetFocus;
        Exit;
    End;
    SP_TermAndSupervisor.Parameters.ParamByName('@id').Value:=QTermAndSupervisor['id'];
    SP_TermAndSupervisor.Parameters.ParamByName('@TermId').Value:=edtTermId.Text;
    SP_TermAndSupervisor.Parameters.ParamByName('@poolSupervisorId').Value:=edtSupervisorId.Text;

    IF StatusRecord='Insert' then
        SP_TermAndSupervisor.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_TermAndSupervisor.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_TermAndSupervisor.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QTermAndSupervisor.Close;
    QTermAndSupervisor.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmTermAndSupervisor.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmTermAndSupervisor.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmTermAndSupervisor.BtnEditClick(Sender: TObject);
begin
    IF (QTermAndSupervisor.RecNo<=0) OR (QTermAndSupervisor.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmTermAndSupervisor.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QTermAndSupervisor.RecNo<=0) OR (QTermAndSupervisor.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QTermAndSupervisor['id'];
    QDelete.ExecSQL;
    QTermAndSupervisor.Close;
    QTermAndSupervisor.Open;
    Grid.SetFocus;
  except
   ShowMessage('Œÿ« œ— Õ–› «ÿ·«⁄« ');
  end;    
end;

{*******************  Form Show  ***********************}
procedure TfrmTermAndSupervisor.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmTermAndSupervisor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QTermAndSupervisor.Close;
end;


procedure TfrmTermAndSupervisor.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
begin

  if edtSTermId.Text <> '' then
      strFilter := 'TermId='+edtSTermId.Text;


  if edtSPoolSupervisorId.Text <> '' then
      if strFilter <> '' then
          strFilter := strFilter + ' and poolSupervisorId='+edtSPoolSupervisorId.Text
      else
          strFilter := 'poolSupervisorId='+edtSPoolSupervisorId.Text;





  QTermAndSupervisor.Close;
  QTermAndSupervisor.SQL.Clear;
  QTermAndSupervisor.SQL.Add('select TTermAndSupervisor.*, TTerm.title TermTitle, TPoolSupervisor.name supervisorName from TTermAndSupervisor');
  QTermAndSupervisor.SQL.Add('inner join TTerm on TTermAndSupervisor.termId = TTerm.id');
  QTermAndSupervisor.SQL.Add('inner join TPoolSupervisor on TTermAndSupervisor.poolSupervisorId = TPoolSupervisor.id');
  if  strFilter <> '' then
    QTermAndSupervisor.SQL.Add('where '+strFilter);
  QTermAndSupervisor.Open;
end;

procedure TfrmTermAndSupervisor.btnSupervisorClick(Sender: TObject);
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

procedure TfrmTermAndSupervisor.btnSPoolSupervisorClick(Sender: TObject);
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


procedure TfrmTermAndSupervisor.btnTermClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTermInfo, frmTermInfo);
    frmTermInfo.ShowModal;
    if frmTermInfo.strKey='enter' then
    begin
        edtTermId.Text:=frmTermInfo.QTerm['id'];
        edtTermTitle.Text:=frmTermInfo.QTerm['title'];
        QPoolAndSupervisor.Close;
        QPoolAndSupervisor.Parameters.ParamByName('termId').Value := frmTermInfo.QTerm['id'];
        QPoolAndSupervisor.Open;
        if QPoolAndSupervisor['poolSupervisorId'] <> null then
        begin
            edtSupervisorId.Text := QPoolAndSupervisor['poolSupervisorId'];
            edtSupervisorName.Text := QPoolAndSupervisor['name'];
        end;
        btnSupervisor.SetFocus;
    end;
    FreeAndNil(frmTermInfo);
end;

procedure TfrmTermAndSupervisor.btnSTermClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTermInfo, frmTermInfo);
    frmTermInfo.ShowModal;
    if frmTermInfo.strKey='enter' then
    begin
        edtSTermId.Text:=frmTermInfo.QTerm['id'];
        edtSTermTitle.Text:=frmTermInfo.QTerm['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmTermInfo);
end;

end.
