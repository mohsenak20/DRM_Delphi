unit CheckCardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, DB, ADODB, DBCtrls, Grids, DBGrids,
  Menus, MPlayer;

type
  TfrmCheckCard = class(TForm)
    Label12: TLabel;
    edtCardID: TEdit;
    btnSearch: TBitBtn;
    Label14: TLabel;
    Label1: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    QCard: TADOQuery;
    daCard: TDataSource;
    BtnReturn: TBitBtn;
    BitBtn1: TBitBtn;
    QCardPrint: TADOQuery;
    Label8: TLabel;
    DBText7: TDBText;
    Label9: TLabel;
    DBText8: TDBText;
    Label10: TLabel;
    DBText9: TDBText;
    Label11: TLabel;
    DBText10: TDBText;
    BtnNew: TBitBtn;
    QStart: TADOQuery;
    btnStart: TBitBtn;
    QUpdateTReception: TADOQuery;
    btnNotChecked: TBitBtn;
    btnUser: TBitBtn;
    edtUserName: TEdit;
    edtUserID: TEdit;
    Label13: TLabel;
    DBGrid1: TDBGrid;
    QNotReadCard: TADOQuery;
    daNotReadCard: TDataSource;
    PopupMenu: TPopupMenu;
    mnuDelCard: TMenuItem;
    MediaPlayer1: TMediaPlayer;
    procedure btnSearchClick(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure edtCardIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnStartClick(Sender: TObject);
    procedure btnNotCheckedClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuDelCardClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheckCard: TfrmCheckCard;

implementation

uses DMUnit, qrCardGroupUnit, CalculatUnit, ShareUnit, CardReportUnit,
  NotCheckedCardUnit, UserInfoUnit;

{$R *.dfm}

procedure TfrmCheckCard.btnSearchClick(Sender: TObject);
var
  QInsertNotReadCard : TADOQuery;
begin
    QInsertNotReadCard := TADOQuery.Create(nil);
    QInsertNotReadCard.Connection := DM.ADOConnection;
    QCard.Close;
    QCard.Parameters.ParamByName('CardID').Value:=edtCardID.Text;
    QCard.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QCard.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    QCard.Open;
    if QCard['BargainNumber']=Null then
    begin
        //MediaPlayer1.Play;
        ShowMessage('«Ì‰ ‘„«—Â ò«—  „⁄ »— ‰„Ì»«‘œ');
        QInsertNotReadCard.Close;
        QInsertNotReadCard.SQL.Add('Insert into TNotReadCard');
        QInsertNotReadCard.SQL.Add('(CardNumber, UserID)');
        QInsertNotReadCard.SQL.Add('values('+edtCardID.Text+','+IntToStr(UserInfo.UserID)+')');
        QInsertNotReadCard.ExecSQL;
        QNotReadCard.Close;
        QNotReadCard.Open;
    end
    else
    begin
        if ((QCard['CardID']=edtCardID.Text) and (QCard['CheckedCard1']=1)) or ((QCard['CardID2']=edtCardID.Text) and (QCard['CheckedCard2']=1))
            or ((QCard['CardID3']=edtCardID.Text) and (QCard['CheckedCard3']=1)) then
            ShowMessage('«Ì‰ ò«—  —« ﬁ»·« çò ‰„ÊœÂ «Ìœ')
        else
        begin
            QUpdateTReception.Close;
            if QCard['CardID']=edtCardID.Text then
                QUpdateTReception.Parameters.ParamByName('Card').Value:=1
            else
                if QCard['CardID2']=edtCardID.Text then
                    QUpdateTReception.Parameters.ParamByName('Card').Value:=2
                else
                    if QCard['CardID3']=edtCardID.Text then
                        QUpdateTReception.Parameters.ParamByName('Card').Value:=3;
            QUpdateTReception.Parameters.ParamByName('ReceptionID').Value:=QCard['ReceptionID'];
            QUpdateTReception.ExecSQL;
        end;
    end;
end;

procedure TfrmCheckCard.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmCheckCard.BitBtn1Click(Sender: TObject);
var
strFilter : string;
begin
    strFilter:='';
    if edtStartDate.Text<>'1   /  /  ' then
        if edtEndDate.Text<>'1   /  /  ' then
            if strFilter='' then
                strFilter:=' ReceptionDate >= '+QuotedStr(edtStartDate.Text)+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text)
            else
                strFilter:=strFilter+' and ReceptionDate >= '+QuotedStr(edtStartDate.Text)+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text)
        else
            if strFilter='' then
                strFilter:=' ReceptionDate >= '+QuotedStr(edtStartDate.Text)
            else
                strFilter:=strFilter+' and ReceptionDate >= '+QuotedStr(edtStartDate.Text)
    else
        if edtEndDate.Text<>'1   /  /  ' then
            if strFilter='' then
                strFilter:=' ReceptionDate <= '+QuotedStr(edtEndDate.Text)
            else
                strFilter:=strFilter+' and ReceptionDate <= '+QuotedStr(edtEndDate.Text);

    strFilter:=strFilter+' and TReception.CardID<>1';
    Application.CreateForm(TqrCardGroup, qrCardGroup);
    qrCardGroup.QCardPrint.Close;
    qrCardGroup.QCardPrint.SQL.Clear;
    qrCardGroup.QCardPrint.SQL.Add('select CompanyName, TBargain.BargainID, TBargain.BargainNumber, Count(ReceptionID) as CardCount from TReception');
    qrCardGroup.QCardPrint.SQL.Add('inner join TCard on TReception.CardID=TCard.CardID');
    qrCardGroup.QCardPrint.SQL.Add('inner join TBargain on TCard.BargainID=TBargain.BargainID');
    qrCardGroup.QCardPrint.SQL.Add('inner join TCompany on TBargain.CompanyID=TCompany.CompanyID');
    qrCardGroup.QCardPrint.SQL.Add('where '+strFilter);
    qrCardGroup.QCardPrint.SQL.Add('group by CompanyName, TBargain.BargainID, TBargain.BargainNumber');
    qrCardGroup.QCardPrint.Open;

    qrCardGroup.lblCoName.Caption:=Parameter.CoName;
    qrCardGroup.lblStartDate.Caption:=edtStartDate.Text;
    qrCardGroup.lblEndDate.Caption:=edtEndDate.Text;
    qrCardGroup.lblCurrentDate.Caption:=CurrentDate;
    qrCardGroup.lblUserName.Caption:='';
    qrCardGroup.Preview;
    FreeAndNil(qrCardGroup);
end;

procedure TfrmCheckCard.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCardReport, frmCardReport);
    frmCardReport.ShowModal;
    FreeAndNil(frmCardReport);
end;

procedure TfrmCheckCard.edtCardIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then
    begin
        btnSearchClick(Sender);
        edtCardID.SelectAll;
    end;
end;

procedure TfrmCheckCard.btnStartClick(Sender: TObject);
begin
    IF (MessageBox(Self.Handle,'¬Ì« „ÌŒÊ«ÂÌœ ò«— Â« —« «“ «» œ« çò ‰„«ÌÌœø','çò ò—œ‰ ò«— Â«',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    if edtStartDate.Text<>edtEndDate.Text then
    begin
        ShowMessage(' «—ÌŒ ‘—Ê⁄ Ê Å«Ì«‰ ÌòÌ ‰„Ì »«‘œ ');
        Exit;
    end;
    QStart.Close;
    QStart.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QStart.Parameters.ParamByName('EndDate').Value:=edtStartDate.Text;
    if edtUserID.Text<>'' then
        QStart.Parameters.ParamByName('UserID').Value:=edtUserID.Text
    else
        QStart.Parameters.ParamByName('UserID').Value:=-1;
    QStart.ExecSQL;
    ShowMessage('·ÿ›« «“ «» œ« ò«— Â«Ì  «—ÌŒ „‘Œ’ ‘œÂ —« çò ‰„«ÌÌœ');
end;

procedure TfrmCheckCard.btnNotCheckedClick(Sender: TObject);
begin
    Application.CreateForm(TfrmNotCheckedCard, frmNotCheckedCard);
    frmNotCheckedCard.edtStartDate.Text:=edtStartDate.Text;
    frmNotCheckedCard.edtEndDate.Text:=edtEndDate.Text;    
    frmNotCheckedCard.ShowModal;
    FreeAndNil(frmNotCheckedCard);


end;

procedure TfrmCheckCard.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        edtCardID.SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

procedure TfrmCheckCard.FormCreate(Sender: TObject);
var
    QDelNotReadCard : TADOQuery;
begin
    IF (MessageBox(Self.Handle,'¬Ì« „ÌŒÊ«ÂÌœ ÃœÊ· ò«— Â«Ì ‰«„⁄ »— Œ«·Ì ‘Êœø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelNotReadCard := TADOQuery.Create(nil);
    QDelNotReadCard.Connection := DM.ADOConnection;
    QDelNotReadCard.SQL.Text := 'Delete TNotReadCard where UserID = '+IntToStr(UserInfo.UserID);
    QDelNotReadCard.ExecSQL;
end;

procedure TfrmCheckCard.mnuDelCardClick(Sender: TObject);
var
    QDelCard : TADOQuery;
begin
    QDelCard := TADOQuery.Create(nil);
    QDelCard.Connection := DM.ADOConnection;
    QDelCard.SQL.Text := 'Delete TNotReadCard where CardNumber = '+IntToStr(QNotReadCard['CardNumber'])+' and UserID='+IntToStr(UserInfo.UserID);
    QDelCard.ExecSQL;
    QNotReadCard.Close;
    QNotReadCard.Open;


end;

procedure TfrmCheckCard.FormShow(Sender: TObject);
begin
    QNotReadCard.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QNotReadCard.Open;
end;

end.
