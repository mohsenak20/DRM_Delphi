unit ChangingLockerNumberUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons;

type
  TfrmChangingLockerNumber = class(TForm)
    Label20: TLabel;
    edtFirst: TEdit;
    Label1: TLabel;
    edtLast: TEdit;
    BtnSave: TBitBtn;
    QCheckLocker: TADOQuery;
    Label2: TLabel;
    lblName: TLabel;
    Label4: TLabel;
    lblReceptionId: TLabel;
    QChangingLocker: TADOQuery;
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangingLockerNumber: TfrmChangingLockerNumber;

implementation

uses DMUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmChangingLockerNumber.BtnSaveClick(Sender: TObject);
begin
  QCheckLocker.Close;
  QCheckLocker.Parameters.ParamByName('keyNumber').Value := edtLast.Text;
  QCheckLocker.Parameters.ParamByName('serviceCenterId').Value := UserInfo.Service_center_id;
  QCheckLocker.Open;
  if QCheckLocker['ClosedID'] = null then
  begin
      ShowMessage('‘„«Â ò„œ „ﬁ’œ „⁄ »— ‰„Ì »«‘œ');
      Exit;
  end;
  if QCheckLocker['lend'] <> 0 then
  begin
      ShowMessage('ê„œ „Ê—œ ‰Ÿ— «‘€«· „Ì »«‘œ');
      Exit;
  end;
  QChangingLocker.Close;
  QChangingLocker.Parameters.ParamByName('KeyNumber').Value := edtLast.Text;
  QChangingLocker.Parameters.ParamByName('serviceCenterId').Value := UserInfo.Service_center_id;
  QChangingLocker.Parameters.ParamByName('oldKeyNumber').Value := edtFirst.Text;
  QChangingLocker.Parameters.ParamByName('ReceptionId').Value := lblReceptionId.Caption;
  QChangingLocker.ExecSQL;
  ShowMessage('ò„œ „Ê—œ ‰Ÿ—  €ÌÌ— ‰„Êœ');
  Close;
end;

end.
