unit DelFactorsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, Grids, DBGrids, Mask, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmDelFactor = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    edtFactorID: TEdit;
    BBtnAccept: TBitBtn;
    edtReceptiondate: TMaskEdit;
    edtClosedID: TEdit;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Label4: TLabel;
    BtnReturn: TBitBtn;
    StatusBar: TStatusBar;
    DS_SubFactor: TDataSource;
    DS_Factor: TDataSource;
    QSubFactor: TADOQuery;
    QFactors: TADOQuery;
    QDeleteFactor: TADOQuery;
    QDeleteSubFactor: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TFactorsCalcFields(DataSet: TDataSet);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TSubFactorsCalcFields(DataSet: TDataSet);
    procedure TFactorsAfterScroll(DataSet: TDataSet);
    procedure QFactorsAfterScroll(DataSet: TDataSet);
    procedure BtnReturnClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmDelFactor: TfrmDelFactor;
  StrFilter, StrDate, Customer : string;
implementation

uses DMUnit, Math, qrFactorsReportUnit, UserInfoUnit, CalculatUnit;
{$R *.dfm}

procedure TfrmDelFactor.FormCreate(Sender: TObject);
begin
    edtReceptiondate.Text:=CurrentDate;
    If (UserInfo.WorkSectionID<>6) and (UserInfo.WorkSectionID<>8) then
        edtUserID.Text := IntToStr(UserInfo.UserID)
    else
    begin
        edtReceptiondate.Enabled := True;
        edtUserID.Enabled:=True;
        btnUser.Enabled:=True;
    end;
end;

procedure TfrmDelFactor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //QFactors.Close;
    //TSubFactors.Close;
end;

procedure TfrmDelFactor.BBtnAcceptClick(Sender: TObject);
var
strFilter : string;
begin

    strFilter:='';

    if edtUserID.Text<>'' then
        strFilter:=' TDelFactor.UserID ='+edtUserID.Text;

    if edtFactorID.Text<>'' then
        strFilter:=strFilter+' and SerialNumber='+edtFactorID.Text;

    if edtClosedID.Text<>'' then
        strFilter:=strFilter+' and ClosedID='+edtClosedID.Text;

    QFactors.Close;
    QFactors.SQL.Clear;
    QFactors.SQL.Add('select * from TReception inner join TDelFactor');
    QFactors.SQL.Add('on TReception.ReceptionID=TDelFactor.ReceptionID');
    QFactors.SQL.Add('where ReceptionDate='+QuotedStr(edtReceptiondate.Text));
    QFactors.SQL.Add(' and '+strFilter);
    QFactors.SQL.Add('order by SerialNumber');
    QFactors.Open;
end;

procedure TfrmDelFactor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then Self.Close;
    if (key=13) then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmDelFactor.TFactorsCalcFields(DataSet: TDataSet);
begin
    if QFactors['Active']=False then
end;

procedure TfrmDelFactor.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If QFactors['UserID']=4 then
        DBGrid2.Canvas.Brush.Color:=$00E2BCFE
    else
        IF QFactors['UserID']=20 Then
            DBGrid2.Canvas.Brush.Color:=clTeal
        else
            IF QFactors['UserID']=28 Then
                DBGrid2.Canvas.Brush.Color:=clMoneyGreen;
    DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmDelFactor.TSubFactorsCalcFields(DataSet: TDataSet);
begin
    //QSubFactor['strVahedPrice']:=Number2Money(TSubFactors['VahedPrice']);
end;

procedure TfrmDelFactor.TFactorsAfterScroll(DataSet: TDataSet);
begin
    QSubFactor.Close;
    QSubFactor.Parameters.ParamByName('FactorID').Value:=QFactors['FactorID'];
    QSubFactor.Open;
end;

procedure TfrmDelFactor.QFactorsAfterScroll(DataSet: TDataSet);
begin
    QSubFactor.Close;
    QSubFactor.Parameters.ParamByName('FactorID').Value:=QFactors['FactorID'];
    QSubFactor.Open;
end;

procedure TfrmDelFactor.BtnReturnClick(Sender: TObject);
begin
    Close();
end;

procedure TfrmDelFactor.btnUserClick(Sender: TObject);
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

end.
