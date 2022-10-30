unit FpictureUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, ExtDlgs, DB, ADODB, jpeg;

type
  TFPicture = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    BtnSelectPicture: TBitBtn;
    Image1: TImage;
    BtnPostPicture: TBitBtn;
    BtnReturn: TBitBtn;
    Image: TImage;
    SP_Picture: TADOStoredProc;
    CheckBoxDeletePicture: TCheckBox;
    QExist: TADOQuery;
    QMaxPictureID: TADOQuery;
    procedure BtnSelectPictureClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnPostPictureClick(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure CheckBoxDeletePictureClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPicture: TFPicture;

implementation

uses DMUnit, MainUnit, Math, CalculatUnit;

{$R *.dfm}

procedure TFPicture.BtnSelectPictureClick(Sender: TObject);
begin
    If OpenPictureDialog1.Execute then
      IF OpenPictureDialog1.FileName<>'' Then
        Image.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TFPicture.FormShow(Sender: TObject);
begin
    QExist.Close;
    QExist.Parameters.ParamValues['UserID']:= UserInfo.UserID;
    QExist.Prepared;
    QExist.Open;
    if QExist.RecordCount=1 then
        Image.Picture.LoadFromFile(QExist['Picture']);
end;

procedure TFPicture.BtnPostPictureClick(Sender: TObject);
begin
    if CheckBoxDeletePicture.Checked then
    begin
        Image.Picture.LoadFromFile('');
        fMain.Image.Picture.LoadFromFile('');
        SP_Picture.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
        SP_Picture.Parameters.ParamByName('@Action').Value:='Delete';
        SP_Picture.ExecProc;
        DM.QPicture.Close;
        DM.QPicture.Open;
        Self.Close;
    end
    else
    begin
        QExist.Close;
        QExist.Parameters.ParamValues['UserID']:=UserInfo.UserID;
        QExist.Prepared;
        QExist.Open;
        if QExist.RecordCount=1 then
        Begin
            QExist.Edit;
            QExist['Picture']:=OpenPictureDialog1.FileName;
            QExist.Post;
        End
        Else
        Begin
            QExist.Append;
            QMaxPictureID.Close;
            QMaxPictureID.Open;
            IF QMaxPictureID['PictureID']=Null Then
                QExist['PictureID']:=1
            Else
            QExist['PictureID']:=QMaxPictureID['PictureID']+1;
            QExist['Picture']:=OpenPictureDialog1.FileName;
            QExist['UserID']:=UserInfo.UserID;
            QExist.Post;
        End;
        QExist.Close;
        QExist.Parameters.ParamValues['UserID']:=UserInfo.UserID;
        QExist.Prepared;
        QExist.Open;
        fMain.Image.Picture.LoadFromFile(QExist['Picture']);
        Self.Close;
    end;
end;

procedure TFPicture.BtnReturnClick(Sender: TObject);
begin
     Self.Close;
end;

procedure TFPicture.CheckBoxDeletePictureClick(Sender: TObject);
begin
    If CheckBoxDeletePicture.Checked=True then
        Image.Picture.LoadFromFile('')
    else
        Image.Picture.LoadFromFile(DM.QPicture['Picture']);
end;

procedure TFPicture.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_ESCAPE) then Self.Close;
end;

end.
