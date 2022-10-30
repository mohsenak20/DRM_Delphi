unit HealthCardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, ActnList, ADODB, DB, Menus,
  ComCtrls, Buttons, Mask;

type
  TfrmHealthCard = class(TForm)
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
    edtName: TEdit;
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
    SP_HealthCard: TADOStoredProc;
    dsHealthCard: TDataSource;
    QHealthCard: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    edtExpireDate: TMaskEdit;
    Label3: TLabel;
    edtCode: TEdit;
    edtWorkSectioHealthCard: TEdit;
    btnWorkSectioHealthCard: TBitBtn;
    Label4: TLabel;
    edtSCode: TEdit;
    edtSWorkSectioHealthCard: TEdit;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    edtSPersonName: TEdit;
    BBtnAccept: TBitBtn;
    Label6: TLabel;
    MaskEdit1: TMaskEdit;
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
    procedure btnWorkSectioHealthCardClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;


var
  frmHealthCard: TfrmHealthCard;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, WorkSectionHealthCardUnit;

{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmHealthCard.SetEnabledDisable(BL:Boolean);
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
        edtName.Clear;
        edtName.SetFocus;
        edtExpireDate.Clear;
        edtCode.Clear;
        edtWorkSectioHealthCard.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmHealthCard.LoadSqlQuery;
Begin
    QHealthCard.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmHealthCard.GetValue;
begin
    edtName.Text := QHealthCard.fieldByName('PersonName').Text;
    edtExpireDate.Text := QHealthCard.fieldByName('ExpireDate').Text;
    edtCode.Text := QHealthCard.fieldByName('Code').Text;
    edtWorkSectioHealthCard.Text := QHealthCard.fieldByName('WorkSectionHealthCard').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmHealthCard.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmHealthCard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmHealthCard.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmHealthCard.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmHealthCard.BtnSaveClick(Sender: TObject);
begin
    IF (edtName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtName.SetFocus;
        Exit;
    End;
    SP_HealthCard.Parameters.ParamByName('@PersonID').Value:=QHealthCard['PersonID'];
    SP_HealthCard.Parameters.ParamByName('@PersonName').Value:= edtName.Text;
    SP_HealthCard.Parameters.ParamByName('@ExpireDate').Value:= edtExpireDate.Text;
    SP_HealthCard.Parameters.ParamByName('@WorkSection').Value:= edtCode.Text;

    IF StatusRecord='Insert' then
        SP_HealthCard.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_HealthCard.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_HealthCard.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QHealthCard.Close;
    QHealthCard.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmHealthCard.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmHealthCard.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmHealthCard.BtnEditClick(Sender: TObject);
begin
    IF (QHealthCard.RecNo<=0) OR (QHealthCard.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmHealthCard.BtnDelClick(Sender: TObject);
begin
    IF ((QHealthCard.RecNo<=0) OR (QHealthCard.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QHealthCard.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmHealthCard.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmHealthCard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QHealthCard.Close;
end;

procedure TfrmHealthCard.btnWorkSectioHealthCardClick(Sender: TObject);
begin
    Application.CreateForm(TfrmWorkSectionHealthCard, frmWorkSectionHealthCard);
    frmWorkSectionHealthCard.ShowModal;
    if frmWorkSectionHealthCard.strKey='enter' then
    begin
        edtCode.Text := frmWorkSectionHealthCard.QWorkSectionHealthCard['Code'];
        edtWorkSectioHealthCard.Text:=frmWorkSectionHealthCard.QWorkSectionHealthCard['WorkSectionHealthCard'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmWorkSectionHealthCard);
end;

procedure TfrmHealthCard.BBtnAcceptClick(Sender: TObject);
var
  strFilter : string;
begin
  //if edt
end;

end.
