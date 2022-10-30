unit LockersUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Menus, StdCtrls, Buttons;

type
  TfrmLockers = class(TForm)
    QLockers: TADOQuery;
    QLockerStatus: TADOQuery;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuLendLockers: TMenuItem;
    pnlOP: TPanel;
    pnlLockers: TPanel;
    GroupBox1: TGroupBox;
    btnLockerRoom: TBitBtn;
    edtLockerRoomTitle: TEdit;
    edtLockerRoomId: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblFree: TLabel;
    lblOccupied: TLabel;
    lblHaveProblem: TLabel;
    lblDeactive: TLabel;
    Label5: TLabel;
    lblAllLockers: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblStart: TLabel;
    lblEnd: TLabel;
    GroupBox2: TGroupBox;
    lblLockerTitle: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblLockerRoomId: TLabel;
    btnRefresh: TButton;
    QSummery: TADOQuery;
    GroupBox3: TGroupBox;
    pnlFree: TPanel;
    pnlOccupied: TPanel;
    pnlDeactive: TPanel;
    pnlHaveProblem: TPanel;
    GroupBox4: TGroupBox;
    rbSmall: TRadioButton;
    rbMedium: TRadioButton;
    rbLarge: TRadioButton;
    QLockerRoom: TADOQuery;
    mnuActive: TMenuItem;
    ih1: TMenuItem;
    procedure mnuLendLockersClick(Sender: TObject);
    procedure btnLockerRoomClick(Sender: TObject);
    procedure showLockers(lockerRoomId: integer);
    procedure clearForm();
    procedure FormCreate(Sender: TObject);
    procedure setSize(size: integer);
    procedure writeConf(lockerRoomId: integer);
    procedure rbSmallClick(Sender: TObject);
    procedure destroyLockers();
    procedure btnRefreshClick(Sender: TObject);
    procedure mnuActiveClick(Sender: TObject);
    procedure ih1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLockers: TfrmLockers;
  panelSize: integer;
  rowCount: integer;
implementation

uses DMUnit, LockerLendUnit, CalculatUnit, LockerRoominfoUnit,
  ActiveLockerUnit, ClosedUnit;
{$R *.dfm}
procedure TfrmLockers.destroyLockers();
var
  pnl : TControl;
begin
  while pnlLockers.ControlCount > 0 do
  begin
    pnl := pnlLockers.controls[0];
    pnl.Free;
  end;
end;

procedure TfrmLockers.writeConf(lockerRoomId: integer);
var
  F : TextFile;
  size: integer;
begin
  AssignFile(F, 'config.cnf');
  ReWrite(F);
  if rbSmall.Checked then size:=1;
  if rbMedium.Checked then size:=2;
  if rbLarge.Checked then size:=3;
  WriteLn(F, IntToStr(size));
  WriteLn(F, IntToStr(lockerRoomId));
  CloseFile(F);
  setSize(size);
end;

procedure TfrmLockers.setSize(size: integer);
begin
    case size of
    1:
      begin
        panelSize := 40;
        rowCount:= 22;
        rbSmall.Checked := True;
      end;
    2:
      begin
        panelSize := 50;
        rowCount := 18;
        rbMedium.Checked := True;
      end;
    3:
      begin
        panelSize := 60;
        rowCount := 15;
        rbLarge.Checked := True;
      end;
    else
      begin
        panelSize := 50;
        rowCount := 18;
        rbMedium.Checked := True;
      end;
    end;

end;

procedure TfrmLockers.clearForm();
begin
    lblLockerRoomId.Caption := '';
    lblLockerTitle.Caption := '';
    lblFree.Caption := '';
    lblOccupied.Caption := '';
    lblHaveProblem.Caption := '';
    lblDeactive.Caption := '';
    lblAllLockers.Caption := '';
    lblStart.Caption := '';
    lblEnd.Caption := '';
end;

procedure TfrmLockers.showLockers(lockerRoomId: integer);
var
  panel: TPanel;
  i: integer;
  panelTop: integer;
  lastLeft: integer;
  lastTop: integer;
begin
  destroyLockers;
  QLockers.Close;
  QLockers.Parameters.ParamByName('lockerRoomId').Value := lockerRoomId;
  QLockers.Open;
  lastLeft := 0;
  i:=1;
  while not QLockers.Eof do
  begin
    panel := TPanel.Create(self);
    panel.Width:=panelSize;
    panel.Height:=panelSize;
    panel.Left := lastLeft;
    lastLeft := (i mod rowCount) * panelSize ;
    panel.Top:= lastTop;
    lastTop := i div rowCount * panelSize;
    panel.Parent := pnlLockers;
    panel.Name := 'panel'+IntToStr(i);
    panel.Caption := IntToStr(i);
    //QLockerStatus.Close;
    //QLockerStatus.Parameters.ParamByName('ClosedID').Value:=i;
    //QLockerStatus.Open;
    if QLockers['Lend'] then
    begin
        TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$008080FF;
        TPanel(FindComponent('Panel'+IntToStr(i))).Caption := IntToStr(i); //+'-'+FormatDateTime('hh:mm',(Time()-StrToTime(QLockerStatus['StartTime'])));
    end
    else
        TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$0000C100;

    if QLockers['Active']=0 then
        TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$00E800E8;

    if QLockers['Status']=2 then
        TPanel(FindComponent('Panel'+IntToStr(i))).Color:=clYellow;

    QLockers.Next;
    i:= i + 1;
  end;
  QSummery.Close;
  QSummery.Parameters.ParamByName('lockerRoomId').Value := edtLockerRoomId.Text;
  QSummery.Open;
  if QSummery['free']<>null then
  begin
      lblFree.Caption := QSummery['free'];
      lblOccupied.Caption := QSummery['occupied'];
      lblHaveProblem.Caption := QSummery['haveProblem'];
      lblDeactive.Caption := QSummery['deactive'];
      lblAllLockers.Caption := QSummery['allLockers'];
      lblStart.Caption := QSummery['minKeyNumber'];
      lblEnd.Caption := QSummery['maxKeyNumber'];
  end;

end;

procedure TfrmLockers.mnuLendLockersClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLendLockers, frmLendLockers);
    frmLendLockers.QLoclers.Parameters.ParamByName('receptionDate').Value := CurrentDate;
    frmLendLockers.QLoclers.Open;
    frmLendLockers.ShowModal;
    FreeAndNil(frmLendLockers);
end;

procedure TfrmLockers.btnLockerRoomClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLockerRoomInfo, frmLockerRoomInfo);
    frmLockerRoomInfo.ShowModal;
    if frmLockerRoomInfo.strKey='enter' then
    begin
        edtLockerRoomId.Text:=frmLockerRoomInfo.QLockerRoom['id'];
        edtLockerRoomTitle.Text:= frmLockerRoomInfo.QLockerRoom['title'];
        lblLockerRoomId.Caption := frmLockerRoomInfo.QLockerRoom['id'];
        lblLockerTitle.Caption := frmLockerRoomInfo.QLockerRoom['title'];
        showLockers(frmLockerRoomInfo.QLockerRoom['id']);
        writeConf(frmLockerRoomInfo.QLockerRoom['id']);
    end;
    FreeAndNil(frmLockerRoomInfo);
end;

procedure TfrmLockers.FormCreate(Sender: TObject);
var
    F : TextFile;
    size, lastLockerRoomId: integer;

begin
    clearForm;
    AssignFile(F,'config.cnf');
    {$I-}
    Reset(F);
    {$I+}
    if IOResult = 0 then
    begin
        Readln(F, size);
        setSize(size);
        Readln(F, lastLockerRoomId);
        if lastLockerRoomId <> null then
        begin
          QLockerRoom.Parameters.ParamByName('lockerRoomId').Value := lastLockerRoomId;
          QLockerRoom.Open;
          if QLockerRoom['id'] <> null then
          begin
              edtLockerRoomId.Text := IntToStr(lastLockerRoomId);
              lblLockerRoomId.Caption := IntToStr(lastLockerRoomId);
              edtLockerRoomTitle.Text := QLockerRoom['title'];
              lblLockerTitle.Caption := QLockerRoom['title'];
              showLockers(QLockerRoom['id']);
          end;
        end;
        CloseFile(F);
        rbSmall.OnClick := rbSmallClick;
        rbMedium.OnClick := rbSmallClick;
        rbLarge.OnClick := rbSmallClick;
    end;
end;

procedure TfrmLockers.rbSmallClick(Sender: TObject);
begin
    writeConf(StrToInt(edtLockerRoomId.Text));
    showLockers(strToInt(edtLockerRoomId.Text));
end;

procedure TfrmLockers.btnRefreshClick(Sender: TObject);
begin
  showLockers(strToInt(edtLockerRoomId.Text));
end;

procedure TfrmLockers.mnuActiveClick(Sender: TObject);
begin
    Application.CreateForm(TfrmActiveLocker, frmActiveLocker);
    frmActiveLocker.ShowModal;
    FreeAndNil(frmActiveLocker);
    btnRefreshClick(Sender);
end;

procedure TfrmLockers.ih1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmClosed, frmClosed);
    frmClosed.ShowModal;
    FreeAndNil(frmClosed);
end;

end.
