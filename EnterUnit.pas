unit EnterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ExtCtrls, MPlayer, ActnList;

type
  TfrmEnter = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    lblCustomerName: TLabel;
    lblStartTme: TLabel;
    Label17: TLabel;
    lblLocker: TLabel;
    Label12: TLabel;
    edtReceptionID: TEdit;
    btnSearch: TBitBtn;
    BtnReturn: TBitBtn;
    BtnEnter: TBitBtn;
    SP_Enter: TADOStoredProc;
    QCheckEnter: TADOQuery;
    QReception: TADOQuery;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    QSearch: TADOQuery;
    lblType: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblUserName: TLabel;
    Label6: TLabel;
    lblCo1: TLabel;
    Label8: TLabel;
    lblCo3: TLabel;
    Label10: TLabel;
    lblCo2: TLabel;
    Label3: TLabel;
    lblCredit: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    QEntrance: TADOQuery;
    QSetEntraneOnGate2: TADOQuery;
    QUser: TADOQuery;
    MediaPlayer1: TMediaPlayer;
    QCheckReseller: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    QSetEnter2: TADOQuery;
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnEnterClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtReceptionIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionInsertExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnter: TfrmEnter;

implementation

uses DMUnit, CalculatUnit, Math, IssueCreditCardTicketUnit;

{$R *.dfm}

procedure TfrmEnter.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmEnter.BtnEnterClick(Sender: TObject);
begin
    QCheckEnter.Close;
    QCheckEnter.Parameters.ParamByName('ReceptionID').Value:=edtReceptionID.Text;
    QCheckEnter.Open;
    if QCheckEnter['Enter']<>Null then
    begin
        if UserInfo.WorkSectionID <> 6 then
            if (Time()-StrToTime(QCheckEnter['StartTime']) > StrToTime('2:00')) then
            begin
                ShowMessage('«“ “„«‰ Å–Ì—‘ 2 ”«⁄  ò–‘ Â «”  Ê ‘„« „Ã«“ »Â Ê—Êœ «Ì‰ „ÌÂ„«‰ ‰„Ì»«‘Ìœ.');
                Exit;
        end;

        if UserInfo.UserID = 63 then
        begin
          if QCheckEnter['Enter'] then
          begin
              ShowMessage('»« «Ì‰ òœ Å–Ì—‘ ﬁ»·« Ìò ‰›— Ê«—œ ”Ì” „ ‘œÂ «” ');
          end
          else
          begin
              SP_Enter.Parameters.ParamByName('@ReceptionID').Value:=edtReceptionID.Text;
              SP_Enter.ExecProc;
              if SP_Enter.Parameters.ParamByName('@ReturnMessage').Value='error' then
              begin
                  ShowMessage('»« «Ì‰ òœ Å–Ì—‘ ﬁ»·« Ìò ‰›— Ê«—œ ”Ì” „ ‘œÂ «” ');
              end
              else
                  if SP_Enter.Parameters.ParamByName('@ReturnMessage').Value='Ok' then
                      ShowMessage('À»  Ê—Êœ');
          end;
        end
        else
        begin
            if QCheckEnter['enter_time2'] <> null then
            begin
                ShowMessage('»« «Ì‰ òœ Å–Ì—‘ ﬁ»·« Ìò ‰›— Ê«—œ ”Ì” „ ‘œÂ «” ');
            end
            else
            begin
                QSetEnter2.Parameters.ParamByName('ReceptionID').Value := edtReceptionID.Text;
                QSetEnter2.ExecSQL;
                ShowMessage('À»  Ê—Êœ');
            end;
        end;
    end
    else
    begin
        ShowMessage('òœ Å–Ì—‘ „⁄ »— ‰„Ì »«‘œ');
    end;
    lblCustomerName.Caption:='';
    lblStartTme.Caption:='';
    lblLocker.Caption:='';
    edtReceptionID.Clear;
    edtReceptionID.SetFocus;
end;
procedure TfrmEnter.btnSearchClick(Sender: TObject);
begin
    if edtReceptionID.Text='' then Exit;
    QReception.Close;
    QReception.Parameters.ParamByName('ReceptionID').Value:=edtReceptionID.Text;
    QReception.Parameters.ParamByName('service_center_id').Value := UserInfo.Service_center_id;
    QReception.Open;
    if QReception['ReceptionID']<>Null then
    begin
        if Time()-StrToTime(QReception['StartTime']) > StrToTime('1:00') then
        begin
            ShowMessage('„œ  “„«‰ «⁄ »«— »·Ìÿ »Â Å«Ì«‰ —”ÌœÂ «” ');
        end;
        lblLocker.Caption:=QReception['ClosedID'];
        lblCustomerName.Caption:=QReception['CustomerName'];
        lblStartTme.Caption:=QReception['StartTime'];
    end
    else
    begin
        ShowMessage('òœ Å–Ì—‘ „⁄ »— ‰„Ì »«‘œ');
        Exit;
    end;
end;

procedure TfrmEnter.FormCreate(Sender: TObject);

begin
    lblCustomerName.Caption:='';
    lblStartTme.Caption:='';
    lblLocker.Caption:='';
    lblType.Caption:='';
    lblUserName.Caption:='';
    lblCo1.Caption:='';
    lblCo2.Caption:='';
    lblCo3.Caption:='';
    lblCredit.Caption:='';
    QUser.Close;
    QUser.Parameters.ParamByName('UserID').Value := UserInfo.UserID;
    QUser.Open;
    if QUser['Entrance']<>null then
        UserInfo.Entrance := QUser['Entrance'];
    MediaPlayer1.Open;
end;

procedure TfrmEnter.edtReceptionIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
ColorBozorgsal, ColorKhordsal : TColor;
begin
if key=13 then
begin
ColorBozorgsal:=clBlue;
ColorKhordsal:=clRed;
    Shape1.Visible:=False;
    Shape2.Visible:=False;
    Shape3.Visible:=False;
    if key=13 then
    begin
        lblType.Caption:='';
        if edtReceptionID.Text='' then Exit;
        QSearch.Close;
        QSearch.Parameters.ParamByName('ReceptionID').Value:=edtReceptionID.Text;
        QSearch.Open;
        if QSearch['ReceptionID']<>Null then
        begin
            if UserInfo.Service_center_id <> QSearch['Service_center_id'] then
            begin
                ShowMessage('«Ì‰ »·Ìÿ „—»Êÿ »Â «Ì‰ Å«—ò ‰„Ì»«‘œ');
                Exit;
            end;
            if not QSearch['Active'] then
            begin
                MediaPlayer1.Play;
                ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— €Ì— ›⁄«· „Ì »«‘œ ·ÿ›« »« „œÌ— ””Ì” „  „«” »êÌ—Ìœ');
                lblLocker.Caption:='';
                lblCustomerName.Caption:='';
                lblStartTme.Caption:='';
                lblType.Caption:='';
                edtReceptionID.Clear;
                edtReceptionID.SetFocus;
                Exit;
            end;
            if Time()-StrToTime(QSearch['StartTime']) > StrToTime('1:00') then
            begin
                ShowMessage('„œ  “„«‰ «⁄ »«— »·Ìÿ »Â Å«Ì«‰ —”ÌœÂ «” ');
            end;
            if userinfo.Entrance = 1 then
            begin
              if QSearch['Enter'] then
              begin
                  MediaPlayer1.Play;
                  ShowMessage('»« «Ì‰ òœ ﬁ»·« Ìò  „‘ —Ì Ê«—œ Å«—ò ‘œÂ «” ');
                  lblLocker.Caption:='';
                  lblCustomerName.Caption:='';
                  lblStartTme.Caption:='';
                  lblType.Caption:='';
                  edtReceptionID.Clear;
                  edtReceptionID.SetFocus;
                  Exit;
              end;

                SP_Enter.Parameters.ParamByName('@ReceptionID').Value:=edtReceptionID.Text;
                SP_Enter.ExecProc;
                if SP_Enter.Parameters.ParamByName('@ReturnMessage').Value='error' then
                begin
                    MediaPlayer1.Play;
                    ShowMessage('»« «Ì‰ òœ Å–Ì—‘ ﬁ»·« Ìò ‰›— Ê«—œ ”Ì” „ ‘œÂ «” ');
                    edtReceptionID.Clear;
                    edtReceptionID.SetFocus;
                end;
            end
            else
            begin
              if not QSearch['Enter'] then
              begin
                  ShowMessage('Ê—ÊœÌ œ— Ê—ÊœÌ 1 À»  ‰‘œÂ «”  Ê «„ò«‰ À»  Ê—ÊœÌ œ— «Ì‰Ã« ‰„Ì»«‘œ');
                  Exit;
              end;
              QEntrance.Close;
              QEntrance.Parameters.ParamByName('ReceptionID').Value := edtReceptionID.Text;
              QEntrance.Open;

              if QEntrance['ReceptionID'] <> null then
                  if QEntrance['Gate2'] then
                  begin
                      MediaPlayer1.Play;
                      ShowMessage('»« «Ì‰ òœ ﬁ»·« Ìò  „‘ —Ì Ê«—œ Å«—ò ‘œÂ «” ');
                      lblLocker.Caption:='';
                      lblCustomerName.Caption:='';
                      lblStartTme.Caption:='';
                      lblType.Caption:='';
                      edtReceptionID.Clear;
                      edtReceptionID.SetFocus;
                      Exit;
                  end;
              QSetEntraneOnGate2.Close;
              QSetEntraneOnGate2.Parameters.ParamByName('ReceptionID').Value := edtReceptionID.Text;
              QSetEntraneOnGate2.ExecSQL;
            end;

            lblLocker.Caption:=IntToStr(QSearch['ClosedID']);
            lblCustomerName.Caption:=QSearch['CustomerName'];
            lblStartTme.Caption:=QSearch['StartTime'];
            lblUserName.Caption:=QSearch['UserName'];

            if QSearch['CardID']<>1 then
                lblCo1.Caption:=QSearch['Co1']
            else
                lblCo1.Caption:='';

            if QSearch['CardID2']<>1 then
                lblCo2.Caption:=QSearch['Co2']
            else
                lblCo2.Caption:='';

            if QSearch['CardID3']<>1 then
                lblCo3.Caption:=QSearch['Co3']
            else
                lblCo3.Caption:='';

            if QSearch['Credit']<>null then
                lblCredit.Caption:=QSearch['Credit']
            else
                lblCredit.Caption:='0';


            if QSearch['NumberOfAdult']=1 then
                lblType.Caption:='»“—ê”«·'
            else
                if QSearch['NumberOfAdult']=2 then
                    lblType.Caption:='»“—ê”«·'+'+'+'»“—ê”«·';

            if QSearch['NumberOfChild']=1 then
                if lblType.Caption<>'' then
                    lblType.Caption:=lblType.Caption+'+'+'Œ—œ”«·'
                else
                    lblType.Caption:='Œ—œ”«·'
            else
                if QSearch['NumberOfChild']=2 then
                    lblType.Caption:='Œ—œ”«·'+'+'+'Œ—œ”«·';

            if QSearch['NumberOfAdult']=1 then
            begin
                Shape1.Brush.Color:=ColorBozorgsal;
                Shape1.Visible:=True;
                if QSearch['NumberOfChild']=1 then
                begin
                    Shape2.Brush.Color:=ColorKhordsal;
                    Shape2.Visible:=True;
                end
                else
                begin
                    if QSearch['NumberOfChild']=2 then
                    begin
                        Shape2.Brush.Color:=ColorKhordsal;
                        Shape2.Visible:=True;
                        Shape3.Brush.Color:=ColorKhordsal;
                        Shape3.Visible:=True;
                    end;
                end;
            end
            else
                if QSearch['NumberOfAdult']=2 then
                begin
                        Shape1.Brush.Color:=ColorBozorgsal;
                        Shape1.Visible:=True;
                        Shape2.Brush.Color:=ColorBozorgsal;
                        Shape2.Visible:=True;
                        if QSearch['NumberOfChild']=1 then
                        begin
                            Shape3.Brush.Color:=ColorKhordsal;
                            Shape3.Visible:=True;
                        end;
                end
                else
                    if QSearch['NumberOfAdult']=3 then
                    begin
                        Shape1.Brush.Color:=ColorBozorgsal;
                        Shape1.Visible:=True;
                        Shape2.Brush.Color:=ColorBozorgsal;
                        Shape2.Visible:=True;
                        Shape3.Brush.Color:=ColorBozorgsal;
                        Shape3.Visible:=True;

                    end
                    else
                        if QSearch['NumberOfChild']=1 then
                        begin
                            Shape1.Brush.Color:=ColorKhordsal;
                            Shape1.Visible:=True;
                        end
                        else
                            if QSearch['NumberOfChild']=2 then
                            begin
                                Shape1.Brush.Color:=ColorKhordsal;
                                Shape1.Visible:=True;
                                Shape2.Brush.Color:=ColorKhordsal;
                                Shape2.Visible:=True;
                            end
                            else
                                if QSearch['NumberOfChild']=3 then
                            begin
                                Shape1.Brush.Color:=ColorKhordsal;
                                Shape1.Visible:=True;
                                Shape2.Brush.Color:=ColorKhordsal;
                                Shape2.Visible:=True;
                                Shape3.Brush.Color:=ColorKhordsal;
                                Shape3.Visible:=True;
                            end;
        end
        else
        begin
            MediaPlayer1.Play;
            ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
            lblLocker.Caption:='';
            lblCustomerName.Caption:='';
            //lblCurrentCredit.Caption:='';
            lblType.Caption:='';
            Exit;
        end;
    end;
    frmEnter.Refresh;
    edtReceptionID.Clear;
    edtReceptionID.SetFocus;
end;
end;

procedure TfrmEnter.ActionInsertExecute(Sender: TObject);
begin
    Application.CreateForm(TfrmIssueCreditCardTicket, frmIssueCreditCardTicket);
    frmIssueCreditCardTicket.ShowModal;
    FreeAndNil(frmIssueCreditCardTicket);
end;

end.
