unit LockerMapUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Buttons;

type
  TfrmLockerMap = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel11: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    Panel13: TPanel;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel23: TPanel;
    Panel19: TPanel;
    Panel21: TPanel;
    Panel25: TPanel;
    Panel27: TPanel;
    Panel29: TPanel;
    Panel35: TPanel;
    Panel31: TPanel;
    Panel33: TPanel;
    Panel37: TPanel;
    Panel39: TPanel;
    Panel41: TPanel;
    Panel47: TPanel;
    Panel43: TPanel;
    Panel45: TPanel;
    Panel49: TPanel;
    Panel51: TPanel;
    Panel53: TPanel;
    Panel59: TPanel;
    Panel55: TPanel;
    Panel57: TPanel;
    Panel61: TPanel;
    Panel63: TPanel;
    Panel65: TPanel;
    Panel71: TPanel;
    Panel67: TPanel;
    Panel69: TPanel;
    Panel73: TPanel;
    Panel75: TPanel;
    Panel77: TPanel;
    Panel83: TPanel;
    Panel79: TPanel;
    Panel81: TPanel;
    Panel85: TPanel;
    Panel87: TPanel;
    Panel89: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel12: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel14: TPanel;
    Panel16: TPanel;
    Panel18: TPanel;
    Panel24: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    Panel26: TPanel;
    Panel28: TPanel;
    Panel30: TPanel;
    Panel36: TPanel;
    Panel32: TPanel;
    Panel34: TPanel;
    Panel38: TPanel;
    Panel40: TPanel;
    Panel42: TPanel;
    Panel48: TPanel;
    Panel44: TPanel;
    Panel46: TPanel;
    Panel50: TPanel;
    Panel52: TPanel;
    Panel54: TPanel;
    Panel60: TPanel;
    Panel56: TPanel;
    Panel58: TPanel;
    Panel62: TPanel;
    Panel64: TPanel;
    Panel66: TPanel;
    Panel72: TPanel;
    Panel68: TPanel;
    Panel70: TPanel;
    Panel74: TPanel;
    Panel76: TPanel;
    Panel78: TPanel;
    Panel84: TPanel;
    Panel80: TPanel;
    Panel82: TPanel;
    Panel86: TPanel;
    Panel88: TPanel;
    Panel90: TPanel;
    Panel158: TPanel;
    Panel160: TPanel;
    Panel156: TPanel;
    Panel154: TPanel;
    Panel152: TPanel;
    Panel146: TPanel;
    Panel150: TPanel;
    Panel148: TPanel;
    Panel144: TPanel;
    Panel142: TPanel;
    Panel140: TPanel;
    Panel134: TPanel;
    Panel138: TPanel;
    Panel136: TPanel;
    Panel132: TPanel;
    Panel130: TPanel;
    Panel128: TPanel;
    Panel122: TPanel;
    Panel126: TPanel;
    Panel124: TPanel;
    Panel120: TPanel;
    Panel118: TPanel;
    Panel116: TPanel;
    Panel110: TPanel;
    Panel114: TPanel;
    Panel112: TPanel;
    Panel157: TPanel;
    Panel159: TPanel;
    Panel155: TPanel;
    Panel153: TPanel;
    Panel151: TPanel;
    Panel145: TPanel;
    Panel149: TPanel;
    Panel147: TPanel;
    Panel143: TPanel;
    Panel141: TPanel;
    Panel139: TPanel;
    Panel133: TPanel;
    Panel137: TPanel;
    Panel135: TPanel;
    Panel131: TPanel;
    Panel129: TPanel;
    Panel127: TPanel;
    Panel121: TPanel;
    Panel125: TPanel;
    Panel123: TPanel;
    Panel119: TPanel;
    Panel117: TPanel;
    Panel115: TPanel;
    Panel109: TPanel;
    Panel113: TPanel;
    Panel111: TPanel;
    Panel91: TPanel;
    Panel92: TPanel;
    Panel94: TPanel;
    Panel93: TPanel;
    Panel95: TPanel;
    Panel96: TPanel;
    Panel98: TPanel;
    Panel97: TPanel;
    Panel99: TPanel;
    Panel100: TPanel;
    Panel102: TPanel;
    Panel101: TPanel;
    Panel103: TPanel;
    Panel104: TPanel;
    Panel106: TPanel;
    Panel105: TPanel;
    Panel108: TPanel;
    Panel107: TPanel;
    QReception: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
    QLockerStatus: TADOQuery;
    Label11: TLabel;
    edtTime: TEdit;
    Label12: TLabel;
    btnAccept: TBitBtn;
    btnStopMonitoring: TBitBtn;
    btnMonitoringStart: TBitBtn;
    btnGeneralReport: TBitBtn;
    QSummery: TADOQuery;
    QLocker: TADOQuery;
    Timer: TTimer;
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RefreshLocker();
    procedure FormCreate(Sender: TObject);
    procedure btnMonitoringStartClick(Sender: TObject);
    procedure btnGeneralReportClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLockerMap: TfrmLockerMap;

implementation

uses SabegheMoshtariUnit, DMUnit, GeneralReportUnit, CalculatUnit,
  ViewReceptionUnit, ManagerUnit;

{$R *.dfm}

procedure TfrmLockerMap.RefreshLocker();
var
i, k : integer;
begin
for i := 1 to 1016 do
begin

    if TPanel(FindComponent('Panel'+IntToStr(i))).Caption <> '' then
    begin
        QLockerStatus.Close;
        QLockerStatus.Parameters.ParamByName('ClosedID').Value:=TPanel(FindComponent('Panel'+IntToStr(i))).Caption;
       QLockerStatus.Open;

        if QLockerStatus['EndTime']='99:99' then
        begin
            if ((Time()-StrToTime(QLockerStatus['StartTime'])) >= StrToTime('03:00')) and ((Time()-StrToTime(QLockerStatus['StartTime'])) < StrToTime('04:00')) then
                TPanel(FindComponent('Panel'+IntToStr(i))).Color:=clNavy
            else
                if ((Time()-StrToTime(QLockerStatus['StartTime'])) >= StrToTime('04:00')) and ((Time()-StrToTime(QLockerStatus['StartTime'])) < StrToTime('05:00')) then
                    TPanel(FindComponent('Panel'+IntToStr(i))).Color:=clGray
                else
                    if ((Time()-StrToTime(QLockerStatus['StartTime'])) >= StrToTime('05:00')) and ((Time()-StrToTime(QLockerStatus['StartTime'])) < StrToTime('06:00')) then
                        TPanel(FindComponent('Panel'+IntToStr(i))).Color:=clSkyBlue
                    else
                        if ((Time()-StrToTime(QLockerStatus['StartTime'])) >= StrToTime('06:00')) and ((Time()-StrToTime(QLockerStatus['StartTime'])) < StrToTime('07:00')) then
                            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=clTeal
                        else
                            if ((Time()-StrToTime(QLockerStatus['StartTime'])) >= StrToTime('07:00')) then
                                TPanel(FindComponent('Panel'+IntToStr(i))).Color:=clBlack
                            else
                                TPanel(FindComponent('Panel'+IntToStr(i))).Color:=clRed;
        end
        else
            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$0000CC00;

        if QLockerStatus['Active']=0 then
            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$00FF0080;

        if QLockerStatus['Status']=2 then
            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$00004000;

    end;
end;

end;

procedure TfrmLockerMap.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Button=mbLeft then
    begin
        Application.CreateForm(TfrmSabegheMoshtari, frmSabegheMoshtari);
        QReception.Close;
        QReception.Parameters.ParamByName('ClosedID').Value:=TPanel(Sender).Caption;
        QReception.Open;
        if QReception['ReceptionID']=Null then Exit;
        frmSabegheMoshtari.lblReceptionID.Caption:=QReception['ReceptionID'];
        frmSabegheMoshtari.lblKeyNumber.Caption:=QReception['ClosedID'];

        frmSabegheMoshtari.lblCustomerName.Caption:=QReception['CustomerName'];
        frmSabegheMoshtari.lblNumber.Caption:=QReception['NumberOfAdult']+QReception['NumberOfChild'];
        SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
        SP_GetCurrentCredit.ExecProc;
        frmSabegheMoshtari.lblCredit.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
        frmSabegheMoshtari.chbMobile.Checked:=QReception['Mobile'];
        frmSabegheMoshtari.chbPool.Checked:=QReception['Pool'];
        frmSabegheMoshtari.chbSaat.Checked:=QReception['Saat'];
        frmSabegheMoshtari.chbSooeech.Checked:=QReception['Sooeech'];
        frmSabegheMoshtari.chbAngoshtar.Checked:=QReception['AngoshtarPlak'];
        frmSabegheMoshtari.chbAsnad.Checked:=QReception['Asnad'];
        frmSabegheMoshtari.chbPakhsh.Checked:=QReception['Pakhsh'];
        frmSabegheMoshtari.chbSamsonet.Checked:=QReception['Samsonet'];
        frmSabegheMoshtari.chbKeefPool.Checked:=QReception['KeefPool'];
        frmSabegheMoshtari.edtOther.Text:=QReception['Other'];
        frmSabegheMoshtari.lblStartTime.Caption:=QReception['StartTime'];
        frmSabegheMoshtari.QFactor.Close;
        frmSabegheMoshtari.QFactor.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
        frmSabegheMoshtari.QFactor.Open;

        frmSabegheMoshtari.QCredit.Close;
        frmSabegheMoshtari.QCredit.Parameters.ParamByName('ReceptionID').Value:=QReception['ReceptionID'];
        frmSabegheMoshtari.QCredit.Open;

        frmSabegheMoshtari.ShowModal;
        FreeAndNil(frmSabegheMoshtari);
    end
    else
        if Button=mbRight then
        begin
            Application.CreateForm(TfrmViewReception, frmViewReception);
            frmViewReception.edtStartDate.Text:='1   /  /  ';
            frmViewReception.edtKeyNumber.Text:=TPanel(Sender).Caption;
            frmViewReception.BBtnAcceptClick(Sender);
            frmViewReception.ShowModal;
            FreeAndNil(frmViewReception);
        end
        else
            if Button=mbMiddle then
            begin
                QReception.Close;
                QReception.Parameters.ParamByName('ClosedID').Value:=TPanel(Sender).Caption;
                QReception.Open;
                if QReception['ReceptionID']=Null then Exit;
                Application.CreateForm(TfrmManager, frmManager);
                frmManager.edtReceptionID.Text:=IntToStr(QReception['ReceptionID']);
                frmManager.ShowModal;
                FreeAndNil(frmManager);
            end;
end;

procedure TfrmLockerMap.FormCreate(Sender: TObject);
var
i : integer;
begin
QLocker.Close;
QLocker.Open;

for i:= 1 to 1016 do
begin
    if TPanel(FindComponent('Panel'+IntToStr(i))).Caption <> '' then
    begin
        if QLocker['Lend'] then
        begin
            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=clRed;
        end
        else
            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$0000CC00;

        if QLocker['Active']=0 then
            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$00FF0080;

        if QLocker['Status']=2 then
            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$00004000;
    end;
    QLocker.Next;
end;
end;
procedure TfrmLockerMap.btnMonitoringStartClick(Sender: TObject);
begin
    btnMonitoringStart.Enabled := False;
    RefreshLocker;
    btnMonitoringStart.Enabled := True;
end;

procedure TfrmLockerMap.btnGeneralReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGeneralReport, frmGeneralReport);
    frmGeneralReport.ShowModal;
    FreeAndNil(frmGeneralReport);
end;

procedure TfrmLockerMap.TimerTimer(Sender: TObject);
begin
    FormCreate(Sender);
end;

end.
