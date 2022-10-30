unit ClosedUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, ActnList, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls;

type
  TfrmClosed = class(TForm)
    PanelButton: TPanel;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    GroupBox: TGroupBox;
    lblCustomerName: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label12: TLabel;
    edtKeyNumber: TEdit;
    MainMenuUnit: TMainMenu;
    MnuFile: TMenuItem;
    MnuEdit: TMenuItem;
    MnuReturn: TMenuItem;
    PopupMenuUnit: TPopupMenu;
    MnuPopEdit: TMenuItem;
    dsClosed: TDataSource;
    QClosed: TADOQuery;
    ActionList: TActionList;
    ActionEdit: TAction;
    ActionReturn: TAction;
    SP_Closed: TADOStoredProc;
    lblClosed: TLabel;
    N1: TMenuItem;
    QClosedKeyNumber: TIntegerField;
    QClosedStatus: TSmallintField;
    QClosedLend: TBooleanField;
    QClosedstrStatus: TStringField;
    QClosedstrLend: TStringField;
    QClosedClosedID: TIntegerField;
    QClosedPositionClosed: TSmallintField;
    QClosedActive: TBooleanField;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    rbOk: TRadioButton;
    rbNotOk: TRadioButton;
    rbOf: TRadioButton;
    rbOn: TRadioButton;
    Label3: TLabel;
    edtService_center_id: TEdit;
    edtService_center: TEdit;
    btnService_center: TBitBtn;
    BBtnAccept: TBitBtn;
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
    procedure btnSearchClick(Sender: TObject);
    procedure QClosedCalcFields(DataSet: TDataSet);
    procedure btnService_centerClick(Sender: TObject);
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
  frmClosed: TfrmClosed;
  StatusRecord:String;

implementation

uses ShareUnit, ServiceCenterInfoUnit;

{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmClosed.SetEnabledDisable(BL:Boolean);
Begin
    Grid.Enabled:=BL;
    PanelButton.Enabled:=BL;
    MnuEdit.Enabled:=BL;
    MnuPopEdit.Enabled:=BL;
    GroupBox.Visible:=Not BL;
    IF Not BL Then
    Begin
        rbOk.Checked:=True;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmClosed.LoadSqlQuery;
Begin

End;

{*******************  GetValue  ***********************}
procedure TfrmClosed.GetValue;
begin
    if QClosed['Status']=1 then
        rbOk.Checked:=True
    else
        rbNotOk.Checked:=True;

    if QClosed['Lend']=True then
        rbOn.Checked:=True
    else
        rbOf.Checked:=True;

    lblClosed.Caption:=QClosed.fieldByName('ClosedID').Text;
end;

{*******************  FormCreate  ***********************}
procedure TfrmClosed.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmClosed.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmClosed.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmClosed.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmClosed.BtnSaveClick(Sender: TObject);
begin
    SP_Closed.Parameters.ParamByName('@ClosedID').Value:=QClosed['ClosedID'];
    if rbOk.Checked then
        SP_Closed.Parameters.ParamByName('@Status').Value:=1
    else
        SP_Closed.Parameters.ParamByName('@Status').Value:=2;

    if rbOn.Checked then
        SP_Closed.Parameters.ParamByName('@Lend').Value:=1
    else
        SP_Closed.Parameters.ParamByName('@Lend').Value:=0;
    SP_Closed.ExecProc;
    SetEnabledDisable(True);
    Refresh_Query(QClosed);
    Grid.SetFocus;
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmClosed.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmClosed.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmClosed.BtnEditClick(Sender: TObject);
begin
    IF (QClosed.RecNo<=0) OR (QClosed.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmClosed.BtnDelClick(Sender: TObject);
begin
    IF ((QClosed.RecNo<=0) OR (QClosed.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QClosed.Delete;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmClosed.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;

{*******************  Form Close  ***********************}
procedure TfrmClosed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QClosed.Close;
end;



procedure TfrmClosed.btnSearchClick(Sender: TObject);
begin
    if edtKeyNumber.Text<>'' then
        QClosed.Locate('KeyNumber',edtKeyNumber.Text,[loCaseInsensitive]);
end;

procedure TfrmClosed.QClosedCalcFields(DataSet: TDataSet);
begin
    if QClosed['Status']=1 then
        QClosed['strStatus']:='”«·„'
    else
        QClosed['strStatus']:='„⁄ÌÊ»';

    if QClosed['Lend'] then
        QClosed['strLend']:='Å—'
    else
        QClosed['strLend']:='Œ«·Ì';

end;

procedure TfrmClosed.btnService_centerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmService_center_info, frmService_center_info);
    frmService_center_info.ShowModal;
    if frmService_center_info.strKey='enter' then
    begin
        edtService_center_id.Text:=frmService_center_info.QService_center['id'];
        edtService_center.Text:=frmService_center_info.QService_center['title'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmService_center_info);
end;

procedure TfrmClosed.BBtnAcceptClick(Sender: TObject);
var
  strFilter: string;
begin
    strFilter := '';
    if edtService_center_id.Text <> '' then
        strFilter:= 'service_center_id ='+edtService_center_id.Text;

    if edtKeyNumber.Text <> '' then
      if strFilter <> '' then
          strFilter := strFilter + ' and KeyNumber='+edtKeyNumber.Text
      else
          strFilter := 'KeyNumber='+edtKeyNumber.Text;

    QClosed.Close;
    QClosed.SQL.Clear;
    QClosed.SQL.Add('select * from TClosed');
    if strFilter <> '' then
      QClosed.SQL.Add('where '+strFilter);
    QClosed.SQL.Add('order by KeyNumber');
    QClosed.Open;

end;

end.
