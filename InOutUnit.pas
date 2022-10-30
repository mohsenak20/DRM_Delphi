unit InOutUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmInOut = class(TForm)
    btnOut: TBitBtn;
    btnIn: TBitBtn;
    BtnReturn: TBitBtn;
    Label6: TLabel;
    edtEmployeeName: TEdit;
    btnEmployee: TBitBtn;
    edtEmployeeId: TEdit;
    SP_InOut: TADOStoredProc;
    procedure BtnReturnClick(Sender: TObject);
    procedure btnEmployeeClick(Sender: TObject);
    procedure btnInClick(Sender: TObject);
    procedure clearForm();
    procedure btnOutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInOut: TfrmInOut;

implementation

uses DMUnit, EmployeeUnit, EmployeeInfoUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmInOut.clearForm();
begin
    edtEmployeeId.Clear;
    edtEmployeeName.Clear;
    btnEmployee.SetFocus;
end;

procedure TfrmInOut.BtnReturnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInOut.btnEmployeeClick(Sender: TObject);
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

procedure TfrmInOut.btnInClick(Sender: TObject);
begin
    SP_InOut.Parameters.ParamByName('@employeeId').Value := edtEmployeeId.Text;
    SP_InOut.Parameters.ParamByName('@inOutTypeId').Value := 1;
    SP_InOut.Parameters.ParamByName('@inOutDate').Value := CurrentDate;
    SP_InOut.ExecProc;
    ShowMessage('Ê—ÊœÌ À»  ê—œÌœ');
    clearForm;
end;

procedure TfrmInOut.btnOutClick(Sender: TObject);
begin
    SP_InOut.Parameters.ParamByName('@employeeId').Value := edtEmployeeId.Text;
    SP_InOut.Parameters.ParamByName('@inOutTypeId').Value := 2;
    SP_InOut.Parameters.ParamByName('@inOutDate').Value := CurrentDate;
    SP_InOut.ExecProc;
    ShowMessage('Œ—ÊÃÌ À»  ê—œÌœ');
    clearForm;
end;

end.
