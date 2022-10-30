unit GroupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ADODB, DB, StdCtrls, Buttons;

type
  TfrmGroup = class(TForm)
    Panel2631: TPanel;
    Panel2633: TPanel;
    Panel2635: TPanel;
    Panel2641: TPanel;
    Panel2637: TPanel;
    Panel2639: TPanel;
    Panel2643: TPanel;
    Panel2645: TPanel;
    Panel2647: TPanel;
    Panel2653: TPanel;
    Panel2649: TPanel;
    Panel2651: TPanel;
    Panel2655: TPanel;
    Panel2657: TPanel;
    Panel2659: TPanel;
    Panel2661: TPanel;
    Panel2663: TPanel;
    Panel2632: TPanel;
    Panel2634: TPanel;
    Panel2636: TPanel;
    Panel2642: TPanel;
    Panel2638: TPanel;
    Panel2640: TPanel;
    Panel2644: TPanel;
    Panel2648: TPanel;
    Panel2654: TPanel;
    Panel2650: TPanel;
    Panel2652: TPanel;
    Panel2656: TPanel;
    Panel2658: TPanel;
    Panel2660: TPanel;
    Panel2662: TPanel;
    Panel2664: TPanel;
    Panel2734: TPanel;
    Panel2732: TPanel;
    Panel2730: TPanel;
    Panel2724: TPanel;
    Panel2728: TPanel;
    Panel2726: TPanel;
    Panel2722: TPanel;
    Panel2720: TPanel;
    Panel2718: TPanel;
    Panel2712: TPanel;
    Panel2716: TPanel;
    Panel2714: TPanel;
    Panel2708: TPanel;
    Panel2706: TPanel;
    Panel2700: TPanel;
    Panel2704: TPanel;
    Panel2702: TPanel;
    Panel2698: TPanel;
    Panel2696: TPanel;
    Panel2694: TPanel;
    Panel2733: TPanel;
    Panel2731: TPanel;
    Panel2729: TPanel;
    Panel2723: TPanel;
    Panel2727: TPanel;
    Panel2725: TPanel;
    Panel2721: TPanel;
    Panel2719: TPanel;
    Panel2717: TPanel;
    Panel2711: TPanel;
    Panel2715: TPanel;
    Panel2713: TPanel;
    Panel2709: TPanel;
    Panel2707: TPanel;
    Panel2705: TPanel;
    Panel2699: TPanel;
    Panel2703: TPanel;
    Panel2701: TPanel;
    Panel2697: TPanel;
    Panel2695: TPanel;
    Panel2693: TPanel;
    Panel2690: TPanel;
    Panel2689: TPanel;
    Panel2692: TPanel;
    Panel2691: TPanel;
    Panel2686: TPanel;
    Panel2685: TPanel;
    Panel2688: TPanel;
    Panel2687: TPanel;
    Panel2682: TPanel;
    Panel2681: TPanel;
    Panel2684: TPanel;
    Panel2683: TPanel;
    Panel2678: TPanel;
    Panel2677: TPanel;
    Panel2680: TPanel;
    Panel2679: TPanel;
    Panel2674: TPanel;
    Panel2673: TPanel;
    Panel2676: TPanel;
    Panel2675: TPanel;
    Panel2670: TPanel;
    Panel2669: TPanel;
    Panel2672: TPanel;
    Panel2671: TPanel;
    Panel2665: TPanel;
    Panel2667: TPanel;
    Panel2666: TPanel;
    Panel2668: TPanel;
    Panel2781: TPanel;
    Panel2779: TPanel;
    Panel2777: TPanel;
    Panel2771: TPanel;
    Panel2775: TPanel;
    Panel2773: TPanel;
    Panel2769: TPanel;
    Panel2767: TPanel;
    Panel2765: TPanel;
    Panel2759: TPanel;
    Panel2763: TPanel;
    Panel2761: TPanel;
    Panel2782: TPanel;
    Panel2780: TPanel;
    Panel2778: TPanel;
    Panel2772: TPanel;
    Panel2776: TPanel;
    Panel2774: TPanel;
    Panel2770: TPanel;
    Panel2768: TPanel;
    Panel2766: TPanel;
    Panel2760: TPanel;
    Panel2764: TPanel;
    Panel2762: TPanel;
    Panel2735: TPanel;
    Panel2737: TPanel;
    Panel2739: TPanel;
    Panel2745: TPanel;
    Panel2741: TPanel;
    Panel2743: TPanel;
    Panel2747: TPanel;
    Panel2749: TPanel;
    Panel2751: TPanel;
    Panel2757: TPanel;
    Panel2753: TPanel;
    Panel2755: TPanel;
    Panel2736: TPanel;
    Panel2738: TPanel;
    Panel2740: TPanel;
    Panel2746: TPanel;
    Panel2742: TPanel;
    Panel2744: TPanel;
    Panel2748: TPanel;
    Panel2750: TPanel;
    Panel2752: TPanel;
    Panel2758: TPanel;
    Panel2754: TPanel;
    Panel2756: TPanel;
    Panel2710: TPanel;
    QLockerStatus: TADOQuery;
    QReception: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
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
    QSummery: TADOQuery;
    Panel2646: TPanel;
    QLocker: TADOQuery;
    Timer: TTimer;
    procedure RefreshLocker();
    procedure FormCreate(Sender: TObject);
    procedure btnMonitoringStartClick(Sender: TObject);
    procedure btnGeneralReportClick(Sender: TObject);
    procedure Panel2631MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroup: TfrmGroup;

implementation
uses SabegheMoshtariUnit, DMUnit, GeneralReportUnit, CalculatUnit,
  ViewReceptionUnit, ManagerUnit;

{$R *.dfm}

procedure TfrmGroup.RefreshLocker();
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
for i :=2631  to 2782 do
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



for i :=2631  to 2782 do
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

procedure TfrmGroup.Panel2631MouseDown(Sender: TObject;
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

procedure TfrmGroup.FormCreate(Sender: TObject);
var
i : integer;
begin
QLocker.Close;
QLocker.Open;

for i:= 2631 to 2782 do
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

procedure TfrmGroup.btnMonitoringStartClick(Sender: TObject);
begin
    RefreshLocker;
end;

procedure TfrmGroup.btnGeneralReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGeneralReport, frmGeneralReport);
    frmGeneralReport.ShowModal;
    FreeAndNil(frmGeneralReport);
end;



end.
