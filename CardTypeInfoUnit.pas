unit CardTypeInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCardTypeInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QCardTypeInfo: TADOQuery;
    dsCardTypeInfo: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;

var
  frmCardTypeInfo: TfrmCardTypeInfo;

implementation

uses DMUnit;

{$R *.dfm}
procedure TfrmCardTypeInfo.FormCreate(Sender: TObject);
begin
    QCardTypeInfo.Close;
    QCardTypeInfo.Parameters.ParamByName('CardTypeName').Value:='%%';
    QCardTypeInfo.Open;
end;

procedure TfrmCardTypeInfo.edtSearchChange(Sender: TObject);
begin
    QCardTypeInfo.Close;
    QCardTypeInfo.Parameters.ParamByName('CardTypeName').Value:='%'+edtSearch.Text+'%';
    QCardTypeInfo.Open;
end;

procedure TfrmCardTypeInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCardTypeInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

end.
