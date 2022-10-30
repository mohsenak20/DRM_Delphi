unit UserAttractionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ActnList, Menus, ComCtrls;

type
  TfrmUsedAttraction = class(TForm)
    edtKeyNumber: TEdit;
    Label1: TLabel;
    edtNumber: TEdit;
    Label2: TLabel;
    btnDeleteInfo: TBitBtn;
    SP_Factor: TADOStoredProc;
    SP_SubFactor: TADOStoredProc;
    Label3: TLabel;
    Label4: TLabel;
    lblName: TLabel;
    lblCredit: TLabel;
    QSearch: TADOQuery;
    SP_GetCurrentCredit: TADOStoredProc;
    Label5: TLabel;
    lblReceptionID: TLabel;
    QKala: TADOQuery;
    ActionList1: TActionList;
    Clear: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuDelete: TMenuItem;
    N3: TMenuItem;
    mnuExit: TMenuItem;
    StatusBar: TStatusBar;
    mnuReport: TMenuItem;
    lblUser: TLabel;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDeleteInfoClick(Sender: TObject);
    procedure edtKeyNumberExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure ClearForm();
    procedure FormShow(Sender: TObject);
    procedure ClearExecute(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuDeleteClick(Sender: TObject);
    procedure edtNumberExit(Sender: TObject);
    procedure mnuReportClick(Sender: TObject);
  private
    { Private declarations }
    VahedPrice : integer;
  public
    { Public declarations }
  end;

var
  frmUsedAttraction: TfrmUsedAttraction;

implementation

uses CalculatUnit, DMUnit, Math, MenuPasswordUnit;

{$R *.dfm}

procedure TfrmUsedAttraction.ClearForm();
begin
    edtKeyNumber.Clear;
    edtKeyNumber.SetFocus;
    edtNumber.Clear;
    lblReceptionID.Caption := '';
    lblName.Caption := '';
    lblCredit.Caption := '';
end;

procedure TfrmUsedAttraction.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmUsedAttraction.btnDeleteInfoClick(Sender: TObject);
var Credit, Price :integer;
begin
    if StrToIntDef(edtNumber.Text, 0) > 1000 then
    begin
        ShowMessage(' ⁄œ«œ Ê«—œÂ «“  ⁄œ«œ ‰›—«  „Ã«“ »Ì‘ — „Ì »«‘œ');
        edtNumber.Clear;
        Exit;
    end;
    SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QSearch['ReceptionID'];
    SP_GetCurrentCredit.ExecProc;
    Credit := SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    Price := VahedPrice * StrToInt(edtNumber.Text);
    if Price > Credit then
    begin
        ShowMessage('«⁄ »«— ò«›Ì ÃÂ  ’œÊ— ›«ò Ê— „ÊÃÊœ ‰„Ì »«‘œ');
        edtNumber.SetFocus;
        Exit;
    end;


    

    SP_Factor.Parameters.ParamByName('@ReceptionID').Value := lblReceptionID.Caption;
    SP_Factor.Parameters.ParamByName('@Description').Value:= '';
    SP_Factor.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Factor.Parameters.ParamByName('@Discount').Value:= '0';
    SP_Factor.Parameters.ParamByName('@FactorID').Value:=-1;
    SP_Factor.Parameters.ParamByName('@Active').Value:=True;
    SP_Factor.Parameters.ParamByName('@PercentDiscount').Value:=0;
    SP_Factor.Parameters.ParamByName('@Documentation').Value:=False;
    SP_Factor.Parameters.ParamByName('@Action').Value:='Insert';
    SP_Factor.ExecProc;

    SP_SubFactor.Parameters.ParamByName('@FactorID').Value := SP_Factor.Parameters.ParamByName('@OutFactorID').Value;

    SP_SubFactor.Parameters.ParamByName('@ProductID').Value:= UserInfo.KalaID;
    SP_SubFactor.Parameters.ParamByName('@Number').Value:= edtNumber.Text;

    SP_SubFactor.Parameters.ParamByName('@VahedPrice').Value := VahedPrice;
    SP_SubFactor.Parameters.ParamByName('@Description').Value:='';
    SP_SubFactor.Parameters.ParamByName('@StorageTitleID').Value := 1;
    SP_SubFactor.Parameters.ParamByName('@Active').Value:=True;
    SP_SubFactor.Parameters.ParamByName('@Action').Value:='Insert';
    SP_SubFactor.ExecProc;
    ClearForm;
end;

procedure TfrmUsedAttraction.edtKeyNumberExit(Sender: TObject);
begin
    if edtKeyNumber.Text='' then Exit;
    QSearch.Close;
    QSearch.Parameters.ParamByName('KeyNumber').Value:=edtKeyNumber.Text;
    QSearch.Open;
    if QSearch['ReceptionID']<>Null then
    begin
        if not QSearch['Active'] then
        begin
            ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— €Ì— ›⁄«· „Ì »«‘œ ·ÿ›« »« „œÌ— ””Ì” „  „«” »êÌ—Ìœ');
            lblName.Caption:='';
            lblCredit.Caption:='';
            Exit;
        end;
        lblReceptionID.Caption := QSearch['ReceptionID'];
        lblName.Caption:=QSearch['CustomerName'];
        SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QSearch['ReceptionID'];
        SP_GetCurrentCredit.ExecProc;
        lblCredit.Caption:=SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    end
    else
    begin
        ShowMessage('„‘ —Ì „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        ClearForm;
        Exit;
    end;

end;

procedure TfrmUsedAttraction.FormCreate(Sender: TObject);
begin
    QKala.Parameters.ParamByName('KalaID').Value := UserInfo.KalaID;
    QKala.Open;
    if QKala['VahedPrice'] <> null then
    begin
        VahedPrice := QKala['VahedPrice'];
        lblUser.Caption := UserInfo.UserName;
    end
    else
    begin
        ShowMessage('Œÿ« œ— „ﬁœ«— œÂÌ ﬁÌ„ ');
        Caption := 'Œÿ« œ— „ﬁœ«— œÂÌ ﬁÌ„ ';
    end;
end;

procedure TfrmUsedAttraction.FormShow(Sender: TObject);
begin
    ClearForm;
end;

procedure TfrmUsedAttraction.ClearExecute(Sender: TObject);
begin
    ClearForm;
end;

procedure TfrmUsedAttraction.mnuExitClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmUsedAttraction.mnuDeleteClick(Sender: TObject);
begin
    Application.CreateForm(TfrmMenuPassword, frmMenuPassword);
    frmMenuPassword.Caption:='—„“ Õ–› ›«ò Ê—';
    frmMenuPassword.Acction:='Delete';
    frmMenuPassword.ShowModal;
    FreeAndNil(frmMenuPassword);
end;

procedure TfrmUsedAttraction.edtNumberExit(Sender: TObject);
var Credit, Price :integer;
begin
    SP_GetCurrentCredit.Parameters.ParamByName('@ReceptionID').Value:=QSearch['ReceptionID'];
    SP_GetCurrentCredit.ExecProc;
    Credit := SP_GetCurrentCredit.Parameters.ParamByName('@CurrentCredit').Value;
    Price := VahedPrice * StrToInt(edtNumber.Text);
    if Price > Credit then
    begin
        ShowMessage('«⁄ »«— ò«›Ì ÃÂ  ’œÊ— ›«ò Ê— „ÊÃÊœ ‰„Ì »«‘œ');
        edtNumber.Clear;
        edtKeyNumber.SetFocus;
        Exit;
    end;
end;

procedure TfrmUsedAttraction.mnuReportClick(Sender: TObject);
begin
    Application.CreateForm(TfrmMenuPassword, frmMenuPassword);
    frmMenuPassword.Acction:='Print';
    frmMenuPassword.ShowModal;
    FreeAndNil(frmMenuPassword);
end;

end.
