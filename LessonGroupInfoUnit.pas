unit LessonGroupInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmLessonGroupInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QLessonGroup: TADOQuery;
    dsLessonGroup: TDataSource;
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
  frmLessonGroupInfo: TfrmLessonGroupInfo;

implementation
uses DMUnit, LessonTypeUnit, LessonGroupUnit;

{$R *.dfm}

procedure TfrmLessonGroupInfo.FormCreate(Sender: TObject);
begin
    QLessonGroup.Close;
    QLessonGroup.Parameters.ParamByName('title').Value:='%%';
    QLessonGroup.Open;
end;

procedure TfrmLessonGroupInfo.edtSearchChange(Sender: TObject);
begin
    QLessonGroup.Close;
    QLessonGroup.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QLessonGroup.Open;
end;

procedure TfrmLessonGroupInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLessonGroupInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLessonGroupInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLessonGroup, frmLessonGroup);
    frmLessonGroup.ShowModal;
    FreeAndNil(frmLessonGroup);
    QLessonGroup.Close;
    QLessonGroup.Open;
end;



end.
