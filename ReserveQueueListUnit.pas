unit ReserveQueueListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ADODB, DB;

type
  TfrmReserveQueueList = class(TForm)
    q6: TPanel;
    q5: TPanel;
    q4: TPanel;
    q3: TPanel;
    q2: TPanel;
    q1: TPanel;
    e6: TButton;
    e5: TButton;
    e4: TButton;
    e3: TButton;
    e2: TButton;
    e1: TButton;
    q12: TPanel;
    e12: TButton;
    q11: TPanel;
    e11: TButton;
    q10: TPanel;
    e10: TButton;
    q9: TPanel;
    e9: TButton;
    q8: TPanel;
    e8: TButton;
    q7: TPanel;
    e7: TButton;
    q18: TPanel;
    e18: TButton;
    q17: TPanel;
    e17: TButton;
    q16: TPanel;
    e16: TButton;
    q15: TPanel;
    e15: TButton;
    q14: TPanel;
    e14: TButton;
    q13: TPanel;
    e13: TButton;
    q24: TPanel;
    e24: TButton;
    q23: TPanel;
    e23: TButton;
    q22: TPanel;
    e22: TButton;
    q21: TPanel;
    e21: TButton;
    q20: TPanel;
    e20: TButton;
    q19: TPanel;
    e19: TButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Panel25: TPanel;
    btnClose: TButton;
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
    l13: TLabel;
    t13: TLabel;
    l14: TLabel;
    t14: TLabel;
    l15: TLabel;
    t15: TLabel;
    l16: TLabel;
    t16: TLabel;
    l17: TLabel;
    t17: TLabel;
    l18: TLabel;
    t18: TLabel;
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
    sp_expireQueue: TADOStoredProc;
    QQueues: TADOQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure clearForm();
    procedure takeService(sender: TObject);
    procedure fillForm();
    procedure expireQueue(sender: TObject);
  private
    { Private declarations }
      service_provider_id :integer;
  public
    { Public declarations }
  end;


var
  frmReserveQueueList: TfrmReserveQueueList;

implementation

uses CalculatUnit;

{$R *.dfm}

procedure TfrmReserveQueueList.btnCloseClick(Sender: TObject);
begin
    Close;
end;


procedure TfrmReserveQueueList.FormCreate(Sender: TObject);
begin
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

procedure TfrmReserveQueueList.clearForm();
var
i : integer;
begin
    for i :=1  to 24 do
    begin
        TLabel(FindComponent('l'+IntToStr(i))).Caption := '';
        TLabel(FindComponent('t'+IntToStr(i))).Caption := '';
    end;
end;

procedure TfrmReserveQueueList.takeService(Sender: TObject);
begin
    sp_take_service.Close;
    sp_take_service.Parameters.ParamByName('@queue_id').Value := TPanel(sender).Tag;
    sp_take_service.ExecProc;
    clearForm;
    fillForm;
end;

procedure TfrmReserveQueueList.fillForm();
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
            TButton(FindComponent('e'+IntToStr(i))).tag := QQueues['id'];
            QQueues.Next
        end
        else
            Exit;
    end;
end;

procedure TfrmReserveQueueList.expireQueue(sender: TObject);
begin
    sp_expireQueue.Close;
    sp_expireQueue.Parameters.ParamByName('@queue_id').Value := TButton(sender).Tag;
    sp_expireQueue.ExecProc;
    clearForm;
    fillForm;
end;



end.
