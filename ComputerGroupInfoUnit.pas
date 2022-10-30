unit ComputerGroupInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmComputerGroupInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QComputerGroup: TADOQuery;
    dsComputerGroup: TDataSource;
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
  frmComputerGroupInfo: TfrmComputerGroupInfo;

implementation
uses DMUnit, ManageShiftsUnit, ComputerGroupUnit;
{$R *.dfm}


procedure TfrmComputerGroupInfo.FormCreate(Sender: TObject);
begin
    QComputerGroup.Close;
    QComputerGroup.Parameters.ParamByName('title').Value:='%%';
    QComputerGroup.Open;
end;

procedure TfrmComputerGroupInfo.edtSearchChange(Sender: TObject);
begin
    QComputerGroup.Close;
    QComputerGroup.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QComputerGroup.Open;
end;

procedure TfrmComputerGroupInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmComputerGroupInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmComputerGroupInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmComputerGroupInfo, frmComputerGroupInfo);
    frmComputerGroupInfo.ShowModal;
    FreeAndNil(frmComputerGroupInfo);
    QComputerGroup.Close;
    QComputerGroup.Open;
end;
end.
