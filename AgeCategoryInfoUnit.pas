unit AgeCategoryInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmAgeCategoryInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QAgeCategory: TADOQuery;
    dsAgeCategory: TDataSource;
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
  frmAgeCategoryInfo: TfrmAgeCategoryInfo;

implementation
uses DMUnit, AgeCategoryUnit;

{$R *.dfm}

procedure TfrmAgeCategoryInfo.FormCreate(Sender: TObject);
begin
    QAgeCategory.Close;
    QAgeCategory.Parameters.ParamByName('title').Value:='%%';
    QAgeCategory.Open;
end;

procedure TfrmAgeCategoryInfo.edtSearchChange(Sender: TObject);
begin
    QAgeCategory.Close;
    QAgeCategory.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QAgeCategory.Open;
end;

procedure TfrmAgeCategoryInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmAgeCategoryInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmAgeCategoryInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmAgeCategory, frmAgeCategory);
    frmAgeCategory.ShowModal;
    FreeAndNil(frmAgeCategory);
    QAgeCategory.Close;
    QAgeCategory.Open;
end;

end.
