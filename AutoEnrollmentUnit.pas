unit AutoEnrollmentUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TfrmAutoEnrollment = class(TForm)
    Panel2: TPanel;
    Label3: TLabel;
    edtTermId: TEdit;
    edtTermTitle: TEdit;
    btnTerm: TBitBtn;
    btnTermEnrollment: TBitBtn;
    Label1: TLabel;
    lblTermCount: TLabel;
    QTermCount: TADOQuery;
    SP_AutoEnrollment: TADOStoredProc;
    QCheckBeforEnrollment: TADOQuery;
    procedure btnTermClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTermEnrollmentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutoEnrollment: TfrmAutoEnrollment;

implementation

uses DMUnit, TermInfoUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmAutoEnrollment.btnTermClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTermInfo, frmTermInfo);
    frmTermInfo.ShowModal;
    if frmTermInfo.strKey='enter' then
    begin
        edtTermId.Text:=frmTermInfo.QTerm['id'];
        edtTermTitle.Text:=frmTermInfo.QTerm['title'];
        QTermCount.Close;
        QTermCount.Parameters.ParamByName('termId').Value := edtTermId.Text;
        QTermCount.Open;
        lblTermCount.Caption := QTermCount['count'];
    end;
    FreeAndNil(frmTermInfo);
end;

procedure TfrmAutoEnrollment.FormCreate(Sender: TObject);
begin
  lblTermCount.Caption := '';
end;

procedure TfrmAutoEnrollment.btnTermEnrollmentClick(Sender: TObject);
begin
  if edtTermId.Text <> '' then
  begin
    QCheckBeforEnrollment.Close;
    QCheckBeforEnrollment.Parameters.ParamByName('termId').Value := edtTermId.Text;
    QCheckBeforEnrollment.Open;
    if QCheckBeforEnrollment['id'] <> null then
    begin
        ShowMessage('ﬁ»·« »—«Ì «Ì‰  —„ À»  ‰«„Ì «‰Ã«„ ‘œÂ «”  Ê «„ò«‰ À»  ‰«„ ò·Ì ÊÃÊœ ‰œ«—œ');
        Exit;
    end;
    SP_AutoEnrollment.Parameters.ParamByName('@termId').Value := edtTermId.Text;
    SP_AutoEnrollment.Parameters.ParamByName('@enrollmentDate').Value := CurrentDate;
    SP_AutoEnrollment.Parameters.ParamByName('@userId').Value := UserInfo.UserID;
    SP_AutoEnrollment.ExecProc;
  end;
end;

end.
