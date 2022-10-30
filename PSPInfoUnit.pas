unit PSPInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPSPInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QPSP: TADOQuery;
    dsPSP: TDataSource;
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
  frmPSPInfo: TfrmPSPInfo;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmPSPInfo.FormCreate(Sender: TObject);
begin
    QPSP.Close;
    QPSP.Parameters.ParamByName('title').Value:='%%';
    QPSP.Open;
end;

procedure TfrmPSPInfo.edtSearchChange(Sender: TObject);
begin
    QPSP.Close;
    QPSP.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QPSP.Open;
end;

procedure TfrmPSPInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPSPInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPSPInfo.DBGridDblClick(Sender: TObject);
begin
    strKey:='enter';
    Close;
end;


end.
