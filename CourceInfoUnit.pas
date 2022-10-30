unit CourceInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCourceInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QCourse: TADOQuery;
    dsCourse: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCourceInfo: TfrmCourceInfo;

implementation

{$R *.dfm}

end.
