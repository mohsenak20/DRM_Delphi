unit NotCheckedCardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB, Mask;

type
  TfrmNotCheckedCard = class(TForm)
    Panel1: TPanel;
    BtnReturn: TBitBtn;
    QNotCheckedCard: TADOQuery;
    dsNotCheckCard: TDataSource;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label14: TLabel;
    Label3: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    btnUser: TBitBtn;
    edtUserName: TEdit;
    edtUserID: TEdit;
    Label4: TLabel;
    procedure btnUserClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotCheckedCard: TfrmNotCheckedCard;

implementation

uses DMUnit, UserInfoUnit;

{$R *.dfm}

procedure TfrmNotCheckedCard.btnUserClick(Sender: TObject);
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

procedure TfrmNotCheckedCard.BBtnAcceptClick(Sender: TObject);
begin
    QNotCheckedCard.Close;
    QNotCheckedCard.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QNotCheckedCard.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    if edtUserID.Text<>'' then
        QNotCheckedCard.Parameters.ParamByName('UserID').Value:=edtUserID.Text
    else
        QNotCheckedCard.Parameters.ParamByName('UserID').Value:=-1;
    QNotCheckedCard.Open;
end;

end.
