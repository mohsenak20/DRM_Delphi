unit CreditCardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ExtDlgs, StdCtrls, Buttons, DB, ADODB,
  Menus, Mask, ComCtrls;

type
  TfrmCreditCard = class(TForm)
    Label4: TLabel;
    OpenPictureDialog: TOpenPictureDialog;
    SP_CreditCard: TADOStoredProc;
    QSubCreditCard: TADOQuery;
    pgcCreditCard: TPageControl;
    tabList: TTabSheet;
    tabEdit: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtName: TEdit;
    edtNID: TEdit;
    edtFatherName: TEdit;
    edtTel: TEdit;
    edtAddress: TEdit;
    edtCardID: TEdit;
    edtGroupName: TEdit;
    btnGroupInfo: TBitBtn;
    edtGroupID: TEdit;
    edtLastName: TEdit;
    edtCreditCardTypeID: TEdit;
    edtCreditCardTypeTitle: TEdit;
    btnCreditCardType: TBitBtn;
    edtCardIssuePrice: TEdit;
    edtNumberOfCustomer: TEdit;
    edtGeneralCode: TEdit;
    edtGenderID: TEdit;
    edtGenderTitle: TEdit;
    btnGender: TBitBtn;
    GroupBox1: TGroupBox;
    Shape4: TShape;
    Shape3: TShape;
    Shape2: TShape;
    imgSubSet1: TImage;
    imgSubset2: TImage;
    imgSubset3: TImage;
    lblPerson1: TLabel;
    lblPerson2: TLabel;
    lblPerson3: TLabel;
    lblSubsetTel1: TLabel;
    lblSubsetTel2: TLabel;
    lblSubsetTel3: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    imgSubset4: TImage;
    imgSubset5: TImage;
    imgSubset6: TImage;
    lblPerson4: TLabel;
    lblPerson5: TLabel;
    lblPerson6: TLabel;
    lblSubsetTel4: TLabel;
    lblSubsetTel5: TLabel;
    lblSubsetTel6: TLabel;
    Shape1: TShape;
    Image: TImage;
    btnOpenPic: TBitBtn;
    chbNotActive: TCheckBox;
    chbIsSessioned: TCheckBox;
    Panel2: TPanel;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    BtnNew: TBitBtn;
    BtnPrint: TBitBtn;
    btnPrintBack: TBitBtn;
    btnAmoozesh: TBitBtn;
    mnuDiscountCard: TBitBtn;
    Panel5: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    edtSName: TEdit;
    edtSNID: TEdit;
    edtSCardNumber: TEdit;
    BBtnAccept: TBitBtn;
    btnCredit: TBitBtn;
    edtStartDate: TMaskEdit;
    edtEndDate: TMaskEdit;
    edtSGroupID: TEdit;
    edtSGroupName: TEdit;
    btnSGroupInfo: TBitBtn;
    ExportToExcel: TBitBtn;
    DBGrid1: TDBGrid;
    QCreditCard: TADOQuery;
    dsCreditCard: TDataSource;
    pmnuGrid: TPopupMenu;
    pmnuEdit: TMenuItem;
    mnuSummary: TMenuItem;
    rbLesson: TRadioButton;
    rbMembership: TRadioButton;
    gbLesson: TGroupBox;
    Label20: TLabel;
    btnLessonCode: TBitBtn;
    edtLessonCode: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    lblLessonId: TLabel;
    lblLessonCode: TLabel;
    lblAgeCategory: TLabel;
    lblLessonType: TLabel;
    lblLessonGroup: TLabel;
    lblLessonPrice: TLabel;
    lblLessonCapacity: TLabel;
    lblLessonCapacityRemain: TLabel;
    lblLessonTitle: TLabel;
    Label30: TLabel;
    QLesson: TADOQuery;
    SP_Enrollment: TADOStoredProc;
    SP_PaymentEnrollment: TADOStoredProc;
    QCheckCreditCard: TADOQuery;
    Label31: TLabel;
    edtSGeneralCode: TEdit;
    QFirstIssueDate: TADOQuery;
    procedure btnOpenPicClick(Sender: TObject);
    procedure ClearForm();
    procedure BtnNewClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pmnuEditClick(Sender: TObject);
    procedure imgSubSet1DblClick(Sender: TObject);
    procedure fillSubset(CardID : string);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure callSubCreditCardForm(imgSubSet : TImage; subPic : string; lblPerson : TLabel; lblSubsetTel : TLabel; picNumber: integer);
    procedure imgSubset2DblClick(Sender: TObject);
    procedure imgSubset3DblClick(Sender: TObject);
    procedure btnGroupInfoClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure btnCreditClick(Sender: TObject);
    procedure btnPrintBackClick(Sender: TObject);
    procedure BBtnAcceptClick(Sender: TObject);
    procedure btnAmoozeshClick(Sender: TObject);
    procedure mnuDiscountCardClick(Sender: TObject);
    procedure btnCreditCardTypeClick(Sender: TObject);
    procedure btnSGroupInfoClick(Sender: TObject);
    procedure mnuSummaryClick(Sender: TObject);
    procedure imgSubset4DblClick(Sender: TObject);
    procedure imgSubset5DblClick(Sender: TObject);
    procedure imgSubset6DblClick(Sender: TObject);
    procedure btnGenderClick(Sender: TObject);
    procedure ExportToExcelClick(Sender: TObject);
    procedure rbLessonClick(Sender: TObject);
    procedure btnLessonCodeClick(Sender: TObject);
    procedure lessonInfo();
    procedure tabEditShow(Sender: TObject);
    procedure saveLesson(creditCardId: integer);
    procedure rbMembershipClick(Sender: TObject);
    procedure edtCardIDExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreditCard: TfrmCreditCard;
  StatusRecord:String;
  Pic, subPic1, subPic2, subPic3, subPic4, subPic5, subPic6 : String;

  
implementation

uses SubsetCreditCardUnit, DMUnit, CalculatUnit, ShareUnit,
  CreditCardGroupInfoUnit, qrCreditCardPrintUnit, CreditCardChargeUnit,
  qrCreditCardPrint1Unit, Math, CreditCardTypeInfo, UnitSummaryCreditCard,
  GenderInfoUnit, LessonInfoUnit;

{$R *.dfm}

procedure TfrmCreditCard.saveLesson(creditCardId: integer);
begin
    SP_Enrollment.Parameters.ParamByName('@id').Value:=-1;
    SP_Enrollment.Parameters.ParamByName('@lessonId').Value:=lblLessonId.Caption;
    SP_Enrollment.Parameters.ParamByName('@creditCardId').Value:=creditCardId;
    SP_Enrollment.Parameters.ParamByName('@enrollmentDate').Value:=CurrentDate;
    SP_Enrollment.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;
    SP_Enrollment.Parameters.ParamByName('@price').Value:=lblLessonPrice.Caption;
    SP_Enrollment.Parameters.ParamByName('@Action').Value:='Insert';
    SP_Enrollment.ExecProc;

    IF (MessageBox(Self.Handle,'¬Ì« Â“Ì‰Â œÊ—Â ¬„Ê“‘Ì Å—œ«Œ  ê—œÌœø','Å—œ«Œ  ‘Â—ÌÂ',MB_YESNO+MB_DEFBUTTON1+MB_ICONWARNING+MB_RIGHT)=mrYes)  Then
    begin
      SP_PaymentEnrollment.Parameters.ParamByName('@id').Value:=-1;
      SP_PaymentEnrollment.Parameters.ParamByName('@enrollmentId').Value:=SP_Enrollment.Parameters.ParamByName('@enrollmentId').Value;
      SP_PaymentEnrollment.Parameters.ParamByName('@price').Value:=lblLessonPrice.Caption;
      SP_PaymentEnrollment.Parameters.ParamByName('@userId').Value:=UserInfo.UserID;
      SP_PaymentEnrollment.Parameters.ParamByName('@paymentDate').Value:=CurrentDate;
      SP_PaymentEnrollment.Parameters.ParamByName('@Action').Value:='Insert';
      SP_PaymentEnrollment.ExecProc;
    end;


end;

procedure TfrmCreditCard.lessonInfo();
begin
    Application.CreateForm(TfrmLessonInfo, frmLessonInfo);
    frmLessonInfo.ShowModal;
    if frmLessonInfo.strKey='enter' then
    begin
        lblLessonId.Caption := frmlessonInfo.QLesson['id'];
        lblLessonCode.Caption := frmlessonInfo.QLesson['code'];
        lblLessonTitle.Caption := frmlessonInfo.QLesson['title'];
        lblLessonType.Caption := frmlessonInfo.QLesson['lessonTypeTitle'];
        lblLessonGroup.Caption := frmlessonInfo.QLesson['lessonGroupTitle'];
        lblAgeCategory.Caption := frmlessonInfo.QLesson['agecategoryTitle'];
        lblLessonPrice.Caption := frmlessonInfo.QLesson['price'];
        lblLessonCapacity.Caption := frmlessonInfo.QLesson['capacity'];
        btnGender.SetFocus;
    end;
    FreeAndNil(frmLessonInfo);
end;

procedure TfrmCreditCard.callSubCreditCardForm(imgSubSet : TImage; subPic : string; lblPerson : TLabel; lblSubsetTel : TLabel; picNumber: integer);
begin
    if edtCardID.Text = '' then Exit;
    Application.CreateForm(TfrmSubsetCreditCard, frmSubsetCreditCard);
    frmSubsetCreditCard.lblCardID.Caption := edtCardID.Text;
    frmSubsetCreditCard.CreditCardID := edtCardID.Text;
    frmSubsetCreditCard.lblName.Caption := edtName.Text+' '+edtLastName.Text;
    frmSubsetCreditCard.picNumber := picNumber;
    if imgSubSet.Tag = 0 then
    begin
        frmSubsetCreditCard.id := -1;
        frmSubsetCreditCard.StatusRecord := 'Insert';
    end
    else
    begin
        frmSubsetCreditCard.id := imgSubSet.Tag;
        frmSubsetCreditCard.Pic := subPic;
        frmSubsetCreditCard.StatusRecord := 'Update';
        frmSubsetCreditCard.Image.Picture := imgSubSet.Picture;
        frmSubsetCreditCard.edtName.Text := lblPerson.Caption;
        frmSubsetCreditCard.edtTel.Text := lblSubsetTel.Caption;

    end;
    frmSubsetCreditCard.ShowModal;
    FreeAndNil(frmSubsetCreditCard);
    fillSubset(edtCardID.Text);



end;

procedure TfrmCreditCard.fillSubset(CardID : string);
var
  subCreditCard : integer;
begin
    subCreditCard := 1;
    QSubCreditCard.Close;
    QSubCreditCard.Parameters.ParamByName('CreditCardID').Value := CardID;
    QSubCreditCard.Open;
    while not QSubCreditCard.Eof do
    begin
        if subCreditCard = 1 then
        begin
            imgSubSet1.Tag := QSubCreditCard['id'];
            if FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic']) then
              imgSubSet1.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            lblPerson1.Caption := QSubCreditCard['name'];
            lblSubsetTel1.Caption := QSubCreditCard['Tel'];
            subPic1 := Parameter.URL_Pic+'\'+QSubCreditCard['pic'];
        end;
        if subCreditCard = 2 then
        begin
            imgSubSet2.Tag := QSubCreditCard['id'];
            if FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic']) then
              imgSubSet2.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            lblPerson2.Caption := QSubCreditCard['name'];
            lblSubsetTel2.Caption := QSubCreditCard['Tel'];
            subPic2 := Parameter.URL_Pic+'\'+QSubCreditCard['pic'];
        end;
        if subCreditCard = 3 then
        begin
            imgSubSet3.Tag := QSubCreditCard['id'];
            if FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic']) then
              imgSubSet3.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            lblPerson3.Caption := QSubCreditCard['name'];
            lblSubsetTel3.Caption := QSubCreditCard['Tel'];
            subPic3 := Parameter.URL_Pic+'\'+QSubCreditCard['pic'];
        end;
        if subCreditCard = 4 then
        begin
            imgSubSet4.Tag := QSubCreditCard['id'];
            if FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic']) then
              imgSubSet4.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            lblPerson4.Caption := QSubCreditCard['name'];
            lblSubsetTel4.Caption := QSubCreditCard['Tel'];
            subPic4 := Parameter.URL_Pic+'\'+QSubCreditCard['pic'];
        end;
        if subCreditCard = 5 then
        begin
            imgSubSet5.Tag := QSubCreditCard['id'];
            if FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic']) then
              imgSubSet5.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            lblPerson5.Caption := QSubCreditCard['name'];
            lblSubsetTel5.Caption := QSubCreditCard['Tel'];
            subPic5 := Parameter.URL_Pic+'\'+QSubCreditCard['pic'];
        end;
        if subCreditCard = 6 then
        begin
            imgSubSet6.Tag := QSubCreditCard['id'];
            if FileExists(Parameter.URL_Pic+'\'+QSubCreditCard['pic']) then
              imgSubSet6.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QSubCreditCard['pic']);
            lblPerson6.Caption := QSubCreditCard['name'];
            lblSubsetTel6.Caption := QSubCreditCard['Tel'];
            subPic6 := Parameter.URL_Pic+'\'+QSubCreditCard['pic'];
        end;
        subCreditCard := subCreditCard + 1;
        QSubCreditCard.Next;
    end;


end;
procedure TfrmCreditCard.ClearForm();
begin
    edtCardID.Clear;
    edtName.Clear;
    edtLastName.Clear;
    edtNID.Clear;
    edtFatherName.Clear;
    edtTel.Clear;
    edtAddress.Clear;
    edtGeneralCode.Clear;
    Image.Picture.LoadFromFile('');
    StatusRecord := 'Insert';
    edtGenderID.Clear;
    edtGenderTitle.Clear;
    edtNumberOfCustomer.Text := '1';
    subPic1 := '';
    subPic2 := '';
    subPic3 := '';
    subPic4 := '';
    subPic5 := '';
    subPic6 := '';
    imgSubSet1.Picture.LoadFromFile('');
    imgSubSet2.Picture.LoadFromFile('');
    imgSubSet3.Picture.LoadFromFile('');
    imgSubSet4.Picture.LoadFromFile('');
    imgSubSet5.Picture.LoadFromFile('');
    imgSubSet6.Picture.LoadFromFile('');
    lblPerson1.Caption := '';
    lblPerson2.Caption := '';
    lblPerson3.Caption := '';
    lblPerson4.Caption := '';
    lblPerson5.Caption := '';
    lblPerson6.Caption := '';

    lblSubsetTel1.Caption := '';
    lblSubsetTel2.Caption := '';
    lblSubsetTel3.Caption := '';
    lblSubsetTel4.Caption := '';
    lblSubsetTel5.Caption := '';
    lblSubsetTel6.Caption := '';
    imgSubSet1.Tag := 0;
    imgSubSet2.Tag := 0;
    imgSubSet3.Tag := 0;
    imgSubSet4.Tag := 0;
    imgSubSet5.Tag := 0;
    imgSubSet6.Tag := 0;
    Pic := '';
    lblLessonId.Caption := '';
    lblLessonCode.Caption := '';
    lblAgeCategory.Caption := '';
    lblLessonType.Caption := '';
    lblLessonGroup.Caption := '';
    lblLessonPrice.Caption := '';
    lblLessonCapacity.Caption := '';
    lblLessonCapacityRemain.Caption := '';
    lblLessonTitle.Caption := '';
    edtLessonCode.Clear;
    rbLesson.Enabled := True;
    rbMembership.Enabled := True;
    gbLesson.Enabled := False;
    rbMembership.Checked := True;
    chbIsSessioned.Checked := False;
end;

procedure TfrmCreditCard.btnOpenPicClick(Sender: TObject);
begin
    if OpenPictureDialog.Execute then
    begin
        if FileExists(OpenPictureDialog.FileName) then
          Image.Picture.LoadFromFile(OpenPictureDialog.FileName);
        Pic := OpenPictureDialog.FileName;

    end
    else
        ShowMessage('Open file was cancelled');

end;

procedure TfrmCreditCard.BtnNewClick(Sender: TObject);
begin
    ClearForm;
    edtCardID.SetFocus;
end;

procedure TfrmCreditCard.BtnCancelClick(Sender: TObject);
begin
    ClearForm;
end;

procedure TfrmCreditCard.BtnSaveClick(Sender: TObject);
begin
    IF (edtCardID.Text='') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtCardID.SetFocus;
        Exit;
    End;

    IF (rbLesson.Checked) and (lblLessonId.Caption = '') and (StatusRecord = 'Insert') Then
    Begin
        MessageBox(Self.Handle,'! «ÿ·«⁄«  ﬂ«„· Ê«—œ ‰‘œÂ «” ','Œÿ« Â‰ê«„ Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT);
        edtCardID.SetFocus;
        Exit;
    End;

    SP_CreditCard.Parameters.ParamByName('@CardID').Value:=edtCardID.Text;
    SP_CreditCard.Parameters.ParamByName('@Name').Value:=edtName.Text;
    SP_CreditCard.Parameters.ParamByName('@lastName').Value:=edtLastName.Text;
    SP_CreditCard.Parameters.ParamByName('@NID').Value:=edtNID.Text;
    SP_CreditCard.Parameters.ParamByName('@FatherName').Value:=edtFatherName.Text;
    SP_CreditCard.Parameters.ParamByName('@Address').Value:=edtAddress.Text;
    SP_CreditCard.Parameters.ParamByName('@Tel').Value:=edtTel.Text;
    SP_CreditCard.Parameters.ParamByName('@CreditGroupID').Value:=edtGroupID.Text;
    if pic <> '' then
      SP_CreditCard.Parameters.ParamByName('@Pic').Value:=edtCardID.Text+'.jpg'
    else
      SP_CreditCard.Parameters.ParamByName('@Pic').Value:= '';
    SP_CreditCard.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    if edtCreditCardTypeID.Text = '1' then
        SP_CreditCard.Parameters.ParamByName('@Active').Value:=1
    else
        SP_CreditCard.Parameters.ParamByName('@Active').Value:=0;
    SP_CreditCard.Parameters.ParamByName('@Comment').Value:='';
    SP_CreditCard.Parameters.ParamByName('@Type').Value:=edtCreditCardTypeID.Text;
    SP_CreditCard.Parameters.ParamByName('@CardIssuePrice').Value:= StrToIntDef(edtCardIssuePrice.Text, 0);
    SP_CreditCard.Parameters.ParamByName('@NumberOfCustomer').Value:= StrToIntDef(edtNumberOfCustomer.Text, 1);
    SP_CreditCard.Parameters.ParamByName('@generalCode').Value:=edtGeneralCode.Text;
    SP_CreditCard.Parameters.ParamByName('@genderId').Value:=edtGenderID.Text;
    SP_CreditCard.Parameters.ParamByName('@isLesson').Value:=rbLesson.checked;
    SP_CreditCard.Parameters.ParamByName('@isSession').Value:=chbIsSessioned.Checked;
    if chbNotActive.Checked then
        SP_CreditCard.Parameters.ParamByName('@NotActive').Value:= 1
    else
        SP_CreditCard.Parameters.ParamByName('@NotActive').Value:= 0;
    IF StatusRecord='Insert' then
    begin
        SP_CreditCard.Parameters.ParamByName('@Action').Value:='Insert';
        SP_CreditCard.Parameters.ParamByName('@IssueDate').Value:=CurrentDate;
    end
    Else
    IF StatusRecord='Update' then Begin
    begin
        SP_CreditCard.Parameters.ParamByName('@Action').Value:='Update';
        SP_CreditCard.Parameters.ParamByName('@IssueDate').Value:=QCreditCard['IssueDate'];
    end;
    End;
    SP_CreditCard.ExecProc;
    if (rbLesson.Checked) and  (StatusRecord = 'Insert') then
      saveLesson(SP_CreditCard.Parameters.ParamByName('@creditCardId').Value);
    if pic <> '' then
        CopyFile(pchar(Pic), pchar(Parameter.URL_Pic+'\'+Trim(edtCardID.Text)+'.jpg'), False);

    StatusRecord:='';
    QCreditCard.Close;
    QCreditCard.Open;
    ShowMessage('«ÿ·«⁄«  –ŒÌ—Â ê—œÌœ');
end;

procedure TfrmCreditCard.FormCreate(Sender: TObject);
begin
    StatusRecord := 'Insert';
    QFirstIssueDate.Open;
    if QFirstIssueDate['issueDate']<> null then
      edtStartDate.Text := QFirstIssueDate['issueDate'];
    edtEndDate.Text := CurrentDate;
    QCreditCard.Open;
    tabEdit.Show;
    ClearForm;
end;

procedure TfrmCreditCard.pmnuEditClick(Sender: TObject);
begin
try
    ClearForm;
    edtCardID.Text := QCreditCard['CardID'];
    edtGroupID.Text := QCreditCard['CreditGroupID'];
    edtCreditCardTypeID.Text := QCreditCard['Type'];
    edtCreditCardTypeTitle.Text := QCreditCard['Title'];
    edtGroupName.Text := QCreditCard['CreditGroupName'];
    edtName.Text := QCreditCard['Name'];
    edtLastName.Text := QCreditCard['lastName'];
    edtNID.Text := QCreditCard['NID'];
    edtFatherName.Text := QCreditCard['FatherName'];
    edtTel.Text := QCreditCard['Tel'];
    edtAddress.Text := QCreditCard['Address'];
    if FileExists(Parameter.URL_Pic+'\'+QCreditCard['pic']) then
      Image.Picture.LoadFromFile(Parameter.URL_Pic+'\'+QCreditCard['pic']);
    if QCreditCard['pic'] <> '' then
      Pic := Parameter.URL_Pic+'\'+QCreditCard['pic'];
    edtCardIssuePrice.Text := QCreditCard['CardIssuePrice'];
    chbNotActive.Checked := QCreditCard['NotActive'];
    edtNumberOfCustomer.Text := QCreditCard['NumberOfCustomer'];
    edtGeneralCode.Text := QCreditCard['generalCode'];
    edtGenderID.Text := QCreditCard['genderId'];
    edtGenderTitle.Text := QCreditCard['genderTitle'];
    tabEdit.Show;
    StatusRecord := 'Update';
    gbLesson.Enabled := False;
    if QCreditCard['isLesson'] then
      rbLesson.Checked := True
    else
      rbMembership.Checked := True;

    rbLesson.Enabled := False;
    rbMembership.Enabled := False;
    fillSubset(QCreditCard['CardID']);
    chbIsSessioned.Checked := QCreditCard['isSession'];
   except
       ShowMessage('Œÿ« œ— »«“Ì«»Ì «ÿ·«⁄« ');
   end;
end;

procedure TfrmCreditCard.imgSubSet1DblClick(Sender: TObject);
begin
    callSubCreditCardForm(imgSubset1, subPic1, lblPerson1, lblSubsetTel1, 1);
end;

procedure TfrmCreditCard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmCreditCard.imgSubset2DblClick(Sender: TObject);
begin
    callSubCreditCardForm(imgSubset2, subPic2, lblPerson2, lblSubsetTel2, 2);
end;

procedure TfrmCreditCard.imgSubset3DblClick(Sender: TObject);
begin
    callSubCreditCardForm(imgSubset3, subPic3, lblPerson3, lblSubsetTel3, 3);
end;

procedure TfrmCreditCard.btnGroupInfoClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardGroupInfo, frmCreditCardGroupInfo);
    frmCreditCardGroupInfo.ShowModal;
    if frmCreditCardGroupInfo.strKey='enter' then
    begin
        edtGroupID.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupID'];
        edtGroupName.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupName'];
        btnCreditCardType.SetFocus;
    end;
    FreeAndNil(frmCreditCardGroupInfo);
end;

procedure TfrmCreditCard.BtnPrintClick(Sender: TObject);
begin
    Application.CreateForm(TqrCreditCardPrint, qrCreditCardPrint);
    qrCreditCardPrint.lblName.Caption := edtName.Text;
    qrCreditCardPrint.lblLastName.Caption := edtLastName.Text;
    qrCreditCardPrint.lblNID.Caption := edtNID.Text;
    qrCreditCardPrint.lblIssueDate.Caption := CurrentDate;
    qrCreditCardPrint.imgPerson.Picture := Image.Picture;
    qrCreditCardPrint.Prepare;
    qrCreditCardPrint.PreviewModal;
    FreeAndNil(qrCreditCardPrint);


end;

procedure TfrmCreditCard.btnCreditClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardCharge, frmCreditCardCharge);
    frmCreditCardCharge.ShowModal;
    FreeAndNil(frmCreditCardCharge);
end;

procedure TfrmCreditCard.btnPrintBackClick(Sender: TObject);
begin
    Application.CreateForm(TqrCreditCard1, qrCreditCard1);
    qrCreditCard1.imgPerson1.Picture := imgSubSet1.Picture;
    qrCreditCard1.imgPerson2.Picture := imgSubset2.Picture;
    qrCreditCard1.imgPerson3.Picture := imgSubset3.Picture;
    qrCreditCard1.Prepare;
    qrCreditCard1.PreviewModal;
    FreeAndNil(qrCreditCard1);
end;

procedure TfrmCreditCard.BBtnAcceptClick(Sender: TObject);
var
    strFilter : string;
begin
    strFilter := ' issueDate >= '+QuotedStr(edtStartDate.Text)+' and IssueDate <= '+QuotedStr(edtEndDate.Text);
    If edtSName.Text <> '' then
        strFilter := strFilter + ' and lastName like '+QuotedStr('%'+edtSName.Text+'%');
    if edtSNID.Text <> '' then
        strFilter := strFilter + ' and NID like '+QuotedStr('%'+edtSNID.Text+'%');
    if edtSCardNumber.Text <> '' then
        strFilter := strFilter + ' and CardID like '+QuotedStr('%'+edtSCardNumber.Text+'%');

    if edtSGroupID.Text <> '' then
        strFilter := strFilter + ' and TCreditCard.CreditGroupID ='+edtSGroupID.Text;

    if edtSGeneralCode.Text <> '' then
        strFilter := strFilter + ' and generalCode='+QuotedStr(edtSGeneralCode.Text);

    QCreditCard.Close;
    QCreditCard.SQL.Clear;
    QCreditCard.SQL.Add('select CardID, Name, lastName, NID, FatherName, Address, Tel, TCreditCard.CreditGroupID, NumberOfCustomer,');
    QCreditCard.SQL.Add('CreditGroupName, Pic, IssueDate, IssueTime, UserID, Active, Comment, Type,  TCReditCardType.title, TCreditCard.CardIssuePrice, generalCode, NotActive, ');
    QCreditCard.SQL.Add('gender.title genderTitle, genderId, isLesson, isSession');
    QCreditCard.SQL.Add('from TCreditCard inner join TCreditGroup');
    QCreditCard.SQL.Add('on TCreditCard.CreditGroupID = TCreditGroup.CreditGroupID');
    QCreditCard.SQL.Add('inner join TCReditCardType on TCreditCardType.id = TCreditCard.type');
    QCreditCard.SQL.Add('inner join gender on TCreditCard.genderId = gender.id');
    if strFilter <> '' then
        QCreditCard.SQL.Add(' where '+strFilter);
    QCreditCard.SQL.Add('order by  issueDate, IssueTime DESC');
    QCreditCard.Open;
end;

procedure TfrmCreditCard.btnAmoozeshClick(Sender: TObject);
begin
    Application.CreateForm(TqrCreditCardPrint, qrCreditCardPrint);
    qrCreditCardPrint.QRImage1.Picture.LoadFromFile('AmoozeshParvaresh.JPG');
    qrCreditCardPrint.lblName.Caption := edtName.Text;
    qrCreditCardPrint.lblLastName.Caption := edtLastName.Text;
    qrCreditCardPrint.lblNID.Caption := edtNID.Text;
    qrCreditCardPrint.lblIssueDate.Caption := CurrentDate;
    qrCreditCardPrint.imgPerson.Picture := Image.Picture;
    qrCreditCardPrint.Prepare;
    qrCreditCardPrint.PreviewModal;
    FreeAndNil(qrCreditCardPrint);
end;

procedure TfrmCreditCard.mnuDiscountCardClick(Sender: TObject);
begin
    Application.CreateForm(TqrCreditCardPrint, qrCreditCardPrint);
    qrCreditCardPrint.QRImage1.Picture.LoadFromFile('DiscountCard.JPG');
    qrCreditCardPrint.lblName.Caption := edtName.Text;
    qrCreditCardPrint.lblLastName.Caption := edtLastName.Text;
    qrCreditCardPrint.lblNID.Caption := edtNID.Text;
    qrCreditCardPrint.lblIssueDate.Caption := CurrentDate;
    qrCreditCardPrint.imgPerson.Picture := Image.Picture;
    qrCreditCardPrint.Prepare;
    qrCreditCardPrint.PreviewModal;
    FreeAndNil(qrCreditCardPrint);
end;

procedure TfrmCreditCard.btnCreditCardTypeClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardTypeInfo, frmCreditCardTypeInfo);
    frmCreditCardTypeInfo.ShowModal;
    if frmCreditCardTypeInfo.strKey='enter' then
    begin
        edtCreditCardTypeID.Text:=frmCreditCardTypeInfo.QCreditCardType['id'];
        edtCreditCardTypeTitle.Text:=frmCreditCardTypeInfo.QCreditCardType['Title'];
        edtCardIssuePrice.Text := frmCreditCardTypeInfo.QCreditCardType['CardIssuePrice'];
        btnGender.SetFocus;
    end;
    FreeAndNil(frmCreditCardTypeInfo);
end;

procedure TfrmCreditCard.btnSGroupInfoClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCreditCardGroupInfo, frmCreditCardGroupInfo);
    frmCreditCardGroupInfo.ShowModal;
    if frmCreditCardGroupInfo.strKey='enter' then
    begin
        edtSGroupID.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupID'];
        edtSGroupName.Text:=frmCreditCardGroupInfo.QGroup['CreditGroupName'];
        BBtnAccept.SetFocus;
    end;
    FreeAndNil(frmCreditCardGroupInfo);

end;

procedure TfrmCreditCard.mnuSummaryClick(Sender: TObject);
begin
    Application.CreateForm(TfrmSummaryCreditCard, frmSummaryCreditCard);
    frmSummaryCreditCard.ShowModal;
    FreeAndNil(frmSummaryCreditCard);
end;

procedure TfrmCreditCard.imgSubset4DblClick(Sender: TObject);
begin
    callSubCreditCardForm(imgSubset4, subPic4, lblPerson4, lblSubsetTel4, 4);
end;

procedure TfrmCreditCard.imgSubset5DblClick(Sender: TObject);
begin
    callSubCreditCardForm(imgSubset5, subPic5, lblPerson5, lblSubsetTel5, 5);
end;

procedure TfrmCreditCard.imgSubset6DblClick(Sender: TObject);
begin
    callSubCreditCardForm(imgSubset6, subPic6, lblPerson6, lblSubsetTel6, 6);
end;

procedure TfrmCreditCard.btnGenderClick(Sender: TObject);
begin
    Application.CreateForm(TfrmGenderInfo, frmGenderInfo);
    frmGenderInfo.ShowModal;
    if frmGenderInfo.strKey='enter' then
    begin
        edtGenderID.Text:=frmGenderInfo.QGender['id'];
        edtGenderTitle.Text:=frmGenderInfo.QGender['Title'];
        edtName.SetFocus;
    end;
    FreeAndNil(frmGenderInfo);
end;

procedure TfrmCreditCard.ExportToExcelClick(Sender: TObject);
begin
  ExportToExl(QCreditCard);
end;

procedure TfrmCreditCard.rbLessonClick(Sender: TObject);
begin
  gbLesson.Enabled := True;
  edtLessonCode.SetFocus;
  chbIsSessioned.Checked := True;
end;

procedure TfrmCreditCard.btnLessonCodeClick(Sender: TObject);
begin
    if edtLessonCode.Text <> '' then
    begin
        QLesson.Close;
        QLesson.Parameters.ParamByName('lessonCode').Value := edtLessonCode.Text;
        QLesson.Open;
        if QLesson['id'] <> null then
        begin
            lblLessonId.Caption := QLesson['id'];
            lblLessonCode.Caption := QLesson['code'];
            lblLessonTitle.Caption := QLesson['title'];
            lblLessonType.Caption := QLesson['lessonTypeTitle'];
            lblLessonGroup.Caption := QLesson['lessonGroupTitle'];
            lblAgeCategory.Caption := QLesson['agecategoryTitle'];
            lblLessonPrice.Caption := QLesson['price'];
            lblLessonCapacity.Caption := QLesson['capacity'];
            //lblLessonCapacityRemain.Caption := QLesson['capacityRemain'];
            lessonInfo;
        end;
    end
    else
      lessonInfo;

    edtCardID.SetFocus;
end;

procedure TfrmCreditCard.tabEditShow(Sender: TObject);
begin
    edtCardID.SetFocus;
end;

procedure TfrmCreditCard.rbMembershipClick(Sender: TObject);
begin
  chbIsSessioned.Checked := False;
end;

procedure TfrmCreditCard.edtCardIDExit(Sender: TObject);
begin
    if (StatusRecord = 'Insert') and (edtCardID.Text <> '') then
    begin
      QCheckCreditCard.Close;
      QCheckCreditCard.Parameters.ParamByName('cardId').Value := edtCardId.Text;
      QCheckCreditCard.Open;
      if QCheckCreditCard['id']<>null then
      begin
          ShowMessage('«Ì‰ ‘„«—Â ò«—   ò—«—Ì „Ì »«‘œ');
          edtCardID.Clear;
          Exit;
      end;

    end;

end;

end.
