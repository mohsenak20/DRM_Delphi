unit UnitCompanyInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCompanyInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QCompany: TADOQuery;
    dsCompany: TDataSource;
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
  frmCompanyInfo: TfrmCompanyInfo;

implementation

uses CompanyUnit, DMUnit;

{$R *.dfm}
procedure TfrmCompanyInfo.FormCreate(Sender: TObject);
begin
    QCompany.Close;
    QCompany.Parameters.ParamByName('CompanyName').Value:='%%';
    QCompany.Open;
end;

procedure TfrmCompanyInfo.edtSearchChange(Sender: TObject);
begin
    QCompany.Close;
    QCompany.Parameters.ParamByName('CompanyName').Value:='%'+edtSearch.Text+'%';
    QCompany.Open;
end;

procedure TfrmCompanyInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCompanyInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCompanyInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCompany, frmCompany);
    frmCompany.ShowModal;
    FreeAndNil(frmCompany);
    QCompany.Close;
    QCompany.Open;
end;

end.
