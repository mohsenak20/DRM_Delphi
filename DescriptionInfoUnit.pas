unit DescriptionInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  ActnList, ComCtrls;

type
  TfrmDescriptionInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QDescription: TADOQuery;
    dsDescription: TDataSource;
    StatusBar: TStatusBar;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionReturn: TAction;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnNewClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure ActionReturnExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;

var
  frmDescriptionInfo: TfrmDescriptionInfo;

implementation

uses DescriptionUnit;

{$R *.dfm}
procedure TfrmDescriptionInfo.FormCreate(Sender: TObject);
begin
    QDescription.Close;
    QDescription.Parameters.ParamByName('Description').Value:='%%';
    QDescription.Open;
end;

procedure TfrmDescriptionInfo.edtSearchChange(Sender: TObject);
begin
    QDescription.Close;
    QDescription.Parameters.ParamByName('Description').Value:='%'+edtSearch.Text+'%';
    QDescription.Open;
end;

procedure TfrmDescriptionInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmDescriptionInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmDescriptionInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmDescription, frmDescription);
    frmDescription.ShowModal;
    FreeAndNil(frmDescription);
    QDescription.Close;
    QDescription.Open;
    edtSearch.SetFocus;
end;

procedure TfrmDescriptionInfo.DBGridDblClick(Sender: TObject);
begin
    strKey:='enter';
    Close;
end;

procedure TfrmDescriptionInfo.ActionReturnExecute(Sender: TObject);
begin
    Close;
end;

end.
