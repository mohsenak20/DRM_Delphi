unit StudentInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmStudentInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QStudent: TADOQuery;
    dsStudent: TDataSource;
    chbSuspend: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;
  end;


var
  frmStudentInfo: TfrmStudentInfo;

implementation
uses DMUnit, studentUnit;
{$R *.dfm}

procedure TfrmStudentInfo.FormCreate(Sender: TObject);
begin
    QStudent.Close;
    QStudent.Parameters.ParamByName('family').Value:='%%';
    QStudent.Parameters.ParamByName('isSuspend').Value:=chbSuspend.Checked;
    QStudent.Open;
end;

procedure TfrmStudentInfo.edtSearchChange(Sender: TObject);
begin
    QStudent.Close;
    QStudent.Parameters.ParamByName('family').Value:='%'+edtSearch.Text+'%';
    QStudent.Parameters.ParamByName('isSuspend').Value:=chbSuspend.Checked;
    QStudent.Open;
end;

procedure TfrmStudentInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=13 then
        DBGrid.SetFocus
    else
        if Key=27 then
        begin
            Close;
        end;
end;

procedure TfrmStudentInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then
    begin
        strKey:='enter';
        Close;
    end
    else
        if key=27 then
            Close;
end;

procedure TfrmStudentInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmStudent, frmStudent);
    frmStudent.ShowModal;
    FreeAndNil(frmStudent);
    QStudent.Close;
    QStudent.Open;
end;


end.
