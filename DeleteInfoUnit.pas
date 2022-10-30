unit DeleteInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  TfrmDeleteInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    QDeleteInfo: TADOQuery;
    Label19: TLabel;
    lblUserName: TLabel;
    BtnReturn: TBitBtn;
    dsDeleteInfo: TDataSource;
    DBGrid1: TDBGrid;
    procedure BtnReturnClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeleteInfo: TfrmDeleteInfo;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmDeleteInfo.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmDeleteInfo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If QDeleteInfo['Enter']=False then
        DBGrid1.Canvas.Brush.Color:=clTeal
    else
        DBGrid1.Canvas.Brush.Color:=clGradientActiveCaption;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
