unit KalaGroupInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmKalaGroupInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QKalaGroup: TADOQuery;
    dsRiz: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnNewClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;


var
  frmKalaGroupInfo: TfrmKalaGroupInfo;

implementation

uses DMUnit, ProductUnit, KalaGroupUnit;

{$R *.dfm}

procedure TfrmKalaGroupInfo.FormCreate(Sender: TObject);
begin
    QKalaGroup.Close;
    QKalaGroup.Parameters.ParamByName('title').Value:='%%';
    QKalaGroup.Open;
end;

procedure TfrmKalaGroupInfo.edtSearchChange(Sender: TObject);
begin
    QKalaGroup.Close;
    QKalaGroup.Parameters.ParamByName('title').Value:='%'+edtSearch.Text+'%';
    QKalaGroup.Open;
end;

procedure TfrmKalaGroupInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmKalaGroupInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmKalaGroupInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmKalaGroup, frmKalaGroup);
    frmKalaGroup.ShowModal;
    FreeAndNil(frmKalaGroup);
    QKalaGroup.Close;
    QKalaGroup.Open;
end;

procedure TfrmKalaGroupInfo.DBGridDblClick(Sender: TObject);
begin
    strKey:='enter';
    Close;
end;

end.
