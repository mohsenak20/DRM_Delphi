unit SectionInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSectionInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QSection: TADOQuery;
    dsSection: TDataSource;
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
  frmSectionInfo: TfrmSectionInfo;

implementation

uses SectionUnit;

{$R *.dfm}


procedure TfrmSectionInfo.FormCreate(Sender: TObject);
begin
    QSection.Close;
    QSection.Parameters.ParamByName('Title').Value:='%%';
    QSection.Open;
end;

procedure TfrmSectionInfo.edtSearchChange(Sender: TObject);
begin
    QSection.Close;
    QSection.Parameters.ParamByName('Title').Value:='%'+edtSearch.Text+'%';
    QSection.Open;
end;

procedure TfrmSectionInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSectionInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSectionInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSection, frmSection);
    frmSection.ShowModal;
    FreeAndNil(frmSection);
    QSection.Close;
    QSection.Open;
end;

end.
