unit CreditListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, Menus, StdCtrls, Grids, DBGrids, ComCtrls,
  Buttons, ExtCtrls, Mask;

type
  TfrmCreditList = class(TForm)
    PanelButton: TPanel;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    BtnPrint: TBitBtn;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit2: TEdit;
    Edit3: TEdit;
    BBtnAccept: TBitBtn;
    MainMenuUnit: TMainMenu;
    MnuFile: TMenuItem;
    MnuEdit: TMenuItem;
    MnuDelete: TMenuItem;
    N2: TMenuItem;
    MnuReturn: TMenuItem;
    PopupMenuUnit: TPopupMenu;
    MnuPopEdit: TMenuItem;
    MnuPopNone1: TMenuItem;
    MnuPopDelete: TMenuItem;
    dsCredit: TDataSource;
    QCredit: TADOQuery;
    ActionList: TActionList;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    ActionPrint: TAction;
    QDeleteCredit: TADOQuery;
    QCreditCreditID: TLargeintField;
    QCreditReceptionID: TLargeintField;
    QCreditCredit: TIntegerField;
    QCreditChargeTime: TStringField;
    QCreditUserID: TIntegerField;
    QCreditCustomerName: TWideStringField;
    QCreditStartTime: TStringField;
    QCreditKeynumber: TIntegerField;
    QCreditPositionClosed: TSmallintField;
    QCreditstrPositionClosed: TStringField;
    Label7: TLabel;
    lblTedad: TLabel;
    Label10: TLabel;
    lblSum: TLabel;
    QSum: TADOQuery;
    Label8: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    Label1: TLabel;
    edtDate: TMaskEdit;
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
    procedure QCreditCalcFields(DataSet: TDataSet);
    procedure btnUserClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure GridTitleClick(Column: TColumn);
    procedure GridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;
var
  frmCreditList: TfrmCreditList;
  StatusRecord:String;
implementation
uses DMUnit, CalculatUnit, MainUnit, UserInfoUnit;
{$R *.dfm}
{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TfrmCreditList.SetEnabledDisable(BL:Boolean);
Begin
End;
{******************* LoadSqlQuery ***********************}
Procedure TfrmCreditList.LoadSqlQuery;
Begin
    QCredit.Close;
    QCredit.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QCredit.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QCredit.Open;

    QSum.Close;
    QSum.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QSum.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QSum.Open;

    if QSum['Tedad']<>Null then
        lblTedad.Caption:=IntToStr(QSum['Tedad'])
    else
        lblTedad.Caption:='0';

    if QSum['SumCredit']<>Null then
        lblSum.Caption:=FormatFloat('###,', QSum['SumCredit'])
    else
        lblSum.Caption:='0';
End;

{*******************  GetValue  ***********************}
procedure TfrmCreditList.GetValue;
begin
end;

{*******************  FormCreate  ***********************}
procedure TfrmCreditList.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TfrmCreditList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

{*******************  GridKeyDown  ***********************}
procedure TfrmCreditList.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
end;

{*******************  BtnReturnClick  ***********************}
procedure TfrmCreditList.BtnReturnClick(Sender: TObject);
begin
end;

{*******************  BtnSaveClick  ***********************}
procedure TfrmCreditList.BtnSaveClick(Sender: TObject);
begin
end;

{*******************  BtnCancelClick  ***********************}
procedure TfrmCreditList.BtnCancelClick(Sender: TObject);
begin
end;

{*******************  BtnNewClick  ***********************}
procedure TfrmCreditList.BtnNewClick(Sender: TObject);
begin
end;

{*******************  BtnEditClick  ***********************}
procedure TfrmCreditList.BtnEditClick(Sender: TObject);
begin
end;

{*******************  BtnDelClick  ***********************}
procedure TfrmCreditList.BtnDelClick(Sender: TObject);
var
DiffTime : TDateTime;
begin
    IF ((QCredit.RecNo<=0) OR (QCredit.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    if Time()-StrToTime(QCredit['ChargeTime']) > StrToTime('00:01') then
    begin
        ShowMessage('‘„« „Ã«“ »Â Õ–› «Ì‰ ‘«—é ‰„Ì »«‘Ìœ ·ÿ›« »« „œÌ— ”Ì” „  „«” »êÌ—Ìœ');
        Exit;
    end;

    QDeleteCredit.Close;
    QDeleteCredit.Parameters.ParamByName('CreditID').Value:=QCredit['CreditID'];
    QDeleteCredit.ExecSQL;
    QCredit.Close;
    QCredit.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TfrmCreditList.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
    if (UserInfo.WorkSectionID = 6) or  (UserInfo.WorkSectionID = 8) then
    begin
        
        edtUserID.Enabled := True;
        edtUserName.Enabled := True;
        btnUser.Enabled :=True;
        edtDate.Enabled:= True;
    end;
    edtDate.Text := CurrentDate;
    

end;

{*******************  Form Close  ***********************}
procedure TfrmCreditList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QCredit.Close;
end;

procedure TfrmCreditList.QCreditCalcFields(DataSet: TDataSet);
begin
    if QCredit['PositionClosed']=1 then
        QCredit['strPositionClosed']:='⁄„Ê„Ì'
    else
        if QCredit['PositionClosed']=2 then
            QCredit['strPositionClosed']:='VIP'
        else
            if QCredit['PositionClosed']=3 then
                QCredit['strPositionClosed']:='„œÌ—Ì ';
end;

procedure TfrmCreditList.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

procedure TfrmCreditList.BBtnAcceptClick(Sender: TObject);
begin
    QCredit.Close;
    QSum.Close;
    if edtUserID.Text<>'' then
    begin
        QCredit.Parameters.ParamByName('UserID').Value:=edtUserID.Text;
        QSum.Parameters.ParamByName('UserID').Value:=edtUserID.Text;
    end
    else
    begin
        QCredit.Parameters.ParamByName('UserID').Value:= UserInfo.UserID;
        QSum.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    end;

    if edtDate.Text <> '    /  /  ' then
    begin
        QCredit.Parameters.ParamByName('ReceptionDate').Value:= edtDate.Text;
        QSum.Parameters.ParamByName('ReceptionDate').Value:=edtDate.Text;
    end
    else
    begin
        QCredit.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
        QSum.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    end;
    QCredit.Open;
    QSum.Open;

    if QSum['Tedad']<>Null then
        lblTedad.Caption:=IntToStr(QSum['Tedad'])
    else
        lblTedad.Caption:='0';

    if QSum['SumCredit']<>Null then
        lblSum.Caption:=FormatFloat('###,', QSum['SumCredit'])
    else
        lblSum.Caption:='0';
end;

procedure TfrmCreditList.GridTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = 0;
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

procedure TfrmCreditList.GridMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
  var
  pt: TGridcoord;
begin
   pt:= Grid.MouseCoord(x, y);

  if pt.y=0 then
    Grid.Cursor:=crHandPoint
  else
    Grid.Cursor:=crDefault;
end;

end.
