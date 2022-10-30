unit EnterQueueUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ExtCtrls, Menus;

type
  TfrmEnterQueue = class(TForm)
    QReception: TADOQuery;
    QServiceProviders: TADOQuery;
    sp_queue_insert: TADOStoredProc;
    DBGrid1: TDBGrid;
    QQueue: TADOQuery;
    dsQueue: TDataSource;
    Panel1: TPanel;
    btn3: TButton;
    btn2: TButton;
    btn1: TButton;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    btnSearch: TBitBtn;
    edtKeyNumber: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblKeyNumber: TLabel;
    lblCustomerName: TLabel;
    lblStartTme: TLabel;
    Label17: TLabel;
    lblReceptionID: TLabel;
    QcheckActive: TADOQuery;
    cbx1: TComboBox;
    Label1: TLabel;
    cbx2: TComboBox;
    cbx3: TComboBox;
    btn4: TButton;
    cbx4: TComboBox;
    btn6: TButton;
    btn5: TButton;
    cbx5: TComboBox;
    cbx6: TComboBox;
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
    procedure btn1Click(Sender: TObject);
    procedure enter_queue(service_provider_id :integer; delayTime :integer);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
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
  frmEnterQueue: TfrmEnterQueue;

implementation

uses CalculatUnit, DMUnit, QueueTVUnit, Types;

{$R *.dfm}

procedure TfrmEnterQueue.btnSearchClick(Sender: TObject);
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
end;

procedure TfrmEnterQueue.FormCreate(Sender: TObject);
begin
    QServiceProviders.Open;
    btn1.Caption := QServiceProviders['title'];
    btn1.Tag := QServiceProviders['id'];
    QServiceProviders.Next;
    btn2.Caption := QServiceProviders['title'];
    btn2.Tag := QServiceProviders['id'];
    QServiceProviders.Next;
    btn3.Caption := QServiceProviders['title'];
    btn3.Tag := QServiceProviders['id'];
    QServiceProviders.Next;
    btn4.Caption := QServiceProviders['title'];
    btn4.Tag := QServiceProviders['id'];
    QServiceProviders.Next;
    btn5.Caption := QServiceProviders['title'];
    btn5.Tag := QServiceProviders['id'];
    QServiceProviders.Next;
    btn6.Caption := QServiceProviders['title'];
    btn6.Tag := QServiceProviders['id'];
    QServiceProviders.Close;
end;

procedure TfrmEnterQueue.enter_queue(service_provider_id :integer; delayTime :integer);
var estimate_wating_time : string;
begin
    
    sp_queue_insert.Close;
    sp_queue_insert.Parameters.ParamByName('@service_provider_id').Value:= service_provider_id;
    sp_queue_insert.Parameters.ParamByName('@delayTime').Value:= delayTime;
    sp_queue_insert.Parameters.ParamByName('@reception_id').Value:= lblReceptionID.Caption;
    sp_queue_insert.ExecProc;
    QQueue.Close;
    QQueue.Open;
    estimate_wating_time:=sp_queue_insert.Parameters.ParamByName('@estimate_waiting_time').Value;
    if estimate_wating_time = '00:00:00' then
    begin
        ShowMessage('Êﬁ  ﬁ»·Ì „ÌÂ„«‰ „Ê—œ ‰Ÿ— ›⁄«· „Ì »«‘œ');
    end;

end;

procedure TfrmEnterQueue.btn1Click(Sender: TObject);
begin
    if lblReceptionID.Caption <> '' then
        enter_queue(btn1.Tag, StrToIntDef(cbx1.Text, 0));
    cbx1.Text := '0';
end;

procedure TfrmEnterQueue.btn2Click(Sender: TObject);
begin
    if lblReceptionID.Caption <> '' then
        enter_queue(btn2.Tag, StrToIntDef(cbx2.Text, 0));

    cbx2.Text := '0';
end;

procedure TfrmEnterQueue.btn3Click(Sender: TObject);
begin
    if lblReceptionID.Caption <> '' then
        enter_queue(btn3.Tag, StrToIntDef(cbx3.Text, 0));

    cbx3.Text := '0';
end;

procedure TfrmEnterQueue.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
        If QQueue['state']=1 then
            DBGrid1.Canvas.Brush.Color:=clTeal
        else
          if QQueue['state']=2 then
            DBGrid1.Canvas.Brush.Color:=clYellow
          else
            DBGrid1.Canvas.Brush.Color:=clFuchsia;

        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmEnterQueue.btn4Click(Sender: TObject);
begin
if lblReceptionID.Caption <> '' then
        enter_queue(btn4.Tag, StrToIntDef(cbx4.Text, 0));

    cbx4.Text := '0';
end;

procedure TfrmEnterQueue.btn5Click(Sender: TObject);
begin
if lblReceptionID.Caption <> '' then
        enter_queue(btn5.Tag, StrToIntDef(cbx5.Text, 0));

    cbx5.Text := '0';
end;

procedure TfrmEnterQueue.btn6Click(Sender: TObject);
begin
if lblReceptionID.Caption <> '' then
        enter_queue(btn6.Tag, StrToIntDef(cbx6.Text, 0));

    cbx6.Text := '0';
end;

procedure TfrmEnterQueue.mnuSpaceSlideClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    if Screen.MonitorCount>1 then
    begin
        frmQueueTV.Top := Screen.Monitors[2].BoundsRect.Top;
        frmQueueTV.Left := Screen.Monitors[2].BoundsRect.Left;
    end;
    frmQueueTV.service_provider_id := 1;
    frmQueueTV.lblTitle.Caption := '”—”—Â ç«·Â ›÷«ÌÌ';
    frmQueueTV.Show;
end;

procedure TfrmEnterQueue.mnuBoomrangClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 2;
    frmQueueTV.lblTitle.Caption := '”—”—Â »Ê„—‰ê';
    frmQueueTV.Show;
end;

procedure TfrmEnterQueue.mnuShuttelClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 3;
    frmQueueTV.lblTitle.Caption := '”—”—Â ”›Ì‰Â';
    frmQueueTV.Show;
end;

procedure TfrmEnterQueue.mnuTwisterClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 4;
    frmQueueTV.lblTitle.Caption := '”—”—Â  ÊÌ” —';
    frmQueueTV.Show;
end;

procedure TfrmEnterQueue.mnuKamikazClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 5;
    frmQueueTV.lblTitle.Caption := '”—”—Â ò«„Ìò«“';
    frmQueueTV.Show;
end;

procedure TfrmEnterQueue.mnuLoopClick(Sender: TObject);
begin
    Application.CreateForm(TfrmQueueTV, frmQueueTV);
    frmQueueTV.service_provider_id := 6;
    frmQueueTV.lblTitle.Caption := '”—”—Â ·ÊÅ';
    frmQueueTV.Show;
end;

end.


