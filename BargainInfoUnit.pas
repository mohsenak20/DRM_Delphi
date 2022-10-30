unit BargainInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmBargainInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    DBGrid: TDBGrid;
    QBargain: TADOQuery;
    dsBargain: TDataSource;
    QDelete: TADOQuery;
    BtnDel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;

var
  frmBargainInfo: TfrmBargainInfo;

implementation
uses DMUnit;


{$R *.dfm}
procedure TfrmBargainInfo.FormCreate(Sender: TObject);
begin
    QBargain.Close;
    QBargain.Parameters.ParamByName('CompanyName').Value:='%%';
    QBargain.Open;
end;

procedure TfrmBargainInfo.edtSearchChange(Sender: TObject);
begin
    QBargain.Close;
    QBargain.Parameters.ParamByName('CompanyName').Value:='%'+edtSearch.Text+'%';
    QBargain.Open;
end;

procedure TfrmBargainInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmBargainInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmBargainInfo.BtnDelClick(Sender: TObject);
begin
    IF ((QBargain.RecNo<=0) OR (QBargain.IsEmpty)) Or (MessageBox(Self.Handle,'ÂíÇ ãí ÎæÇåíÏ Çíä ÑßæÑÏ ÍÐÝ ÔæÏ ¿','ÍÐÝ ÑßæÑÏ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    QDelete.Close;
    QDelete.Parameters.ParamByName('BargainID').Value:=QBargain['BargainID'];
    QDelete.ExecSQL;
    QBargain.Close;
    QBargain.Open;
    Close;
end;

end.
