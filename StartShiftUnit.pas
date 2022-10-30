unit StartShiftUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmStartShift = class(TForm)
    Label1: TLabel;
    edtShiftTitle: TEdit;
    btnShift: TBitBtn;
    edtShiftId: TEdit;
    Label2: TLabel;
    lblCurrentShift: TLabel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    QStartReception: TADOQuery;
    QCurrentShift: TADOQuery;
    chbLockerReset: TCheckBox;
    procedure BtnSaveClick(Sender: TObject);
    procedure btnShiftClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStartShift: TfrmStartShift;

implementation

uses DMUnit, ShiftInfoUnit;

{$R *.dfm}

procedure TfrmStartShift.BtnSaveClick(Sender: TObject);
begin
  if edtShiftId.Text <> '' then
  begin
    if (MessageBox(Self.Handle,'¬Ì« ‘Ì›  ÃœÌœÌ „Ì ŒÊ«ÂÌœ ‘—Ê⁄ ‰„«ÌÌœø','‘—Ê⁄ ‘Ì› ',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrYes)  Then
    begin
        QStartReception.Parameters.ParamByName('shiftId').Value := edtShiftId.Text;
        QStartReception.Parameters.ParamByName('lockerReset').Value := chbLockerReset.Checked;
        QStartReception.ExecSQL;
        Close;
    end;
  end;
end;

procedure TfrmStartShift.btnShiftClick(Sender: TObject);
begin
    Application.CreateForm(TfrmShiftInfo, frmShiftInfo);
    frmShiftInfo.ShowModal;
    if frmShiftInfo.strKey='enter' then
    begin
        edtShiftId.Text:=frmShiftInfo.QShift['id'];
        edtShiftTitle.Text:=frmShiftInfo.QShift['title'];
        chbLockerReset.Checked:=frmShiftInfo.QShift['lockerReset'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmShiftInfo);
end;

procedure TfrmStartShift.FormShow(Sender: TObject);
begin
    btnShift.SetFocus;
end;

procedure TfrmStartShift.FormCreate(Sender: TObject);
begin
    QCurrentShift.Open;
    if QCurrentShift['title'] <> null then
      lblCurrentShift.Caption := QCurrentShift['title']
    else
      lblCurrentShift.Caption := '';
end;

end.
