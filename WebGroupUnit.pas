unit WebGroupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmWebGroup = class(TForm)
    dsWebSales: TDataSource;
    DBGrid1: TDBGrid;
    QWebSales: TADOQuery;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWebGroup: TfrmWebGroup;

implementation

uses DMUnit, WebReceptionUnit;

{$R *.dfm}

procedure TfrmWebGroup.DBGrid1DblClick(Sender: TObject);
begin
    frmWebReception.lblWebReceptionID.Caption := QWebSales['ticketType'];
    frmWebReception.lblWebReceptionType.Caption := QWebSales['webReceptionType'];
    frmWebReception.BBtnAcceptClick(sender);
    Close;
end;

end.
