unit VahedInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmVahedInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QVahed: TADOQuery;
    dsVahed: TDataSource;
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
  frmVahedInfo: TfrmVahedInfo;

implementation
uses DMUnit, VahedUnit;
{$R *.dfm}
procedure TfrmVahedInfo.FormCreate(Sender: TObject);
begin
    QVahed.Close;
    QVahed.Parameters.ParamByName('VahedName').Value:='%%';
    QVahed.Open;
end;

procedure TfrmVahedInfo.edtSearchChange(Sender: TObject);
begin
    QVahed.Close;
    QVahed.Parameters.ParamByName('VahedName').Value:='%'+edtSearch.Text+'%';
    QVahed.Open;
end;

procedure TfrmVahedInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmVahedInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmVahedInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmVahed, frmVahed);
    frmVahed.ShowModal;
    FreeAndNil(frmVahed);
    QVahed.Close;
    QVahed.Open;
end;

end.
