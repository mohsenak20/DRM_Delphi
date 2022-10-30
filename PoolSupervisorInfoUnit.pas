unit PoolSupervisorInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPoolSupervisorInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QPoolSupervisor: TADOQuery;
    dsPoolSupervisor: TDataSource;
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
  frmPoolSupervisorInfo: TfrmPoolSupervisorInfo;

implementation
uses DMUnit, PoolsUnit, PoolSupervisorUnit;

{$R *.dfm}

procedure TfrmPoolSupervisorInfo.FormCreate(Sender: TObject);
begin
    QPoolSupervisor.Close;
    QPoolSupervisor.Parameters.ParamByName('name').Value:='%%';
    QPoolSupervisor.Open;
end;

procedure TfrmPoolSupervisorInfo.edtSearchChange(Sender: TObject);
begin
    QPoolSupervisor.Close;
    QPoolSupervisor.Parameters.ParamByName('name').Value:='%'+edtSearch.Text+'%';
    QPoolSupervisor.Open;
end;

procedure TfrmPoolSupervisorInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPoolSupervisorInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPoolSupervisorInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPoolSupervisor, frmPoolSupervisor);
    frmPoolSupervisor.ShowModal;
    FreeAndNil(frmPoolSupervisor);
    QPoolSupervisor.Close;
    QPoolSupervisor.Open;
end;

end.
