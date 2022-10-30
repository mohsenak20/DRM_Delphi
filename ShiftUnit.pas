unit ShiftUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmShift = class(TForm)
    rbMen: TRadioButton;
    rbWomen: TRadioButton;
    BtnSave: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShift: TfrmShift;

implementation

uses ShareUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmShift.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if rbMen.Checked then
        Parameter.Shift:=1
    else
        Parameter.Shift:=2;
end;

procedure TfrmShift.BtnSaveClick(Sender: TObject);
begin
    if rbMen.Checked then
        UserInfo.Shift:=1
    else
        UserInfo.Shift:=2;
    Close;
end;

end.
