unit SendSMSUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Sockets, Adodb, ExtCtrls;

type
  TfrmSendSMS = class(TForm)
    BtnSend: TBitBtn;
    BtnReturn: TBitBtn;
    TcpClient1: TTcpClient;
    Label1: TLabel;
    Label2: TLabel;
    lblServerName: TLabel;
    lblServerPort: TLabel;
    Label5: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    rbSMSSlides: TRadioButton;
    rbSMSOrdinary: TRadioButton;
    GroupBox1: TGroupBox;
    rb5: TRadioButton;
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSendSMS: TfrmSendSMS;

implementation

uses CalculatUnit, DMUnit;

{$R *.dfm}

procedure TfrmSendSMS.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSendSMS.BtnSendClick(Sender: TObject);
var
  I, smsType: Integer;
  Number : string;
begin
  TcpClient1.RemoteHost := lblServerName.Caption;
  TcpClient1.RemotePort := lblServerPort.Caption;
  try
    if TcpClient1.Connect then
    begin
      if rb1.Checked then
          Number := rb1.Caption;

      if rb2.Checked then
                Number := rb2.Caption;

      if rb3.Checked then
                Number := rb3.Caption;

      if rb4.Checked then
                Number := rb4.Caption;

      if  rb5.Checked then
                Number := rb5.Caption;


      if rbSMSOrdinary.Checked then
          smsType := 1
      else
          smsType := 2;
      TcpClient1.Sendln(Number+'-'+CurrentDate+','+IntToStr(smsType));
    end;
  finally
    TcpClient1.Disconnect;
  end;
  ShowMessage('sms „Ê—œ ‰Ÿ— «—”«· ê—œÌœ');
end;
procedure TfrmSendSMS.FormCreate(Sender: TObject);
var
  QServerInfo : TADOQuery;
begin
  QServerInfo:=TADOQuery.Create(nil);
  QServerInfo.Connection := DM.ADOConnection;
  QServerInfo.SQL.Text := 'select SMS_Server, SMS_Server_Port from TParameter';
  QServerInfo.Open;
  if QServerInfo['SMS_Server']<>null then
      lblServerName.Caption := QServerInfo['SMS_Server']
  else
      lblServerName.Caption := '';

  if QServerInfo['SMS_Server_Port']<>null then
      lblServerPort.Caption := QServerInfo['SMS_Server_Port']
  else
      lblServerPort.Caption := '';



end;

end.
