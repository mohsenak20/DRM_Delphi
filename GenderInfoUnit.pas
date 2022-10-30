unit GenderInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmGenderInfo = class(TForm)
    DBGrid: TDBGrid;
    QGender: TADOQuery;
    dsGender: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;


var
  frmGenderInfo: TfrmGenderInfo;

implementation
uses DMUnit;

{$R *.dfm}

procedure TfrmGenderInfo.FormCreate(Sender: TObject);
begin
    QGender.Open;
end;

procedure TfrmGenderInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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
