unit HotelreceptionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmHotelReception = class(TForm)
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
    edtReceptionistName: TEdit;
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
    SP_Receptionistr: TADOStoredProc;
    dsReceptionist: TDataSource;
    QReceptionist: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label4: TLabel;
    edtHotelID: TEdit;
    edtHotelName: TEdit;
    btnHotel: TBitBtn;
    Label1: TLabel;
    edtTel: TEdit;
    Label3: TLabel;
    edtComment: TEdit;
    QDelete: TADOQuery;
    Panel1: TPanel;
    edtSearch: TEdit;
    Label11: TLabel;
    procedure btnHotelClick(Sender: TObject);
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
    procedure QReceptionistBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;


var
  frmHotelReception: TfrmHotelReception;
  StatusRecord:String;
implementation

uses DMUnit, HotelsInfoUnit;


{$R *.dfm}

procedure TfrmHotelReception.btnHotelClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelsInfo, frmHotelsInfo);
    frmHotelsInfo.ShowModal;
    if frmHotelsInfo.strKey='enter' then
    begin
        edtHotelID.Text:=frmHotelsInfo.QHotel['HotelID'];
        edtHotelName.Text:=frmHotelsInfo.QHotel['HotelName'];
        edtReceptionistName.SetFocus;
    end;
    FreeAndNil(frmHotelsInfo);

end;

procedure TfrmHotelReception.SetEnabledDisable(BL:Boolean);
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
        //edtHotelID.Clear;
        //edtHotelName.Clear;
        edtReceptionistName.Clear;
        edtTel.Clear;
        edtComment.Clear;
        btnHotel.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmHotelReception.LoadSqlQuery;
Begin
    QReceptionist.Close;
    QReceptionist.Parameters.ParamByName('HotelName').Value:='%'+edtSearch.Text+'%';
    QReceptionist.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmHotelReception.GetValue;
begin
    edtHotelID.Text:=QReceptionist.fieldByName('HotelID').Text;
    edtHotelName.Text:=QReceptionist.fieldByName('HotelName').Text;
    edtReceptionistName.Text:=QReceptionist.fieldByName('ReceptionistName').Text;
    edtTel.Text:=QReceptionist.fieldByName('Tel').Text;
    edtComment.Text:=QReceptionist.fieldByName('Comment').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmHotelReception.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmHotelReception.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmHotelReception.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmHotelReception.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmHotelReception.BtnSaveClick(Sender: TObject);
begin
    IF (edtHotelID.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        btnHotel.SetFocus;
        Exit;
    End;
    SP_Receptionistr.Parameters.ParamByName('@HotelReceptionID').Value:=QReceptionist['HotelReceptionID'];
    SP_Receptionistr.Parameters.ParamByName('@HotelID').Value:=edtHotelID.Text;
    SP_Receptionistr.Parameters.ParamByName('@ReceptionistName').Value:=edtReceptionistName.Text;
    SP_Receptionistr.Parameters.ParamByName('@Tel').Value:=edtTel.Text;
    SP_Receptionistr.Parameters.ParamByName('@Comment').Value:=edtComment.Text;
    IF StatusRecord='Insert' then
        SP_Receptionistr.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Receptionistr.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Receptionistr.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QReceptionist.Close;
    QReceptionist.Parameters.ParamByName('HotelName').Value:='%'+edtSearch.Text+'%';
    QReceptionist.Open;
    Grid.SetFocus;
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmHotelReception.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmHotelReception.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmHotelReception.BtnEditClick(Sender: TObject);
begin
    IF (QReceptionist.RecNo<=0) OR (QReceptionist.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmHotelReception.BtnDelClick(Sender: TObject);
begin
    IF ((QReceptionist.RecNo<=0) OR (QReceptionist.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Close;
    QDelete.Parameters.ParamByName('HotelReceptionID').Value:= QReceptionist['HotelReceptionID'];
    QDelete.ExecSQL;
    QReceptionist.Close;
    QReceptionist.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmHotelReception.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmHotelReception.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QReceptionist.Close;
end;


procedure TfrmHotelReception.edtSearchChange(Sender: TObject);
begin
    QReceptionist.Close;
    QReceptionist.Parameters.ParamByName('HotelName').Value:='%'+edtSearch.Text+'%';
    QReceptionist.Open;
end;

procedure TfrmHotelReception.QReceptionistBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

end.
