unit UserAndComputerGroupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmUserAndComputerGroup = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    edtUserId: TEdit;
    edtUserName: TEdit;
    btnUser: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    dbManuAccess: TDBGrid;
    Panel4: TPanel;
    dbSource: TDBGrid;
    Panel5: TPanel;
    BtnDel: TBitBtn;
    btnAdd: TBitBtn;
    dsComputerGroup: TDataSource;
    QComputerGroup: TADOQuery;
    QUserAndComputerGroup: TADOQuery;
    dsUserAndComputerGroup: TDataSource;
    QAdd: TADOQuery;
    QDel: TADOQuery;
    pmMenuAccess: TPopupMenu;
    pmMenuAccessDelete: TMenuItem;
    pmManu: TPopupMenu;
    pmMenuAdd: TMenuItem;
    procedure BtnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserAndComputerGroup: TfrmUserAndComputerGroup;

implementation

uses DMUnit, UserInfoUnit, WorkSectionInfoUnit;
{$R *.dfm}

procedure TfrmUserAndComputerGroup.BtnDelClick(Sender: TObject);
begin
    QDel.Parameters.ParamByName('id').Value := QUserAndComputerGroup['id'];
    QDel.ExecSQL;
    QUserAndComputerGroup.Close;
    QUserAndComputerGroup.Open;
end;

procedure TfrmUserAndComputerGroup.btnAddClick(Sender: TObject);
begin
    if edtUserId.Text = '' then
    begin
        ShowMessage('·ÿ›«  ò«—»— —« „‘Œ’ ‰„«ÌÌœ');
        Exit;
    end;
    QAdd.Parameters.ParamByName('userId').Value := edtUserId.Text;
    QAdd.Parameters.ParamByName('computerGroupId').Value := QComputerGroup['Id'];
    QAdd.ExecSQL;
    QUserAndComputerGroup.Close;
    QUserAndComputerGroup.Open;
end;

procedure TfrmUserAndComputerGroup.FormCreate(Sender: TObject);
begin
    QComputerGroup.Open;
end;

procedure TfrmUserAndComputerGroup.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserId.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        QUserAndComputerGroup.Close;
        QUserAndComputerGroup.Parameters.ParamByName('userId').Value := edtUserId.Text;
        QUserAndComputerGroup.Open;
    end;
    FreeAndNil(frmWorkSectionInfo);

end;

end.
