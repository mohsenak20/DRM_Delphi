unit KalaInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, ADODB, Buttons;

type
  TfrmKalaInfo = class(TForm)
    Panel1: TPanel;
    DBGrid: TDBGrid;
    edtSearch: TEdit;
    Label1: TLabel;
    QKala: TADOQuery;
    dsRiz: TDataSource;
    BtnNew: TBitBtn;
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
  frmKalaInfo: TfrmKalaInfo;

implementation

uses DMUnit, ProductUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmKalaInfo.FormCreate(Sender: TObject);
begin
    QKala.Close;
    QKala.Parameters.ParamByName('KalaName').Value:='%%';
    QKala.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QKala.Parameters.ParamByName('UserType').Value := UserInfo.userType;
    QKala.Open;
end;

procedure TfrmKalaInfo.edtSearchChange(Sender: TObject);
begin
    QKala.Close;
    QKala.Parameters.ParamByName('KalaName').Value:='%'+edtSearch.Text+'%';
    QKala.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
    QKala.Parameters.ParamByName('UserType').Value := UserInfo.userType;
    QKala.Open;
end;

procedure TfrmKalaInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmKalaInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmKalaInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmProduct, frmProduct);
    frmProduct.ShowModal;
    FreeAndNil(frmProduct);
    QKala.Close;
    QKala.Open;
end;

procedure TfrmKalaInfo.DBGridDblClick(Sender: TObject);
begin
    strKey:='enter';
    Close;
end;

end.
