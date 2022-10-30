unit ViewFactorsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DBGrids, ExtCtrls, Buttons, DB, ADODB, CalculatUnit,
  ActnList, ComCtrls, Menus;

type
  TfrmViewFactors = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    edtFactorID: TEdit;
    BBtnAccept: TBitBtn;
    DS_SubFactor: TDataSource;
    DS_Factor: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    StatusBar: TStatusBar;
    QSubFactor: TADOQuery;
    Label1: TLabel;
    edtReceptiondate: TMaskEdit;
    QFactors: TADOQuery;
    lblDel: TLabel;
    lblPreFactor: TLabel;
    lblBargain: TLabel;
    Label4: TLabel;
    pnlDel: TPanel;
    pnlPreFactor: TPanel;
    pnlBargain: TPanel;
    BtnReturn: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    edtClosedID: TEdit;
    PopupMenuSubFactor: TPopupMenu;
    PopupMenuFactor: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    QDeleteFactor: TADOQuery;
    QDeleteSubFactor: TADOQuery;
    Label8: TLabel;
    edtUserID: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    btnDelFactors: TBitBtn;
    chbExit: TCheckBox;
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
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnDelFactorsClick(Sender: TObject);
    procedure QFactorsBeforeDelete(DataSet: TDataSet);
    procedure QSubFactorBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmViewFactors: TfrmViewFactors;
  StrFilter, StrDate, Customer : string;

implementation

uses DMUnit, Math, qrFactorsReportUnit, UserInfoUnit, DelFactorsUnit;

{$R *.dfm}




procedure TfrmViewFactors.FormCreate(Sender: TObject);
begin
    edtReceptiondate.Text:=CurrentDate;
    If (UserInfo.WorkSectionID<>6) and (UserInfo.WorkSectionID<>8) then
        edtUserID.Text := IntToStr(UserInfo.UserID)
    else
    begin
        edtUserID.Enabled:=True;
        btnUser.Enabled:=True;
    end;
end;

procedure TfrmViewFactors.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //QFactors.Close;
    //TSubFactors.Close;
end;

procedure TfrmViewFactors.BBtnAcceptClick(Sender: TObject);
var
strFilter : string;
begin

    strFilter:='';

    if edtUserID.Text<>'' then
        strFilter:=' TFactor.UserID ='+edtUserID.Text;

    if edtFactorID.Text<>'' then
        strFilter:=strFilter+' and SerialNumber='+edtFactorID.Text;

    if edtClosedID.Text<>'' then
        strFilter:=strFilter+' and ClosedID='+edtClosedID.Text;

    QFactors.Close;
    QFactors.SQL.Clear;
    QFactors.SQL.Add('select * from TReception inner join TFactor');
    QFactors.SQL.Add('on TReception.ReceptionID=TFactor.ReceptionID');
    QFactors.SQL.Add('where ReceptionDate='+QuotedStr(edtReceptiondate.Text));
    if strFilter <> '' then
        QFactors.SQL.Add(' and '+strFilter);
    if (((UserInfo.Permission<>2) and (UserInfo.WorkSectionID<>6)) or not chbExit.Checked) then
        QFactors.SQL.Add(' and ExitUserID is Null and EndTime<>'+QuotedStr('23:59'));
    QFactors.SQL.Add('order by TFactor.FactorID');
    QFactors.Open;
end;

procedure TfrmViewFactors.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then Self.Close;
    if (key=13) then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmViewFactors.TFactorsCalcFields(DataSet: TDataSet);
begin
    if QFactors['Active']=False then
end;

procedure TfrmViewFactors.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TfrmViewFactors.TSubFactorsCalcFields(DataSet: TDataSet);
begin
    //QSubFactor['strVahedPrice']:=Number2Money(TSubFactors['VahedPrice']);
end;

procedure TfrmViewFactors.TFactorsAfterScroll(DataSet: TDataSet);
begin
    QSubFactor.Close;
    QSubFactor.Parameters.ParamByName('FactorID').Value:=QFactors['FactorID'];
    QSubFactor.Open;
end;

procedure TfrmViewFactors.QFactorsAfterScroll(DataSet: TDataSet);
begin
    QSubFactor.Close;
    QSubFactor.Parameters.ParamByName('FactorID').Value:=QFactors['FactorID'];
    QSubFactor.Open;
end;

procedure TfrmViewFactors.BtnReturnClick(Sender: TObject);
begin
    Close();
end;

procedure TfrmViewFactors.N1Click(Sender: TObject);
begin
    IF ((QFactors.RecNo<=0) OR (QFactors.IsEmpty)) Or (MessageBox(Self.Handle,'ÂíÇ ãí ÎæÇåíÏ Çíä ÝÇ˜ÊæÑ ÍÐÝ ÔæÏ ¿','ÍÐÝ ÑßæÑÏ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDeleteFactor.Close;
    QDeleteFactor.Parameters.ParamByName('FactorID').Value:=QFactors['FactorID'];
    QDeleteFactor.ExecSQL;
    QFactors.Close;
    QFactors.Open;
end;

procedure TfrmViewFactors.N2Click(Sender: TObject);
begin
    IF ((QSubFactor.RecNo<=0) OR (QSubFactor.IsEmpty)) Or (MessageBox(Self.Handle,'ÂíÇ ãí ÎæÇåíÏ Çíä ÑÏíÝ ÍÐÝ ÔæÏ ¿','ÍÐÝ ÑßæÑÏ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDeleteSubFactor.Close;
    QDeleteSubFactor.Parameters.ParamByName('Code').Value:=QSubFactor['Code'];
    QDeleteSubFactor.ExecSQL;
    QFactors.Close;
    QFactors.Open;
end;

procedure TfrmViewFactors.btnUserClick(Sender: TObject);
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

procedure TfrmViewFactors.btnDelFactorsClick(Sender: TObject);
begin
    Application.CreateForm(TfrmDelFactor, frmDelFactor);
    if edtUserID.Text <> '' then
    begin
        frmDelFactor.edtUserID.Text := edtUserID.Text;
        frmDelFactor.edtUserName.Text := edtUserName.Text;
        frmDelFactor.BBtnAcceptClick(Sender);
    end;
    frmDelFactor.ShowModal;
    FreeAndNil(frmDelFactor);
end;

procedure TfrmViewFactors.QFactorsBeforeDelete(DataSet: TDataSet);
begin
    Abort;    
end;

procedure TfrmViewFactors.QSubFactorBeforeDelete(DataSet: TDataSet);
begin
    Abort;
end;

end.
