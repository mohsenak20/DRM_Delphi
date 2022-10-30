unit AddClosedUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmAddClosed = class(TForm)
    Label12: TLabel;
    edtClosedNumber: TEdit;
    BtnEdit: TBitBtn;
    BtnReturn: TBitBtn;
    SP_AddClosed: TADOStoredProc;
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddClosed: TfrmAddClosed;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmAddClosed.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmAddClosed.BtnEditClick(Sender: TObject);
begin
    if StrToIntDef(edtClosedNumber.Text, 0) > 0 then
    begin
        SP_AddClosed.Parameters.ParamByName('@Count').Value:=edtClosedNumber.Text;
        SP_AddClosed.ExecProc;
        ShowMessage(' ÊÚÏÇÏ '+edtClosedNumber.Text+' ˜ãÏ ÇÖÇİå ÑÏíÏ');
        Close;
    end;
end;

end.
