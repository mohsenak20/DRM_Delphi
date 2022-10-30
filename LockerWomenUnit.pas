unit LockerWomenUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, ExtCtrls;

type
  TfrmLockerWomen = class(TForm)
    Panel1386: TPanel;
    Panel1388: TPanel;
    Panel1390: TPanel;
    Panel1396: TPanel;
    Panel1392: TPanel;
    Panel1394: TPanel;
    Panel1398: TPanel;
    Panel1400: TPanel;
    Panel1402: TPanel;
    Panel1408: TPanel;
    Panel1404: TPanel;
    Panel1406: TPanel;
    Panel1410: TPanel;
    Panel1412: TPanel;
    Panel1414: TPanel;
    Panel1420: TPanel;
    Panel1416: TPanel;
    Panel1418: TPanel;
    Panel1422: TPanel;
    Panel1424: TPanel;
    Panel1426: TPanel;
    Panel1432: TPanel;
    Panel1428: TPanel;
    Panel1430: TPanel;
    Panel1434: TPanel;
    Panel1436: TPanel;
    Panel1438: TPanel;
    Panel1440: TPanel;
    Panel1442: TPanel;
    Panel1385: TPanel;
    Panel1387: TPanel;
    Panel1389: TPanel;
    Panel1395: TPanel;
    Panel1391: TPanel;
    Panel1393: TPanel;
    Panel1397: TPanel;
    Panel1399: TPanel;
    Panel1401: TPanel;
    Panel1407: TPanel;
    Panel1403: TPanel;
    Panel1405: TPanel;
    Panel1409: TPanel;
    Panel1411: TPanel;
    Panel1413: TPanel;
    Panel1419: TPanel;
    Panel1415: TPanel;
    Panel1417: TPanel;
    Panel1421: TPanel;
    Panel1423: TPanel;
    Panel1425: TPanel;
    Panel1431: TPanel;
    Panel1427: TPanel;
    Panel1429: TPanel;
    Panel1433: TPanel;
    Panel1435: TPanel;
    Panel1437: TPanel;
    Panel1439: TPanel;
    Panel1441: TPanel;
    Panel1445: TPanel;
    Panel1449: TPanel;
    Panel1450: TPanel;
    Panel1446: TPanel;
    Panel1384: TPanel;
    Panel1383: TPanel;
    Panel1380: TPanel;
    Panel1451: TPanel;
    Panel1452: TPanel;
    Panel1443: TPanel;
    Panel1447: TPanel;
    Panel1448: TPanel;
    Panel1444: TPanel;
    Panel1382: TPanel;
    Panel1381: TPanel;
    Panel1378: TPanel;
    Panel1368: TPanel;
    Panel1366: TPanel;
    Panel1364: TPanel;
    Panel1358: TPanel;
    Panel1362: TPanel;
    Panel1360: TPanel;
    Panel1356: TPanel;
    Panel1354: TPanel;
    Panel1352: TPanel;
    Panel1346: TPanel;
    Panel1350: TPanel;
    Panel1348: TPanel;
    Panel1344: TPanel;
    Panel1342: TPanel;
    Panel1340: TPanel;
    Panel1334: TPanel;
    Panel1338: TPanel;
    Panel1336: TPanel;
    Panel1332: TPanel;
    Panel1330: TPanel;
    Panel1328: TPanel;
    Panel1322: TPanel;
    Panel1326: TPanel;
    Panel1324: TPanel;
    Panel1320: TPanel;
    Panel1318: TPanel;
    Panel1316: TPanel;
    Panel1310: TPanel;
    Panel1314: TPanel;
    Panel1312: TPanel;
    Panel1308: TPanel;
    Panel1306: TPanel;
    Panel1304: TPanel;
    Panel1367: TPanel;
    Panel1365: TPanel;
    Panel1363: TPanel;
    Panel1357: TPanel;
    Panel1361: TPanel;
    Panel1359: TPanel;
    Panel1355: TPanel;
    Panel1353: TPanel;
    Panel1351: TPanel;
    Panel1345: TPanel;
    Panel1349: TPanel;
    Panel1347: TPanel;
    Panel1343: TPanel;
    Panel1341: TPanel;
    Panel1339: TPanel;
    Panel1333: TPanel;
    Panel1337: TPanel;
    Panel1335: TPanel;
    Panel1331: TPanel;
    Panel1329: TPanel;
    Panel1327: TPanel;
    Panel1321: TPanel;
    Panel1325: TPanel;
    Panel1323: TPanel;
    Panel1319: TPanel;
    Panel1317: TPanel;
    Panel1315: TPanel;
    Panel1309: TPanel;
    Panel1313: TPanel;
    Panel1311: TPanel;
    Panel1307: TPanel;
    Panel1305: TPanel;
    Panel1303: TPanel;
    Panel1379: TPanel;
    Panel1376: TPanel;
    Panel1375: TPanel;
    Panel1372: TPanel;
    Panel1371: TPanel;
    Panel1377: TPanel;
    Panel1374: TPanel;
    Panel1373: TPanel;
    Panel1370: TPanel;
    Panel1369: TPanel;
    QLockerStatus: TADOQuery;
    QReception: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
    procedure RefreshLocker();
    procedure Panel1303MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLockerWomen: TfrmLockerWomen;

implementation
uses SabegheMoshtariUnit, DMUnit, GeneralReportUnit, CalculatUnit,
  ViewReceptionUnit, ManagerUnit;


{$R *.dfm}
procedure TfrmLockerWomen.RefreshLocker();
var
i : integer;
begin
for i :=1303  to 1452 do
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

procedure TfrmLockerWomen.Panel1303MouseDown(Sender: TObject;
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

procedure TfrmLockerWomen.FormCreate(Sender: TObject);
begin
    RefreshLocker;
end;

end.
