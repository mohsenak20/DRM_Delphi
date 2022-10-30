unit UserUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, ADODB, DB, Menus, Grids, DBGrids,
  ComCtrls, ExtCtrls;

type
  TFUser = class(TForm)
    PanelButton: TPanel;
    StatusBar: TStatusBar;
    Grid: TDBGrid;
    MainMenuUnit: TMainMenu;
    MnuFile: TMenuItem;
    MnuInsert: TMenuItem;
    MnuEdit: TMenuItem;
    MnuDelete: TMenuItem;
    N2: TMenuItem;
    MnuReturn: TMenuItem;
    PopupMenuUnit: TPopupMenu;
    MnuPopInsert: TMenuItem;
    MnuPopEdit: TMenuItem;
    MnuPopNone1: TMenuItem;
    MnuPopDelete: TMenuItem;
    SP_Login: TADOStoredProc;
    DSEmployee: TDataSource;
    QLogin: TADOQuery;
    ActionList: TActionList;
    ActionInsert: TAction;
    ActionEdit: TAction;
    ActionDel: TAction;
    ActionReturn: TAction;
    GroupBox: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    EditUserName: TEdit;
    EditPassword: TEdit;
    EditConfirmPassword: TEdit;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    BtnNew: TBitBtn;
    BtnEdit: TBitBtn;
    BtnDel: TBitBtn;
    BtnReturn: TBitBtn;
    chbUseMenu: TCheckBox;
    SP_UseMenu: TADOStoredProc;
    gbPermission: TGroupBox;
    rbNorm: TRadioButton;
    rbManager: TRadioButton;
    Label3: TLabel;
    edtWorkSectionID: TEdit;
    edtWorkSectionName: TEdit;
    btnWorkSection: TBitBtn;
    QDelete: TADOQuery;
    chbActive: TCheckBox;
    Label5: TLabel;
    edtService_center_id: TEdit;
    edtService_center: TEdit;
    btnService_center: TBitBtn;
    Panel1: TPanel;
    Label6: TLabel;
    edtSearch: TEdit;
    Label7: TLabel;
    edtUserTypeId: TEdit;
    edtUserTypeTitle: TEdit;
    btnUserType: TBitBtn;
    chbAmrieh: TCheckBox;
    chbCanDeposit: TCheckBox;
    chbCanIssueTicket: TCheckBox;
    chbSaleByBarcode: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnReturnClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QLoginCalcFields(DataSet: TDataSet);
    procedure btnWorkSectionClick(Sender: TObject);
    procedure btnService_centerClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnUserTypeClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEnabledDisable(BL:Boolean);
    Procedure LoadSqlQuery;
    procedure GetValue;
  public
    { Public declarations }
  end;

var
  FUser: TFUser;
  StatusRecord:String;
implementation

uses DMUnit, CalculatUnit, WorkSectionInfoUnit, StrUtils,
  ServiceCenterInfoUnit, UserTypeUnit;

{$R *.dfm}


{************************************************************************}
{************************* Procedure & Function *************************}
{************************************************************************}

{*******************  SetEnabledDisable  ***********************}
procedure TFUser.SetEnabledDisable(BL:Boolean);
Begin

    Grid.Enabled:=BL;
    PanelButton.Enabled:=BL;
    MnuInsert.Enabled:=BL;
    MnuEdit.Enabled:=BL;
    MnuDelete.Enabled:=BL;
    MnuPopInsert.Enabled:=BL;
    MnuPopEdit.Enabled:=BL;
    MnuPopDelete.Enabled:=BL;
    GroupBox.Visible:=Not BL;
    IF Not BL Then
    Begin
        EditUserName.Clear;
        if EditUserName.Enabled then
            EditUserName.SetFocus
        else
            EditPassword.SetFocus;
        EditPassword.Clear;
        EditConfirmPassword.Clear;
        chbSaleByBarcode.Checked := False;
    End;
End;
{******************* LoadSqlQuery ***********************}
Procedure TFUser.LoadSqlQuery;
Begin
    if (UserInfo.userType <> Admin)  and (UserInfo.userType <> Supervisour) and (UserInfo.userType <> IT) then
    begin
        QLogin.SQL.Clear;
        QLogin.SQL.Add('select * from TUser inner join TWorkSection on TUser.WorkSectionID=TWorkSection.WorkSectionID inner join service_centers on service_centers.id = Tuser.service_center_id where UserID='+IntToStr(UserInfo.UserID));
        //btnPermission.Enabled:=False;
        BtnNew.Enabled:=False;
        ActionInsert.Enabled:=False;
        BtnDel.Enabled:=False;
        ActionDel.Enabled:=False;
        gbPermission.Enabled:=False;
        edtWorkSectionID.Enabled:=False;
        edtWorkSectionName.Enabled:=False;
        btnWorkSection.Enabled:=False;
        chbUseMenu.Enabled:=False;
        chbActive.Enabled:=False;
        EditUserName.Enabled := False;
        edtService_center_id.Enabled := False;
        edtService_center.Enabled := False;
        btnService_center.Enabled := False;
    end
    else
      QLogin.Parameters.ParamByName('UserName').Value := '%'+edtSearch.Text+'%';
    QLogin.Open;
End;

{*******************  GetValue  ***********************}
procedure TFUser.GetValue;
begin
    EditUserName.Text:=QLogin.FieldByName('UserName').Text;
    EditPassword.Text:=trim(QLogin.FieldByName('PassWord').Text);
    EditConfirmPassword.Text:=trim(QLogin.FieldByName('PassWord').Text);
    if QLogin['LevelPermission']=1 then
        rbNorm.Checked:=True
    else
        if QLogin['LevelPermission']=2 then
            rbManager.Checked:=True;
    chbUseMenu.Checked:=QLogin['UseMenu'];
    edtWorkSectionID.Text:=QLogin['WorkSectionID'];
    edtWorkSectionName.Text:=QLogin['WorkSectionName'];
    edtService_center_id.Text := QLogin['service_center_id'];
    edtService_center.Text := QLogin['title'];
    chbActive.Checked:=QLogin['Active'];
    edtUserTypeId.Text := QLogin['userTypeId'];
    edtUserTypeTitle.Text := QLogin['userTypeTitle'];
    chbAmrieh.Checked := QLogin['amrieh'];
    chbCanDeposit.Checked := QLogin['canDeposit'];
    chbCanIssueTicket.Checked := QLogin['canIssueTicket'];
    chbSaleByBarcode.Checked := QLogin['SaleByBarcode'];
end;

{*******************  FormCreate  ***********************}
procedure TFUser.FormCreate(Sender: TObject);
begin
    LoadSqlQuery;
end;

{*******************  FormKeyDown  ***********************}
procedure TFUser.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (key=27)  Then
        IF GroupBox.Showing Then SetEnabledDisable(True) Else BtnReturnClick(Self);
if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));        
end;

{*******************  GridKeyDown  ***********************}
procedure TFUser.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF (Key=VK_RETURN) Then Begin BtnEditClick(Self); Key:=0; End;
    IF (Key=VK_DELETE) Then Begin BtnDelClick(Self);  Key:=0; End;
    IF (Key=VK_INSERT) Then Begin BtnNewClick(Self);  Key:=0; End;
end;

{*******************  BtnReturnClick  ***********************}
procedure TFUser.BtnReturnClick(Sender: TObject);
begin
    if GroupBox.Visible=True then
        SetEnabledDisable(True)
    else
        Self.Close;
end;

{*******************  BtnSaveClick  ***********************}
procedure TFUser.BtnSaveClick(Sender: TObject);
var
strUserName : string;
begin
    If EditPassword.Text<>EditConfirmPassword.Text then
    begin
        MessageBox(Self.Handle,'«”„ —„“ Ê  «ÌÌœ¬‰ ÌòÌ ‰Ì” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        EditPassword.Clear;
        EditPassword.SetFocus;
        EditConfirmPassword.Clear;
        Exit;
    end;
    IF (EditUserName.Text='') or (EditPassword.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        IF EditUserName.Text=''   then EditUserName.SetFocus;
        IF EditPassword.Text=''   then EditPassword.SetFocus;
        Exit;
    End;
    SP_Login.Parameters.ParamByName('@UserID').Value:=QLogin['UserID'];
    strUserName := EditUserName.Text;
    strUserName := StringReplace(strUserName,'ò','ò', [rfReplaceAll, rfIgnoreCase]);
    strUserName := StringReplace(strUserName,'Ì','Ì', [rfReplaceAll, rfIgnoreCase]);
    SP_Login.Parameters.ParamByName('@UserName').Value:=trim(strUserName);
    SP_Login.Parameters.ParamByName('@Password').Value:=trim(EditPassword.Text);
    if rbNorm.Checked then
        SP_Login.Parameters.ParamByName('@LevelPermission').Value:=1
    else
        if rbManager.Checked then
            SP_Login.Parameters.ParamByName('@LevelPermission').Value:=2;
    SP_Login.Parameters.ParamByName('@WorkSection').Value:=1;
    SP_Login.Parameters.ParamByName('@UseMenu').Value:=chbUseMenu.Checked;
    SP_Login.Parameters.ParamByName('@WorkSectionID').Value:=edtWorkSectionID.Text;
    SP_Login.Parameters.ParamByName('@service_center_id').Value:=edtService_center_id.Text;
    SP_Login.Parameters.ParamByName('@userTypeId').Value:=edtUserTypeId.Text;
    SP_Login.Parameters.ParamByName('@amrieh').Value := chbAmrieh.Checked;
    SP_Login.Parameters.ParamByName('@canDeposit').Value := chbCanDeposit.Checked;
    SP_Login.Parameters.ParamByName('@canIssueTicket').Value := chbCanIssueTicket.Checked;
    SP_Login.Parameters.ParamByName('@SaleByBarcode').Value := chbSaleByBarcode.Checked;

    if chbActive.Checked then
        SP_Login.Parameters.ParamByName('@Active').Value:=1
    else
        SP_Login.Parameters.ParamByName('@Active').Value:=0;



    IF StatusRecord='Insert' then
        SP_Login.Parameters.ParamByName('@Action').Value:='Insert'
    Else
    IF StatusRecord='Update' then
        SP_Login.Parameters.ParamByName('@Action').Value:='Update';

    SP_Login.ExecProc;

    SP_UseMenu.Parameters.ParamByName('@UserID').Value:=SP_Login.Parameters.ParamByName('@OutUserID').Value;
    if chbUseMenu.Checked then
        SP_UseMenu.Parameters.ParamByName('@UseMenu').Value:=1
    else
        SP_UseMenu.Parameters.ParamByName('@UseMenu').Value:=0;


    SP_UseMenu.ExecProc;
    StatusRecord:='';
    SetEnabledDisable(True);
    QLogin.Close;
    QLogin.Open;
    Grid.SetFocus;

end;

{*******************  BtnCancelClick  ***********************}
procedure TFUser.BtnCancelClick(Sender: TObject);
begin
    SetEnabledDisable(True);
end;

{*******************  BtnNewClick  ***********************}
procedure TFUser.BtnNewClick(Sender: TObject);
begin
    StatusRecord:='Insert';
    SetEnabledDisable(False);
end;

{*******************  BtnEditClick  ***********************}
procedure TFUser.BtnEditClick(Sender: TObject);
begin
    IF (QLogin.RecNo<=0) OR (QLogin.IsEmpty) Then Exit;
    SetEnabledDisable(False);
    StatusRecord:='Update';
    GetValue;
end;

{*******************  BtnDelClick  ***********************}
procedure TFUser.BtnDelClick(Sender: TObject);
begin
    IF ((QLogin.RecNo<=0) OR (QLogin.IsEmpty)) Or (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —ﬂÊ—œ Õ–› ‘Êœ ø','Õ–› —ﬂÊ—œ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
    IF QLogin['UserName']='admin' then
    begin
        MessageBox(Self.Handle,'‘„« „Ã«“ »Â Õ–› «Ì‰ ò«—»— ‰Ì” Ìœ','Œÿ« œ— Â‰ê«„ Õ–›',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        Exit;
    end;
    IF QLogin['UserName']=UserName then
    begin
        MessageBox(Self.Handle,'‘„« Â„ «ò‰Ê‰ »« «Ì‰ ò«—»— Ê«—œ ‘œÂ «Ìœ Ê „Ã«“ »Â »Â Õ–› «Ì‰ ò«—»— ‰Ì” Ìœ','Œÿ« œ— Â‰ê«„ Õ–›',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        Exit;
    end;
    QDelete.Close;
    QDelete.Parameters.ParamByName('UserID').Value:=QLogin['UserID'];
    QDelete.ExecSQL;
    QLogin.Close;
    QLogin.Open;
    Grid.SetFocus;
end;

{*******************  Form Show  ***********************}
procedure TFUser.FormShow(Sender: TObject);
begin
    Grid.SetFocus;
end;
procedure TFUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    QLogin.Close;
end;

procedure TFUser.QLoginCalcFields(DataSet: TDataSet);
begin
    if QLogin['LevelPermission']=1 then
        QLogin['strLevelPermission']:='⁄«œÌ'
    else
        if QLogin['LevelPermission']=2 then
            QLogin['strLevelPermission']:='„œÌ—';

end;

procedure TFUser.btnWorkSectionClick(Sender: TObject);
begin
    Application.CreateForm(TfrmWorkSectionInfo, frmWorkSectionInfo);
    frmWorkSectionInfo.ShowModal;
    if frmWorkSectionInfo.strKey='enter' then
    begin
        edtWorkSectionID.Text:=frmWorkSectionInfo.QWorkSection['WorkSectionID'];
        edtWorkSectionName.Text:=frmWorkSectionInfo.QWorkSection['WorkSectionName'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmWorkSectionInfo);
end;

procedure TFUser.btnService_centerClick(Sender: TObject);
begin
    Application.CreateForm(TfrmService_center_info, frmService_center_info);
    frmService_center_info.ShowModal;
    if frmService_center_info.strKey='enter' then
    begin
        edtService_center_id.Text:=frmService_center_info.QService_center['id'];
        edtService_center.Text:=frmService_center_info.QService_center['title'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmService_center_info);
end;

procedure TFUser.edtSearchChange(Sender: TObject);
begin
    QLogin.Close;
    QLogin.Parameters.ParamByName('UserName').Value := '%'+edtSearch.Text+'%';
    QLogin.Open;
end;

procedure TFUser.btnUserTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmUserType, frmUserType);
    frmUserType.ShowModal;
    if frmUserType.strKey='enter' then
    begin
        edtUserTypeId.Text:=frmUserType.QUserType['id'];
        edtUserTypeTitle.Text:=frmUserType.QUserType['title'];
        BtnSave.SetFocus;
    end;
    FreeAndNil(frmUserType);
end;

end.
