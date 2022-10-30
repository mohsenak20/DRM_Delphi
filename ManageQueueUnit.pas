unit ManageQueueUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB;

type
  TfrmManageQueue = class(TForm)
    q6: TPanel;
    q5: TPanel;
    q4: TPanel;
    q3: TPanel;
    q2: TPanel;
    q1: TPanel;
    r6: TButton;
    r5: TButton;
    r4: TButton;
    r3: TButton;
    r2: TButton;
    r1: TButton;
    q12: TPanel;
    r12: TButton;
    q11: TPanel;
    r11: TButton;
    q10: TPanel;
    r10: TButton;
    q9: TPanel;
    r9: TButton;
    q8: TPanel;
    r8: TButton;
    q7: TPanel;
    r7: TButton;
    q18: TPanel;
    r18: TButton;
    q17: TPanel;
    r17: TButton;
    q16: TPanel;
    r16: TButton;
    q15: TPanel;
    r15: TButton;
    q14: TPanel;
    r14: TButton;
    q13: TPanel;
    r13: TButton;
    q24: TPanel;
    r24: TButton;
    q23: TPanel;
    r23: TButton;
    q22: TPanel;
    r22: TButton;
    q21: TPanel;
    r21: TButton;
    q20: TPanel;
    r20: TButton;
    q19: TPanel;
    r19: TButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Panel25: TPanel;
    Button25: TButton;
    l1: TLabel;
    t1: TLabel;
    l2: TLabel;
    t2: TLabel;
    l3: TLabel;
    t3: TLabel;
    l4: TLabel;
    t4: TLabel;
    l5: TLabel;
    t5: TLabel;
    l6: TLabel;
    t6: TLabel;
    l7: TLabel;
    t7: TLabel;
    l8: TLabel;
    t8: TLabel;
    l9: TLabel;
    t9: TLabel;
    l10: TLabel;
    t10: TLabel;
    l11: TLabel;
    t11: TLabel;
    l12: TLabel;
    t12: TLabel;
    l18: TLabel;
    t18: TLabel;
    l17: TLabel;
    t17: TLabel;
    l16: TLabel;
    t16: TLabel;
    l15: TLabel;
    t15: TLabel;
    l14: TLabel;
    t14: TLabel;
    l13: TLabel;
    t13: TLabel;
    l19: TLabel;
    t19: TLabel;
    l20: TLabel;
    t20: TLabel;
    l21: TLabel;
    t21: TLabel;
    l22: TLabel;
    t22: TLabel;
    l23: TLabel;
    t23: TLabel;
    l24: TLabel;
    t24: TLabel;
    sp_take_service: TADOStoredProc;
    QQueues: TADOQuery;
    sp_gotoReserve: TADOStoredProc;
    Timer: TTimer;
    Button1: TButton;
    procedure Button25Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure clearForm();
    procedure takeService(sender: TObject);
    procedure fillForm();
    procedure gotoReserve(sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    service_provider_id :integer;
  public
    { Public declarations }

  end;

var
  frmManageQueue: TfrmManageQueue;

implementation

uses ReserveQueueListUnit, DMUnit, CalculatUnit, ActiveServiceProviderUnit;

{$R *.dfm}

procedure TfrmManageQueue.Button25Click(Sender: TObject);
begin
    Application.CreateForm(TfrmReserveQueueList, frmReserveQueueList);
    frmReserveQueueList.ShowModal;
    FreeAndNil(frmReserveQueueList);
end;

procedure TfrmManageQueue.FormCreate(Sender: TObject);
begin
    Caption := '”Ì” „ ‰Ê»  œÂÌ '+UserInfo.UserName;
    Case UserInfo.UserID of
        403 :
        begin

            service_provider_id := 1;
        end;
        404 :
        begin
            service_provider_id := 2;

        end;
        405 :
        begin
            service_provider_id := 3;

        end;
    end;
    clearForm;
    fillForm;
end;

procedure TfrmManageQueue.clearForm();
var
i : integer;
begin
    for i :=1  to 24 do
    begin
        TLabel(FindComponent('l'+IntToStr(i))).Caption := '';
        TLabel(FindComponent('t'+IntToStr(i))).Caption := '';
    end;
end;

procedure TfrmManageQueue.takeService(Sender: TObject);
begin
    sp_take_service.Close;
    sp_take_service.Parameters.ParamByName('@queue_id').Value := TPanel(sender).Tag;
    sp_take_service.ExecProc;
    clearForm;
    fillForm;
end;

procedure TfrmManageQueue.fillForm();
var
  i :integer;
begin
    QQueues.Close;
    QQueues.Parameters.ParamByName('ReceptionDate').Value := CurrentDate;
    QQueues.Parameters.ParamByName('service_provider_id').Value := service_provider_id;
    QQueues.Open;
    for i :=1 to 24 do
    begin
        if not QQueues.eof then
        begin
            TPanel(FindComponent('q'+IntToStr(i))).tag := QQueues['id'];
            TLabel(FindComponent('l'+IntToStr(i))).Caption := QQueues['ClosedID'];
            TLabel(FindComponent('t'+IntToStr(i))).Caption := QQueues['estimate_waiting_time'];
            TButton(FindComponent('r'+IntToStr(i))).tag := QQueues['id'];
            QQueues.Next
        end
        else
            Exit;
    end;
end;

procedure TfrmManageQueue.gotoReserve(sender: TObject);
begin
    sp_gotoReserve.Close;
    sp_gotoReserve.Parameters.ParamByName('@queue_id').Value := TPanel(sender).Tag;
    sp_gotoReserve.ExecProc;
    clearForm;
    fillForm;
end;


procedure TfrmManageQueue.TimerTimer(Sender: TObject);
begin
    clearForm;
    fillForm;
end;

procedure TfrmManageQueue.Button1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmActiveServiceProvider, frmActiveServiceProvider);
    frmActiveServiceProvider.ShowModal;
    FreeAndNil(frmActiveServiceProvider);
end;

end.
