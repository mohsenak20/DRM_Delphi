unit HotelsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmHotels = class(TForm)
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
    edtHotelName: TEdit;
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
    SP_Hotel: TADOStoredProc;
    dsHotels: TDataSource;
    QHotels: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    Label1: TLabel;
    edtAddress: TEdit;
    Label3: TLabel;
    edtTel: TEdit;
    Label4: TLabel;
    edtHoteTypeID: TEdit;
    edtHoteType: TEdit;
    edtHotelType: TBitBtn;
    Label5: TLabel;
    edtManagerName: TEdit;
    QDelete: TADOQuery;
    Label6: TLabel;
    edtHotelSectionID: TEdit;
    edtHotelSectionTitle: TEdit;
    btnHotelSection: TBitBtn;
    Panel1: TPanel;
    Label7: TLabel;
    edtSearch: TEdit;
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
    procedure edtHotelTypeClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure GridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GridTitleClick(Column: TColumn);
    procedure btnHotelSectionClick(Sender: TObject);
    procedure QHotelsBeforeDelete(DataSet: TDataSet);
    procedure edtSearchChange(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;


var
  frmHotels: TfrmHotels;
  StatusRecord:String;

implementation

uses DMUnit, CalculatUnit, HotelInfoUnit, qrHotelUnit, ShareUnit,
  CardListUnit, HotelSectionInfoUnit;

{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmHotels.SetEnabledDisable(BL:Boolean);
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
        edtHotelName.Clear;
        edtManagerName.Clear;
        edtAddress.Clear;
        edtTel.Clear;
        edtHotelName.SetFocus;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmHotels.LoadSqlQuery;
Begin
    QHotels.Parameters.ParamByName('HotelName').Value := '%'+edtSearch.Text+'%';
    QHotels.Open;
End;

{*******************  GetValue  ***********************}
procedure TfrmHotels.GetValue;
begin
    edtHoteTypeID.Text:=QHotels.fieldByName('HotelTypeID').Text;
    edtHotelSectionID.Text := QHotels.fieldByName('HotelSectionID').Text;
    edtHotelSectionTitle.Text := QHotels.fieldByName('title').Text;
    edtHoteType.Text:=QHotels.fieldByName('HotelType').Text;
    edtHotelName.Text:=QHotels.fieldByName('HotelName').Text;
    edtManagerName.Text:=QHotels.fieldByName('ManagerName').Text;
    edtAddress.Text:=QHotels.fieldByName('Address').Text;
    edtTel.Text:=QHotels.fieldByName('Tel').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmHotels.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmHotels.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmHotels.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmHotels.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmHotels.BtnSaveClick(Sender: TObject);
begin
    IF (edtHotelName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtHotelName.SetFocus;
        Exit;
    End;
    SP_Hotel.Parameters.ParamByName('@HotelID').Value:=QHotels['HotelID'];
    SP_Hotel.Parameters.ParamByName('@HotelSectionID').Value:=edtHotelSectionID.Text;
    SP_Hotel.Parameters.ParamByName('@HotelName').Value:=edtHotelName.Text;
    SP_Hotel.Parameters.ParamByName('@ManagerName').Value:=edtManagerName.Text;
    SP_Hotel.Parameters.ParamByName('@HotelType').Value:=edtHoteTypeID.Text;
    SP_Hotel.Parameters.ParamByName('@Address').Value:=edtAddress.Text;
    SP_Hotel.Parameters.ParamByName('@Tel').Value:=edtTel.Text;
    IF StatusRecord='Insert' then
        SP_Hotel.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_Hotel.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_Hotel.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QHotels.Close;
    QHotels.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmHotels.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmHotels.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmHotels.BtnEditClick(Sender: TObject);
begin
    IF (QHotels.RecNo<=0) OR (QHotels.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmHotels.BtnDelClick(Sender: TObject);
begin
    IF ((QHotels.RecNo<=0) OR (QHotels.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Close;
    QDelete.Parameters.ParamByName('HotelID').Value:=QHotels['HotelID'];
    QDelete.ExecSQL;
    QHotels.Close;
    QHotels.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmHotels.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmHotels.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QHotels.Close;
end;

procedure TfrmHotels.edtHotelTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelInfo, frmHotelInfo);
    frmHotelInfo.ShowModal;
    if frmHotelInfo.strKey='enter' then
    begin
        edtHoteTypeID.Text:=frmHotelInfo.QHotel['HotelTypeID'];
        edtHoteType.Text:=frmHotelInfo.QHotel['HotelType'];
        btnHotelSection.SetFocus;
    end;
    FreeAndNil(frmHotelInfo);

end;

procedure TfrmHotels.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrHotels, qrHotels);
    qrHotels.lblCoName.Caption := Parameter.CoName;
    qrHotels.lblCurrentDate.Caption := CurrentDate;
    qrHotels.Preview;
    FreeAndNil(qrHotels);
end;

procedure TfrmHotels.GridMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var
  pt: TGridcoord;
begin
   pt:= Grid.MouseCoord(x, y);

  if pt.y=0 then
    Grid.Cursor:=crHandPoint
  else
    Grid.Cursor:=crDefault;
end;

procedure TfrmHotels.GridTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}
begin

  if Grid.DataSource.DataSet is TCustomADODataSet then
  with TCustomADODataSet(Grid.DataSource.DataSet) do
  begin
    try
      Grid.Columns[PreviousColumnIndex].title.Font.Style :=
      Grid.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
  end;

    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];
    PreviousColumnIndex := Column.Index;

    if (Pos(Column.Field.FieldName, Sort) = 1)
    and (Pos(' DESC', Sort)= 0) then
      Sort := Column.Field.FieldName + ' DESC'
    else
      Sort := Column.Field.FieldName + ' ASC';
  end;
end;

procedure TfrmHotels.btnHotelSectionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmHotelSectionInfo, frmHotelSectionInfo);
    frmHotelSectionInfo.ShowModal;
    if frmHotelSectionInfo.strKey='enter' then
    begin
        edtHotelSectionID.Text:=frmHotelSectionInfo.QHotelSection['id'];
        edtHotelSectionTitle.Text:=frmHotelSectionInfo.QHotelSection['title'];
        edtHotelName.SetFocus;
    end;
    FreeAndNil(frmHotelSectionInfo);
end;

procedure TfrmHotels.QHotelsBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

procedure TfrmHotels.edtSearchChange(Sender: TObject);
begin
    QHotels.Close;
    QHotels.Parameters.ParamByName('HotelName').Value := '%'+edtSearch.Text+'%';
    QHotels.Open;
end;

end.
