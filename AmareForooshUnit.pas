unit AmareForooshUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DB, ADODB;

type
  TfrmAmareForoosh = class(TForm)
    Label14: TLabel;
    edtStartDate: TMaskEdit;
    Label3: TLabel;
    edtEndDate: TMaskEdit;
    BBtnAccept: TBitBtn;
    Label19: TLabel;
    lblResturent: TLabel;
    lblAghzye: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    lblRevagh: TLabel;
    QFactor: TADOQuery;
    BtnPrint: TBitBtn;
    BtnReturn: TBitBtn;
    procedure BBtnAcceptClick(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAmareForoosh: TfrmAmareForoosh;

implementation

uses DMUnit, qrAmareForooshUnit, CalculatUnit, ShareUnit;

{$R *.dfm}

procedure TfrmAmareForoosh.BBtnAcceptClick(Sender: TObject);
begin
    QFactor.Close;
    QFactor.Parameters.ParamByName('StartDate').Value:=edtStartDate.Text;
    QFactor.Parameters.ParamByName('EndDate').Value:=edtEndDate.Text;
    QFactor.Open;
    if QFactor['UserID']<>null then
    begin
        while not(QFactor.Eof) do
        begin
            if QFactor['UserID']=4 then
                lblResturent.Caption:=QFactor['AmareForoosh'];
            if QFactor['UserID']=20 then
                lblAghzye.Caption:=QFactor['AmareForoosh'];
            if QFactor['UserID']=38 then
                lblRevagh.Caption:=QFactor['AmareForoosh'];
            QFactor.Next;
        end;
    end;
end;

procedure TfrmAmareForoosh.BtnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmAmareForoosh.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrAmareForoosh, qrAmareForoosh);
    qrAmareForoosh.lblCoName.Caption:='”—“„Ì‰ „ÊÃÂ«Ì ¬»Ì';
    qrAmareForoosh.lblStartDate.Caption:=edtStartDate.Text;
    qrAmareForoosh.lblEndDate.Caption:=edtEndDate.Text;
    qrAmareForoosh.Preview;
    FreeAndNil(qrAmareForoosh);
end;

end.
