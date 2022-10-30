unit MenuListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, Grids, DBGrids, ExtCtrls, DB, ADODB,  QuickRpt;

type
  TfrmMenuList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dsMenu: TDataSource;
    Label8: TLabel;
    edtUserName: TEdit;
    edtUserID: TEdit;
    btnUser: TBitBtn;
    BBtnAccept: TBitBtn;
    btnPrint: TBitBtn;
    btnReturn: TBitBtn;
    QMenu: TADOQuery;
    edtSectionName: TEdit;
    Label1: TLabel;
    dbGrid: TDBGrid;
    ExportToExcel: TBitBtn;
    procedure btnReturnClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuList: TfrmMenuList;

implementation

uses DMUnit, qrReceptionUnit, qrManuListUnit, UserInfoUnit, ShareUnit,
  CalculatUnit;

{$R *.dfm}

procedure TfrmMenuList.btnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmMenuList.BBtnAcceptClick(Sender: TObject);
begin
    QMenu.Close;
    QMenu.Parameters.ParamByName('UserID').Value := edtUserID.Text;
    QMenu.Open;
end;

procedure TfrmMenuList.btnUserClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserInfo, frmUserInfo);
    frmUserInfo.ShowModal;
    if frmUserInfo.strKey='enter' then
    begin
        edtUserID.Text:=frmUserInfo.QUser['UserID'];
        edtUserName.Text:=frmUserInfo.QUser['UserName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmUserInfo);
end;

procedure TfrmMenuList.btnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrMenuList, qrMenuList);
    qrMenuList.lblCoName.Caption:=Parameter.CoName;
    qrMenuList.lblSectionName.Caption:=edtSectionName.Text;
    qrMenuList.lblCurrentDate.Caption:=CurrentDate;
    qrMenuList.Preview;
    FreeAndNil(qrMenuList);
end;

procedure TfrmMenuList.ExportToExcelClick(Sender: TObject);
begin
  ExportToExl(QMenu);
end;

end.
