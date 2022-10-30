unit CreditCardGroupInfoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCreditCardGroupInfo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    BtnNew: TBitBtn;
    DBGrid: TDBGrid;
    QGroup: TADOQuery;
    dsGroup: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  strKey : string;    
  end;

var
  frmCreditCardGroupInfo: TfrmCreditCardGroupInfo;

implementation
uses DMUnit, VahedUnit, CreditGroupUnit;

{$R *.dfm}

procedure TfrmCreditCardGroupInfo.FormCreate(Sender: TObject);
begin
    QGroup.Close;
    QGroup.Parameters.ParamByName('CreditGroupName').Value:='%%';
    QGroup.Open;
end;

procedure TfrmCreditCardGroupInfo.edtSearchChange(Sender: TObject);
begin
    QGroup.Close;
    QGroup.Parameters.ParamByName('CreditGroupName').Value:='%'+edtSearch.Text+'%';
    QGroup.Open;
end;

procedure TfrmCreditCardGroupInfo.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=13 then
        DBGrid.SetFocus
    else
        if Key=27 then
        begin
            Close;
        end;
end;

procedure TfrmCreditCardGroupInfo.DBGridKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCreditCardGroupInfo.BtnNewClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditGroup, frmCreditGroup);
    frmCreditGroup.ShowModal;
    FreeAndNil(frmCreditGroup);
    QGroup.Close;
    QGroup.Open;
end;


end.
