unit LockerWomen2Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ADODB, DB;

type
  TfrmLockerWomen2 = class(TForm)
    Panel8619: TPanel;
    Panel8620: TPanel;
    Panel8621: TPanel;
    Panel8624: TPanel;
    Panel8622: TPanel;
    Panel8623: TPanel;
    Panel8625: TPanel;
    Panel8626: TPanel;
    Panel8627: TPanel;
    Panel8630: TPanel;
    Panel8628: TPanel;
    Panel8629: TPanel;
    Panel8631: TPanel;
    Panel8632: TPanel;
    Panel8633: TPanel;
    Panel8636: TPanel;
    Panel8634: TPanel;
    Panel8635: TPanel;
    Panel8654: TPanel;
    Panel8653: TPanel;
    Panel8652: TPanel;
    Panel8649: TPanel;
    Panel8651: TPanel;
    Panel8650: TPanel;
    Panel8648: TPanel;
    Panel8647: TPanel;
    Panel8646: TPanel;
    Panel8643: TPanel;
    Panel8645: TPanel;
    Panel8644: TPanel;
    Panel8642: TPanel;
    Panel8641: TPanel;
    Panel8640: TPanel;
    Panel8637: TPanel;
    Panel8639: TPanel;
    Panel8638: TPanel;
    Panel8655: TPanel;
    Panel8656: TPanel;
    Panel8657: TPanel;
    Panel8660: TPanel;
    Panel8658: TPanel;
    Panel8659: TPanel;
    Panel8661: TPanel;
    Panel8662: TPanel;
    Panel8663: TPanel;
    Panel8666: TPanel;
    Panel8664: TPanel;
    Panel8665: TPanel;
    Panel8667: TPanel;
    Panel8668: TPanel;
    Panel8669: TPanel;
    Panel8672: TPanel;
    Panel8670: TPanel;
    Panel8671: TPanel;
    Panel210: TPanel;
    Panel8682: TPanel;
    Panel8673: TPanel;
    Panel8681: TPanel;
    Panel8674: TPanel;
    Panel8683: TPanel;
    Panel8684: TPanel;
    Panel166: TPanel;
    Panel8680: TPanel;
    Panel8675: TPanel;
    Panel8678: TPanel;
    Panel8679: TPanel;
    Panel8676: TPanel;
    Panel8677: TPanel;
    Panel8685: TPanel;
    Panel25: TPanel;
    Panel8733: TPanel;
    Panel8730: TPanel;
    Panel8732: TPanel;
    Panel8731: TPanel;
    Panel8729: TPanel;
    Panel8728: TPanel;
    Panel8727: TPanel;
    Panel8724: TPanel;
    Panel8726: TPanel;
    Panel8725: TPanel;
    Panel8723: TPanel;
    Panel8722: TPanel;
    Panel8721: TPanel;
    Panel8718: TPanel;
    Panel8720: TPanel;
    Panel8719: TPanel;
    Panel8702: TPanel;
    Panel8705: TPanel;
    Panel8703: TPanel;
    Panel8704: TPanel;
    Panel8706: TPanel;
    Panel8707: TPanel;
    Panel8708: TPanel;
    Panel8711: TPanel;
    Panel8709: TPanel;
    Panel8710: TPanel;
    Panel8712: TPanel;
    Panel8713: TPanel;
    Panel8714: TPanel;
    Panel8717: TPanel;
    Panel8715: TPanel;
    Panel8716: TPanel;
    Panel8701: TPanel;
    Panel8698: TPanel;
    Panel8700: TPanel;
    Panel8699: TPanel;
    Panel8697: TPanel;
    Panel8696: TPanel;
    Panel8695: TPanel;
    Panel8692: TPanel;
    Panel8694: TPanel;
    Panel8693: TPanel;
    Panel8691: TPanel;
    Panel8690: TPanel;
    Panel8689: TPanel;
    Panel8686: TPanel;
    Panel8688: TPanel;
    Panel8687: TPanel;
    QSummery: TADOQuery;
    QReception: TADOQuery;
    QLockerStatus: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
    Timer: TTimer;
    Panel24: TPanel;
    QLocker: TADOQuery;
    procedure RefreshLocker();
    procedure FormCreate(Sender: TObject);
    procedure btnMonitoringStartClick(Sender: TObject);
    procedure btnGeneralReportClick(Sender: TObject);
    procedure Panel8619MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLockerWomen2: TfrmLockerWomen2;

implementation
uses SabegheMoshtariUnit, DMUnit, GeneralReportUnit, CalculatUnit,
  ViewReceptionUnit, ManagerUnit;

{$R *.dfm}

procedure TfrmLockerWomen2.RefreshLocker();
var
i : integer;
begin
for i:= 8619 to 8733 do
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



for i:= 8619 to 8733 do
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



procedure TfrmLockerWomen2.FormCreate(Sender: TObject);
var
i : integer;
begin
QLocker.Close;
QLocker.Open;

for i:= 8619 to 8733 do
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

procedure TfrmLockerWomen2.btnMonitoringStartClick(Sender: TObject);
begin
    RefreshLocker;
end;

procedure TfrmLockerWomen2.btnGeneralReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGeneralReport, frmGeneralReport);
    frmGeneralReport.ShowModal;
    FreeAndNil(frmGeneralReport);
end;



procedure TfrmLockerWomen2.Panel8619MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
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


end.
