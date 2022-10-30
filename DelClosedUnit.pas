unit DelClosedUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons;

type
  TfrmDelClosed = class(TForm)
    Label12: TLabel;
    edtClosedNumber: TEdit;
    BtnEdit: TBitBtn;
    BtnReturn: TBitBtn;
    chbAll: TCheckBox;
    QDelClosed: TADOQuery;
    QDelAllClosed: TADOQuery;
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDelClosed: TfrmDelClosed;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmDelClosed.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmDelClosed.BtnEditClick(Sender: TObject);
begin
    if chbAll.Checked then
    begin
        if MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ  „«„ ò„œÂ« Õ–› ‘Ê‰œ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrNo then Exit;
        QDelAllClosed.ExecSQL;
        ShowMessage(' „«„ ò„œ Â« Õ–› ê—œÌœ');
        Close;
    end
    else
        if StrToIntDef(edtClosedNumber.Text, 0)>0 then
        begin
            if MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ ò„œÂ« Õ–› ‘Ê‰œ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrNo then Exit;
            QDelClosed.Close;
            QDelClosed.Parameters.ParamByName('ClosedCount1').Value:=edtClosedNumber.Text;
            QDelClosed.Parameters.ParamByName('ClosedCount2').Value:=edtClosedNumber.Text;
            QDelClosed.ExecSQL;
            ShowMessage(' ⁄œ«œ '+edtClosedNumber.Text+' Õ–› ê—œÌœ');
            Close;
        end;
end;

end.
