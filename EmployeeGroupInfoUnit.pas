unit EmployeeGroupInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmEmployeeGroupInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QEmployeeGroup: TADOQuery;
    dsEmployeeGroup: TDataSource;
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
  frmEmployeeGroupInfo: TfrmEmployeeGroupInfo;

implementation
uses DMUnit, LessonTypeUnit, EmployeeGroupUnit;

{$R *.dfm}

procedure TfrmEmployeeGroupInfo.FormCreate(Sender: TObject);
begin
    QEmployeeGroup.Close;
    QEmployeeGroup.Parameters.ParamByName('title').Value:='%%';
    QEmployeeGroup.Open;
end;

procedure TfrmEmployeeGroupInfo.edtSearchChange(Sender: TObject);
begin
    QEmployeeGroup.Close;
    QEmployeeGroup.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QEmployeeGroup.Open;
end;

procedure TfrmEmployeeGroupInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmEmployeeGroupInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmEmployeeGroupInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEmployeeGroup, frmEmployeeGroup);
    frmEmployeeGroup.ShowModal;
    FreeAndNil(frmEmployeeGroup);
    QEmployeeGroup.Close;
    QEmployeeGroup.Open;
end;


end.
