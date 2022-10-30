unit NotAcceptBargainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB;

type
  TfrmNotAcceptBargain = class(TForm)
    Grid: TDBGrid;
    PanelButton: TPanel;
    BtnReturn: TBitBtn;
    BtnAccept: TBitBtn;
    QBargain: TADOQuery;
    SP_CreateCard: TADOStoredProc;
    lblPrompt: TLabel;
    QUpdateActive: TADOQuery;
    dsBargain: TDataSource;
    BitBtn1: TBitBtn;
    procedure BtnAcceptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotAcceptBargain: TfrmNotAcceptBargain;

implementation

uses DMUnit, CreditCardChargeReportUnit, CalculatUnit;

{$R *.dfm}

procedure TfrmNotAcceptBargain.BtnAcceptClick(Sender: TObject);
begin
    IF QBargain['Active']=True Then
    Begin
        MessageBox(Self.Handle,'ﬁ—«—œ«œ „Ê—œ ‰Ÿ— ›⁄«· „Ì »«‘œ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        Exit;
    End;
    lblPrompt.Visible:=True;
    SP_CreateCard.Parameters.ParamByName('@BargainDate').Value:=QBargain['ExportDate'];
    SP_CreateCard.Parameters.ParamByName('@BargainNumber').Value:=QBargain['BargainNumber'];
    SP_CreateCard.Parameters.ParamByName('@CardType').Value:=2;
    SP_CreateCard.Parameters.ParamByName('@CreateDate').Value:=QBargain['StartDate'];
    SP_CreateCard.Parameters.ParamByName('@ExpireDate').Value:=QBargain['EndDate'];
    SP_CreateCard.Parameters.ParamByName('@StartCardID').Value:=QBargain['StartNumber'];
    SP_CreateCard.Parameters.ParamByName('@CardCount').Value:=QBargain['Number'];
    SP_CreateCard.Parameters.ParamByName('@Credit').Value:=QBargain['Price'];
    SP_CreateCard.Parameters.ParamByName('@CompanyID').Value:=QBargain['CompanyID'];
    SP_CreateCard.Parameters.ParamByName('@GetMoney').Value:=QBargain['GetMoney'];
    SP_CreateCard.Parameters.ParamByName('@is50Percent').Value:=QBargain['is50Percent'];
    SP_CreateCard.Parameters.ParamByName('@userID').Value:= UserInfo.UserID;
    SP_CreateCard.Parameters.ParamByName('@SpecialForAfternoon').Value:=QBargain['SpecialForAfternoon'];
    SP_CreateCard.Parameters.ParamByName('@SpecialForNight').Value:=QBargain['SpecialForNight'];
    SP_CreateCard.ExecProc;
    QUpdateActive.Close;
    QUpdateActive.Parameters.ParamByName('TempBargainID').Value:=QBargain['TempBargainID'];
    QUpdateActive.ExecSQL;
    lblPrompt.Visible:=False;
    ShowMessage('ﬁ—«—œ«œ „Ê—œ ‰Ÿ— ›⁄«· ê—œÌœ');
    QBargain.Close;
    QBargain.Open;

end;

procedure TfrmNotAcceptBargain.FormCreate(Sender: TObject);
begin
    QBargain.Open;
end;

procedure TfrmNotAcceptBargain.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardChargeReport, frmCreditCardChargeReport);
    frmCreditCardChargeReport.edtStartDate.Text := CurrentDate;
    frmCreditCardChargeReport.ShowModal;
    FreeAndNil(frmCreditCardChargeReport);
end;

end.
