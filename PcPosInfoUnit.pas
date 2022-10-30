unit PcPosInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPcPosInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QPcPos: TADOQuery;
    dsPcPos: TDataSource;
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
  frmPcPosInfo: TfrmPcPosInfo;

implementation
uses DMUnit, PcPosUnit;

{$R *.dfm}

procedure TfrmPcPosInfo.FormCreate(Sender: TObject);
begin
    QPcPos.Close;
    QPcPos.Parameters.ParamByName('title').Value:='%%';
    QPcPos.Open;
end;

procedure TfrmPcPosInfo.edtSearchChange(Sender: TObject);
begin
    QPcPos.Close;
    QPcPos.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QPcPos.Open;
end;

procedure TfrmPcPosInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPcPosInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPcPosInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPcPos, frmPcPos);
    frmPcPos.ShowModal;
    FreeAndNil(frmPcPos);
    QPcPos.Close;
    QPcPos.Open;
end;

end.
