unit LessonInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, Buttons;

type
  TfrmLessonInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtTitle: TEdit;
    DBGrid: TDBGrid;
    QLesson: TADOQuery;
    dsLesson: TDataSource;
    Label3: TLabel;
    edtCode: TEdit;
    rbEnrollment: TRadioButton;
    rbInTerm: TRadioButton;
    rbFinished: TRadioButton;
    rbAll: TRadioButton;
    BBtnAccept: TBitBtn;
    procedure rbAllClick(Sender: TObject);
    procedure edtCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    strKey : string;
  end;

var
  frmLessonInfo: TfrmLessonInfo;

implementation

uses CalculatUnit;

{$R *.dfm}

procedure TfrmLessonInfo.rbAllClick(Sender: TObject);
var
  strFilter: string;
begin
  if rbInTerm.Checked then strFilter := 'startDate <= '+QuotedStr(CurrentDate)+' and endDate >='+QuotedStr(CurrentDate);
  if rbEnrollment.Checked then strFilter := 'deadline <= '+QuotedStr(CurrentDate);
  if rbFinished.Checked then strFilter := 'endDate <'+QuotedStr(CurrentDate);
  if edtTitle.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and title like '+QuotedStr('%'+edtTitle.Text+'%')
    else
      strFilter := 'title like '+QuotedStr('%'+edtTitle.Text+'%');

  if edtCode.Text <> '' then
    if strFilter <> '' then
      strFilter := strFilter + ' and code like '+QuotedStr('%'+edtCode.Text+'%')
    else
      strFilter := 'code like '+QuotedStr('%'+edtCode.Text+'%');

  QLesson.Close;
  QLesson.SQL.Clear;
  QLesson.SQL.Add('Select TLesson.*, TLessonType.title lessonTypeTitle, TageCategory.title ageCategoryTitle,');
  QLesson.SQL.Add('TLessonGroup.title lessonGroupTitle ');
  QLesson.SQL.Add('From TLesson ');
  QLesson.SQL.Add('inner join TLessonType on TLesson.lessonTypeId = TLessonType.id');
  QLesson.SQL.Add('inner join TageCategory on TLesson.ageCategoryId = TageCategory.id');
  QLesson.SQL.Add('inner join TLessonGroup on TLesson.lessonGroupId = TLessonGroup.id');
  if strFilter <> '' then
    QLesson.SQL.Add('where '+strFilter);
  QLesson.SQL.Add('order by startDate DESC');
  QLesson.Open;

end;

procedure TfrmLessonInfo.edtCodeKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLessonInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLessonInfo.FormCreate(Sender: TObject);
begin
    QLesson.Open;
end;

end.
