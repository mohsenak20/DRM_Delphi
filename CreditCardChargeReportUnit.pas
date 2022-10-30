unit CreditCardChargeReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DB, Grids, DBGrids, ADODB, Buttons,
  DBCtrls, Menus;

type
  TfrmCreditCardChargeReport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtStartDate: TMaskEdit;
    Label14: TLabel;
    Label4: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    BBtnAccept: TBitBtn;
    QCharge: TADOQuery;
    DBGrid1: TDBGrid;
    dsCharge: TDataSource;
    Label1: TLabel;
    lblSum: TLabel;
    rbActive: TRadioButton;
    rbNotActive: TRadioButton;
    RadioButton3: TRadioButton;
    lblCount: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    edtEndDate: TMaskEdit;
    Label5: TLabel;
    edtCreditGroupID: TEdit;
    edtCreditGroupTitle: TEdit;
    btnCreditGroup: TBitBtn;
    edtCard: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtName: TEdit;
    QDelete: TADOQuery;
    DBCheckBox1: TDBCheckBox;
    pmGrid: TPopupMenu;
    mnuDelete: TMenuItem;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnCreditGroupClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure mnuDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreditCardChargeReport: TfrmCreditCardChargeReport;

implementation

uses DMUnit, CalculatUnit, UserInfoUnit, CreditCardGroupInfoUnit,
  CreditCardTypeInfo, CreditCardListUnit;

{$R *.dfm}

procedure TfrmCreditCardChargeReport.BBtnAcceptClick(Sender: TObject);
var
    strFilter : string;
begin
    strFilter := ' ChargeDate >='+QuotedStr(edtStartDate.Text)+' and ChargeDate <='+QuotedStr(edtEndDate.Text);
    if edtUserID.Text <> '' then strFilter := strFilter + ' and TCreditCardCharge.UserID ='+edtUserID.Text;
    if edtCreditGroupID.Text <> '' then strFilter := strFilter + ' and TCreditCardCharge.ChargeGroupID ='+edtCreditGroupID.Text;
    if edtName.Text <> '' then strFilter := strFilter + ' and LastName like '+QuotedStr('%'+edtName.Text+'%');
    if edtCard.Text <> '' then strFilter := strFilter + ' and CardID = '+ QuotedStr(edtCard.Text);
    if rbActive.Checked then  strFilter := strFilter + ' and TCreditCardCharge.Active = 1';
    if rbNotActive.Checked then  strFilter := strFilter + ' and TCreditCardCharge.Active <> 1';



    QCharge.Close;
    QCharge.SQL.Clear;
    QCharge.SQL.Add('select CreditCardChargeID, CreditCardID, Name+'+QuotedStr(' ')+'+lastName name, CreditGroupName, TCReditGroup.CreditGroupID,Price, ChargeTime, ChargeDate, NumberOfSession,');
    QCharge.SQL.Add('TCreditCard.CardIssuePrice, NotActive, NumberOfCustomer,');
    QCharge.SQL.Add('(select SUM(price) from TCreditCardCharge inner join TCreditCard on TCreditCard.CardID = TCreditCardCharge.CreditCardID ');
    QCharge.SQL.Add('where '+strFilter+') sumPrice, TCreditCardCharge.Active,');
    QCharge.SQL.Add('(select count(CreditCardChargeID) from TCreditCardCharge  inner join TCreditCard on TCreditCard.CardID = TCreditCardCharge.CreditCardID');
    QCharge.SQL.Add('where '+strFilter+') ChargeCount, ');
    QCharge.SQL.Add('(select SUM(NumberOfAdult) from TReception where TReception.creditCardID = TCreditCardCharge.CreditCardID) used,');
    QCharge.SQL.Add('(select SUM(NumberOfSession) from TCreditCardCharge t1 where t1.creditCardID = TCreditCardCharge.CreditCardID) allSeassion');
    QCharge.SQL.Add('from TCreditCardCharge inner join TCreditCard on TCreditCard.CardID = TCreditCardCharge.CreditCardID');
    QCharge.SQL.Add('inner join TCReditGroup on TCreditCardCharge.ChargeGroupID = TCReditGroup.CreditGroupID');
    QCharge.SQL.Add('where '+strFilter);
    QCharge.SQL.Add('order by ChargeDate, ChargeTime');
    QCharge.Open;

    if QCharge['sumPrice']<>null then
        lblSum.Caption := FormatFloat('#,', QCharge['sumPrice'])
    else
        lblSum.Caption := '0';

    if QCharge['ChargeCount']<>null then
        lblCount.Caption := FormatFloat('#,', QCharge['ChargeCount'])
    else
        lblCount.Caption := '0';



end;

procedure TfrmCreditCardChargeReport.btnUserClick(Sender: TObject);
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

procedure TfrmCreditCardChargeReport.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If QCharge['Active']=0 then
        DBGrid1.Canvas.Brush.Color:=$00E2BCFE
    else
        DBGrid1.Canvas.Brush.Color:=clTeal;

    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;



procedure TfrmCreditCardChargeReport.DBGrid1ColExit(Sender: TObject);
begin
  if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False
end;

procedure TfrmCreditCardChargeReport.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then Exit;

  if (DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField) then
  begin
    DBCheckBox1.SetFocus;
    SendMessage(DBCheckBox1.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TfrmCreditCardChargeReport.FormCreate(Sender: TObject);
begin
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
end;

procedure TfrmCreditCardChargeReport.btnCreditGroupClick(Sender: TObject);
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

procedure TfrmCreditCardChargeReport.DBGrid1DblClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardList, frmCreditCardList);
    frmCreditCardList.QCredit.Parameters.ParamByName('CardID').Value := QCharge['CreditCardID'];
    frmCreditCardList.lblName.Caption := QCharge['Name'];
    frmCreditCardList.lblCardID.Caption := QCharge['CreditCardID'];
    frmCreditCardList.lblCreditGroupName.Caption := QCharge['CreditGroupName'];
    frmCreditCardList.QCredit.Open;
    frmCreditCardList.ShowModal;
    FreeAndNil(frmCreditCardList)
end;

procedure TfrmCreditCardChargeReport.mnuDeleteClick(Sender: TObject);
begin
  IF ((QCharge.RecNo<=0) OR (QCharge.IsEmpty)) Or (MessageBox(Self.Handle,'ÂíÇ ãí ÎæÇåíÏ Çíä ÑßæÑÏ ÍÐÝ ÔæÏ ¿','ÍÐÝ ÑßæÑÏ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
  QDelete.Parameters.ParamByName('CreditCardChargeID').Value := QCharge['CreditCardChargeID'];
  QDelete.ExecSQL;
end;

end.
