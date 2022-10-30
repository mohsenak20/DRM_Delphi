unit ClassReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ADODB, DB, Menus, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmClassReport = class(TForm)
    Label5: TLabel;
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
    SP_ClassReport: TADOStoredProc;
    dsClassReport: TDataSource;
    QClassReport: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDelete: TADOQuery;
    Panel1: TPanel;
    memReport: TMemo;
    Label2: TLabel;
    Label1: TLabel;
    lblStudent: TLabel;
    lblClass: TLabel;
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

  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
    studentAndClassId : integer;
  end;

var
  frmClassReport: TfrmClassReport;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmClassReport.SetEnabledDisable(BL:Boolean);
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
        memReport.Clear;
        memReport.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmClassReport.LoadSqlQuery;
Begin
    QClassReport.Parameters.ParamByName('studentAndClassId').Value := studentAndClassId;
    QClassReport.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmClassReport.GetValue;
begin
    memReport.Text:=QClassReport.fieldByName('report').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmClassReport.FormCreate(Sender: TObject);
begin

end;

{*******************  FormKeyDown  ***********************}
procedure TfrmClassReport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmClassReport.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmClassReport.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmClassReport.BtnSaveClick(Sender: TObject);
begin
    IF (memReport.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        memReport.SetFocus;
        Exit;
    End;
    SP_ClassReport.Parameters.ParamByName('@id').Value:=QClassReport['id'];
    SP_ClassReport.Parameters.ParamByName('@studentAndClassId').Value:=studentAndClassId;
    SP_ClassReport.Parameters.ParamByName('@report').Value:=memReport.Text;
    SP_ClassReport.Parameters.ParamByName('@userId').Value:= UserInfo.UserID;
    SP_ClassReport.Parameters.ParamByName('@reportDate').Value:=CurrentDate;
    IF StatusRecord='Insert' then
        SP_ClassReport.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_ClassReport.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_ClassReport.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QClassReport.Close;
    QClassReport.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmClassReport.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmClassReport.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmClassReport.BtnEditClick(Sender: TObject);
begin
    IF (QClassReport.RecNo<=0) OR (QClassReport.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmClassReport.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QClassReport.RecNo<=0) OR (QClassReport.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QClassReport['id'];
    QDelete.ExecSQL;
    QClassReport.Close;
    QClassReport.Open;
    Grid.SetFocus;
  except
   ShowMessage('Œÿ« œ— Õ–› «ÿ·«⁄« ');
  end;
end;

{*******************  Form Show  ***********************}
procedure TfrmClassReport.FormShow(Sender: TObject);
begin
    LoadSqlQuery;
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmClassReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QClassReport.Close;
end;


end.
