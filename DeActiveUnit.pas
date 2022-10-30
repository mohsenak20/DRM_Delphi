unit DeActiveUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmDeActiveCard = class(TForm)
    BBtnAccept: TBitBtn;
    gbCard: TGroupBox;
    edtCardID: TEdit;
    gbBargain: TGroupBox;
    edtBargainID: TEdit;
    rbCard: TRadioButton;
    rbBargain: TRadioButton;
    gbFromTo: TGroupBox;
    edtEndNumber: TEdit;
    rbFromTo: TRadioButton;
    memComment: TMemo;
    GroupBox2: TGroupBox;
    rbDeActive: TRadioButton;
    rbActive: TRadioButton;
    edtStartNumber: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnCheckStatus: TBitBtn;
    QCheckStatus: TADOQuery;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure rbCardClick(Sender: TObject);
    procedure rbBargainClick(Sender: TObject);
    procedure rbFromToClick(Sender: TObject);
    procedure btnCheckStatusClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeActiveCard: TfrmDeActiveCard;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmDeActiveCard.BBtnAcceptClick(Sender: TObject);
var
  QCard : TADOQuery;
begin
  QCard:=TADOQuery.Create(nil);
  QCard.Connection:=DM.ADOConnection;
  if rbDeActive.Checked then
  begin
      if rbCard.Checked then
      begin
          QCard.SQL.Text:='Update TCard set Active=0, Comment='+QuotedStr(memComment.Text)+' where CardID='+edtCardID.Text;
          QCard.ExecSQL;
          ShowMessage('ò«—  „Ê—œ ‰Ÿ— €Ì— ›⁄«· ê—œÌœ');
          edtCardID.Clear;
          memComment.Clear;
          edtCardID.SetFocus;
      end
      else
          if rbBargain.Checked then
          begin
              QCard.SQL.Text:='Update TCard set Active=0, Comment='+QuotedStr(memComment.Text)+' where BargainID='+edtBargainID.Text;
              QCard.ExecSQL;
              ShowMessage('ﬁ—«—œ«œ „Ê—œ ‰Ÿ— €Ì— ›⁄«· ê—œÌœ');
              edtBargainID.Clear;
              memComment.Clear;
              edtBargainID.SetFocus;
          end
          else
              if rbFromTo.Checked then
              begin
                  QCard.SQL.Text:='Update TCard set Active=0, Comment='+QuotedStr(memComment.Text)+' where CardID>='+edtStartNumber.Text+' and CardID<='+edtEndNumber.Text;
                  QCard.ExecSQL;
                  ShowMessage('ò«— Â«Ì „Ê—œ ‰Ÿ— €Ì— ›⁄«· ê—œÌœ');
                  edtStartNumber.Clear;
                  edtEndNumber.Clear;
                  memComment.Clear;
                  edtStartNumber.SetFocus;
              end;
  end
  else
  begin
      if rbCard.Checked then
      begin
          QCard.SQL.Text:='Update TCard set Active=1 where CardID='+edtCardID.Text;
          QCard.ExecSQL;
          ShowMessage('ò«—  „Ê—œ ‰Ÿ— ›⁄«· ê—œÌœ');
          edtCardID.Clear;
          memComment.Clear;
          edtCardID.SetFocus;
      end
      else
          if rbBargain.Checked then
          begin
              QCard.SQL.Text:='Update TCard set Active=1 where BargainID='+edtBargainID.Text;
              QCard.ExecSQL;
              ShowMessage('ﬁ—«—œ«œ „Ê—œ ‰Ÿ— ›⁄«· ê—œÌœ');
              edtBargainID.Clear;
              memComment.Clear;
              edtBargainID.SetFocus;
          end
          else
              if rbFromTo.Checked then
              begin
                  QCard.SQL.Text:='Update TCard set Active=1 where CardID>='+edtStartNumber.Text+' and CardID<='+edtEndNumber.Text;
                  QCard.ExecSQL;
                  ShowMessage('ò«— Â«Ì „Ê—œ ‰Ÿ— ›⁄«· ê—œÌœ');
                  edtStartNumber.Clear;
                  edtEndNumber.Clear;
                  memComment.Clear;
                  edtStartNumber.SetFocus;
              end;
  end;
end;

procedure TfrmDeActiveCard.rbCardClick(Sender: TObject);
begin
    gbCard.Enabled:=True;
    gbBargain.Enabled:=False;
    gbFromTo.Enabled:=False;
end;

procedure TfrmDeActiveCard.rbBargainClick(Sender: TObject);
begin
    gbCard.Enabled:=False;
    gbBargain.Enabled:=True;
    gbFromTo.Enabled:=False;
end;

procedure TfrmDeActiveCard.rbFromToClick(Sender: TObject);
begin
    gbCard.Enabled:=False;
    gbBargain.Enabled:=False;
    gbFromTo.Enabled:=True;
end;

procedure TfrmDeActiveCard.btnCheckStatusClick(Sender: TObject);
begin
    QCheckStatus.Close;
    QCheckStatus.Parameters.ParamByName('CardID').Value:=edtCardID.Text;
    QCheckStatus.Open;
    if QCheckStatus['CardID']<>null then
    begin
        if QCheckStatus['Comment']<>null then
            memComment.Text:=QCheckStatus['Comment']
        else
            memComment.Text:='';
    end
    else
        ShowMessage('‘„«—Â „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
end;

procedure TfrmDeActiveCard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

end.
