unit WorkSectionHealthCardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmWorkSectionHealthCard = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QWorkSectionHealthCard: TADOQuery;
    dsWorkSectionHealthCard: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;

var
  frmWorkSectionHealthCard: TfrmWorkSectionHealthCard;

implementation
uses DMUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmWorkSectionHealthCard.FormCreate(Sender: TObject);
begin
    QWorkSectionHealthCard.Close;
    QWorkSectionHealthCard.Parameters.ParamByName('WorkSectionHealthCard').Value:='%%';
    QWorkSectionHealthCard.Open;
end;

procedure TfrmWorkSectionHealthCard.edtSearchChange(Sender: TObject);
begin
    QWorkSectionHealthCard.Close;
    QWorkSectionHealthCard.Parameters.ParamByName('WorkSectionHealthCard').Value:='%'+edtSearch.Text+'%';
    QWorkSectionHealthCard.Open;
end;

procedure TfrmWorkSectionHealthCard.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmWorkSectionHealthCard.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmWorkSectionHealthCard.DBGridDblClick(Sender: TObject);
begin
    strKey:='enter';
    Close;
end;

end.
