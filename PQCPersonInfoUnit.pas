unit PQCPersonInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPQCPersonInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    Qpqc: TADOQuery;
    dsPQC: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;

var
  frmPQCPersonInfo: TfrmPQCPersonInfo;

implementation

{$R *.dfm}
procedure TfrmPQCPersonInfo.FormCreate(Sender: TObject);
begin
    Qpqc.Close;
    Qpqc.Parameters.ParamByName('Name').Value:='%%';
    Qpqc.Open;
end;

procedure TfrmPQCPersonInfo.edtSearchChange(Sender: TObject);
begin
    Qpqc.Close;
    Qpqc.Parameters.ParamByName('Name').Value:='%'+edtSearch.Text+'%';
    Qpqc.Open;
end;

procedure TfrmPQCPersonInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPQCPersonInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

end.
