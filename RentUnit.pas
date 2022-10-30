unit RentUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmRent = class(TForm)
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
    edtTitle: TEdit;
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
    SP_RentPool: TADOStoredProc;
    dsRent: TDataSource;
    QRent: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label5: TLabel;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    edtStartTime: TMaskEdit;
    edtEndTime: TMaskEdit;
    Label4: TLabel;
    edtPoolId: TEdit;
    edtPoolTitle: TEdit;
    btnPool: TBitBtn;
    Label6: TLabel;
    edtCapacity: TEdit;
    Label7: TLabel;
    QDelete: TADOQuery;
    chbSaturday: TCheckBox;
    chbSunday: TCheckBox;
    chbMondey: TCheckBox;
    chbTuesday: TCheckBox;
    chbWednesday: TCheckBox;
    chbThursday: TCheckBox;
    chbFriday: TCheckBox;
    Label16: TLabel;
    edtGenderID: TEdit;
    edtGenderTitle: TEdit;
    btnGender: TBitBtn;
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
    procedure btnPoolClick(Sender: TObject);
    procedure btnGenderClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;

var
  frmRent: TfrmRent;
  StatusRecord:String;
implementation

{$R *.dfm}
uses DMUnit, CalculatUnit, PoolInfoUnit, UserInfoUnit, GenderInfoUnit;
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmRent.SetEnabledDisable(BL:Boolean);
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
        edtTitle.Clear;
        edtStartDate.Clear;
        edtEndDate.Clear;
        edtStartTime.Clear;
        edtEndTime.Clear;
        edtPoolId.Clear;
        edtPoolTitle.Clear;
        edtCapacity.Clear;
        chbSaturday.Checked := False;
        chbSunday.Checked := False;
        chbMondey.Checked := False;
        chbTuesday.Checked := False;
        chbWednesday.Checked := False;
        chbThursday.Checked := False;
        chbFriday.Checked := False;
        btnPool.SetFocus;
        edtGenderID.Clear;
        edtGenderTitle.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmRent.LoadSqlQuery;
Begin
    QRent.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmRent.GetValue;
begin
    edtPoolId.Text := QRent['poolId'];
    edtPoolTitle.Text:=QRent['PoolTitle'];
    edtTitle.Text:=QRent['title'];
    edtStartDate.Text:=QRent['startDate'];
    edtEndDate.Text:=QRent['endDate'];
    edtStartTime.Text:=QRent['startTime'];
    edtEndTime.Text:=QRent['endTime'];
    edtCapacity.Text := QRent['capacity'];
    chbSaturday.Checked := QRent['saturday'];
    chbSunday.Checked := QRent['sunday'];
    chbMondey.Checked := QRent['monday'];
    chbTuesday.Checked := QRent['tuesday'];
    chbWednesday.Checked := QRent['wednesday'];
    chbThursday.Checked := QRent['thursday'];
    chbFriday.Checked := QRent['friday'];
    edtGenderID.Text := QRent['genderIdAccepted'];
    edtGenderTitle.Text := QRent['genderTitle'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmRent.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmRent.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmRent.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmRent.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmRent.BtnSaveClick(Sender: TObject);
begin
    IF (edtTitle.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtTitle.SetFocus;
        Exit;
    End;
    SP_RentPool.Parameters.ParamByName('@id').Value:=QRent['id'];
    SP_RentPool.Parameters.ParamByName('@title').Value:=edtTitle.Text;
    SP_RentPool.Parameters.ParamByName('@startDate').Value:=edtStartDate.Text;
    SP_RentPool.Parameters.ParamByName('@endDate').Value:=edtEndDate.Text;
    SP_RentPool.Parameters.ParamByName('@startTime').Value:=edtStartTime.Text;
    SP_RentPool.Parameters.ParamByName('@endTime').Value:=edtEndTime.Text;
    SP_RentPool.Parameters.ParamByName('@poolId').Value:=edtPoolId.Text;
    SP_RentPool.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;
    SP_RentPool.Parameters.ParamByName('@capacity').Value:=edtCapacity.Text;
    SP_RentPool.Parameters.ParamByName('@genderIdAccepted').Value:=edtGenderID.Text;    
    SP_RentPool.Parameters.ParamByName('@saturday').Value:=chbSaturday.Checked;
    SP_RentPool.Parameters.ParamByName('@sunday').Value:=chbSunday.Checked;
    SP_RentPool.Parameters.ParamByName('@monday').Value:=chbMondey.Checked;
    SP_RentPool.Parameters.ParamByName('@tuesday').Value:=chbTuesday.Checked;
    SP_RentPool.Parameters.ParamByName('@wednesday').Value:=chbWednesday.Checked;
    SP_RentPool.Parameters.ParamByName('@thursday').Value:=chbThursday.Checked;
    SP_RentPool.Parameters.ParamByName('@friday').Value:=chbFriday.Checked;

    IF StatusRecord='Insert' then
        SP_RentPool.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_RentPool.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_RentPool.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QRent.Close;
    QRent.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmRent.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmRent.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmRent.BtnEditClick(Sender: TObject);
begin
    IF (QRent.RecNo<=0) OR (QRent.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmRent.BtnDelClick(Sender: TObject);
begin
  try
    IF ((QRent.RecNo<=0) OR (QRent.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('id').Value := QRent['id'];
    QDelete.ExecSQL;
    Grid.SetFocus;
  except
   ShowMessage('Œÿ« œ— Õ–› «ÿ·«⁄« ');
  end;
end;

{*******************  Form Show  ***********************}
procedure TfrmRent.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmRent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QRent.Close;
end;

procedure TfrmRent.btnPoolClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPoolsInfo, frmPoolsInfo);
    frmPoolsInfo.ShowModal;
    if frmPoolsInfo.strKey='enter' then
    begin
        edtPoolId.Text:=frmPoolsInfo.QPool['id'];
        edtPoolTitle.Text:=frmPoolsInfo.QPool['title'];
        edtTitle.SetFocus;
    end;
    FreeAndNil(frmPoolsInfo);
end;

procedure TfrmRent.btnGenderClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGenderInfo, frmGenderInfo);
    frmGenderInfo.ShowModal;
    if frmGenderInfo.strKey='enter' then
    begin
        edtGenderID.Text:=frmGenderInfo.QGender['id'];
        edtGenderTitle.Text:=frmGenderInfo.QGender['Title'];
        edtStartDate.SetFocus;
    end;
    FreeAndNil(frmGenderInfo);
end;

end.
