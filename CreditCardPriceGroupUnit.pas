unit CreditCardPriceGroupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmCreditCardPriceGroup = class(TForm)
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
    SP_CreditGroup: TADOStoredProc;
    dsCreditGroup: TDataSource;
    QCreditGroup: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    edtPrice: TEdit;
    Label1: TLabel;
    edtSubsetPrice: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtPrice2: TEdit;
    edtSubSetPrice2: TEdit;
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
  end;


var
  frmCreditCardPriceGroup: TfrmCreditCardPriceGroup;
  StatusRecord:String;

implementation

uses DMUnit, CalculatUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmCreditCardPriceGroup.SetEnabledDisable(BL:Boolean);
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
        edtPrice.Clear;
        edtSubsetPrice.Clear;
        edtPrice2.Clear;
        edtSubsetPrice2.Clear;
        edtTitle.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmCreditCardPriceGroup.LoadSqlQuery;
Begin
    QCreditGroup.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmCreditCardPriceGroup.GetValue;
begin
    edtTitle.Text:=QCreditGroup.fieldByName('title').Text;
    edtPrice.Text:=QCreditGroup.fieldByName('price').Text;
    edtSubsetPrice.Text:=QCreditGroup.fieldByName('subSetPrice').Text;
    edtPrice2.Text:=QCreditGroup.fieldByName('price2').Text;
    edtSubSetPrice2.Text:=QCreditGroup.fieldByName('subSetPrice2').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmCreditCardPriceGroup.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmCreditCardPriceGroup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmCreditCardPriceGroup.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmCreditCardPriceGroup.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmCreditCardPriceGroup.BtnSaveClick(Sender: TObject);
begin
    IF (edtTitle.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtTitle.SetFocus;
        Exit;
    End;
    SP_CreditGroup.Parameters.ParamByName('@id').Value:=QCreditGroup['id'];
    SP_CreditGroup.Parameters.ParamByName('@title').Value:=edtTitle.Text;
    SP_CreditGroup.Parameters.ParamByName('@price').Value:=edtPrice.Text;
    SP_CreditGroup.Parameters.ParamByName('@subSetPrice').Value:=edtSubsetPrice.Text;
    SP_CreditGroup.Parameters.ParamByName('@price2').Value:=edtPrice2.Text;
    SP_CreditGroup.Parameters.ParamByName('@subSetPrice2').Value:=edtSubSetPrice2.Text;
    SP_CreditGroup.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;    
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
procedure TfrmCreditCardPriceGroup.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmCreditCardPriceGroup.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmCreditCardPriceGroup.BtnEditClick(Sender: TObject);
begin
    IF (QCreditGroup.RecNo<=0) OR (QCreditGroup.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmCreditCardPriceGroup.BtnDelClick(Sender: TObject);
begin
    IF ((QCreditGroup.RecNo<=0) OR (QCreditGroup.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QCreditGroup.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmCreditCardPriceGroup.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmCreditCardPriceGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QCreditGroup.Close;
end;

end.
