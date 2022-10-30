unit PoolInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPoolsInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QPool: TADOQuery;
    dsPool: TDataSource;
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
  frmPoolsInfo: TfrmPoolsInfo;

implementation
uses DMUnit, PoolsUnit;

{$R *.dfm}

procedure TfrmPoolsInfo.FormCreate(Sender: TObject);
begin
    QPool.Close;
    QPool.Parameters.ParamByName('title').Value:='%%';
    QPool.Open;
end;

procedure TfrmPoolsInfo.edtSearchChange(Sender: TObject);
begin
    QPool.Close;
    QPool.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QPool.Open;
end;

procedure TfrmPoolsInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPoolsInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPoolsInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPools, frmPools);
    frmPools.ShowModal;
    FreeAndNil(frmPools);
    QPool.Close;
    QPool.Open;
end;

end.
