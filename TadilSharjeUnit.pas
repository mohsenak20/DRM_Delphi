unit TadilSharjeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ADODB, DB, StdCtrls, Buttons;

type
  TfrmTadilSharje = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblKeyNumber: TLabel;
    lblCustomerName: TLabel;
    lblStartTme: TLabel;
    lblCredit: TLabel;
    Label17: TLabel;
    lblReceptionID: TLabel;
    Label1: TLabel;
    lblActive: TLabel;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    btnSearch: TBitBtn;
    edtKeyNumber: TEdit;
    BtnSave: TBitBtn;
    BtnCancel: TBitBtn;
    BtnReturn: TBitBtn;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblAllCredit: TLabel;
    edtNewCredit: TEdit;
    BtnPrint: TBitBtn;
    btnCreditList: TBitBtn;
    QReception: TADOQuery;
    SP_Print: TADOStoredProc;
    SP_Credit: TADOStoredProc;
    SP_GetCurrentCredit: TADOStoredProc;
    ActionList1: TActionList;
    Return: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTadilSharje: TfrmTadilSharje;

implementation

{$R *.dfm}

end.
