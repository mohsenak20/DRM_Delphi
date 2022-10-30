unit VisitorInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmVisitorInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QVisitor: TADOQuery;
    dsVisitor: TDataSource;
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
  frmVisitorInfo: TfrmVisitorInfo;

implementation

uses CompanyUnit, DMUnit, VisitorUnit;

{$R *.dfm}
procedure TfrmVisitorInfo.FormCreate(Sender: TObject);
begin
    QVisitor.Close;
    QVisitor.Parameters.ParamByName('VisitorName').Value:='%%';
    QVisitor.Open;
end;

procedure TfrmVisitorInfo.edtSearchChange(Sender: TObject);
begin
    QVisitor.Close;
    QVisitor.Parameters.ParamByName('VisitorName').Value:='%'+edtSearch.Text+'%';
    QVisitor.Open;
end;

procedure TfrmVisitorInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmVisitorInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmVisitorInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmVisitor, frmVisitor);
    frmVisitor.ShowModal;
    FreeAndNil(frmVisitor);
    QVisitor.Close;
    QVisitor.Open;
end;

end.
