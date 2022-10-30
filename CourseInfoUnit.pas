unit CourseInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCourceInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QCourse: TADOQuery;
    dsCourse: TDataSource;
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
  frmCourceInfo: TfrmCourceInfo;

implementation
uses DMUnit, CourseUnit;

{$R *.dfm}

procedure TfrmCourceInfo.FormCreate(Sender: TObject);
begin
    QCourse.Close;
    QCourse.Parameters.ParamByName('title').Value:='%%';
    QCourse.Open;
end;

procedure TfrmCourceInfo.edtSearchChange(Sender: TObject);
begin
    QCourse.Close;
    QCourse.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QCourse.Open;
end;

procedure TfrmCourceInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCourceInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCourceInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCourse, frmCourse);
    frmCourse.ShowModal;
    FreeAndNil(frmCourse);
    QCourse.Close;
    QCourse.Open;
end;

end.
