unit UseQueueUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TfrmUseQueue = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblKeyNumber: TLabel;
    lblCustomerName: TLabel;
    lblStartTme: TLabel;
    Label17: TLabel;
    lblReceptionID: TLabel;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    btnSearch: TBitBtn;
    edtKeyNumber: TEdit;
    QReception: TADOQuery;
    QChechQueue: TADOQuery;
    QServiceProviders: TADOQuery;
    QQueue: TADOQuery;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    sp_take_service: TADOStoredProc;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuSpaceSlide: TMenuItem;
    mnuBoomrang: TMenuItem;
    mnuShuttel: TMenuItem;
    mnuTwister: TMenuItem;
    mnuKamikaz: TMenuItem;
    mnuLoop: TMenuItem;
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure clearForm();
    procedure takeService(sender: TObject);
    procedure mnuSpaceSlideClick(Sender: TObject);
    procedure mnuBoomrangClick(Sender: TObject);
    procedure mnuShuttelClick(Sender: TObject);
    procedure mnuTwisterClick(Sender: TObject);
    procedure mnuKamikazClick(Sender: TObject);
    procedure mnuLoopClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUseQueue: TfrmUseQueue;

implementation

uses DMUnit, CalculatUnit, QueueTVUnit;

{$R *.dfm}

procedure TfrmUseQueue.clearForm();
begin
    btn1.Enabled := true;
    btn2.Enabled := true;
    btn3.Enabled := true;
    btn4.Enabled := true;
    btn5.Enabled := true;
    btn6.Enabled := true;
    btn1.Caption := '';
    btn2.Caption := '';
    btn3.Caption := '';
    btn4.Caption := '';
    btn5.Caption := '';
    btn6.Caption := '';
    btn1.Tag := 0;
    btn2.Tag := 0;
    btn3.Tag := 0;
    btn4.Tag := 0;
    btn5.Tag := 0;
    btn6.Tag := 0;
    edtKeyNumber.Clear;
    edtKeyNumber.SetFocus;

end;

procedure TfrmUseQueue.btnSearchClick(Sender: TObject);
begin
if edtKeyNumber.Text='' then Exit;
    QServiceProviders.Open;
    btn1.Enabled := QServiceProviders['is_active'];
    QServiceProviders.Next;
    btn2.Enabled := QServiceProviders['is_active'];
    QServiceProviders.Next;
    btn3.Enabled := QServiceProviders['is_active'];
    QServiceProviders.Close;

    QReception.Close;
    QReception.Parameters.ParamByName('KeyNumber').Value:=edtKeyNumber.Text;
    QReception.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QReception.Open;
    if QReception['ReceptionID']<>Null then
    begin
        if QReception['Active'] then
        begin
            QQueue.Close;
            QQueue.Parameters.ParamByName('ReceptionID').Value := QReception['ReceptionID'];
            QQueue.Open;
            lblReceptionID.Caption:=IntToStr(QReception['ReceptionID']);
            lblKeyNumber.Caption:=IntToStr(QReception['KeyNumber']);
            lblCustomerName.Caption:=QReception['CustomerName'];
            lblStartTme.Caption:=QReception['StartTime'];
        end
        else
            ShowMessage('«Ì‰ ‘„«—Â ﬂ·Ìœ »Â ÿÊ— „Êﬁ  €Ì— ›⁄«· ‘œÂ «”  ·ÿ›« »Â „œÌ—Ì  œ«Œ·Ì „—«Ã⁄Â ‘Êœ');
    end
    else
        ShowMessage('«Ì‰ ‘„«—Â ﬂ·Ìœ „⁄ »— ‰„Ì »«‘œ');
    clearForm;
    while not QQueue.eof do
    begin
        TButton(FindComponent('btn'+IntToStr(QQueue['service_provider_id']))).Caption := QQueue['diff'];
        TButton(FindComponent('btn'+IntToStr(QQueue['service_provider_id']))).tag := QQueue['id'];
        QQueue.Next;
    end;
end;

procedure TfrmUseQueue.FormCreate(Sender: TObject);
begin
    QServiceProviders.Open;
    btn1.Caption := QServiceProviders['title'];

    QServiceProviders.Next;
    btn2.Caption := QServiceProviders['title'];

    QServiceProviders.Next;
    btn3.Caption := QServiceProviders['title'];

    QServiceProviders.Next;
    btn4.Caption := QServiceProviders['title'];

    QServiceProviders.Next;
    btn5.Caption := QServiceProviders['title'];

    QServiceProviders.Next;
    btn6.Caption := QServiceProviders['title'];
    
    QServiceProviders.Close;
end;
procedure TfrmUseQueue.takeService(Sender: TObject);
begin
    if TButton(sender).Tag<>0 then
    begin
      sp_take_service.Close;
      sp_take_service.Parameters.ParamByName('@queue_id').Value := TButton(sender).Tag;
      sp_take_service.ExecProc;
      clearForm;
    end
end;

procedure TfrmUseQueue.mnuSpaceSlideClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 1;
    frmQueueTV.lblTitle.Caption := '”—”—Â ç«·Â ›÷«ÌÌ';
    frmQueueTV.Show;
end;

procedure TfrmUseQueue.mnuBoomrangClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 2;
    frmQueueTV.lblTitle.Caption := '”—”—Â »Ê„—‰ê';
    frmQueueTV.Show;
end;

procedure TfrmUseQueue.mnuShuttelClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 3;
    frmQueueTV.lblTitle.Caption := '”—”—Â ”›Ì‰Â';
    frmQueueTV.Show;
end;

procedure TfrmUseQueue.mnuTwisterClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 4;
    frmQueueTV.lblTitle.Caption := '”—”—Â  ÊÌ” —';
    frmQueueTV.Show;
end;

procedure TfrmUseQueue.mnuKamikazClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 5;
    frmQueueTV.lblTitle.Caption := '”—”—Â ò«„Ìò«“';
    frmQueueTV.Show;
end;

procedure TfrmUseQueue.mnuLoopClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 6;
    frmQueueTV.lblTitle.Caption := '”—”—Â ·ÊÅ';
    frmQueueTV.Show;
end;

end.
