unit InOutListUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, ADODB, ExtCtrls, Mask;

type
  TfrmInOutList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    QinOut: TADOQuery;
    DBGrid1: TDBGrid;
    dsInOut: TDataSource;
    Label6: TLabel;
    edtEmployeeName: TEdit;
    btnEmployee: TBitBtn;
    edtEmployeeId: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    BtnReturn: TBitBtn;
    procedure btnEmployeeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInOutList: TfrmInOutList;

implementation

uses CalculatUnit, DMUnit, EmployeeInfoUnit;

{$R *.dfm}

procedure TfrmInOutList.btnEmployeeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmEmployeeInfo, frmEmployeeInfo);
    frmEmployeeInfo.ShowModal;
    if frmEmployeeInfo.strKey='enter' then
    begin
        edtEmployeeId.Text:=frmEmployeeInfo.QEmployee['id'];
        edtEmployeeName.Text:=frmEmployeeInfo.QEmployee['name'];
    end;
    FreeAndNil(frmEmployeeInfo);
end;

procedure TfrmInOutList.FormCreate(Sender: TObject);
begin
    edtStartDate.Text := CurrentDate;
    edtEndDate.Text := CurrentDate;
end;

procedure TfrmInOutList.BBtnAcceptClick(Sender: TObject);
var
  strFilter: string;
begin
  strFilter := 'inOutDate >='+QuotedStr(edtStartDate.Text)+' and inOutDate <= '+QuotedStr(edtEndDate.Text);

  if edtEmployeeId.Text <> '' then
      strFilter := strFilter + ' and employeeId='+edtEmployeeId.Text;

  QinOut.SQL.Clear;
  QinOut.SQL.Add('select TInOut.*, TEmployee.name, TInOutType.title inOutTitle , TEmployeeGroup.title employeeGroupTitle');
  QinOut.SQL.Add('from TInOut');
  QinOut.SQL.Add('inner join TEmployee on TInOut.employeeId = TEmployee.id');
  QinOut.SQL.Add('inner join TInOutType on TInOut.inOutTypeId = TInOutType.id');
  QinOut.SQL.Add('inner join TEmployeeGroup on TEmployee.employeeGroupId = TEmployeeGroup.id');
  QinOut.SQL.Add('where '+strFilter);
  QinOut.Open;
end;

end.
