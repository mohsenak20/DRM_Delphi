unit MakedGoodsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DB, ADODB, ExtCtrls, Menus;

type
  TfrmMakedGoods = class(TForm)
    GroupBox1: TGroupBox;
    lblKalaName1: TLabel;
    maked: TLabel;
    lblOrder1: TLabel;
    UpDown1: TUpDown;
    Edit1: TEdit;
    btnGood1: TBitBtn;
    GroupBox2: TGroupBox;
    lblKalaName2: TLabel;
    Label2: TLabel;
    lblOrder2: TLabel;
    UpDown2: TUpDown;
    Edit2: TEdit;
    btnGood2: TBitBtn;
    GroupBox3: TGroupBox;
    lblKalaName3: TLabel;
    Label6: TLabel;
    lblOrder3: TLabel;
    UpDown3: TUpDown;
    Edit3: TEdit;
    btnGood3: TBitBtn;
    GroupBox4: TGroupBox;
    lblKalaName4: TLabel;
    Label9: TLabel;
    lblOrder4: TLabel;
    UpDown4: TUpDown;
    Edit4: TEdit;
    btnGood4: TBitBtn;
    GroupBox5: TGroupBox;
    lblKalaName5: TLabel;
    Label12: TLabel;
    lblOrder5: TLabel;
    UpDown5: TUpDown;
    Edit5: TEdit;
    btnGood5: TBitBtn;
    GroupBox6: TGroupBox;
    lblKalaName6: TLabel;
    Label15: TLabel;
    lblOrder6: TLabel;
    UpDown6: TUpDown;
    Edit6: TEdit;
    btnGood6: TBitBtn;
    GroupBox7: TGroupBox;
    lblKalaName7: TLabel;
    Label18: TLabel;
    lblOrder7: TLabel;
    UpDown7: TUpDown;
    Edit7: TEdit;
    btnGood7: TBitBtn;
    GroupBox8: TGroupBox;
    lblKalaName8: TLabel;
    Label21: TLabel;
    lblOrder8: TLabel;
    UpDown8: TUpDown;
    Edit8: TEdit;
    btnGood8: TBitBtn;
    GroupBox9: TGroupBox;
    lblKalaName9: TLabel;
    Label24: TLabel;
    lblOrder9: TLabel;
    UpDown9: TUpDown;
    Edit9: TEdit;
    btnGood9: TBitBtn;
    QGoods: TADOQuery;
    Timer1: TTimer;
    QUpdateGood: TADOQuery;
    GroupBox10: TGroupBox;
    lblKalaName10: TLabel;
    Label3: TLabel;
    lblOrder10: TLabel;
    UpDown10: TUpDown;
    Edit10: TEdit;
    btnGood10: TBitBtn;
    GroupBox11: TGroupBox;
    lblKalaName11: TLabel;
    Label7: TLabel;
    lblOrder11: TLabel;
    UpDown11: TUpDown;
    Edit11: TEdit;
    btnGood11: TBitBtn;
    GroupBox12: TGroupBox;
    lblKalaName12: TLabel;
    Label11: TLabel;
    lblOrder12: TLabel;
    UpDown12: TUpDown;
    Edit12: TEdit;
    btnGood12: TBitBtn;
    GroupBox13: TGroupBox;
    lblKalaName13: TLabel;
    Label16: TLabel;
    lblOrder13: TLabel;
    UpDown13: TUpDown;
    Edit13: TEdit;
    btnGood13: TBitBtn;
    GroupBox14: TGroupBox;
    lblKalaName14: TLabel;
    Label20: TLabel;
    lblOrder14: TLabel;
    UpDown14: TUpDown;
    Edit14: TEdit;
    btnGood14: TBitBtn;
    GroupBox15: TGroupBox;
    lblKalaName15: TLabel;
    Label25: TLabel;
    lblOrder15: TLabel;
    UpDown15: TUpDown;
    Edit15: TEdit;
    btnGood15: TBitBtn;
    GroupBox16: TGroupBox;
    lblKalaName16: TLabel;
    Label28: TLabel;
    lblOrder16: TLabel;
    UpDown16: TUpDown;
    Edit16: TEdit;
    btnGood16: TBitBtn;
    QUpdateForm: TADOQuery;
    QClearForm: TADOQuery;
    MainMenu1: TMainMenu;
    vkni1: TMenuItem;
    mnuStart: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    Procedure Update(NewMake :integer; GoodID : Integer);
    Procedure UpdateForm(ReceptionDate : string);
    procedure btnGood1Click(Sender: TObject);
    procedure btnGood2Click(Sender: TObject);
    procedure btnGood3Click(Sender: TObject);
    procedure btnGood4Click(Sender: TObject);
    procedure btnGood5Click(Sender: TObject);
    procedure btnGood6Click(Sender: TObject);
    procedure btnGood7Click(Sender: TObject);
    procedure btnGood8Click(Sender: TObject);
    procedure btnGood9Click(Sender: TObject);
    procedure btnGood10Click(Sender: TObject);
    procedure btnGood11Click(Sender: TObject);
    procedure btnGood12Click(Sender: TObject);
    procedure btnGood13Click(Sender: TObject);
    procedure btnGood14Click(Sender: TObject);
    procedure btnGood15Click(Sender: TObject);
    procedure btnGood16Click(Sender: TObject);
    procedure mnuStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMakedGoods: TfrmMakedGoods;

implementation

uses DMUnit, CalculatUnit, ShareUnit;

{$R *.dfm}

procedure TfrmMakedGoods.Timer1Timer(Sender: TObject);
var
  i : integer;
begin
    QGoods.Close;
    QGoods.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QGoods.Open;
    for i:=1 to 16 do
    begin
        if not QGoods.Eof then
        begin
            TLabel(FindComponent('lblKalaName'+IntToStr(i))).Caption := QGoods['KalaName'];
            TLabel(FindComponent('lblKalaName'+IntToStr(i))).Tag := QGoods['KalaID'];
            QGoods.Next;
        end
        else
            Exit;
    end;
    UpdateForm(CurrentDate);
end;
Procedure TfrmMakedGoods.Update(NewMake :integer; GoodID :integer);
begin
    QUpdateGood.Close;
    QUpdateGood.Parameters.ParamByName('NewMake').Value := NewMake;
    QUpdateGood.Parameters.ParamByName('GoodID').Value := GoodID;
    QUpdateGood.Open;
end;

procedure TfrmMakedGoods.btnGood1Click(Sender: TObject);
begin
    Update(StrToInt(Edit1.Text), lblKalaName1.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder1.Caption := IntToStr(QUpdateGood['Mod']);
    Edit1.Text := '0';
end;

procedure TfrmMakedGoods.btnGood2Click(Sender: TObject);
begin
    Update(StrToInt(Edit2.Text), lblKalaName2.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder2.Caption := IntToStr(QUpdateGood['Mod']);
    Edit2.Text := '0';
end;

procedure TfrmMakedGoods.btnGood3Click(Sender: TObject);
begin
    Update(StrToInt(Edit3.Text), lblKalaName3.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder3.Caption := IntToStr(QUpdateGood['Mod']);
    Edit3.Text := '0';
end;

procedure TfrmMakedGoods.btnGood4Click(Sender: TObject);
begin
    Update(StrToInt(Edit4.Text), lblKalaName4.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder4.Caption := IntToStr(QUpdateGood['Mod']);
    Edit4.Text := '0';
end;

procedure TfrmMakedGoods.btnGood5Click(Sender: TObject);
begin
    Update(StrToInt(Edit5.Text), lblKalaName5.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder5.Caption := IntToStr(QUpdateGood['Mod']);
    Edit5.Text := '0';
end;

procedure TfrmMakedGoods.btnGood6Click(Sender: TObject);
begin
    Update(StrToInt(Edit6.Text), lblKalaName6.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder6.Caption := IntToStr(QUpdateGood['Mod']);
    Edit6.Text := '0';
end;

procedure TfrmMakedGoods.btnGood7Click(Sender: TObject);
begin
    Update(StrToInt(Edit7.Text), lblKalaName7.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder7.Caption := IntToStr(QUpdateGood['Mod']);
    Edit7.Text := '0';
end;

procedure TfrmMakedGoods.btnGood8Click(Sender: TObject);
begin
    Update(StrToInt(Edit8.Text), lblKalaName8.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder8.Caption := IntToStr(QUpdateGood['Mod']);
    Edit8.Text := '0';
end;

procedure TfrmMakedGoods.btnGood9Click(Sender: TObject);
begin
    Update(StrToInt(Edit9.Text), lblKalaName9.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder9.Caption := IntToStr(QUpdateGood['Mod']);
    Edit9.Text := '0';
end;


Procedure TfrmMakedGoods.UpdateForm(ReceptionDate : string);
var
i : integer;
begin
    QUpdateForm.Close;
    QUpdateForm.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QUpdateForm.Open;
    for i:=1 to 16 do
    begin
        if QUpdateForm['Mod'] <> null then
        begin
            TLabel(FindComponent('lblOrder'+IntToStr(i))).Caption := IntToStr(QUpdateForm['Mod']);
            QUpdateForm.Next;
        end;
    end;
end;

procedure TfrmMakedGoods.btnGood10Click(Sender: TObject);
begin
    Update(StrToInt(Edit10.Text), lblKalaName10.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder10.Caption := IntToStr(QUpdateGood['Mod']);
    Edit10.Text := '0';
end;

procedure TfrmMakedGoods.btnGood11Click(Sender: TObject);
begin
    Update(StrToInt(Edit11.Text), lblKalaName11.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder11.Caption := IntToStr(QUpdateGood['Mod']);
    Edit11.Text := '0';
end;


procedure TfrmMakedGoods.btnGood12Click(Sender: TObject);
begin
    Update(StrToInt(Edit12.Text), lblKalaName12.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder12.Caption := IntToStr(QUpdateGood['Mod']);
    Edit12.Text := '0';
end;

procedure TfrmMakedGoods.btnGood13Click(Sender: TObject);
begin
    Update(StrToInt(Edit13.Text), lblKalaName13.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder13.Caption := IntToStr(QUpdateGood['Mod']);
    Edit13.Text := '0';
end;

procedure TfrmMakedGoods.btnGood14Click(Sender: TObject);
begin
    Update(StrToInt(Edit14.Text), lblKalaName14.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder14.Caption := IntToStr(QUpdateGood['Mod']);
    Edit14.Text := '0';
end;

procedure TfrmMakedGoods.btnGood15Click(Sender: TObject);
begin
    Update(StrToInt(Edit15.Text), lblKalaName15.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder15.Caption := IntToStr(QUpdateGood['Mod']);
    Edit15.Text := '0';
end;

procedure TfrmMakedGoods.btnGood16Click(Sender: TObject);
begin
    Update(StrToInt(Edit16.Text), lblKalaName16.Tag);
    if QUpdateGood['Mod'] <> null then
        lblOrder16.Caption := IntToStr(QUpdateGood['Mod']);
    Edit16.Text := '0';
end;

procedure TfrmMakedGoods.mnuStartClick(Sender: TObject);
begin
    QClearForm.Close;
    QClearForm.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QClearForm.ExecSQL;
    UpdateForm(CurrentDate);
end;

end.
