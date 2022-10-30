unit GetAccessToLoginUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmGetAccessToLogin = class(TForm)
    Label2: TLabel;
    Label5: TLabel;
    edtCreditCardID: TEdit;
    btnNID: TBitBtn;
    edtNID: TEdit;
    procedure btnNIDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGetAccessToLogin: TfrmGetAccessToLogin;

implementation

{$R *.dfm}

procedure TfrmGetAccessToLogin.btnNIDClick(Sender: TObject);
begin
    ShowMessage('œ—” —”Ì ›⁄«· ê—œÌœ');
end;

end.
