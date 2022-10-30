unit ComputerAndCompuetrGroupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmComputerAndCompueterGroup = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    edtComputerGroupId: TEdit;
    edtComputerGroupTitle: TEdit;
    btnComputerGroup: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    dbManuAccess: TDBGrid;
    Panel4: TPanel;
    dbSource: TDBGrid;
    Panel5: TPanel;
    BtnDel: TBitBtn;
    btnAdd: TBitBtn;
    dsComputer: TDataSource;
    QComputer: TADOQuery;
    QComputerAndGroup: TADOQuery;
    dsComputerAndGroup: TDataSource;
    QAdd: TADOQuery;
    QDel: TADOQuery;
    pmMenuAccess: TPopupMenu;
    pmMenuAccessDelete: TMenuItem;
    pmManu: TPopupMenu;
    pmMenuAdd: TMenuItem;
    procedure BtnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnComputerGroupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComputerAndCompueterGroup: TfrmComputerAndCompueterGroup;

implementation

uses DMUnit, ComputerGroupInfoUnit, WorkSectionInfoUnit;
{$R *.dfm}


procedure TfrmComputerAndCompueterGroup.BtnDelClick(Sender: TObject);
begin
    QDel.Parameters.ParamByName('id').Value := QComputerAndGroup['id'];
    QDel.ExecSQL;
    QComputerAndGroup.Close;
    QComputerAndGroup.Open;
end;

procedure TfrmComputerAndCompueterGroup.btnAddClick(Sender: TObject);
begin
    if edtComputerGroupId.Text = '' then
    begin
        ShowMessage('·ÿ›« ê—ÊÂ ò«„ÅÌÊ —Ì —« „‘Œ’ ‰„«ÌÌœ');
        Exit;
    end;
    QAdd.Parameters.ParamByName('computerGroupId').Value := edtComputerGroupId.Text;
    QAdd.Parameters.ParamByName('computerId').Value := QComputer['computerId'];
    QAdd.ExecSQL;
    QComputerAndGroup.Close;
    QComputerAndGroup.Open;
end;

procedure TfrmComputerAndCompueterGroup.FormCreate(Sender: TObject);
begin
    QComputer.Open;
end;

procedure TfrmComputerAndCompueterGroup.btnComputerGroupClick(
  Sender: TObject);
begin
    Application.CreateForm(TfrmComputerGroupInfo, frmComputerGroupInfo);
    frmComputerGroupInfo.ShowModal;
    if frmComputerGroupInfo.strKey='enter' then
    begin
        edtComputerGroupId.Text:=frmComputerGroupInfo.QComputerGroup['ID'];
        edtComputerGroupTitle.Text:=frmComputerGroupInfo.QComputerGroup['title'];
        QComputerAndGroup.Close;
        QComputerAndGroup.Parameters.ParamByName('computerGroupId').Value := edtComputerGroupId.Text;
        QComputerAndGroup.Open;
    end;
    FreeAndNil(frmWorkSectionInfo);
end;

end.
