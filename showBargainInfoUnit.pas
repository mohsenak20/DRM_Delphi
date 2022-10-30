unit showBargainInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmShowBargainInfo = class(TForm)
    QBargain: TADOQuery;
    btnSearch: TBitBtn;
    edtCardID: TEdit;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblBargainNumber: TLabel;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    lblCompanyName: TLabel;
    lblType: TLabel;
    Label12: TLabel;
    lblShift: TLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure edtCardIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure clear();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShowBargainInfo: TfrmShowBargainInfo;

implementation

uses DMUnit;

{$R *.dfm}

Procedure TfrmShowBargainInfo.clear();
begin

    lblBargainNumber.Caption := '';
    lblStartDate.Caption := '';
    lblEndDate.Caption := '';
    lblCompanyName.Caption := '';
    lblType.Caption := '';
    lblShift.Caption := '';
    edtCardID.SetFocus;
end;

procedure TfrmShowBargainInfo.btnSearchClick(Sender: TObject);
begin
    QBargain.Close;
    QBargain.Parameters.ParamByName('CardId').Value := edtCardID.Text;
    QBargain.Open;
    if QBargain['BargainId'] <> null then
    begin
        lblBargainNumber.Caption := QBargain['BargainNumber'];
        lblStartDate.Caption := QBargain['BargainDate'];
        lblEndDate.Caption := QBargain['BargainExpireDate'];
        lblCompanyName.Caption := QBargain['CompanyName'];
        if QBargain['GetMoney'] then
          lblType.Caption := ' Œ›Ì›Ì'
        else
          lblType.Caption := '100 œ—’œ  Œ›Ì›';

        if QBargain['SpecialForAfternoon'] then
          lblShift.Caption := '„Œ’Ê’ ‘Ì›  ⁄’—'
        else
          if QBargain['SpecialForNight'] then
            lblShift.Caption := '„Œ’Ê’ ‘Ì›  ‘»'
          else
            lblShift.Caption := ' „«„ Êﬁ ';
    end;
end;

procedure TfrmShowBargainInfo.edtCardIDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
      btnSearch.Click;
end;

procedure TfrmShowBargainInfo.FormShow(Sender: TObject);
begin
  clear;
end;

end.
