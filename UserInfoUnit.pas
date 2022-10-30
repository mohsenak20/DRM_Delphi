unit UserInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmUserInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QUser: TADOQuery;
    dsUser: TDataSource;
    chbActiveUser: TCheckBox;
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
  frmUserInfo: TfrmUserInfo;

implementation
uses DMUnit,  CalculatUnit, UserUnit;

{$R *.dfm}

procedure TfrmUserInfo.FormCreate(Sender: TObject);
begin
    if (UserInfo.WorkSectionID = 6) or (UserInfo.WorkSectionID = 8) then
        chbActiveUser.Visible := True;
    QUser.Close;
    QUser.Parameters.ParamByName('UserName').Value:='%%';
    QUser.Parameters.ParamByName('ActiveUser').Value:=1;
    QUser.Open;
end;

procedure TfrmUserInfo.edtSearchChange(Sender: TObject);
begin
    QUser.Close;
    QUser.Parameters.ParamByName('UserName').Value:='%'+edtSearch.Text+'%';
    if chbActiveUser.Checked then
        QUser.Parameters.ParamByName('ActiveUser').Value:=1
    else
        QUser.Parameters.ParamByName('ActiveUser').Value:=0;
    QUser.Open;
end;

procedure TfrmUserInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmUserInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmUserInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TFUser, FUser);
    FUser.ShowModal;
    FreeAndNil(FUser);
    QUser.Close;
    QUser.Open;
end;

procedure TfrmUserInfo.DBGridDblClick(Sender: TObject);
begin
    strKey:='enter';
    Close;
end;

end.
