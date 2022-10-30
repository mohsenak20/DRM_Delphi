unit SubsetCreditCardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ExtDlgs, DB, ADODB;

type
  TfrmSubsetCreditCard = class(TForm)
    Label2: TLabel;
    edtName: TEdit;
    Label6: TLabel;
    edtTel: TEdit;
    Image: TImage;
    btnOpenPic: TBitBtn;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    lblCardID: TLabel;
    lblName: TLabel;
    OpenPictureDialog: TOpenPictureDialog;
    Shape1: TShape;
    SP_SubCreditCard: TADOStoredProc;
    procedure btnOpenPicClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      StatusRecord:String;
      id : integer;
      CreditCardID : string;
      Pic : String;
      picNumber: integer;
  end;

var
  frmSubsetCreditCard: TfrmSubsetCreditCard;



  
implementation

uses DMUnit, CalculatUnit, ShareUnit;

{$R *.dfm}

procedure TfrmSubsetCreditCard.btnOpenPicClick(Sender: TObject);
begin
    if OpenPictureDialog.Execute then
    begin
        Image.Picture.LoadFromFile(OpenPictureDialog.FileName);
        Pic := OpenPictureDialog.FileName;
    end
    else
        ShowMessage('Open file was cancelled');
end;

procedure TfrmSubsetCreditCard.BtnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSubsetCreditCard.BtnSaveClick(Sender: TObject);
begin
    IF (edtName.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtName.SetFocus;
        Exit;
    End;
    SP_SubCreditCard.Parameters.ParamByName('@id').Value:=id;
    SP_SubCreditCard.Parameters.ParamByName('@CreditCardID').Value:= CreditCardID;
    SP_SubCreditCard.Parameters.ParamByName('@name').Value:=edtName.Text;
    SP_SubCreditCard.Parameters.ParamByName('@Tel').Value:=edtTel.Text;
    SP_SubCreditCard.Parameters.ParamByName('@Pic').Value:= CreditCardID+'-'+IntToStr(picNumber)+'-s.jpg';
    SP_SubCreditCard.Parameters.ParamByName('@CreateDate').Value:=CurrentDate;
    SP_SubCreditCard.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_SubCreditCard.Parameters.ParamByName('@Active').Value:=1;
    IF StatusRecord='Insert' then
        SP_SubCreditCard.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then Begin
        SP_SubCreditCard.Parameters.ParamByName('@Action').Value:='Update';
    End;
    SP_SubCreditCard.ExecProc;
    CopyFile(pchar(Pic), pchar(Parameter.URL_Pic+'\'+CreditCardID+'-'+IntToStr(picNumber)+'-s.jpg'), False);
    Close;

end;

end.
