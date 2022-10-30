unit ExpireDateUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DB, ADODB;

type
  TfrmExpireDate = class(TForm)
    Label14: TLabel;
    edtExpireDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    gbCard: TGroupBox;
    gbBargain: TGroupBox;
    rbCard: TRadioButton;
    rbBargain: TRadioButton;
    edtCardID: TEdit;
    edtBargainID: TEdit;
    QCard: TADOQuery;
    QBargain: TADOQuery;
    GroupBox1: TGroupBox;
    edtStartCardNumber: TEdit;
    Label1: TLabel;
    edtEndCardNumber: TEdit;
    Label2: TLabel;
    rbFromTo: TRadioButton;
    QFromTo: TADOQuery;
    gbAllBargain: TGroupBox;
    Label12: TLabel;
    edtCompanyID: TEdit;
    edtCompanyName: TEdit;
    btnCompany: TBitBtn;
    QAllBargain: TADOQuery;
    rbAllBargain: TRadioButton;
    btnBargain: TBitBtn;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    Label4: TLabel;
    edtEndDate: TMaskEdit;
    rbStartDateTo: TRadioButton;
    QBargainDateTo: TADOQuery;
    procedure rbBargainClick(Sender: TObject);
    procedure rbCardClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCompanyClick(Sender: TObject);
    procedure rbAllBargainClick(Sender: TObject);
    procedure btnBargainClick(Sender: TObject);
    procedure rbFromToClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExpireDate: TfrmExpireDate;

implementation

uses DMUnit, UnitCompanyInfo, BargainInfoUnit;

{$R *.dfm}

procedure TfrmExpireDate.rbBargainClick(Sender: TObject);
begin
    gbAllBargain.Enabled:=False;
    gbBargain.Enabled:=True;
    gbCard.Enabled := False;
    GroupBox1.Enabled := False;
end;

procedure TfrmExpireDate.rbCardClick(Sender: TObject);
begin
    gbAllBargain.Enabled:=False;
    gbBargain.Enabled:=False;
    GroupBox1.Enabled :=False;
    gbCard.Enabled := True;
end;

procedure TfrmExpireDate.BBtnAcceptClick(Sender: TObject);
begin
    if edtExpireDate.Text<>'1   /  /  ' then
    begin
        if (rbCard.Checked) and (StrToIntDef(edtCardID.Text, 0)<>0) then
        begin
            QCard.Close;
            QCard.Parameters.ParamByName('ExpireDate').Value:=edtExpireDate.Text;
            QCard.Parameters.ParamByName('CardID').Value:=edtCardID.Text;
            QCard.ExecSQL;
            ShowMessage('«⁄ »«— ò«—   €ÌÌ— ‰„Êœ');
            edtCardID.Clear;
            edtCardID.SetFocus;
        end
        else

            if (rbBargain.Checked) and (StrToIntDef(edtBargainID.Text, 0)<>0) then
            begin
                QBargain.Close;
                QBargain.Parameters.ParamByName('ExpireDate').Value:=edtExpireDate.Text;
                QBargain.Parameters.ParamByName('BargainID').Value:=edtBargainID.Text;
                QBargain.ExecSQL;
                ShowMessage('«⁄ »«— ﬁ—«—œ«œ  €ÌÌ— ‰„Êœ');
            end
            else
                if (rbFromTo.Checked) and (StrToIntDef(edtStartCardNumber.Text, 0)<>0) and (StrToIntDef(edtEndCardNumber.Text, 0)<>0) then
                begin
                    ShowMessage(' ⁄œ«œ  ò«— Â« ÃÂ   «ÌÌœ'+IntToStr(StrToIntDef(edtEndCardNumber.Text, 0)-StrToIntDef(edtStartCardNumber.Text, 0))+' „Ì »«‘œ');
                      if (MessageBox(Self.Handle,'¬Ì« «⁄ »«— ò«— Â«  €ÌÌ— ‰„«Ìœø',' €ÌÌ— «⁄ »«—ò«— Â«',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;

                    QFromTo.Close;
                    QFromTo.Parameters.ParamByName('ExpireDate').Value:=edtExpireDate.Text;
                    QFromTo.Parameters.ParamByName('StartCardID').Value:=edtStartCardNumber.Text;
                    QFromTo.Parameters.ParamByName('EndCardID').Value:=edtEndCardNumber.Text;
                    QFromTo.ExecSQL;
                    ShowMessage('«⁄ »«— ò«— Â«  €ÌÌ— ‰„Êœ');
                end
                else
                    if (rbAllBargain.Checked) and (StrToIntDef(edtCompanyID.Text, 0)<>0) then
                    begin
                          if (MessageBox(Self.Handle,'¬Ì« «⁄ »«— ò«— Â«  €ÌÌ— ‰„«Ìœø',' €ÌÌ— «⁄ »«—ò«— Â«',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
                          QAllBargain.Close;
                          QAllBargain.Parameters.ParamByName('ExpireDate').Value := edtExpireDate.Text;
                          QAllBargain.Parameters.ParamByName('CompanyID').Value := edtCompanyID.Text;
                          QAllBargain.ExecSQL;
                          ShowMessage('«⁄ »«— ò«— Â«  €ÌÌ— ‰„Êœ');
                    end
                    else
                      if (rbStartDateTo.Checked) and (edtStartDate.Text <> '1   /  /  ') and (edtEndDate.Text <> '1   /  /  ') then
                      begin
                          QBargainDateTo.Close;
                          QBargainDateTo.Parameters.ParamByName('ExpireDate').Value := edtExpireDate.Text;
                          QBargainDateTo.Parameters.ParamByName('startDate').Value := edtStartDate.Text;
                          QBargainDateTo.Parameters.ParamByName('endDate').Value := edtEndDate.Text;
                          QBargainDateTo.ExecSQL;
                          ShowMessage('«⁄ »«— ò«— Â«  €ÌÌ— ‰„Êœ');
                      end;

    end
    else
        ShowMessage('·ÿ›«  «—ÌŒ —« Ê«—œ ‰„«ÌÌœ');
end;

procedure TfrmExpireDate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmExpireDate.btnCompanyClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCompanyInfo, frmCompanyInfo);
    frmCompanyInfo.ShowModal;
    if frmCompanyInfo.strKey='enter' then
    begin
        edtCompanyID.Text:=frmCompanyInfo.QCompany['CompanyID'];
        edtCompanyName.Text:=frmCompanyInfo.QCompany['CompanyName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmCompanyInfo);
end;

procedure TfrmExpireDate.rbAllBargainClick(Sender: TObject);
begin
    gbAllBargain.Enabled:=True;
    gbBargain.Enabled:=False;
    gbCard.Enabled := False;
    GroupBox1.Enabled := False;
end;

procedure TfrmExpireDate.btnBargainClick(Sender: TObject);
begin
    Application.CreateForm(TfrmBargainInfo, frmBargainInfo);
    frmBargainInfo.ShowModal;
    if frmBargainInfo.strKey='enter' then
    begin
        edtBargainID.Text:=frmBargainInfo.QBargain['BargainID'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmBargainInfo);
end;

procedure TfrmExpireDate.rbFromToClick(Sender: TObject);
begin
    gbAllBargain.Enabled:=False;
    gbBargain.Enabled:=False;
    gbCard.Enabled := False;
    GroupBox1.Enabled := True;
end;

end.
