unit ByUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons;

type
  TfrmBy = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblKeyNumber: TLabel;
    lblCustomerName: TLabel;
    lblStartTme: TLabel;
    lblCredit: TLabel;
    Label17: TLabel;
    lblReceptionID: TLabel;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    btnSearch: TBitBtn;
    edtKeyNumber: TEdit;
    BtnSave: TBitBtn;
    BtnReturn: TBitBtn;
    QReception: TADOQuery;
    SP_By: TADOStoredProc;
    Label1: TLabel;
    lblActive: TLabel;
    SP_GetCurrentCredit: TADOStoredProc;
    procedure btnSearchClick(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure ClearForm();
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBy: TfrmBy;

implementation

uses DMUnit;

{$R *.dfm}
procedure TfrmBy.ClearForm();
begin
    lblReceptionID.Caption:='';
    lblKeyNumber.Caption:='';
    lblCustomerName.Caption:='';
    lblStartTme.Caption:='';
    lblCredit.Caption:='';
    edtKeyNumber.Clear;
    lblActive.Caption:='';
end;


procedure TfrmBy.btnSearchClick(Sender: TObject);
begin
    
    QReception.Close;
    QReception.Parameters.ParamByName('KeyNumber').Value:=edtKeyNumber.Text;
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
                lblCredit.Caption:=IntToStr(QReception['Credit']);
                SP_GetCurrentCredit.Parameters.ParamByName('@KeyNumber').Value:=edtKeyNumber.Text;
                SP_GetCurrentCredit.ExecProc;
                lblCredit.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
                BtnSave.SetFocus;              
                if QReception['Active'] then
                    lblActive.Caption:='œ«—œ'
                else
                begin
                    lblActive.Caption:='‰œ«—œ';
                    ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „ÃÊ“ Œ—ÊÃ ‰œ«—œ');
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

procedure TfrmBy.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmBy.BtnSaveClick(Sender: TObject);
begin
    if not QReception['Active'] then
        if MessageBox(Self.Handle,'„‘ —Ì „Ê—œ ‰Ÿ— „ÃÊ“ Œ—ÊÃ ‰œ«—œ ¬Ì« „‘ —Ì «“ ”Ì” „ Œ«—Ã ‘Êœø','„ÃÊ“ Œ—ÊÃ',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrNo then Exit;
    if QReception['ReceptionID']<>Null then
    begin
        SP_By.Parameters.ParamByName('@ReceptionID').Value:=QReception['ReceptionID'];
        SP_By.ExecProc;
        ClearForm;
    end;
end;

procedure TfrmBy.FormShow(Sender: TObject);
begin
    ClearForm;
    edtKeyNumber.SetFocus;
end;

procedure TfrmBy.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

end.
