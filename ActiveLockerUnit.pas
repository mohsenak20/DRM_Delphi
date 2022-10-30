unit ActiveLockerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfrmActiveLocker = class(TForm)
    edtStartLocker: TEdit;
    Label12: TLabel;
    Label1: TLabel;
    edtEndLocker: TEdit;
    bbtnAccept: TBitBtn;
    QActiveLocker: TADOQuery;
    rbActive: TRadioButton;
    RadioButton2: TRadioButton;
    procedure bbtnAcceptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbActiveClick(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    status :string ;

  end;
var
  frmActiveLocker: TfrmActiveLocker;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmActiveLocker.bbtnAcceptClick(Sender: TObject);
begin
    if MessageBox(Self.Handle,'����� ����� ��� ����� ���Ͽ','���� ���� �����',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo  then Exit;
    QActiveLocker.Close;
    if rbActive.Checked then
        QActiveLocker.Parameters.ParamByName('Type').Value:=1
    else
        QActiveLocker.Parameters.ParamByName('Type').Value:=0;
    QActiveLocker.Parameters.ParamByName('StartLocker').Value:=edtStartLocker.Text;
    QActiveLocker.Parameters.ParamByName('EndLocker').Value:=edtEndLocker.Text;
    QActiveLocker.ExecSQL;
    ShowMessage('������ '+status+' �� ������ ����� �����');
    Close;
end;

procedure TfrmActiveLocker.FormCreate(Sender: TObject);
begin
    status := '���� ����';
end;

procedure TfrmActiveLocker.rbActiveClick(Sender: TObject);
begin
    status := '���� ����';
end;

procedure TfrmActiveLocker.RadioButton2Click(Sender: TObject);
begin
    status := '��� ���� ����';
end;

end.
