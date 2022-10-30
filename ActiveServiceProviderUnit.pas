unit ActiveServiceProviderUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfrmActiveServiceProvider = class(TForm)
    btnActive: TBitBtn;
    BtnReturn: TBitBtn;
    Label2: TLabel;
    edtNumber: TEdit;
    QServiceProvider: TADOQuery;
    QUpdateServiceProvider: TADOQuery;
    procedure BtnReturnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnActiveClick(Sender: TObject);
  private
    { Private declarations }
    service_provider_id :integer;
  public
    { Public declarations }
  end;

var
  frmActiveServiceProvider: TfrmActiveServiceProvider;

implementation

uses DMUnit, Math, CalculatUnit;

{$R *.dfm}

procedure TfrmActiveServiceProvider.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmActiveServiceProvider.FormCreate(Sender: TObject);
begin
    Case UserInfo.UserID of
        403 :
        begin

            service_provider_id := 1;
        end;
        404 :
        begin
            service_provider_id := 2;

        end;
        405 :
        begin
            service_provider_id := 3;

        end;
    end;
    QServiceProvider.Close;
    QServiceProvider.Parameters.ParamByName('id').Value := service_provider_id;
    QServiceProvider.Open;
    if QServiceProvider['id']<>null then
    begin
        If QServiceProvider['is_active'] then
        begin
          btnActive.Caption := 'ÛíÑÝÚÇá ˜ÑÏä';
          edtNumber.Enabled := False;

        end
        else
          btnActive.Caption := 'ÝÚÇá ˜ÑÏä';
    end;


end;

procedure TfrmActiveServiceProvider.btnActiveClick(Sender: TObject);
begin
    QUpdateServiceProvider.Close;
    QUpdateServiceProvider.Parameters.ParamByName('person_in_queue').Value := StrToIntDef(edtNumber.Text, 0);
    QUpdateServiceProvider.Parameters.ParamByName('id').Value := service_provider_id;
    QUpdateServiceProvider.ExecSQL;
    Close;
end;

end.
