unit SalesFactorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, Grids, DB, ADODB, DBGrids,
  ActnList, ComCtrls;

type
  TfrmSalesFactor = class(TForm)
    SG: TStringGrid;
    btnReturn: TBitBtn;
    btnSave: TBitBtn;
    Panel1: TPanel;
    panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtSum: TEdit;
    edtDiscount: TEdit;
    edtMandeh: TEdit;
    SP_Factor: TADOStoredProc;
    SP_SubFactor: TADOStoredProc;
    SP_Doc: TADOStoredProc;
    SP_Artic: TADOStoredProc;
    QCustomer: TADOQuery;
    QMaxDocNumber: TADOQuery;
    QProduct: TADOQuery;
    QFindAccInfo: TADOQuery;
    Label1: TLabel;
    edtDescription: TEdit;
    SP_Storage: TADOStoredProc;
    SP_Exist: TADOStoredProc;
    Label7: TLabel;
    edtSerialNumber: TEdit;
    QSerialNumber: TADOQuery;
    ActionList1: TActionList;
    ASave: TAction;
    StatusBar: TStatusBar;
    Return: TAction;
    QEditFactor: TADOQuery;
    QMaterialVahedName: TADOQuery;
    QVahedProductName: TADOQuery;
    QStorage: TADOQuery;
    btnDelet: TBitBtn;
    lblAct: TLabel;
    Label8: TLabel;
    QDelete: TADOQuery;
    btnViewDoc: TBitBtn;
    QDocNumber: TADOQuery;
    BtnPrint: TBitBtn;
    QPrint: TADOQuery;
    QMod: TADOQuery;
    QFactorMod: TADOQuery;
    QDeleteSubFactor: TADOQuery;
    procedure sum;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGEnter(Sender: TObject);
    procedure SGExit(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSerialNumberExit(Sender: TObject);
    procedure ClearForm();
    procedure btnDeletClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSalesFactor: TfrmSalesFactor;
  RowNumber : integer;
  strTemp : String;
implementation

uses ProductUnit, DMUnit, CalculatUnit, Math, KalaInfoUnit;

{$R *.dfm}

procedure TfrmSalesFactor.ClearForm();
var
i : integer;
begin
    for i:=1 to 100 do
    begin
        SG.Cells[0,i]:=IntToStr(i);
        SG.Cells[1,i]:='';
        SG.Cells[2,i]:='';
        SG.Cells[3,i]:='0';
        SG.Cells[4,i]:='0';
        SG.Cells[5,i]:='0';
    end;
    edtSum.Text:='0';
    edtDiscount.Text:='0';
    edtMandeh.Text:='0';
    edtDescription.Clear;
    lblAct.Caption:='œ—Ã';    
end;


procedure TfrmSalesFactor.sum;
var
i, SumKol : integer;
begin
    SumKol:=0;
    for i:=1 To SG.RowCount-1 do
    begin
        SG.Cells[5,i]:=IntToStr(StrToIntDef(SG.Cells[3,i],0)*StrToIntDef(SG.Cells[4,i],0));
        SumKol:=SumKol+StrToIntDef(SG.Cells[5,i],0);
    end;
    edtSum.Text:=IntToStr(SumKol);
end;
procedure TfrmSalesFactor.FormCreate(Sender: TObject);
var
i : integer;
begin
    SG.Cells[0,0]:='—œÌ›';
    SG.Cells[1,0]:='òœ ò«·«';
    SG.Cells[2,0]:='‘—Õ ò«·«';
    SG.Cells[3,0]:=' ⁄œ«œ/„ﬁœ«—';
    SG.Cells[4,0]:='›Ì';
    SG.Cells[5,0]:='Ã„⁄ —œÌ›';
    for i:=1 to 100 do
    begin
        SG.Cells[0,i]:=IntToStr(i);
        SG.Cells[3,i]:='0';
        SG.Cells[4,i]:='0';
        SG.Cells[5,i]:='0';
    end;
end;

procedure TfrmSalesFactor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key=13) then
            FocusControl(FindNextControl(ActiveControl,true,true,false));
end;

procedure TfrmSalesFactor.SGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
  begin
      if (SG.Col=1) and (SG.Cells[1, SG.Row]='') then
      begin
          Application.CreateForm(TfrmKalaInfo, frmKalaInfo);
          frmKalaInfo.ShowModal;
          if frmKalaInfo.strKey='enter' then
          begin
              SG.Cells[1,SG.Row]:=frmKalaInfo.QKala['KalaID'];
              SG.Cells[2,SG.Row]:=frmKalaInfo.QKala['KalaName'];
          end;
          FreeAndNil(frmKalaInfo);
          SG.Col:=3;
      end
      else
          if SG.Col+1 < 5 then
          begin
              SG.Col:=SG.Col+1;
              if SG.Col=4 then
                  SG.Cells[4, SG.Row]:='';
          end
          else
          begin
              SG.Col:=1;
              SG.Row:=SG.Row+1;
          end;
  end;
  if RowNumber<>SG.Row then
  begin
      sum;
  end;
end;

procedure TfrmSalesFactor.SGEnter(Sender: TObject);
begin
    KeyPreview:=False;
    SG.Col:=1;
end;

procedure TfrmSalesFactor.SGExit(Sender: TObject);
begin
    sum;
    KeyPreview:=True;
end;

procedure TfrmSalesFactor.btnReturnClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSalesFactor.btnSaveClick(Sender: TObject);
var
i : integer;
begin
{
    QCustomer.Close;
    QCustomer.Parameters.ParamValues['CustomerID']:=edtAccIDSaler.Text;
    QCustomer.Prepared;
    QCustomer.Open;
}
    SP_Factor.Parameters.ParamByName('@CustomerID').Value:=1;
    SP_Factor.Parameters.ParamByName('@ExportDate').Value:=CurrentDate;
    SP_Factor.Parameters.ParamByName('@Description').Value:=edtDescription.Text;
    SP_Factor.Parameters.ParamByName('@UserID').Value:=UserInfo.UserID;
    SP_Factor.Parameters.ParamByName('@Discount').Value:=edtDiscount.Text;
    if lblAct.Caption='œ—Ã' then
    begin
        SP_Factor.Parameters.ParamByName('@FactorID').Value:=-1;
        SP_Factor.Parameters.ParamByName('@Action').Value:='Insert';
    end
    else
    begin
        QDeleteSubFactor.Close;
        QDeleteSubFactor.Parameters.ParamByName('FactorID').Value:=QEditFactor['FactorID'];
        QDeleteSubFactor.ExecSQL;
        SP_Factor.Parameters.ParamByName('@FactorID').Value:=QEditFactor['FactorID'];
        SP_Factor.Parameters.ParamByName('@Action').Value:='Update';
    end;
    SP_Factor.Parameters.ParamByName('@Active').Value:=True;
    SP_Factor.Parameters.ParamByName('@BargainType').Value:=False;
    SP_Factor.Parameters.ParamByName('@PreFactor').Value:=False;
    SP_Factor.Parameters.ParamByName('@PercentDiscount').Value:=0;
    SP_Factor.Parameters.ParamByName('@BuyOrSale').Value:=False;
    SP_Factor.Parameters.ParamByName('@FactorType').Value:=2;
    SP_Factor.Parameters.ParamByName('@Documentation').Value:=False;
    SP_Factor.ExecProc;
    {
    QMaxDocNumber.Close;
    QMaxDocNumber.Parameters.ParamValues['DaftarID']:=BaseInfo.DaftarID;
    QMaxDocNumber.Prepared;
    QMaxDocNumber.Open;
    if QMaxDocNumber['MaxDocNumber']<>Null then
        SP_Doc.Parameters.ParamByName('@DocNumber').Value:=StrToInt(QMaxDocNumber['MaxDocNumber'])+1
    else
        SP_Doc.Parameters.ParamByName('@DocNumber').Value:=1;
    SP_Doc.Parameters.ParamByName('@DocDate').Value:=edtFactorDate.Text;
    SP_Doc.Parameters.ParamByName('@Description').Value:='«Ì‰ ”‰œ „—»Êÿ »Â ›«ò Ê— Œ—Ìœ ‘„«—Â '+inttostr(SP_Factor.Parameters.ParamByName('@OutFactorID').Value)+' „Ì »«‘œ';
    SP_Doc.Parameters.ParamByName('@DaftarID').Value:=BaseInfo.DaftarID;
    SP_Doc.Parameters.ParamByName('@FactorID').Value:=SP_Factor.Parameters.ParamByName('@OutFactorID').Value;
    SP_Doc.Parameters.ParamByName('@Action').Value:='Insert';
    SP_Doc.ExecProc;

    QFindAccInfo.Close;
    QFindAccInfo.Parameters.ParamValues['RizID']:=edtAccIDSaler.Text;
    QFindAccInfo.Prepared;
    QFindAccInfo.Open;

    SP_Artic.Parameters.ParamByName('@Code').Value:=QFindAccInfo['Code'];
    SP_Artic.Parameters.ParamByName('@RizID').Value:=edtAccIDSaler.Text;
    SP_Artic.Parameters.ParamByName('@Bed').Value:=0;
    SP_Artic.Parameters.ParamByName('@Bes').Value:=edtSum.Text;
    SP_Artic.Parameters.ParamByName('@Description').Value:='„—»Êÿ »Â Œ—Ìœ «“ ¬ﬁ«Ì/Œ«‰„ '+edtSalerName.Text;
    SP_Artic.Parameters.ParamByName('@DocID').Value:=SP_Doc.Parameters.ParamByName('@OutDocID').Value;
    SP_Artic.Parameters.ParamByName('@Action').Value:='Insert';
    SP_Artic.ExecProc;
    }
    for i:=1 to SG.RowCount-1 do
    begin
        if SG.Cells[1,i]<>'' then
        begin
            SP_SubFactor.Parameters.ParamByName('@FactorID').Value:=SP_Factor.Parameters.ParamByName('@OutFactorID').Value;
            SP_SubFactor.Parameters.ParamByName('@ProductID').Value:=SG.Cells[1,i];
            SP_SubFactor.Parameters.ParamByName('@Number').Value:=SG.Cells[3,i];
            SP_SubFactor.Parameters.ParamByName('@VahedPrice').Value:=SG.Cells[4,i];
            SP_SubFactor.Parameters.ParamByName('@Description').Value:='';
            SP_SubFactor.Parameters.ParamByName('@Active').Value:=True;
            SP_SubFactor.Parameters.ParamByName('@Action').Value:='Insert';
            SP_SubFactor.ExecProc;
            {
            QProduct.Close;
            QProduct.Parameters.ParamValues['ProductID']:=SG.Cells[1,i];
            QProduct.Prepared;
            QProduct.Open;
            QFindAccInfo.Close;
            QFindAccInfo.Parameters.ParamValues['RizID']:=QProduct['AccID'];
            QFindAccInfo.Prepared;
            QFindAccInfo.Open;

            SP_Artic.Parameters.ParamByName('@Code').Value:=QFindAccInfo['Code'];
            SP_Artic.Parameters.ParamByName('@RizID').Value:=QProduct['AccID'];
            SP_Artic.Parameters.ParamByName('@Bed').Value:=SG.Cells[5,i];
            SP_Artic.Parameters.ParamByName('@Bes').Value:=0;
            SP_Artic.Parameters.ParamByName('@Description').Value:='';
            SP_Artic.Parameters.ParamByName('@DocID').Value:=SP_Doc.Parameters.ParamByName('@OutDocID').Value;
            SP_Artic.Parameters.ParamByName('@Action').Value:='Insert';
            SP_Artic.ExecProc;


///////////////////////////Input Storage/////////////////////////
            SP_Exist.Parameters.ParamByName('@ProductID').Value:=SG.Cells[1,i];
            SP_Exist.Parameters.ParamByName('@StorageTitleID').Value:=edtStorageID.Text;
            SP_Exist.ExecProc;
            SP_Storage.Parameters.ParamByName('@InOu').Value:=True;
            IF SP_Exist.Parameters.ParamByName('@Exist').Value=-1 Then
            begin
                SP_Storage.Parameters.ParamByName('@Exist').Value:=SG.Cells[3,i];
                SP_Storage.Parameters.ParamByName('@ExistVahedPrice').Value:=SG.Cells[4,i];
            end
            Else
            begin
                SP_Storage.Parameters.ParamByName('@Exist').Value:=StrToInt(SG.Cells[3,i])+SP_Exist.Parameters.ParamByName('@Exist').Value;
                SP_Storage.Parameters.ParamByName('@ExistVahedPrice').Value:=((StrToInt(SG.Cells[3,i])*StrToInt(SG.Cells[4,i]))+(SP_Exist.Parameters.ParamByName('@Exist').Value*SP_Exist.Parameters.ParamByName('@ExistVahedPrice').Value))/(SP_Exist.Parameters.ParamByName('@Exist').Value+StrToInt(SG.Cells[3,i]));
            end;
            SP_Storage.Parameters.ParamByName('@StorageID').Value:=-1;
            SP_Storage.Parameters.ParamByName('@StorageTitleID').Value:=edtStorageID.Text;
            SP_Storage.Parameters.ParamByName('@ProductID').Value:=SG.Cells[1,i];
            SP_Storage.Parameters.ParamByName('@Amount').Value:=SG.Cells[3,i];
            SP_Storage.Parameters.ParamByName('@InOuVahedPrice').Value:=SG.Cells[4,i];
            SP_Storage.Parameters.ParamByName('@SDate').Value:= edtFactorDate.Text;
            SP_Storage.Parameters.ParamByName('@Description').Value:=edtDescription.Text;
            SP_Storage.Parameters.ParamByName('@FactorID').Value:=SP_Factor.Parameters.ParamByName('@OutFactorID').Value;
            SP_Storage.Parameters.ParamByName('@WorkShopID').Value:=-1;
            SP_Storage.Parameters.ParamByName('@Action').Value:='Insert';
            SP_Storage.ExecProc;}

///////////////////////////////////////////////////////////

        end;
    end;
    Close;
end;

procedure TfrmSalesFactor.FormShow(Sender: TObject);
begin
    if lblAct.Caption='œ—Ã' then
    begin
        QSerialNumber.Close;
        QSerialNumber.Parameters.ParamByName('UserID').Value:=UserInfo.UserID;
        QSerialNumber.Open;
        if QSerialNumber['SerialNumber']<>Null then
            edtSerialNumber.Text:=IntToStr(QSerialNumber['SerialNumber'])
        else
            edtSerialNumber.Text:='1';
    end;
end;

procedure TfrmSalesFactor.edtSerialNumberExit(Sender: TObject);
begin
    QEditFactor.Close;
    QEditFactor.Parameters.ParamByName('SerialNumber').Value:=edtSerialNumber.Text;
    QEditFactor.Open;
    if QEditFactor['FactorID']<>Null then
    begin
        ClearForm;
        lblAct.Caption:='ÊÌ—«Ì‘';
        edtSerialNumber.Text:=QEditFactor['SerialNumber'];
        while Not(QEditFactor.Eof) do
        begin
            SG.Cells[1,QEditFactor.RecNo]:=QEditFactor['KalaID'];
            SG.Cells[2,QEditFactor.RecNo]:=QEditFactor['KalaName'];
            SG.Cells[3,QEditFactor.RecNo]:=QEditFactor['Number'];
            SG.Cells[4,QEditFactor.RecNo]:=QEditFactor['VahedPrice'];
            SG.Cells[5,QEditFactor.RecNo]:=QEditFactor['Number']*QEditFactor['VahedPrice'];
            QEditFactor.Next;
        end;
        sum;
        QEditFactor.First;
        if QEditFactor['Discount']>0 then
            edtDiscount.Text:=IntToStr(QEditFactor['Discount']);
    end
    else
    begin
        ShowMessage('‘„«—Â ›«ò Ê— „Ê—œ ‰Ÿ— „⁄ »— ‰„Ì »«‘œ');
        ClearForm;
        lblAct.Caption:='œ—Ã';
    end;
end;

procedure TfrmSalesFactor.btnDeletClick(Sender: TObject);
begin
    try
        if lblAct.Caption='œ—Ã' then Exit;
        if (MessageBox(Self.Handle,'¬Ì« „Ì ŒÊ«ÂÌœ «Ì‰ —”Ìœ Õ–› ‘Êœ ø','Õ–› —”Ìœ',MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING+MB_RIGHT)=mrNo)  Then Exit;
        if QEditFactor['Documentation'] then
        begin
            ShowMessage('.—”Ìœ «‰»«— „Ê—œ ‰Ÿ— „” ‰œ ”«“Ì ‘œÂ «”  Ê „Ã«“ »Â Õ–› ¬‰ ‰Ì” Ìœ');
            Exit;
        end;
        QDelete.Close;
        QDelete.Parameters.ParamByName('SerialNumber1').Value:=edtSerialNumber.Text;
        QDelete.Parameters.ParamByName('SerialNumber2').Value:=edtSerialNumber.Text;
        QDelete.ExecSQL;
        ClearForm;
        ShowMessage('—”Ìœ «‰»«— „Ê—œ ‰Ÿ— Õ–› ê—œÌœ');
    Except
        ShowMessage('Œÿ« œ— Â‰ê«„ Õ–› —”Ìœ «‰»«—');
    end;
end;

end.
