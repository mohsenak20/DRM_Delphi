unit TermScheduleInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TfrmTermScheduleInfo = class(TForm)
    Panel1: TPanel;
    DBGrid: TDBGrid;
    QTermSchedule: TADOQuery;
    dsTermSchedule: TDataSource;
    Label3: TLabel;
    edtTermId: TEdit;
    edtTermTitle: TEdit;
    btnTerm: TBitBtn;
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTermClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;
  end;

var
  frmTermScheduleInfo: TfrmTermScheduleInfo;

implementation
uses DMUnit, ManageShiftsUnit, TermInfoUnit;

{$R *.dfm}

procedure TfrmTermScheduleInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmTermScheduleInfo.btnTermClick(Sender: TObject);
begin
    Application.CreateForm(TfrmTermInfo, frmTermInfo);
    frmTermInfo.ShowModal;
    if frmTermInfo.strKey='enter' then
    begin
        edtTermId.Text:=frmTermInfo.QTerm['id'];
        edtTermTitle.Text:=frmTermInfo.QTerm['title'];
        FormShow(Sender);
    end;
    FreeAndNil(frmTermInfo);
end;

procedure TfrmTermScheduleInfo.FormShow(Sender: TObject);
begin
    QTermSchedule.Close;
    QTermSchedule.Parameters.ParamByName('termId').Value:=edtTermId.Text;
    QTermSchedule.Open;
    DBGrid.SetFocus;
end;

end.
