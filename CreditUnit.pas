unit CreditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ActnList, Grids, DBGrids, Result_Transaction, Application_Layer;

type
  TfrmCredit = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btnSearch: TBitBtn;
    edtKeyNumber: TEdit;
    Label12: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblKeyNumber: TLabel;
    lblCustomerName: TLabel;
    lblStartTme: TLabel;
    lblCredit: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    BtnReturn: TBitBtn;
    QReception: TADOQuery;
    Label17: TLabel;
    lblReceptionID: TLabel;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtNewCredit: TEdit;
    SP_Print: TADOStoredProc;
    Label1: TLabel;
    lblActive: TLabel;
    SP_Credit: TADOStoredProc;
    SP_GetCurrentCredit: TADOStoredProc;
    BtnPrint: TBitBtn;
    btnCreditList: TBitBtn;
    rbGeneral: TRadioButton;
    rbVip: TRadioButton;
    rbManager: TRadioButton;
    lblAllCredit: TLabel;
    ActionList1: TActionList;
    Return: TAction;
    DBGrid1: TDBGrid;
    QChargeList: TADOQuery;
    dsChargeList: TDataSource;
    QChargeListCreditID: TLargeintField;
    QChargeListReceptionID: TLargeintField;
    QChargeListCredit: TIntegerField;
    QChargeListChargeTime: TStringField;
    QChargeListUserID: TIntegerField;
    QChargeListCustomerName: TWideStringField;
    QChargeListStartTime: TStringField;
    QChargeListClosedID: TIntegerField;
    QSpecialGuestCredit: TADOQuery;
    withPos: TAction;
    SP_PosTrancations: TADOStoredProc;
    procedure btnSearchClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure ClearForm();
    procedure FormCreate(Sender: TObject);
    procedure edtNewCreditChange(Sender: TObject);
    Procedure PrintChargeCredit(CreditID : Longint);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure btnCreditListClick(Sender: TObject);
    procedure edtNewCreditExit(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure QChargeListBeforeDelete(DataSet: TDataSet);
    function usingPos(): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCredit: TfrmCredit;

implementation

uses DMUnit, ShareUnit, qrChargeCreditUnit, qrCreditInfoUnit, CalculatUnit,
  CreditListUnit;

{$R *.dfm}
Procedure TfrmCredit.PrintChargeCredit(CreditID : Longint);
begin
  SP_Print.Close;
  SP_Print.Parameters.ParamByName('@CreditID').Value:=CreditID;
  SP_Print.Open;
  if SP_Print['ReceptionID']<>Null then
  begin
      Application.CreateForm(TqrChargeCredit, qrChargeCredit);
      qrChargeCredit.lblReceptionID.Caption:=IntToStr(SP_Print['ReceptionID']);
      //qrChargeCredit.lblCustomerName.Caption:=SP_Print['CustomerName'];
      qrChargeCredit.lblKeyNumber.Caption:=IntToStr(SP_Print['KeyNumber']);
      qrChargeCredit.lblNewCharge.Caption:=IntToStr(SP_Print['Credit']);
      qrChargeCredit.lblUserName.caption:=UserName;
      SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value := SP_Print['ReceptionID'];
      SP_GetCurrentCredit.ExecProc;

      //qrChargeCredit.lblAllCharge.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
      qrChargeCredit.Print;
      FreeAndNil(qrChargeCredit);
  end;

end;


procedure TfrmCredit.ClearForm();
begin
    edtKeyNumber.Clear;
    lblReceptionID.Caption:='';
    lblKeyNumber.Caption:='';
    lblCustomerName.Caption:='';
    lblCredit.Caption:='';
    lblAllCredit.Caption:='';
    lblStartTme.Caption:='';
    edtNewCredit.Clear;
    lblActive.Caption:='';
end;


procedure TfrmCredit.btnSearchClick(Sender: TObject);
begin
    if edtKeyNumber.Text='' then Exit;

    QReception.Close;
    QReception.Parameters.ParamByName('KeyNumber').Value:=edtKeyNumber.Text;
    QReception.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    {if rbGeneral.Checked then
        QReception.Parameters.ParamByName('PositionClosed').Value:=1
    else
        if rbVip.Checked then
            QReception.Parameters.ParamByName('PositionClosed').Value:=2
        else
            QReception.Parameters.ParamByName('PositionClosed').Value:=3;}
            
    QReception.Open;
    if QReception['ReceptionID']<>Null then
    begin
        if QReception['Active'] then
        begin
            if QReception.RecordCount=1 then
            begin
                lblReceptionID.Caption:=IntToStr(QReception['ReceptionID']);
                lblKeyNumber.Caption:=IntToStr(QReception['KeyNumber']);

                lblCustomerName.Caption:=QReception['CustomerName'];
                lblStartTme.Caption:=QReception['StartTime'];

                //lblCredit.Caption:=IntToStr(QReception['Credit']);
                lblAllCredit.Caption:=lblCredit.Caption;
                SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
                SP_GetCurrentCredit.ExecProc;
                lblCredit.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
                edtNewCredit.SetFocus;
                QSpecialGuestCredit.Close;
                QSpecialGuestCredit.Parameters.ParamByName('ReceptionID').Value := lblReceptionID.Caption;
                QSpecialGuestCredit.Open;
                if QSpecialGuestCredit['Credit']<>null then
                begin
                  ShowMessage('«Ì‰ ò„œ „—»Êÿ »Â „ÌÂ„«‰ ÊÌéÂ „Ì »«‘œ Ê «„ò«‰ ‘«—é ÊÃÊœ ‰œ«—œ.');
                  Exit;
                end;
                if QReception['Active'] then
                    lblActive.Caption:='œ«—œ'
                else
                begin
                    lblActive.Caption:='‰œ«—œ';
                    ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „ÃÊ“ ‘«—é ‰œ«—œ');
                end;
            end
            else
                ShowMessage('«“ «Ì‰ ‘„«—Â »Ì‘ «“ Ìﬂ ‰›— «” ›«œÂ „Ì ﬂ‰‰œ');
        end
        else
            ShowMessage('«Ì‰ ‘„«—Â ﬂ·Ìœ »Â ÿÊ— „Êﬁ  €Ì— ›⁄«· ‘œÂ «”  ·ÿ›« »Â „œÌ—Ì  œ«Œ·Ì „—«Ã⁄Â ‘Êœ');

    end
    else
        ShowMessage('«Ì‰ ‘„«—Â ﬂ·Ìœ „⁄ »— ‰„Ì »«‘œ');

end;

procedure TfrmCredit.BtnSaveClick(Sender: TObject);
var
  intValue: Integer;
begin 
    BtnSave.Enabled := False;
    if ((lblKeyNumber.Caption<>edtKeyNumber.Text) or (StrToIntDef(lblKeyNumber.Caption, -1)=-1)
    or (StrToIntDef(Money2Number(edtNewCredit.Text), -1)=-1)) then
    begin
        ShowMessage('«ÿ·«⁄«  ‰«ﬁ’ „Ì »«‘œ');
        Exit;
    end;
    if PosInfo.isPosActive then
    begin
        if MessageBox(Self.Handle,'¬Ì« ‘«—é «“ ÿ—Ìﬁ ÅÊ“ «‰Ã«„ „Ì‘Êœø','ÅÌ ”Ì ÅÊ“',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrYes  Then
        begin
          case PosInfo.PSP of
            BEHPARDAKHT:
              if posPayment(StrToInt(StringReplace(edtNewCredit.Text, ',' , '',[rfReplaceAll,rfIgnoreCase])), QReception['receptionId']) = 0 then
              begin
                ShowMessage('Œÿ« œ— Å—œ«Œ ');
                BtnSave.Enabled := True;
                Exit;
              end;
            SADAD:
              if SadadPeyment(StrToInt(StringReplace(edtNewCredit.Text, ',' , '',[rfReplaceAll,rfIgnoreCase])), QReception['receptionId']) = 0 then
              begin
                ShowMessage('Œÿ« œ— Å—œ«Œ ');
                BtnSave.Enabled := True;
                Exit;
              end;
          end;
        end;
    end;
    if MessageBox(Self.Handle,'‘«—é „Ê—œ ‰Ÿ— –ŒÌ—Â ê—œœø','–ŒÌ—Â ‘«—é',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo  Then Exit;
    if not QReception['Active'] then
        if MessageBox(Self.Handle,'„‘ —Ì „Ê—œ ‰Ÿ— „ÃÊ“ ‘«—é ‰œ«—œ ¬Ì« ⁄„· ‘«—é «‰Ã«„ ‘Êœø','„ÃÊ“ ‘«—é',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrNo then Exit;

    intValue := StrToInt(Fnc_ReturnNum(edtNewCredit.Text));
    if intValue > 3000000 then
        if MessageBox(Self.Handle,'„»·€ ‘«—é »Ì‘ — «“ 300 Â“«—  Ê„«‰ «” ','«Œÿ«—',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo then Exit;

    SP_Credit.Close;
    SP_Credit.Parameters.ParamByName('@ClosedID').Value:=lblKeyNumber.Caption;  //QReception['ClosedID'];
    SP_Credit.Parameters.ParamByName('@CreditID').Value:=-1;
    SP_Credit.Parameters.ParamByName('@Credit').Value:=edtNewCredit.Text;
    SP_Credit.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Credit.Parameters.ParamByName('@Action').Value:='Insert';
    SP_Credit.ExecProc;
    {if SP_Credit.Parameters.ParamByName('@OutCreditID').Value>0 then
        ShowMessage('‘«—é „Ê—œ ‰Ÿ— –ŒÌ—Â ê—œÌœ')
    else
        ShowMessage('Œÿ« œ— Â‰ê«„ –ŒÌ—Â ‘«—é ·ÿ›« ·Ì”  ‘«—é »——”Ì ê—œœ');}
    PrintChargeCredit(SP_Credit.Parameters.ParamByName('@OutCreditID').Value);
    ClearForm;
    edtKeyNumber.SetFocus;
    QChargeList.Close;
    QChargeList.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QChargeList.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QChargeList.Open;
    QChargeList.Last;
    BtnSave.Enabled := True;
end;

procedure TfrmCredit.FormCreate(Sender: TObject);
begin
    ClearForm;
    QChargeList.Close;
    QChargeList.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QChargeList.Parameters.ParamByName('ReceptionDate').Value:=CurrentDate;
    QChargeList.Open;
    QChargeList.Last;
    if UserInfo.WorkSectionID = 8 then btnCreditList.Enabled := True;
    if UserInfo.WorkSectionID = 6 then btnCreditList.Enabled := True;
end;

procedure TfrmCredit.edtNewCreditChange(Sender: TObject);
var
  iPos: Integer;
begin
    lblAllCredit.Caption:=FormatFloat('###,',(StrToIntDef(lblCredit.Caption, 0)+StrToIntDef(Money2Number(edtNewCredit.Text)
    , 0)));
    edtNewCredit.Text:= FormatFloat( '###,', StrToInt(Money2Number(edtNewCredit.Text)));
    edtNewCredit.SelStart:=Length(edtNewCredit.Text)+1;


end;

procedure TfrmCredit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmCredit.BtnCancelClick(Sender: TObject);
begin
    ClearForm;
    edtKeyNumber.SetFocus;
end;

procedure TfrmCredit.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrCreditInfo, qrCreditInfo);
    qrCreditInfo.lblReceptionID.Caption:=lblReceptionID.Caption;
    qrCreditInfo.lblCustomerName.Caption:=lblCustomerName.Caption;
    qrCreditInfo.lblKeyNumber.Caption:=lblKeyNumber.Caption;
    qrCreditInfo.lblAllCharge.Caption:=lblCredit.Caption;
    qrCreditInfo.Preview;
    FreeAndNil(qrCreditInfo);

end;

procedure TfrmCredit.btnCreditListClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditList, frmCreditList);
    frmCreditList.ShowModal;
    FreeAndNil(frmCreditList);
end;

procedure TfrmCredit.edtNewCreditExit(Sender: TObject);
begin

    if StrToIntDef(edtNewCredit.Text, 0) > 300000 then
        ShowMessage('„»·€ ‘«—é »Ì‘ — «“ 300000 —Ì«· „Ì »«‘œ');
end;

procedure TfrmCredit.BtnReturnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCredit.DBGrid1TitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = 0;
{$J-}
begin

  if DBGrid1.DataSource.DataSet is TCustomADODataSet then
  with TCustomADODataSet(DBGrid1.DataSource.DataSet) do
  begin
    try
      DBGrid1.Columns[PreviousColumnIndex].title.Font.Style :=
      DBGrid1.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];

    except
  end;

    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];
    PreviousColumnIndex := Column.Index;

    if (Pos(Column.Field.FieldName, Sort) = 1)
    and (Pos(' DESC', Sort)= 0) then
      Sort := Column.Field.FieldName + ' DESC'
    else
      Sort := Column.Field.FieldName + ' ASC';
  end;
end;

procedure TfrmCredit.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
  var
  pt: TGridcoord;
begin
   pt:= DBGrid1.MouseCoord(x, y);

  if pt.y=0 then
    DBGrid1.Cursor:=crHandPoint
  else
    DBGrid1.Cursor:=crDefault;
end;

procedure TfrmCredit.QChargeListBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

function TfrmCredit.usingPos(): Boolean;
var
  MSG_OK : string;
  Result_Transaction_Table1 : Result_Transaction_Table;
  Application_Layer1  : TApplication_Layer;
begin
  PosInfo.amount := '1000';
  PosInfo.error := '';
  PosInfo.account := '';
  PosInfo.bank := '';
  PosInfo.card := '';
  PosInfo.serial := '';
  PosInfo.terminal := '';
  PosInfo.sabt := '';
  PosInfo.date := '';
  PosInfo.time := '';
  PosInfo.errorCode := '';

  Result_Transaction_Table1  := Result_Transaction_Table.Create;
  Application_Layer1   := TApplication_Layer.Createe(PosInfo.ip ,PosInfo.port,180);

  Result_Transaction_Table1 := Application_Layer1.POS_PC_Debits_Goods_And_Service(StringReplace(edtNewCredit.Text, ',' , '',[rfReplaceAll,rfIgnoreCase]),PosInfo.payerid ,PosInfo.merchant ,MSG_OK);



    SP_PosTrancations.Close;
    SP_PosTrancations.Parameters.ParamByName('@errorMessage').Value:= MSG_OK;
    SP_PosTrancations.Parameters.ParamByName('@account').Value:= Result_Transaction_Table1.Result_AccountNo;
    SP_PosTrancations.Parameters.ParamByName('@bank').Value:= Result_Transaction_Table1.Result_BIN;
    SP_PosTrancations.Parameters.ParamByName('@card').Value:= Result_Transaction_Table1.Result_PAN;
    SP_PosTrancations.Parameters.ParamByName('@serial').Value:= Result_Transaction_Table1.Result_SerialTransaction;
    SP_PosTrancations.Parameters.ParamByName('@terminal').Value:= Result_Transaction_Table1.Result_TerminalNo;
    SP_PosTrancations.Parameters.ParamByName('@sabt').Value:= Result_Transaction_Table1.Result_TraceNumber;
    SP_PosTrancations.Parameters.ParamByName('@tranDate').Value:= Result_Transaction_Table1.Result_TransactionDate;
    SP_PosTrancations.Parameters.ParamByName('@tranTime').Value:= Result_Transaction_Table1.Result_TransactionTime;
    SP_PosTrancations.Parameters.ParamByName('@errorCode').Value:= Result_Transaction_Table1.Result_recTransResult;
    SP_PosTrancations.Parameters.ParamByName('@amount').Value:= edtNewCredit.Text;
    SP_PosTrancations.Parameters.ParamByName('@receptionID').Value:= lblReceptionID.Caption;
    SP_PosTrancations.Parameters.ParamByName('@userID').Value:= UserInfo.UserID;
    SP_PosTrancations.Parameters.ParamByName('@posID').Value:=  PosInfo.posId;
    SP_PosTrancations.ExecProc;

    ShowMessage(SP_PosTrancations.Parameters.ParamByName('@id').Value);

    if Result_Transaction_Table1.Result_recTransResult = '00' then
      usingPos := True
    else
      usingPos:= False;
end;

end.
