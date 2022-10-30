unit AppMenuAccessUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Grids, DBGrids, Menus;

type
  TfrmAppMenuAccess = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    edtWorkSectionID: TEdit;
    edtWorkSectionName: TEdit;
    btnWorkSection: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    dbManuAccess: TDBGrid;
    dbSource: TDBGrid;
    dsAppMenu: TDataSource;
    QAppMenu: TADOQuery;
    QAppMenuAccess: TADOQuery;
    dsTAppMenuAccess: TDataSource;
    QAdd: TADOQuery;
    QDel: TADOQuery;
    BtnDel: TBitBtn;
    btnAdd: TBitBtn;
    pmMenuAccess: TPopupMenu;
    pmManu: TPopupMenu;
    pmMenuAccessDelete: TMenuItem;
    pmMenuAdd: TMenuItem;
    procedure btnWorkSectionClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppMenuAccess: TfrmAppMenuAccess;

implementation

uses DMUnit, WorkSectionInfoUnit;

{$R *.dfm}

procedure TfrmAppMenuAccess.btnWorkSectionClick(Sender: TObject);
begin
Application.CreateForm(TfrmWorkSectionInfo, frmWorkSectionInfo);
    frmWorkSectionInfo.ShowModal;
    if frmWorkSectionInfo.strKey='enter' then
    begin
        edtWorkSectionID.Text:=frmWorkSectionInfo.QWorkSection['WorkSectionID'];
        edtWorkSectionName.Text:=frmWorkSectionInfo.QWorkSection['WorkSectionName'];
        QAppMenuAccess.Close;
        QAppMenuAccess.Parameters.ParamByName('workSectionId').Value := edtWorkSectionID.Text;
        QAppMenuAccess.Open;
    end;
    FreeAndNil(frmWorkSectionInfo);
end;

procedure TfrmAppMenuAccess.BtnDelClick(Sender: TObject);
begin
    QDel.Parameters.ParamByName('id').Value := QAppMenuAccess['id'];
    QDel.ExecSQL;
    QAppMenuAccess.Close;
    QAppMenuAccess.Open;
end;

procedure TfrmAppMenuAccess.btnAddClick(Sender: TObject);
begin
    if edtWorkSectionID.Text = '' then
    begin
        ShowMessage('·ÿ›« »Œ‘ ò«—Ì —« „‘Œ’ ‰„«ÌÌœ');
        Exit;
    end;
    QAdd.Parameters.ParamByName('workSectionId').Value := edtWorkSectionID.Text;
    QAdd.Parameters.ParamByName('menuId').Value := QAppMenu['id'];
    QAdd.ExecSQL;
    QAppMenuAccess.Close;
    QAppMenuAccess.Open;
end;

procedure TfrmAppMenuAccess.FormCreate(Sender: TObject);
begin
    QAppMenu.Open;
end;

end.
