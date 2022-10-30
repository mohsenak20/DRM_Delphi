unit QueueTVUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ADODB, DB, StdCtrls;

type
  TfrmQueueTV = class(TForm)
    q6: TPanel;
    l6: TLabel;
    t6: TLabel;
    q5: TPanel;
    l5: TLabel;
    t5: TLabel;
    q4: TPanel;
    l4: TLabel;
    t4: TLabel;
    q3: TPanel;
    l3: TLabel;
    t3: TLabel;
    q2: TPanel;
    l2: TLabel;
    t2: TLabel;
    q1: TPanel;
    l1: TLabel;
    t1: TLabel;
    q12: TPanel;
    l12: TLabel;
    t12: TLabel;
    q11: TPanel;
    l11: TLabel;
    t11: TLabel;
    q10: TPanel;
    l10: TLabel;
    t10: TLabel;
    q9: TPanel;
    l9: TLabel;
    t9: TLabel;
    q8: TPanel;
    l8: TLabel;
    t8: TLabel;
    q7: TPanel;
    l7: TLabel;
    t7: TLabel;
    q18: TPanel;
    l18: TLabel;
    t18: TLabel;
    q17: TPanel;
    l17: TLabel;
    t17: TLabel;
    q16: TPanel;
    l16: TLabel;
    t16: TLabel;
    q15: TPanel;
    l15: TLabel;
    t15: TLabel;
    q14: TPanel;
    l14: TLabel;
    t14: TLabel;
    q13: TPanel;
    l13: TLabel;
    t13: TLabel;
    q24: TPanel;
    l24: TLabel;
    t24: TLabel;
    q23: TPanel;
    l23: TLabel;
    t23: TLabel;
    q22: TPanel;
    l22: TLabel;
    t22: TLabel;
    q21: TPanel;
    l21: TLabel;
    t21: TLabel;
    q20: TPanel;
    l20: TLabel;
    t20: TLabel;
    q19: TPanel;
    l19: TLabel;
    t19: TLabel;
    sp_take_service: TADOStoredProc;
    QQueues: TADOQuery;
    sp_gotoReserve: TADOStoredProc;
    Timer: TTimer;
    lblTitle: TLabel;
    procedure clearForm();
    procedure fillForm();
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    service_provider_id :integer;
  end;

var
  frmQueueTV: TfrmQueueTV;

implementation

uses CalculatUnit;

{$R *.dfm}

procedure TfrmQueueTV.clearForm();
var
i : integer;
begin
    for i :=1  to 24 do
    begin
        TLabel(FindComponent('l'+IntToStr(i))).Caption := '';
        TLabel(FindComponent('t'+IntToStr(i))).Caption := '';
    end;
end;

procedure TfrmQueueTV.fillForm();
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
            QQueues.Next
        end
        else
            Exit;
    end;
end;

procedure TfrmQueueTV.TimerTimer(Sender: TObject);
begin
    clearForm;
    fillForm;
end;

procedure TfrmQueueTV.FormCreate(Sender: TObject);
begin
    clearForm;
    fillForm;
end;

end.
