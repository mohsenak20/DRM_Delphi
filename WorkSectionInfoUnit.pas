unit WorkSectionInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmWorkSectionInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QWorkSection: TADOQuery;
    dsWorkSection: TDataSource;
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
  frmWorkSectionInfo: TfrmWorkSectionInfo;

implementation

uses DMUnit, WorkSectionUnit;

{$R *.dfm}
procedure TfrmWorkSectionInfo.FormCreate(Sender: TObject);
begin
    QWorkSection.Close;
    QWorkSection.Parameters.ParamByName('WorkSectionName').Value:='%%';
    QWorkSection.Open;
end;

procedure TfrmWorkSectionInfo.edtSearchChange(Sender: TObject);
begin
    QWorkSection.Close;
    QWorkSection.Parameters.ParamByName('WorkSectionName').Value:='%'+edtSearch.Text+'%';
    QWorkSection.Open;
end;

procedure TfrmWorkSectionInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmWorkSectionInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmWorkSectionInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmWorkSection, frmWorkSection);
    frmWorkSection.ShowModal;
    FreeAndNil(frmWorkSection);
    QWorkSection.Close;
    QWorkSection.Open;
end;

end.
