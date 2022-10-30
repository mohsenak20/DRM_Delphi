unit CreditGroupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmCreditGroup = class(TForm)
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label2: TLabel;
    edtCreditGroupName: TEdit;
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
    SP_CreditGroup: TADOStoredProc;
    dsCreditGroup: TDataSource;
    QCreditGroup: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label11: TLabel;
    edtPriceTitle: TEdit;
    btnPrice: TBitBtn;
    edtPriceId: TEdit;
    btnShowShifts: TBitBtn;
    chbCanUseInOtherShift: TCheckBox;
    QDelete: TADOQuery;
    edtSession: TEdit;
    Label32: TLabel;
    edtDay: TEdit;
    Label33: TLabel;
    chbHasRestrictionRule: TCheckBox;
    chbRestricktIsForEachPerson: TCheckBox;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    edtExtraBasePrice: TEdit;
    edtBaseTime: TEdit;
    edtExtraBaseTime: TEdit;
    chbRestrictUsingTime: TCheckBox;
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
    procedure btnPriceClick(Sender: TObject);
    procedure btnShowShiftsClick(Sender: TObject);

  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;    
  public
    { Public declarations }
  end;

var
  frmCreditGroup: TfrmCreditGroup;
  StatusRecord:String;

implementation

uses DMUnit, CalculatUnit, CreditCardPriceGroupInfoUnit,
  CreditGroupAndShiftUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmCreditGroup.SetEnabledDisable(BL:Boolean);
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
        edtCreditGroupName.Clear;
        edtPriceId.Clear;
        edtPriceTitle.Clear;
        chbCanUseInOtherShift.Checked := False;
        edtCreditGroupName.SetFocus;
        chbHasRestrictionRule.Checked := False;
        chbRestricktIsForEachPerson.Checked := False;
        edtSession.Text := '0';
        edtDay.Text := '0';
        chbRestrictUsingTime.Checked := False;
        edtBaseTime.Clear;
        edtExtraBasePrice.Clear;
        edtExtraBaseTime.Clear; 
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmCreditGroup.LoadSqlQuery;
Begin
    QCreditGroup.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmCreditGroup.GetValue;
begin
    edtCreditGroupName.Text:=QCreditGroup.fieldByName('CreditGroupName').Text;
    edtPriceId.Text := QCreditGroup['id'];
    edtPriceTitle.Text := QCreditGroup['title'];
    chbCanUseInOtherShift.Checked := QCreditGroup['canUseInOtherShift'];
    chbHasRestrictionRule.Checked := QCreditGroup['hasRestrictRule'];
    chbRestricktIsForEachPerson.Checked := QCreditGroup['isRestrictForEachPerson'];
    edtSession.Text := QCreditGroup['session'];
    edtDay.Text := QCreditGroup['day'];
    chbRestrictUsingTime.Checked := QCreditGroup['restrictUsingTime'];
    edtBaseTime.Text := QCreditGroup['baseTime'];
    edtExtraBasePrice.Text := QCreditGroup['extraBasePrice'];
    edtExtraBaseTime.Text := QCreditGroup['extraBaseTime'];
end;

{*******************  FormCreate  ***********************}
procedure TfrmCreditGroup.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmCreditGroup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmCreditGroup.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmCreditGroup.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmCreditGroup.BtnSaveClick(Sender: TObject);
begin
    IF (edtCreditGroupName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtCreditGroupName.SetFocus;
        Exit;
    End;
    SP_CreditGroup.Parameters.ParamByName('@CreditGroupID').Value:=QCreditGroup['CreditGroupID'];
    SP_CreditGroup.Parameters.ParamByName('@CreditGroupName').Value:=edtCreditGroupName.Text;
    SP_CreditGroup.Parameters.ParamByName('@priceGroupId').Value:=edtPriceId.Text;
    SP_CreditGroup.Parameters.ParamByName('@canUseInOtherShift').Value:=chbCanUseInOtherShift.Checked;
    SP_CreditGroup.Parameters.ParamByName('@isRestrictForEachPerson').Value:=chbRestricktIsForEachPerson.Checked;
    SP_CreditGroup.Parameters.ParamByName('@hasRestrictRule').Value:=chbHasRestrictionRule.Checked;
    SP_CreditGroup.Parameters.ParamByName('@session').Value:=edtSession.Text;
    SP_CreditGroup.Parameters.ParamByName('@day').Value:=edtDay.Text;
    SP_CreditGroup.Parameters.ParamByName('@restrictUsingTime').Value:=chbRestrictUsingTime.Checked;
    SP_CreditGroup.Parameters.ParamByName('@baseTime').Value:=edtBaseTime.Text;
    SP_CreditGroup.Parameters.ParamByName('@ExtraBasePrice').Value:=edtExtraBasePrice.Text;
    SP_CreditGroup.Parameters.ParamByName('@ExtraBaseTime').Value:=edtExtraBaseTime.Text;
    IF StatusRecord='Insert' then
        SP_CreditGroup.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_CreditGroup.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_CreditGroup.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QCreditGroup.Close;
    QCreditGroup.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmCreditGroup.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmCreditGroup.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmCreditGroup.BtnEditClick(Sender: TObject);
begin
    IF (QCreditGroup.RecNo<=0) OR (QCreditGroup.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmCreditGroup.BtnDelClick(Sender: TObject);
begin
    IF ((QCreditGroup.RecNo<=0) OR (QCreditGroup.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Parameters.ParamByName('creditGroupId').Value := QCreditGroup['creditGroupId'];
    QDelete.ExecSQL;
    QCreditGroup.Close;
    QCreditGroup.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmCreditGroup.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmCreditGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QCreditGroup.Close;
end;


procedure TfrmCreditGroup.btnPriceClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardPriceGroupInfo, frmCreditCardPriceGroupInfo);
    frmCreditCardPriceGroupInfo.ShowModal;
    if frmCreditCardPriceGroupInfo.strKey='enter' then
    begin
        edtPriceId.Text:=frmCreditCardPriceGroupInfo.QGroup['id'];
        edtPriceTitle.Text:=frmCreditCardPriceGroupInfo.QGroup['title'];
        chbHasRestrictionRule.SetFocus;
    end;
    FreeAndNil(frmCreditCardPriceGroupInfo);
end;

procedure TfrmCreditGroup.btnShowShiftsClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditGroupAndShift, frmCreditGroupAndShift);
    frmCreditGroupAndShift.edtSearchGroupID.Text := QCreditGroup['CreditGroupID'];
    frmCreditGroupAndShift.edtSearchGroupTitle.Text := QCreditGroup['CreditGroupName'];
    frmCreditGroupAndShift.BBtnAcceptClick(Sender);
    frmCreditGroupAndShift.ShowModal;
    FreeAndNil(frmCreditGroupAndShift);
end;

end.
