program Template;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {FMain},
  LoginUnit in 'LoginUnit.pas' {FLogin},
  DMUnit in 'DMUnit.pas' {DM: TDataModule},
  UserUnit in 'UserUnit.pas' {FUser},
  FpictureUnit in 'FpictureUnit.pas' {FPicture};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
