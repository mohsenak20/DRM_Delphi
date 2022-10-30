unit SubBargainCoInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSubBargainCoInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QSubBargainCo: TADOQuery;
    dsSubBargainCo: TDataSource;
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
  frmSubBargainCoInfo: TfrmSubBargainCoInfo;

implementation

uses CompanyUnit, DMUnit, SubCoUnit;

{$R *.dfm}
procedure TfrmSubBargainCoInfo.FormCreate(Sender: TObject);
begin
    QSubBargainCo.Close;
    QSubBargainCo.Parameters.ParamByName('SubBargainCoName').Value:='%%';
    QSubBargainCo.Open;
end;

procedure TfrmSubBargainCoInfo.edtSearchChange(Sender: TObject);
begin
    QSubBargainCo.Close;
    QSubBargainCo.Parameters.ParamByName('SubBargainCoName').Value:='%'+edtSearch.Text+'%';
    QSubBargainCo.Open;
end;

procedure TfrmSubBargainCoInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSubBargainCoInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmSubBargainCoInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSubCo, frmSubCo);
    frmSubCo.ShowModal;
    FreeAndNil(frmSubCo);
    QSubBargainCo.Close;
    QSubBargainCo.Open;
end;

end.
