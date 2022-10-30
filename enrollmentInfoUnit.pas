unit enrollmentInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmEnrollmentInfo = class(TForm)
    DBGrid: TDBGrid;
    QEnrollment: TADOQuery;
    dsEnrollment: TDataSource;
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;

var
  frmEnrollmentInfo: TfrmEnrollmentInfo;

implementation

uses DMUnit;

{$R *.dfm}

procedure TfrmEnrollmentInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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
