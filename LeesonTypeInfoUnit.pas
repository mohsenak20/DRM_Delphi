unit LeesonTypeInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmLessonTypeInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QLessonType: TADOQuery;
    dsLessonType: TDataSource;
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
  frmLessonTypeInfo: TfrmLessonTypeInfo;

implementation
uses DMUnit, LessonTypeUnit;

{$R *.dfm}

procedure TfrmLessonTypeInfo.FormCreate(Sender: TObject);
begin
    QLessonType.Close;
    QLessonType.Parameters.ParamByName('title').Value:='%%';
    QLessonType.Open;
end;

procedure TfrmLessonTypeInfo.edtSearchChange(Sender: TObject);
begin
    QLessonType.Close;
    QLessonType.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QLessonType.Open;
end;

procedure TfrmLessonTypeInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLessonTypeInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmLessonTypeInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmLessonType, frmLessonType);
    frmLessonType.ShowModal;
    FreeAndNil(frmLessonType);
    QLessonType.Close;
    QLessonType.Open;
end;


end.
