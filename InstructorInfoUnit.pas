unit InstructorInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmInstructorInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QInstructor: TADOQuery;
    dsInstructor: TDataSource;
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
  frmInstructorInfo: TfrmInstructorInfo;

implementation
uses DMUnit, PoolsUnit, InstructorUnit;

{$R *.dfm}

procedure TfrmInstructorInfo.FormCreate(Sender: TObject);
begin
    QInstructor.Close;
    QInstructor.Parameters.ParamByName('name').Value:='%%';
    QInstructor.Open;
end;

procedure TfrmInstructorInfo.edtSearchChange(Sender: TObject);
begin
    QInstructor.Close;
    QInstructor.Parameters.ParamByName('name').Value:='%'+edtSearch.Text+'%';
    QInstructor.Open;
end;

procedure TfrmInstructorInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmInstructorInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmInstructorInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmInstructor, frmInstructor);
    frmInstructor.ShowModal;
    FreeAndNil(frmInstructor);
    QInstructor.Close;
    QInstructor.Open;
end;


end.
