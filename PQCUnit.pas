unit PQCUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, Mask, StdCtrls, Buttons, DB, ADODB;

type
  TfrmPQC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    edtPersonID: TEdit;
    edtPersonName: TEdit;
    btnPerson: TBitBtn;
    Label14: TLabel;
    edtStartDate: TMaskEdit;
    Label3: TLabel;
    edtEndDate: TMaskEdit;
    btnSearch: TBitBtn;
    BtnReturn: TBitBtn;
    Qpqc: TADOQuery;
    ADOConnection: TADOConnection;
    dsPQC: TDataSource;
    procedure BtnReturnClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnPersonClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPQC: TfrmPQC;

implementation

uses PQCPersonInfoUnit;

{$R *.dfm}

procedure TfrmPQC.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPQC.btnSearchClick(Sender: TObject);
var
strFilter : string;
begin
    Qpqc.Close;
    Qpqc.Parameters.ParamByName('PersonID').Value := edtPersonID.Text;
    Qpqc.Parameters.ParamByName('StartDate').Value :=StringReplace(edtStartDate.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
    Qpqc.Parameters.ParamByName('EndDate').Value := StringReplace(edtEndDate.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
    Qpqc.Open;
end;

procedure TfrmPQC.btnPersonClick(Sender: TObject);
begin
    Application.CreateForm(TfrmPQCPersonInfo, frmPQCPersonInfo);
    frmPQCPersonInfo.ShowModal;
    if frmPQCPersonInfo.strKey='enter' then
    begin
        edtPersonID.Text:=frmPQCPersonInfo.Qpqc['ID'];
        edtPersonName.Text:=frmPQCPersonInfo.Qpqc['Name'];
        edtStartDate.SetFocus;
    end;
    FreeAndNil(frmPQCPersonInfo);
end;

procedure TfrmPQC.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    If (Qpqc['SubjectID']=65) or (Qpqc['SubjectID']=66) or (Qpqc['SubjectID']=67) then
        DBGrid1.Canvas.Brush.Color:=clTeal;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
