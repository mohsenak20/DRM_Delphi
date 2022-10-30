unit LoginUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  TFLogin = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    EditUserName: TEdit;
    EditPassword: TEdit;
    BitLogin: TBitBtn;
    BtnExit: TBitBtn;
    SPLogin: TADOStoredProc;
    SPGetCurrentDate: TADOStoredProc;
    QUser: TADOQuery;
    QComputerAccess: TADOQuery;
    QGetDate: TADOQuery;
    QGetDate1: TADOQuery;
    QPcPos: TADOQuery;
    QComputer: TADOQuery;
    procedure BtnExitClick(Sender: TObject);
    procedure BitLoginClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function ComputerName():String;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    AppVersion : integer;
  end;

var
  FLogin: TFLogin;

implementation
{$R *.dfm}

Uses DMUnit, CalculatUnit, Math, UFarsiDate, ShareUnit;
function TFLogin.ComputerName():String;
var
  ComputerName: Array [0 .. 256] of char;
  Size: DWORD;
begin
  Size := 256;
  GetComputerName(ComputerName, Size);
  Result := ComputerName;
end;
procedure TFLogin.BtnExitClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFLogin.BitLoginClick(Sender: TObject);
begin
    if EditUserName.Text='' then Exit;
    SPLogin.Parameters.ParamByName('@UserName').Value:=EditUserName.Text;
    SPLogin.Parameters.ParamByName('@PassWord').Value:=EditPassWord.Text;
    SPLogin.ExecProc;

    IF SPLogin.Parameters.ParamByName('@UserID').Value=-1 Then
    Begin
        MessageBox(Self.Handle,'‰«„ ﬂ«—»— Ì« —„“ ⁄»Ê— «‘ »«Â Ê«—œ ‘œÂ «” ','—„“ ⁄»Ê—',MB_OK+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT );
        EditUserName.SetFocus;
    End
    Else
    begin
        if SPLogin.Parameters.ParamByName('@Version').Value > AppVersion Then
        begin
            ShowMessage('·ÿ›« ‰”ŒÂ ‰—„ «›“«— —« »Â —Ê“ —”«‰Ì ‰„«ÌÌœ');
            Halt;
        end;

        if SPLogin.Parameters.ParamByName('@UserID').Value=-2 Then
        begin
            MessageBox(Self.Handle,'‰«„ ﬂ«—»— ‘„« €Ì— ›⁄«· ‘œÂ «”  ·ÿ›« »« „œÌ— ”Ì” „  „«” »êÌ—Ìœ',' ÊÃÂ',MB_OK+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT );
            EditUserName.SetFocus;
        end
        else
        Begin
            SPGetCurrentDate.ExecProc;
            
            UserName:=Trim(EditUserName.Text);
            QUser.Parameters.ParamByName('UserID').Value:=SPLogin.Parameters.ParamByName('@UserID').Value;
            QUser.Open;
            UserInfo.UserID:=QUser['UserID'];
            UserInfo.UserName:=QUser.FieldByName('UserName').Text;
            UserInfo.Permission:=StrToInt(QUser.FieldByName('LevelPermission').Text);
            UserInfo.WorkSection:=QUser['WorkSection'];
            UserInfo.UseMenu:=QUser['UseMenu'];
            UserInfo.WorkSectionID:=QUser['WorkSectionID'];
            UserInfo.KalaID := QUser['KalaID'];
            UserInfo.Service_center_id := QUser['service_center_id'];
            UserInfo.service_center := QUser['title'];
            UserInfo.service_center_shortTitle := QUser['shortTitle'];
            UserInfo.userType := QUser['userTypeId'];
            UserInfo.amrieh :=  QUser['amrieh'];
            UserInfo.saleByBarcode := QUser['SaleByBarcode'];

            QGetDate.Close;
            QGetDate.Open;
            if QGetDate['CurrentDate']<>null then
                CurrentDate := TFarDate.MiladyToShamsistr(QGetDate['CurrentDate'])
            else
                CurrentDate:=InputBox(' «—ÌŒ Å–Ì—‘', '·ÿ›«  «—ÌŒ Ã«—Ì —« Ê«—œ ‰„«ÌÌœ', CurrentDate);
            //////////ramzoon////////////////////////
            //CurrentDate:=InputBox(' «—ÌŒ Å–Ì—‘', '·ÿ›«  «—ÌŒ Ã«—Ì —« Ê«—œ ‰„«ÌÌœ', CurrentDate);
            /////////////////////////////////////////

            SPLogin.Close;
            SPGetCurrentDate.Close;

            QComputer.Parameters.ParamByName('computerName').Value := ComputerName();
            QComputer.Open;
            if (QComputer['isAdmin'] <> null) then
                if QComputer['isAdmin'] = False then
                begin
                    QComputerAccess.Close;
                    QComputerAccess.Parameters.ParamByName('UserID').Value :=UserInfo.UserID;
                    QComputerAccess.Parameters.ParamByName('ComputerName').Value := ComputerName();
                    QComputerAccess.Open;
                    if QComputerAccess['ComputerName'] = null then
                    begin
                        ShowMessage('‘„« „ÃÊ“ Ê—Êœ »Â «Ì‰ ‰—„ «›“«— —« «“ «Ì‰ ”Ì” „ ‰œ«—Ìœ Ê œ—ŒÊ«”  Ê—Êœ ‘„« »Â „œÌ— ”Ì” „ «—”«· ê—œÌœ');
                        UserInfo.UserName := '';
                        Halt;
                    end;
                end;
                
            PosInfo.isPosActive := False;
            QPcPos.Parameters.ParamByName('ComputerName').Value := ComputerName();
            QPcPos.Open;
            if QPcPos['ComputerName'] <> null then
            begin
                if QPcPos['isActive'] then
                begin
                    PosInfo.posId := QPcPos['id'];
                    PosInfo.ip := QPcPos['ip'];
                    PosInfo.port := QPcPos['port'];
                    PosInfo.isPosActive := True;
                    PosInfo.PSP := QPcPos['pspId'];
                end;
            end;

            Self.Close;
        End;
    end;
end;

procedure TFLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
if key=27 then BtnExitClick(Sender);
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  AppVersion := 20
end;

end.
