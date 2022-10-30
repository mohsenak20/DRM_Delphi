unit GroupLockerMapPhaz2Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ADODB, DB, StdCtrls, Buttons;

type
  TfrmGroupLockerMapPhaz2 = class(TForm)
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel8452: TPanel;
    Panel8427: TPanel;
    Panel8450: TPanel;
    Panel8451: TPanel;
    Panel8428: TPanel;
    Panel8449: TPanel;
    Panel8444: TPanel;
    Panel8435: TPanel;
    Panel8442: TPanel;
    Panel8439: TPanel;
    Panel8437: TPanel;
    Panel8440: TPanel;
    Panel8443: TPanel;
    Panel8436: TPanel;
    Panel8441: TPanel;
    Panel8438: TPanel;
    Panel8429: TPanel;
    Panel8448: TPanel;
    Panel8431: TPanel;
    Panel8446: TPanel;
    Panel8433: TPanel;
    Panel8430: TPanel;
    Panel8447: TPanel;
    Panel8432: TPanel;
    Panel8445: TPanel;
    Panel8434: TPanel;
    edtTime: TEdit;
    btnAccept: TBitBtn;
    btnStopMonitoring: TBitBtn;
    btnMonitoringStart: TBitBtn;
    btnGeneralReport: TBitBtn;
    pnlActive: TPanel;
    pnlNotFix: TPanel;
    pnlTo3: TPanel;
    pnlEmpty: TPanel;
    pnlMoreThan7: TPanel;
    pnlTo4: TPanel;
    pnlTo5: TPanel;
    pnlTo6: TPanel;
    pnlTo7: TPanel;
    QLockerStatus: TADOQuery;
    QReception: TADOQuery;
    QSummery: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
    QLocker: TADOQuery;
    Timer: TTimer;
    Panel8414: TPanel;
    Panel8411: TPanel;
    Panel8413: TPanel;
    Panel8412: TPanel;
    Panel8410: TPanel;
    Panel8409: TPanel;
    Panel8408: TPanel;
    Panel8407: TPanel;
    Panel8406: TPanel;
    Panel8391: TPanel;
    Panel8394: TPanel;
    Panel8392: TPanel;
    Panel8393: TPanel;
    Panel8395: TPanel;
    Panel8396: TPanel;
    Panel8397: TPanel;
    Panel8398: TPanel;
    Panel8399: TPanel;
    Panel8405: TPanel;
    Panel8404: TPanel;
    Panel8400: TPanel;
    Panel8401: TPanel;
    Panel8403: TPanel;
    Panel8402: TPanel;
    Panel8484: TPanel;
    Panel8483: TPanel;
    Panel8480: TPanel;
    Panel8482: TPanel;
    Panel8481: TPanel;
    Panel8479: TPanel;
    Panel8478: TPanel;
    Panel8477: TPanel;
    Panel8474: TPanel;
    Panel8476: TPanel;
    Panel8475: TPanel;
    Panel8473: TPanel;
    Panel8472: TPanel;
    Panel8471: TPanel;
    Panel8470: TPanel;
    Panel8469: TPanel;
    Panel8485: TPanel;
    Panel8486: TPanel;
    Panel8489: TPanel;
    Panel8487: TPanel;
    Panel8488: TPanel;
    Panel8490: TPanel;
    Panel8491: TPanel;
    Panel8492: TPanel;
    Panel8495: TPanel;
    Panel8493: TPanel;
    Panel8494: TPanel;
    Panel8496: TPanel;
    Panel8497: TPanel;
    Panel8498: TPanel;
    Panel8499: TPanel;
    Panel8500: TPanel;
    Panel8468: TPanel;
    Panel8467: TPanel;
    Panel8501: TPanel;
    Panel8502: TPanel;
    Panel8466: TPanel;
    Panel8503: TPanel;
    Panel8532: TPanel;
    Panel8531: TPanel;
    Panel8534: TPanel;
    Panel8533: TPanel;
    Panel8530: TPanel;
    Panel8535: TPanel;
    Panel8540: TPanel;
    Panel8523: TPanel;
    Panel8529: TPanel;
    Panel8536: TPanel;
    Panel8527: TPanel;
    Panel8538: TPanel;
    Panel8525: TPanel;
    Panel8528: TPanel;
    Panel8537: TPanel;
    Panel8526: TPanel;
    Panel8539: TPanel;
    Panel8524: TPanel;
    Panel8552: TPanel;
    Panel8453: TPanel;
    Panel8455: TPanel;
    Panel8454: TPanel;
    Panel8456: TPanel;
    Panel8461: TPanel;
    Panel8463: TPanel;
    Panel8465: TPanel;
    Panel8462: TPanel;
    Panel8464: TPanel;
    Panel8457: TPanel;
    Panel8459: TPanel;
    Panel8458: TPanel;
    Panel8460: TPanel;
    Panel8522: TPanel;
    Panel8521: TPanel;
    Panel8518: TPanel;
    Panel8520: TPanel;
    Panel8519: TPanel;
    Panel8517: TPanel;
    Panel8516: TPanel;
    Panel8515: TPanel;
    Panel8512: TPanel;
    Panel8514: TPanel;
    Panel8513: TPanel;
    Panel8511: TPanel;
    Panel8510: TPanel;
    Panel8509: TPanel;
    Panel8508: TPanel;
    Panel8507: TPanel;
    Panel8506: TPanel;
    Panel8505: TPanel;
    Panel8504: TPanel;
    Panel8415: TPanel;
    Panel8418: TPanel;
    Panel8416: TPanel;
    Panel8417: TPanel;
    Panel8419: TPanel;
    Panel8420: TPanel;
    Panel8421: TPanel;
    Panel8422: TPanel;
    Panel8423: TPanel;
    Panel8424: TPanel;
    Panel8425: TPanel;
    Panel8426: TPanel;
    Panel8549: TPanel;
    Panel8547: TPanel;
    Panel8548: TPanel;
    Panel8546: TPanel;
    Panel8541: TPanel;
    Panel8545: TPanel;
    Panel8543: TPanel;
    Panel8544: TPanel;
    Panel8542: TPanel;
    Panel8607: TPanel;
    Panel8612: TPanel;
    Panel8601: TPanel;
    Panel8608: TPanel;
    Panel8605: TPanel;
    Panel8610: TPanel;
    Panel8603: TPanel;
    Panel8606: TPanel;
    Panel8609: TPanel;
    Panel8604: TPanel;
    Panel8611: TPanel;
    Panel8602: TPanel;
    Panel8618: TPanel;
    Panel8613: TPanel;
    Panel8617: TPanel;
    Panel8615: TPanel;
    Panel8616: TPanel;
    Panel8614: TPanel;
    Panel8573: TPanel;
    Panel8577: TPanel;
    Panel8568: TPanel;
    Panel8574: TPanel;
    Panel8571: TPanel;
    Panel8575: TPanel;
    Panel8570: TPanel;
    Panel8572: TPanel;
    Panel8576: TPanel;
    Panel8569: TPanel;
    Panel8582: TPanel;
    Panel8578: TPanel;
    Panel8581: TPanel;
    Panel8580: TPanel;
    Panel8579: TPanel;
    Panel166: TPanel;
    Panel8594: TPanel;
    Panel8589: TPanel;
    Panel8588: TPanel;
    Panel8593: TPanel;
    Panel8584: TPanel;
    Panel8591: TPanel;
    Panel8586: TPanel;
    Panel8583: TPanel;
    Panel8592: TPanel;
    Panel8585: TPanel;
    Panel8590: TPanel;
    Panel8587: TPanel;
    Panel8595: TPanel;
    Panel8600: TPanel;
    Panel8596: TPanel;
    Panel8598: TPanel;
    Panel8597: TPanel;
    Panel8599: TPanel;
    Panel8562: TPanel;
    Panel8558: TPanel;
    Panel8557: TPanel;
    Panel8561: TPanel;
    Panel8554: TPanel;
    Panel8560: TPanel;
    Panel8555: TPanel;
    Panel8553: TPanel;
    Panel8559: TPanel;
    Panel8556: TPanel;
    Panel8563: TPanel;
    Panel8567: TPanel;
    Panel8564: TPanel;
    Panel8565: TPanel;
    Panel8566: TPanel;
    Panel207: TPanel;
    Panel208: TPanel;
    Panel209: TPanel;
    Panel210: TPanel;
    Panel211: TPanel;
    Panel8551: TPanel;
    Panel8550: TPanel;
    Panel212: TPanel;
    Panel213: TPanel;
    procedure RefreshLocker();
    procedure FormCreate(Sender: TObject);
    procedure btnMonitoringStartClick(Sender: TObject);
    procedure btnGeneralReportClick(Sender: TObject);
    procedure Pane8391MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmGroupLockerMapPhaz2: TfrmGroupLockerMapPhaz2;

implementation

uses SabegheMoshtariUnit, ViewReceptionUnit, ManagerUnit,
  GeneralReportUnit, CalculatUnit;

{$R *.dfm}


procedure TfrmGroupLockerMapPhaz2.RefreshLocker();
var
i : integer;
begin
    QSummery.Close;
    QSummery.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QSummery.Open;
    if QSummery['Number'] <> null then
    begin
      pnlTo3.Caption := IntToStr(QSummery['To3']);
      pnlTo4.Caption := IntToStr(QSummery['To4']);
      pnlTo5.Caption := IntToStr(QSummery['To5']);
      pnlTo6.Caption := IntToStr(QSummery['To6']);
      pnlTo7.Caption := IntToStr(QSummery['To7']);
      pnlMoreThan7.Caption := IntToStr(QSummery['MoreThan7']);
    end;
for i :=8391  to 8618 do
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



for i :=8391  to 8618 do
    if TPanel(FindComponent('Panel'+IntToStr(i))).Caption <> '' then
    begin
        QLockerStatus.Close;
        QLockerStatus.Parameters.ParamByName('ClosedID').Value:=TPanel(FindComponent('Panel'+IntToStr(i))).Caption;
        QLockerStatus.Open;
        if QLockerStatus['EndTime']='99:99' then
        begin
            if (Time()-StrToTime(QLockerStatus['StartTime'])) > StrToTime('05:00') then
                TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$0000BFBF
            else
                TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$000000D5;
        end
        else
            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$0000CC00;

        if QLockerStatus['Active']=0 then
            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$00FF0080;

        if QLockerStatus['Status']=2 then
            TPanel(FindComponent('Panel'+IntToStr(i))).Color:=$00004000;

    end;


end;

procedure TfrmGroupLockerMapPhaz2.Pane8391MouseDown(Sender: TObject;
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

procedure TfrmGroupLockerMapPhaz2.FormCreate(Sender: TObject);
var
i : integer;
begin
QLocker.Close;
QLocker.Open;

for i:= 8391 to 8618 do
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

procedure TfrmGroupLockerMapPhaz2.btnMonitoringStartClick(Sender: TObject);
begin
    RefreshLocker;
end;

procedure TfrmGroupLockerMapPhaz2.btnGeneralReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGeneralReport, frmGeneralReport);
    frmGeneralReport.ShowModal;
    FreeAndNil(frmGeneralReport);
end;


end.
