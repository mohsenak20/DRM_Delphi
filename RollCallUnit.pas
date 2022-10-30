unit RollCallUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TfrmRollCall = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    QRollCall: TADOQuery;
    dsRollCall: TDataSource;
    Label16: TLabel;
    Label3: TLabel;
    edtStudentId: TEdit;
    edtStudentName: TEdit;
    btnStudent: TBitBtn;
    edtTermId: TEdit;
    edtTermTitle: TEdit;
    btnTerm: TBitBtn;
    BtnSave: TBitBtn;
    BtnNew: TBitBtn;
    SP_RollCall: TADOStoredProc;
    Label1: TLabel;
    Label2: TLabel;
    lblSessionDate: TLabel;
    lblTermScheduleId: TLabel;
    procedure btnStudentClick(Sender: TObject);
    procedure btnTermClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRollCall: TfrmRollCall;

implementation

uses DMUnit, StudentInfoUnit, TermInfoUnit, TermScheduleInfoUnit,
  CalculatUnit;

{$R *.dfm}

procedure TfrmRollCall.btnStudentClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStudentInfo, frmStudentInfo);
    frmStudentInfo.ShowModal;
    if frmStudentInfo.strKey='enter' then
    begin
        edtStudentId.Text:=frmStudentInfo.QStudent['id'];
        edtStudentName.Text:=frmStudentInfo.QStudent['name']+' '+frmStudentInfo.QStudent['family'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmStudentInfo);
end;

procedure TfrmRollCall.btnTermClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTermInfo, frmTermInfo);
    frmTermInfo.ShowModal;
    if frmTermInfo.strKey='enter' then
    begin
        edtTermId.Text:=frmTermInfo.QTerm['id'];
        edtTermTitle.Text:=frmTermInfo.QTerm['title'];
        Application.CreateForm(TfrmTermScheduleInfo, frmTermScheduleInfo);
        frmTermScheduleInfo.edtTermId.Text := edtTermId.Text;
        frmTermScheduleInfo.edtTermTitle.Text := edtTermTitle.Text;
        frmTermScheduleInfo.ShowModal;
        if frmTermScheduleInfo.strKey='enter' then
        begin
            lblTermScheduleId.Caption := frmTermScheduleInfo.QTermSchedule['id'];
            lblSessionDate.Caption := frmTermScheduleInfo.QTermSchedule['sessionDate'];
            QRollCall.Close;
            QRollCall.Parameters.ParamByName('termScheduleId').Value := frmTermScheduleInfo.QTermSchedule['id'];
            QRollCall.Open;
        end;
        FreeAndNil(frmTermInfo);
        btnStudent.SetFocus;
    end;
    FreeAndNil(frmTermInfo);
end;

procedure TfrmRollCall.BtnSaveClick(Sender: TObject);
begin
  SP_RollCall.Parameters.ParamByName('@termScheduleId').Value := lblTermScheduleId.Caption;
  SP_RollCall.Parameters.ParamByName('@studentId').Value := edtStudentId.Text;
  SP_RollCall.Parameters.ParamByName('@userId').Value := UserInfo.UserID;
  SP_RollCall.Parameters.ParamByName('@Action').Value := 'Insert';
  SP_RollCall.ExecProc;
  QRollCall.Close;
  QRollCall.Open;
  btnStudentClick(Sender);
end;

procedure TfrmRollCall.FormCreate(Sender: TObject);
begin
    lblSessionDate.Caption := '';
    lblTermScheduleId.Caption := '';
end;

end.
