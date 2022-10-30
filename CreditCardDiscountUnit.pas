unit CreditCardDiscountUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, Mask,
  ExtCtrls, ActnList;

type
  TfrmCreditCard_Discount = class(TForm)
    Panel1: TPanel;
    Label14: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtStartDate: TMaskEdit;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    BBtnAccept: TBitBtn;
    rbActive: TRadioButton;
    rbNotActive: TRadioButton;
    RadioButton3: TRadioButton;
    edtEndDate: TMaskEdit;
    edtCreditGroupID: TEdit;
    edtCreditGroupTitle: TEdit;
    btnCreditGroup: TBitBtn;
    edtCard: TEdit;
    edtName: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    lblSum: TLabel;
    lblCount: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    DBCheckBox1: TDBCheckBox;
    QCharge: TADOQuery;
    dsCharge: TDataSource;
    BtnActive: TBitBtn;
    QActive: TADOQuery;
    Panel3: TPanel;
    Panel4: TPanel;
    ActionList1: TActionList;
    Active: TAction;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnCreditGroupClick(Sender: TObject);
    procedure BtnActiveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmCreditCard_Discount: TfrmCreditCard_Discount;

implementation


uses DMUnit, CalculatUnit, UserInfoUnit, CreditCardGroupInfoUnit,
  CreditCardTypeInfo;

{$R *.dfm}

procedure TfrmCreditCard_Discount.BBtnAcceptClick(Sender: TObject);
var
    strFilter : string;
begin
    strFilter := 'Type = 2 and IssueDate >='+QuotedStr(edtStartDate.Text)+' and IssueDate <='+QuotedStr(edtEndDate.Text);
    if edtUserID.Text <> '' then strFilter := strFilter + ' and TCreditCard.UserID ='+edtUserID.Text;
    if edtCreditGroupID.Text <> '' then strFilter := strFilter + ' and TCreditCard.CreditGroupID ='+edtCreditGroupID.Text;
    if edtName.Text <> '' then strFilter := strFilter + ' and LastName like '+QuotedStr('%'+edtName.Text+'%');
    if edtCard.Text <> '' then strFilter := strFilter + ' and CardID = '+ QuotedStr(edtCard.Text);
    if rbActive.Checked then  strFilter := strFilter + ' and TCreditCard.Active = 1';
    if rbNotActive.Checked then  strFilter := strFilter + ' and TCreditCard.Active <> 1';



    QCharge.Close;
    QCharge.SQL.Clear;
    QCharge.SQL.Add('select TCreditCard.*, CreditGroupName,');
    QCharge.SQL.Add('(select Count(id) from TCreditCard where '+strFilter+') CardCount, ');
    QCharge.SQL.Add('(select sum(CardIssuePrice) from TCreditCard where '+strFilter+') sumPrice from TCreditCard');
    QCharge.SQL.Add(' inner join TCReditGroup on TCreditCard.CreditGroupID = TCReditGroup.CreditGroupID');
    QCharge.SQL.Add('where '+strFilter);
    QCharge.SQL.Add('order by id');
    QCharge.Open;

    if QCharge['sumPrice']<>null then
        lblSum.Caption := FormatFloat('#,', QCharge['sumPrice'])
    else
        lblSum.Caption := '0';

    if QCharge['CardCount']<>null then
        lblCount.Caption := FormatFloat('#,', QCharge['CardCount'])
    else
        lblCount.Caption := '0';
end;

procedure TfrmCreditCard_Discount.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmUserInfo);

end;

procedure TfrmCreditCard_Discount.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If QCharge['Active']=0 then
        DBGrid1.Canvas.Brush.Color:=$00E2BCFE
    else
        DBGrid1.Canvas.Brush.Color:=clTeal;

    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;



procedure TfrmCreditCard_Discount.DBGrid1ColExit(Sender: TObject);
begin
  if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False
end;

procedure TfrmCreditCard_Discount.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then Exit;

  if (DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField) then
  begin
    DBCheckBox1.SetFocus;
    SendMessage(DBCheckBox1.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TfrmCreditCard_Discount.FormCreate(Sender: TObject);
begin
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
end;

procedure TfrmCreditCard_Discount.btnCreditGroupClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardGroupInfo, frmCreditCardGroupInfo);
    frmCreditCardGroupInfo.ShowModal;
    if frmCreditCardGroupInfo.strKey='enter' then
    begin
        edtCreditGroupID.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupID'];
        edtCreditGroupTitle.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmCreditCardGroupInfo);
end;

procedure TfrmCreditCard_Discount.BtnActiveClick(Sender: TObject);
var rowNumber : integer;
begin
    if QCharge['id'] <> null then
    begin
        QActive.Close;
        QActive.Parameters.ParamByName('id').Value := QCharge['id'];
        QActive.ExecSQL;
        rowNumber := QCharge.RecNo;
        QCharge.Close;
        QCharge.Open;
        QCharge.RecNo := rowNumber;
    end;
end;

end.
