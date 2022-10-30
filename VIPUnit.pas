unit VIPUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ADODB, DB;

type
  TfrmVIP = class(TForm)
    Panel2884: TPanel;
    Panel2886: TPanel;
    Panel2888: TPanel;
    Panel2894: TPanel;
    Panel2890: TPanel;
    Panel2892: TPanel;
    Panel2896: TPanel;
    Panel2898: TPanel;
    Panel2900: TPanel;
    Panel2906: TPanel;
    Panel2902: TPanel;
    Panel2904: TPanel;
    Panel2908: TPanel;
    Panel2910: TPanel;
    Panel2912: TPanel;
    Panel2918: TPanel;
    Panel2914: TPanel;
    Panel2916: TPanel;
    Panel2920: TPanel;
    Panel2922: TPanel;
    Panel2924: TPanel;
    Panel2930: TPanel;
    Panel2926: TPanel;
    Panel2928: TPanel;
    Panel2932: TPanel;
    Panel2934: TPanel;
    Panel2936: TPanel;
    Panel2938: TPanel;
    Panel2940: TPanel;
    Panel2883: TPanel;
    Panel2885: TPanel;
    Panel2887: TPanel;
    Panel2893: TPanel;
    Panel2889: TPanel;
    Panel2891: TPanel;
    Panel2895: TPanel;
    Panel2897: TPanel;
    Panel2899: TPanel;
    Panel2905: TPanel;
    Panel2901: TPanel;
    Panel2903: TPanel;
    Panel2907: TPanel;
    Panel2909: TPanel;
    Panel2911: TPanel;
    Panel2917: TPanel;
    Panel2913: TPanel;
    Panel2915: TPanel;
    Panel2919: TPanel;
    Panel2921: TPanel;
    Panel2923: TPanel;
    Panel2929: TPanel;
    Panel2925: TPanel;
    Panel2927: TPanel;
    Panel2931: TPanel;
    Panel2933: TPanel;
    Panel2935: TPanel;
    Panel2937: TPanel;
    Panel2939: TPanel;
    Panel2942: TPanel;
    Panel2944: TPanel;
    Panel2882: TPanel;
    Panel2881: TPanel;
    Panel2878: TPanel;
    Panel2941: TPanel;
    Panel2943: TPanel;
    Panel2880: TPanel;
    Panel2879: TPanel;
    Panel2876: TPanel;
    Panel2866: TPanel;
    Panel2865: TPanel;
    Panel2862: TPanel;
    Panel2857: TPanel;
    Panel2861: TPanel;
    Panel2858: TPanel;
    Panel2854: TPanel;
    Panel2852: TPanel;
    Panel2850: TPanel;
    Panel2848: TPanel;
    Panel2864: TPanel;
    Panel2863: TPanel;
    Panel2860: TPanel;
    Panel2855: TPanel;
    Panel2859: TPanel;
    Panel2856: TPanel;
    Panel2853: TPanel;
    Panel2851: TPanel;
    Panel2849: TPanel;
    Panel2847: TPanel;
    Panel2836: TPanel;
    Panel2834: TPanel;
    Panel2832: TPanel;
    Panel2826: TPanel;
    Panel2830: TPanel;
    Panel2828: TPanel;
    Panel2824: TPanel;
    Panel2822: TPanel;
    Panel2820: TPanel;
    Panel2814: TPanel;
    Panel2818: TPanel;
    Panel2816: TPanel;
    Panel2812: TPanel;
    Panel2810: TPanel;
    Panel2808: TPanel;
    Panel2802: TPanel;
    Panel2806: TPanel;
    Panel2804: TPanel;
    Panel2800: TPanel;
    Panel2798: TPanel;
    Panel2796: TPanel;
    Panel2790: TPanel;
    Panel2794: TPanel;
    Panel2792: TPanel;
    Panel2788: TPanel;
    Panel2786: TPanel;
    Panel2784: TPanel;
    Panel922: TPanel;
    Panel926: TPanel;
    Panel924: TPanel;
    Panel9220: TPanel;
    Panel918: TPanel;
    Panel916: TPanel;
    Panel2835: TPanel;
    Panel2833: TPanel;
    Panel2831: TPanel;
    Panel2825: TPanel;
    Panel2829: TPanel;
    Panel2827: TPanel;
    Panel2823: TPanel;
    Panel2821: TPanel;
    Panel2819: TPanel;
    Panel2813: TPanel;
    Panel2817: TPanel;
    Panel2815: TPanel;
    Panel2811: TPanel;
    Panel2809: TPanel;
    Panel2807: TPanel;
    Panel2801: TPanel;
    Panel2805: TPanel;
    Panel2803: TPanel;
    Panel2799: TPanel;
    Panel2797: TPanel;
    Panel2795: TPanel;
    Panel2789: TPanel;
    Panel2793: TPanel;
    Panel2791: TPanel;
    Panel2787: TPanel;
    Panel2785: TPanel;
    Panel2783: TPanel;
    Panel921: TPanel;
    Panel925: TPanel;
    Panel923: TPanel;
    Panel919: TPanel;
    Panel917: TPanel;
    Panel915: TPanel;
    Panel2877: TPanel;
    Panel2874: TPanel;
    Panel2873: TPanel;
    Panel2870: TPanel;
    Panel2869: TPanel;
    Panel2875: TPanel;
    Panel2872: TPanel;
    Panel2871: TPanel;
    Panel2868: TPanel;
    Panel2867: TPanel;
    Panel2846: TPanel;
    Panel2844: TPanel;
    Panel2842: TPanel;
    Panel2840: TPanel;
    Panel2838: TPanel;
    Panel2845: TPanel;
    Panel2843: TPanel;
    Panel2841: TPanel;
    Panel2839: TPanel;
    Panel2837: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    edtTime: TEdit;
    btnAccept: TBitBtn;
    btnStopMonitoring: TBitBtn;
    btnMonitoringStart: TBitBtn;
    btnGeneralReport: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    pnlActive: TPanel;
    pnlNotFix: TPanel;
    pnlTo3: TPanel;
    pnlEmpty: TPanel;
    pnlMoreThan7: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    pnlTo4: TPanel;
    pnlTo5: TPanel;
    pnlTo6: TPanel;
    pnlTo7: TPanel;
    Panel2946: TPanel;
    Panel2945: TPanel;
    QLockerStatus: TADOQuery;
    QReception: TADOQuery;
    QSummery: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
    QLocker: TADOQuery;
    Timer: TTimer;
    procedure RefreshLocker();
    procedure FormCreate(Sender: TObject);
    procedure btnMonitoringStartClick(Sender: TObject);
    procedure btnGeneralReportClick(Sender: TObject);
    procedure Panel2783MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVIP: TfrmVIP;

implementation
uses SabegheMoshtariUnit, DMUnit, GeneralReportUnit, CalculatUnit,
  ViewReceptionUnit, ManagerUnit;
{$R *.dfm}
procedure TfrmVIP.RefreshLocker();
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
for i:= 2783 to 2946 do
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



for i:= 2783 to 2946 do
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



procedure TfrmVIP.FormCreate(Sender: TObject);
var
i : integer;
begin
QLocker.Close;
QLocker.Open;

for i:= 2783 to 2946 do
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

procedure TfrmVIP.btnMonitoringStartClick(Sender: TObject);
begin
    RefreshLocker;
end;

procedure TfrmVIP.btnGeneralReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGeneralReport, frmGeneralReport);
    frmGeneralReport.ShowModal;
    FreeAndNil(frmGeneralReport);
end;



procedure TfrmVIP.Panel2783MouseDown(Sender: TObject; Button: TMouseButton;
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
