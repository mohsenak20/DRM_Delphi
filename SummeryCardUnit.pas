unit SummeryCardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls;

type
  TfrmSummeryCard = class(TForm)
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    BtnReturn: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSummeryCard: TfrmSummeryCard;

implementation

{$R *.dfm}

end.
