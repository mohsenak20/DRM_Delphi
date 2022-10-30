unit EmployeeInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmEmployeeInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QEmployee: TADOQuery;
    dsEmployee: TDataSource;
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
  frmEmployeeInfo: TfrmEmployeeInfo;

implementation
uses DMUnit, LessonTypeUnit, EmployeeUnit;


{$R *.dfm}

procedure TfrmEmployeeInfo.FormCreate(Sender: TObject);
begin
    QEmployee.Close;
    QEmployee.Parameters.ParamByName('name').Value:='%%';
    QEmployee.Open;
end;

procedure TfrmEmployeeInfo.edtSearchChange(Sender: TObject);
begin
    QEmployee.Close;
    QEmployee.Parameters.ParamByName('name').Value:='%'+edtSearch.Text+'%';
    QEmployee.Open;
end;

procedure TfrmEmployeeInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmEmployeeInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmEmployeeInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEmployee, frmEmployee);
    frmEmployee.ShowModal;
    FreeAndNil(frmEmployee);
    QEmployee.Close;
    QEmployee.Open;
end;


end.
