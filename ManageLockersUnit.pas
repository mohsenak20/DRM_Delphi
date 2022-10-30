unit ManageLockersUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, ADODB, CheckLst, ExtCtrls, Buttons,
  Grids, DBGrids, ActnList;

type
  TfrmManageLockers = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    chbList: TCheckListBox;
    btnLockerRoom: TBitBtn;
    edtLockerRoomTitle: TEdit;
    edtLockerRoomId: TEdit;
    QLockerRoomRow: TADOQuery;
    bbtnAccept: TBitBtn;
    rbActive: TRadioButton;
    rbDeActive: TRadioButton;
    QChangeLockerState: TADOQuery;
    QLockerRoomServiceCenter1: TADOQuery;
    QLockerRoomServiceCenter2: TADOQuery;
    DBGridServiceCenter1: TDBGrid;
    DsLockerRoomServiceCenter1: TDataSource;
    DsLockerRoomServiceCenter2: TDataSource;
    ActionList1: TActionList;
    refreshLockerRoomState: TAction;
    btnLockerNumber: TBitBtn;
    procedure btnLockerRoomClick(Sender: TObject);
    procedure bbtnAcceptClick(Sender: TObject);
    procedure DBGridServiceCenter1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    Procedure RefreshServiceCenters();
    procedure FormCreate(Sender: TObject);
    procedure refreshLockerRoomStateExecute(Sender: TObject);
    Procedure changeState(title: string; newState: Boolean; serviceCenterId: integer; lockerRoomId: integer);
    procedure changeStateLockerRoomRow(newState: Boolean; startLockerNumber: integer; endLockerNumber: integer; serviceCenterId: integer);
    procedure DBGridServiceCenter1DblClick(Sender: TObject);
    procedure DBGridServiceCenter2DblClick(Sender: TObject);
    procedure btnLockerNumberClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManageLockers: TfrmManageLockers;

implementation

uses DMUnit, LockerRoominfoUnit, ActiveLockerUnit;

{$R *.dfm}

Procedure TfrmManageLockers.changeState(title: string; newState: Boolean; serviceCenterId: integer; lockerRoomId: integer);
var
  newStateTitle: String;
  confirmMessage: String;
begin
    if newState then
        newStateTitle := 'ÝÚÇá'
    else
        newStateTitle := 'ÛíÑ ÝÚÇá';


    confirmMessage := 'ÂíÇ ˜ãÏ åÇí  '+title+'  '+newStateTitle+' ÑÏÏ¿';

    IF MessageBox(Self.Handle, PAnsiChar(confirmMessage), 'ÊÛííÑ æÖÚíÊ ÑÎÊ˜ä', MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo  Then Exit;

    QLockerRoomRow.Close;
    QLockerRoomRow.Parameters.ParamByName('lockerRoomId').Value := lockerRoomId;
    QLockerRoomRow.Open;
    while not QLockerRoomRow.Eof do
    begin
        changeStateLockerRoomRow(newState, QLockerRoomRow['startLockerNumber'], QLockerRoomRow['endLockerNumber'], serviceCenterId );
        QLockerRoomRow.Next;
    end;

end;

procedure TfrmManageLockers.changeStateLockerRoomRow(newState: Boolean; startLockerNumber: integer; endLockerNumber: integer; serviceCenterId: integer);
begin
  QChangeLockerState.Close;
  QChangeLockerState.Parameters.ParamByName('newState').Value := newState;
  QChangeLockerState.Parameters.ParamByName('startLockerNumber').Value := QLockerRoomRow['startLockerNumber'];
  QChangeLockerState.Parameters.ParamByName('endLockerNumber').Value := QLockerRoomRow['endLockerNumber'];
  QChangeLockerState.Parameters.ParamByName('serviceCenterId').Value := QLockerRoomRow['serviceCenterId'];
  QChangeLockerState.ExecSQL;
end;

procedure TfrmManageLockers.RefreshServiceCenters();
begin
    QLockerRoomServiceCenter1.Close;
    QLockerRoomServiceCenter1.Open;
    QLockerRoomServiceCenter2.Close();
    QLockerRoomServiceCenter2.Open;
end;

procedure TfrmManageLockers.btnLockerRoomClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLockerRoomInfo, frmLockerRoomInfo);
    frmLockerRoomInfo.ShowModal;
    if frmLockerRoomInfo.strKey='enter' then
    begin
        edtLockerRoomId.Text:=frmLockerRoomInfo.QLockerRoom['id'];
        edtLockerRoomTitle.Text:=frmLockerRoomInfo.QLockerRoom['title'];
        QLockerRoomRow.Close;
        QLockerRoomRow.Parameters.ParamByName('lockerRoomId').Value := frmLockerRoomInfo.QLockerRoom['id'];
        QLockerRoomRow.Open;
        chbList.Items.Clear;
        while not QLockerRoomRow.Eof do
        begin
            chbList.Items.Add(QLockerRoomRow['title']+': '+IntToStr(QLockerRoomRow['endLockerNumber'])+' - '+IntToStr(QLockerRoomRow['startLockerNumber']));
            QLockerRoomRow.Next;
        end;
    end;
    FreeAndNil(frmLockerRoomInfo);
end;

procedure TfrmManageLockers.bbtnAcceptClick(Sender: TObject);
var
  ListItem : integer;
begin
    for ListItem := 0 to chbList.Items.Count - 1 do
    begin
        if chbList.Checked[ListItem] then
        begin
            QLockerRoomRow.RecNo := ListItem + 1;
            changeStateLockerRoomRow(rbActive.Checked, QLockerRoomRow['startLockerNumber'], QLockerRoomRow['endLockerNumber'], QLockerRoomRow['serviceCenterId']);
        end;
    end;
    if chbList.Items.Count > 0 then
    begin
       ShowMessage('ÚãáíÇÊ ÈÇ ãæÝÞíÊ ÇäÌÇã ÑÏíÏ');
       RefreshServiceCenters();
    end;
end;

procedure TfrmManageLockers.DBGridServiceCenter1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    DBGridServiceCenter1.Canvas.Font.Color:=clWhite;
    If QLockerRoomServiceCenter1['isActive'] > 0 then
      DBGridServiceCenter1.Canvas.Brush.Color:=clGreen
    else
      DBGridServiceCenter1.Canvas.Brush.Color:=clRed;


    DBGridServiceCenter1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmManageLockers.FormCreate(Sender: TObject);
begin
  RefreshServiceCenters();
end;

procedure TfrmManageLockers.refreshLockerRoomStateExecute(Sender: TObject);
begin
  RefreshServiceCenters();
end;

procedure TfrmManageLockers.DBGridServiceCenter1DblClick(Sender: TObject);
var
  newState: Boolean;
begin
    if QLockerRoomServiceCenter1['isActive'] > 0 then
        newState := False
    else
        newState := True;
    changeState(QLockerRoomServiceCenter1['title'], newState, 1, QLockerRoomServiceCenter1['id']);
    RefreshServiceCenters();
end;

procedure TfrmManageLockers.DBGridServiceCenter2DblClick(Sender: TObject);
var
  newState: Boolean;
begin
    if QLockerRoomServiceCenter2['isActive'] > 0 then
        newState := False
    else
        newState := True;
    changeState(QLockerRoomServiceCenter2['title'], newState, 2, QLockerRoomServiceCenter2['id']);
    RefreshServiceCenters();
end;

procedure TfrmManageLockers.btnLockerNumberClick(Sender: TObject);
begin
    Application.CreateForm(TfrmActiveLocker, frmActiveLocker);
    frmActiveLocker.ShowModal;
    FreeAndNil(frmActiveLocker);
end;

end.
