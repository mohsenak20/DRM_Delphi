unit ProductUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmProduct = class(TForm)
    PanelButton: TPanel;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtKalaName: TEdit;
    edtVahedPrice: TEdit;
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
    SP_Kala: TADOStoredProc;
    dsKala: TDataSource;
    QKala: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    BtnPrint: TBitBtn;
    ActionPrint: TAction;
    Panel1: TPanel;
    Label12: TLabel;
    edtSearch: TEdit;
    edtVahedID: TEdit;
    edtVahedName: TEdit;
    btnVahed: TBitBtn;
    QDel: TADOQuery;
    Label10: TLabel;
    edtKalaGroupId: TEdit;
    edtKalaGroupTitle: TEdit;
    btnKalaGroup: TBitBtn;
    Label2: TLabel;
    edtBarcode: TEdit;
    Label5: TLabel;
    edtPrice2: TEdit;
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
    procedure edtSearchChange(Sender: TObject);
    procedure btnVahedClick(Sender: TObject);
    procedure btnKalaGroupClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  frmProduct: TfrmProduct;
  StatusRecord:String;

implementation
uses DMUnit, CalculatUnit, VahedInfoUnit, KalaGroupInfoUnit, KalaInfoUnit;

{$R *.dfm}

{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmProduct.SetEnabledDisable(BL:Boolean);
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
        edtKalaName.SetFocus;
        edtKalaName.Clear;
        edtVahedID.Clear;
        edtVahedName.Clear;
        edtVahedPrice.Clear;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmProduct.LoadSqlQuery;
Begin
    if (UserInfo.WorkSectionID=6) or (UserInfo.WorkSectionID=8) then
    begin
        QKala.Close;
        QKala.SQL.Clear;
        QKala.SQL.Add('Select * from TKala');
        QKala.SQL.Add('inner join TVahed on TKala.VahedID=TVahed.VahedID');
        QKala.SQL.Add('where KalaName like '+QuotedStr('%'+edtSearch.Text+'%'));
        QKala.Open;
    end
    else
    begin
        QKala.Close;
        QKala.Parameters.ParamValues['KalaName']:='%'+edtSearch.Text+'%';
        QKala.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
        QKala.Prepared;
        QKala.Open;
    end;
End;

{*******************  GetValue  ***********************}
procedure TfrmProduct.GetValue;
begin
    edtKalaName.Text:=QKala.fieldByName('KalaName').Text;
    edtVahedID.Text:=QKala.fieldByName('VahedID').Text;
    edtVahedName.Text:=QKala.fieldByName('VahedName').Text;
    edtVahedPrice.Text:=QKala.fieldByName('VahedPrice').Text;
    edtPrice2.Text:=QKala.fieldByName('price2').Text;
    edtBarcode.Text := QKala.fieldByName('Barcode').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmProduct.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmProduct.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmProduct.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmProduct.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmProduct.BtnSaveClick(Sender: TObject);
begin
    IF (edtKalaName.Text='') or (edtVahedID.Text='') or
        (edtVahedPrice.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        if (edtKalaName.Text='') then (edtKalaName.SetFocus);
        if (edtVahedID.Text='') then (edtVahedID.SetFocus);
        if (edtVahedPrice.Text='') then (edtVahedPrice.SetFocus);
        Exit;
    End;
    SP_Kala.Parameters.ParamByName('@KalaID').Value:=QKala['KalaID'];
    SP_Kala.Parameters.ParamByName('@KalaName').Value:=edtKalaName.Text;

    SP_Kala.Parameters.ParamByName('@VahedID').Value:=edtVahedID.Text;
    SP_Kala.Parameters.ParamByName('@VahedPrice').Value:=edtVahedPrice.Text;
    SP_Kala.Parameters.ParamByName('@price2').Value:=edtPrice2.Text;
    SP_Kala.Parameters.ParamByName('@Barcode').Value:=edtBarcode.Text;

    SP_Kala.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    IF StatusRecord='Insert' then
        SP_Kala.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Kala.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Kala.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QKala.Close;
    QKala.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmProduct.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmProduct.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmProduct.BtnEditClick(Sender: TObject);
begin
    IF (QKala.RecNo<=0) OR (QKala.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmProduct.BtnDelClick(Sender: TObject);
begin
    IF ((QKala.RecNo<=0) OR (QKala.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDel.Close;
    QDel.Parameters.ParamByName('KalaID').Value:=QKala['KalaID'];
    QDel.ExecSQL;
    QKala.Close;
    QKala.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmProduct.FormShow(Sender: TObject);
begin
    if (UserInfo.WorkSectionID=6) or (UserInfo.WorkSectionID=8) then
    begin
        QKala.Close;
        QKala.SQL.Clear;
        QKala.SQL.Add('Select * from TKala');
        QKala.SQL.Add('inner join TVahed on TKala.VahedID=TVahed.VahedID');
        QKala.Open;
    end
    else
    begin
        QKala.Close;
        QKala.Parameters.ParamValues['KalaName']:='%%';
        QKala.Prepared;
        QKala.Open;
    end;
    edtSearch.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QKala.Close;
end;

procedure TfrmProduct.edtSearchChange(Sender: TObject);
begin
    if (UserInfo.WorkSectionID=6) or (UserInfo.WorkSectionID=8) then
    begin
        QKala.Close;
        QKala.SQL.Clear;
        QKala.SQL.Add('Select * from TKala');
        QKala.SQL.Add('inner join TVahed on TKala.VahedID=TVahed.VahedID');
        QKala.SQL.Add('where KalaName like '+QuotedStr('%'+edtSearch.Text+'%'));
        QKala.Open;
    end
    else
    begin
        QKala.Close;
        QKala.Parameters.ParamValues['KalaName']:='%'+edtSearch.Text+'%';
        QKala.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
        QKala.Prepared;
        QKala.Open;
    end;
end;

procedure TfrmProduct.btnVahedClick(Sender: TObject);
begin
    Application.CreateForm(TfrmVahedInfo, frmVahedInfo);
    frmVahedInfo.ShowModal;
    if frmVahedInfo.strKey='enter' then
    begin
        edtVahedID.Text:=frmVahedInfo.QVahed['VahedID'];
        edtVahedName.Text:=frmVahedInfo.QVahed['VahedName'];
        edtVahedPrice.SetFocus;
    end;
    FreeAndNil(frmVahedInfo);

end;

procedure TfrmProduct.btnKalaGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmKalaGroupInfo, frmKalaGroupInfo);
    frmKalaGroupInfo.ShowModal;
    if frmKalaGroupInfo.strKey='enter' then
    begin
        edtKalaGroupId.Text:=frmKalaGroupInfo.QKalaGroup['id'];
        edtKalaGroupTitle.Text:=frmKalaGroupInfo.QKalaGroup['title'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmKalaInfo);
end;

end.
