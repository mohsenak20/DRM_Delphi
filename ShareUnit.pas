unit ShareUnit;

interface
Uses


  Windows, Messages, SysUtils, Variants, Classes, Controls,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Adodb, ComObj, Graphics, Result_Transaction, Application_Layer, PcPosActivex_TLB;

type TPSP = (BEHPARDAKHT = 1, SADAD = 2);

type PcPos = record
    posId: Integer;
    isPosActive : Boolean;
    ip: string;
    port: Integer;
    payerid: string;
    merchant: string;
    error : string;
    account : string;
    bank : string;
    card : string;
    serial : string;
    terminal : string;
    sabt : string;
    date : string;
    time : string;
    errorCode : string;
    amount: string;
    PSP: TPSP;
end;

type Reception = record
    CustomerName : string;
    CustomerType : Smallint;
    ReceptionType: Smallint;
    Mobile       : Boolean;
    Pool         : Boolean;
    Saat         : Boolean;
    AngoshtarPlak: Boolean;
    Sooeech      : Boolean;
    Asnad        : Boolean;
    Pakhsh       : Boolean;
    KeefPool     : Boolean;
    Samsonet     : Boolean;
    Other        : string;
end;

type BaseInfo = record
    Bozorgsal     : Integer;
    khordsal      : Integer;
    Shift         : Smallint;
    factorMessage : String;
    CoName        : string;
    CoAddress     : string;
    Tel           : string;
    PostCode      : string;
    Manager       : string;
    Email         : string;
    URL           : string;
    ExtraBaseTime : integer;
    ExtraBasePrice: integer;
    BaseTime      : integer;
    MenuFontSize  :integer;
    freeClosed    :integer;
    BasePriceForBargain :integer;
    BasePriceForSpecialCompany :integer;
    PermitionForExit : Boolean;
    CanIssueExit : Boolean;
    is_active_sms : Boolean;
    URL_Pic : string;
    hotelTicketExpiredIn: integer;
    hotelAdultPrice: integer;
    hotelChildPrice: integer;
    hotelAdultCommission: integer;
    hotelChildCommission: integer;
    isHotelAllowed: Boolean;
    isTaxiAllowed: Boolean;
    isPool: Boolean;
    internetGate: string;
    centerCode: integer;
    autoCreditInMenu: Boolean;
end;

type TransactionResult = record
  	errorMessage:	String;
	  account:	String;
	  bank:	String;
	  card:	String;
	  serial:	String;
	  terminal:	String;
	  sabt:	String;
	  tranDate:	String;
	  tranTime:	String;
	  errorCode:	String;
	  amount:	integer;
	  receptionID:	Int64;
	  userID:	integer;
	  posID:	integer;
	  mobile: String;
end;

procedure Refresh_Query(var SendQuery : TADOQuery);
Function Money2Number(Nm: String): string;
Function Sub2Time(strStartTime : string; strEndTime : string):string;
Function ExtraPrice(StartTime : String; EndTime :string; BasePrice : integer ; BaseTime : integer) : integer;
Function DateDefint(strDate : string; intDay : integer):string;
Function ToFarsi(s : string) :string;
Procedure ExportToExl(var TheDataset : TADOQuery);
function kabiseh(year:integer):Boolean;
function m2sh(miladidate:string):string;
function posPayment(amount: integer; receptionId: Int64 = 0; merchant: string = ''): integer;
function SadadPeyment(amount: integer; receptionId: Int64 = 0; dataToPrint: string = ''): integer;
procedure saveTransaction(trans: TransactionResult);


var
    Parameter : BaseInfo;
    PosInfo: PcPos;
implementation

uses DB, qrChargeCreditUnit, DMUnit, UFarsiDate, CalculatUnit;

procedure saveTransaction(trans: TransactionResult);
var
  SP_PosTrancations : TADOStoredProc;
begin

    SP_PosTrancations := TADOStoredProc.Create(nil);
    SP_PosTrancations.Connection := DM.ADOConnection;
    SP_PosTrancations.ProcedureName := 'SP_PosTransactions';
    SP_PosTrancations.Parameters.Refresh;

    SP_PosTrancations.Close;
    SP_PosTrancations.Parameters.ParamByName('@errorMessage').Value:= trans.errorMessage;
    SP_PosTrancations.Parameters.ParamByName('@account').Value:= trans.account;
    SP_PosTrancations.Parameters.ParamByName('@bank').Value:= trans.bank;
    SP_PosTrancations.Parameters.ParamByName('@card').Value:= trans.card;
    SP_PosTrancations.Parameters.ParamByName('@serial').Value:= trans.serial;
    SP_PosTrancations.Parameters.ParamByName('@terminal').Value:= trans.terminal;
    SP_PosTrancations.Parameters.ParamByName('@sabt').Value:= trans.sabt;
    SP_PosTrancations.Parameters.ParamByName('@tranDate').Value:= trans.tranDate;
    SP_PosTrancations.Parameters.ParamByName('@tranTime').Value:= trans.tranTime;
    SP_PosTrancations.Parameters.ParamByName('@errorCode').Value:= trans.errorCode;
    SP_PosTrancations.Parameters.ParamByName('@amount').Value:= trans.amount;
    SP_PosTrancations.Parameters.ParamByName('@receptionID').Value:= trans.receptionID;
    SP_PosTrancations.Parameters.ParamByName('@userID').Value:= trans.userID;
    SP_PosTrancations.Parameters.ParamByName('@posID').Value:=  trans.posID;
    SP_PosTrancations.Parameters.ParamByName('@id').Value:= -1;
    SP_PosTrancations.ExecProc;

end;

function SadadPeyment(amount: integer; receptionId: Int64 = 0; dataToPrint: string = ''): integer;
var
  PcPos: TPcPosActivexControl;
  melliResult : _PcPosTransactionResult;
  sadadResult: TransactionResult;
begin
    PcPos := TPcPosActivexControl.Create(nil);
    PcPos.NewPcPos;
    PcPos.ConnectionType := 0;
    PcPos.Ip := PosInfo.ip;
    PcPos.Port := 1040;
    PcPos.RetryTimeOut := '5000,4000,5000';
    PcPos.ResponseTimeout := '120000, 5000, 5000';
    PcPos.Amount := IntToStr(amount);
    PcPos.SetAdvertisementData('˜ÇÑÈÑ: '+UserInfo.UserName);
    melliResult := PcPos.SyncSaleTransaction();


    sadadResult.errorMessage := melliResult.PcPosStatus;
    sadadResult.account := melliResult.MerchantId;
    sadadResult.bank := copy(melliResult.CardNo, 0 , 6);
    sadadResult.card := melliResult.CardNo;
    sadadResult.serial := melliResult.TransactionNo;
    sadadResult.terminal := melliResult.MerchantId;
    sadadResult.sabt := melliResult.Rrn;
    sadadResult.tranDate := melliResult.TransactionDate;
    sadadResult.tranTime := melliResult.TransactionTime;;
    sadadResult.errorCode := melliResult.ResponseCode;
    sadadResult.amount := amount;
    sadadResult.receptionID := receptionId;
    sadadResult.userID := UserInfo.UserID;
    sadadResult.posID := PosInfo.posId;

    saveTransaction(sadadResult);

    if melliResult.ResponseCode = '00' then
      SadadPeyment := 1
    else
      SadadPeyment:= 0;
end;




function posPayment(amount: integer; receptionId: Int64 = 0; merchant: string = ''): integer;
var
    SP_PosTrancations : TADOStoredProc;
    MSG_OK : string;
    Result_Transaction_Table1 : Result_Transaction_Table;
    Application_Layer1  : TApplication_Layer;
    bpResult: TransactionResult;
begin
    if amount <= 0 then
    begin
      ShowMessage('ãÈáÛ ÏÑÎæÇÓÊí äÇãÚÊÈÑ ÇÓÊ');
      Exit;
    end;
    Result_Transaction_Table1  := Result_Transaction_Table.Create;
    Application_Layer1   := TApplication_Layer.Createe(PosInfo.ip ,PosInfo.port,180);
    //PosInfo.merchant := '˜ÇÑÈÑ: '+UserInfo.UserName+' '+merchant;
    Result_Transaction_Table1 := Application_Layer1.POS_PC_Debits_Goods_And_Service(IntToStr(amount),PosInfo.payerid ,PosInfo.merchant ,MSG_OK, '˜ÇÑÈÑ: '+UserInfo.UserName);


    bpResult.errorMessage := MSG_OK;
    bpResult.account := Result_Transaction_Table1.Result_AccountNo;
    bpResult.bank := Result_Transaction_Table1.Result_BIN;
    bpResult.card := Result_Transaction_Table1.Result_PAN;
    bpResult.serial := Result_Transaction_Table1.Result_SerialTransaction;
    bpResult.terminal := Result_Transaction_Table1.Result_TerminalNo;
    bpResult.sabt := Result_Transaction_Table1.Result_TraceNumber;
    bpResult.tranDate := Result_Transaction_Table1.Result_TransactionDate;
    bpResult.tranTime := Result_Transaction_Table1.Result_TransactionTime;
    bpResult.errorCode := Result_Transaction_Table1.Result_recTransResult;
    bpResult.amount := amount;
    bpResult.receptionID := receptionId;
    bpResult.userID := UserInfo.UserID;
    bpResult.posID := PosInfo.posId;

    saveTransaction(bpResult);




    {SP_PosTrancations.Close;
    SP_PosTrancations.Parameters.ParamByName('@errorMessage').Value:= MSG_OK;
    SP_PosTrancations.Parameters.ParamByName('@account').Value:= Result_Transaction_Table1.Result_AccountNo;
    SP_PosTrancations.Parameters.ParamByName('@bank').Value:= Result_Transaction_Table1.Result_BIN;
    SP_PosTrancations.Parameters.ParamByName('@card').Value:= Result_Transaction_Table1.Result_PAN;
    SP_PosTrancations.Parameters.ParamByName('@serial').Value:= Result_Transaction_Table1.Result_SerialTransaction;
    SP_PosTrancations.Parameters.ParamByName('@terminal').Value:= Result_Transaction_Table1.Result_TerminalNo;
    SP_PosTrancations.Parameters.ParamByName('@sabt').Value:= Result_Transaction_Table1.Result_TraceNumber;
    SP_PosTrancations.Parameters.ParamByName('@tranDate').Value:= Result_Transaction_Table1.Result_TransactionDate;
    SP_PosTrancations.Parameters.ParamByName('@tranTime').Value:= Result_Transaction_Table1.Result_TransactionTime;
    SP_PosTrancations.Parameters.ParamByName('@errorCode').Value:= Result_Transaction_Table1.Result_recTransResult;
    SP_PosTrancations.Parameters.ParamByName('@amount').Value:= amount;
    SP_PosTrancations.Parameters.ParamByName('@receptionID').Value:= receptionId;
    SP_PosTrancations.Parameters.ParamByName('@userID').Value:= UserInfo.UserID;
    SP_PosTrancations.Parameters.ParamByName('@posID').Value:=  PosInfo.posId;
    SP_PosTrancations.Parameters.ParamByName('@id').Value:= -1;
    SP_PosTrancations.ExecProc;}

    if Result_Transaction_Table1.Result_recTransResult = '00' then
      posPayment := 1
    else
      posPayment:= 0;


end;


//////////////////Milady 2 Shamsi/////////////////////
function kabiseh(year:integer):Boolean;
begin

  if ( ((year mod 100) <> 0 ) and ((year mod 4) = 0 ) ) or ( ((year mod 100 )=0) and ((year mod 400)=0) )then
  kabiseh:=true
  else
  kabiseh:=false;

end;

function m2sh(miladidate:string):string;
var myear,shyear,mmonth,shmonth,mday,shday:integer;
shyear_str,shmonth_str,shday_str:string; 
daycount,deydiff,farvardindiff:integer; 
days:array[0..12] of integer;
days_kabiseh:array[0..12] of integer;
begin

  days[0]:=0;
  days[1]:=31;
  days[2]:=59;
  days[3]:=90;
  days[4]:=120;
  days[5]:=151;
  days[6]:=181;
  days[7]:=212;
  days[8]:=243;
  days[9]:=273;
  days[10]:=304;
  days[11]:=334;

  days_kabiseh[0]:=0;
  days_kabiseh[1]:=31;
  days_kabiseh[2]:=60;
  days_kabiseh[3]:=91;
  days_kabiseh[4]:=121;
  days_kabiseh[5]:=152;
  days_kabiseh[6]:=182;
  days_kabiseh[7]:=213;
  days_kabiseh[8]:=244;
  days_kabiseh[9]:=274;
  days_kabiseh[10]:=305;
  days_kabiseh[11]:=335;


  myear:=StrToInt(miladidate[1]+miladidate[2]+miladidate[3]+miladidate[4]);
  mmonth:=StrToInt(miladidate[6]+miladidate[7]);
  mday:=StrToInt(miladidate[9]+miladidate[10]);

  farvardindiff:=79;

  if kabiseh(myear) then daycount:=days[mmonth-1]+mday else daycount:=days_kabiseh[mmonth-1]+mday;

  if kabiseh(myear-1) then deydiff:=11 else deydiff:=10;

  if daycount > farvardindiff then
  begin

  daycount:=daycount-farvardindiff;
  if daycount<= 186 then
  begin
  if daycount mod 31 = 0 then
  begin
  shmonth:=daycount div 31;
  shday:=31;
  end
  else
  begin
  shmonth:=(daycount div 31)+1;
  shday:=daycount mod 31;
  end;
  shyear:=myear-621;
  end
  else
  begin
  daycount:=daycount-186;
  if daycount mod 31 = 0 then
  begin
  shmonth:=daycount div 30+6;
  shday:=30;
  end
  else
  begin
  shmonth:=(daycount div 30)+7;
  shday:=daycount mod 30;
  end;
  shyear:=myear - 621;
  end;
  end
  else
  begin
  daycount:=daycount+deydiff;
  if daycount mod 30 = 0 then
  begin
  shmonth:=daycount div 30+9;
  shday:=30;
  end
  else
  begin
  shmonth:=(daycount div 30)+10;
  shday:=daycount mod 30;
  end;
  shyear:=myear - 622;


  end;

  shday:=shday-1;
  str(shyear,shyear_str);
  str(shmonth,shmonth_str);
  str(shday,shday_str);

  if Length(shmonth_str) < 2 then shmonth_str:='0' + shmonth_str;
  if Length(shday_str) < 2 then shday_str:='0' + shday_str ;

  m2sh:=shyear_str+'/'+shmonth_str+'/'+shday_str;

end;






{********************* Excel ************************}
Procedure ExportToExl(var TheDataset : TADOQuery);
var
 XApp:Variant;
 sheet:Variant;
 r,c:Integer;
 q:Integer;
 row,col:Integer;
 fildName:Integer;

begin
try

    begin
        XApp:=CreateOleObject('Excel.Application');
        XApp.Visible:=true;
    end;
    except
        showmessage('Unable to link with MS Excel,  it seems as it is not installed on this system.');
        exit;
    end;

    XApp.WorkBooks.Add(-4167);  //open a new blank workbook
    XApp.WorkBooks[1].WorkSheets[1].Name:='Negar';
         //give any name required to ExcelSheet
    sheet:=XApp.WorkBooks[1].WorkSheets['Negar'];
    for fildName:=0 to TheDataset.FieldCount-1 do
        //TheDataset refer to the any dataset holding data
    begin
      q:=fildName+1;
      sheet.Cells[1,q]:=TheDataset.Fields[fildName].FieldName;   // enter the column headings
    end;

    //now supply the data from table to excel sheet
    TheDataset.First;
    for r:=0 to TheDataset.RecordCount-1 do
    begin
        for c:=0 to TheDataset.FieldCount-1 do
        begin
            row:=r+2;
            col:=c+1;
            sheet.Cells[row,col]:=TheDataset.Fields[c].AsString;
      end;
      TheDataset.Next;
    end;


    //set font attributes of required range if required
    XApp.WorkSheets['Negar'].Range['A1:AA1'].Font.Bold:=True;
    XApp.WorkSheets['Negar'].Range['A1:AA1'].Font.Color := clblue;
    XApp.WorkSheets['Negar'].Range['A1:AA1'].Font.Color := clblue;
    XApp.WorkSheets['Negar'].Range['A1:K1'].Borders.LineStyle :=13;

    // set other attributes as below
    XApp.WorkSheets['Negar'].Range['A1:K11'].HorizontalAlignment := 3;
    // .Borders.LineStyle :=13;
    //XApp.WorkSheets['Negar'].Columns[1].ColumnWidth:=10;

    xapp.caption := 'Mohsen Amri';
    XApp.WorkSheets['Negar'].name := 'Exported from ' + TheDataset.Name;
    //assuming dataset is TTable based its tablename can be given as title of worksheet
end;



Function ToFarsi(s : string) :string;
begin
    s := StringReplace(s,'˜','˜', [rfReplaceAll, rfIgnoreCase]);
    s := StringReplace(s,'í','í', [rfReplaceAll, rfIgnoreCase]);
end;

Function DateDefint(strDate : string; intDay : integer):string;
var
year, Mount, day :integer;
strMount, strDay :string;
begin
    year  := StrToInt(copy(strDate, 1, 4));
    Mount := StrToInt(copy(strDate, 6, 2));
    day   := StrToInt(copy(strDate, 9, 2));

    if day > intDay then
    begin
        if Mount < 10 then
            strMount := '0'+IntToStr(Mount)
        else
            strMount := IntToStr(Mount);

        if Day - intday < 10 then
            strDay := '0'+IntToStr(Day - intday)
        else
            strDay := IntToStr(Day - intday);

        DateDefint := IntToStr(year) + '/' + strMount + '/' + strDay;

    end
    else
    begin
        DateDefint := IntToStr(year) + '/' + strMount + '/' + strDay;
    end;



end;


Function Sub2Time(strStartTime : string; strEndTime : string):string;
var
timStratTime, timEndTime, timsub2Time : TDateTime;
begin
    timStratTime:=StrToTime(strStartTime);
    timEndTime:=StrToTime(StrEndTime);
    timsub2Time:=timEndTime-timStratTime;
    if timStratTime > timEndTime then
        Sub2Time:=TimeToStr(StrToTime('23:59')-timStratTime+timEndTime)
    else
        Sub2Time:=TimeToStr(timsub2Time);
end;

Function ExtraPrice(StartTime : String; EndTime :string; BasePrice : integer ; BaseTime : integer) : integer;
var
strSub2Time, strExtraTime, strTemp : string;
h, m, Price : integer;
timBaseTime, ExtraTime : TDateTime;
begin
    strSub2Time:=Sub2Time(StartTime, EndTime);
    strTemp:=TimeToStr(StrToTime(IntToStr(BaseTime)));
    timBaseTime:=StrToTime(IntToStr(BaseTime)+':00');
    if strSub2Time <= TimeToStr(timBaseTime) then
        ExtraPrice:=0
    else
    begin
        ExtraTime:=StrToTime(strSub2Time)-timBaseTime;
        h:=StrToIntDef(copy(TimeToStr(ExtraTime), 1, 2), 0);
        m:=StrToIntDef(copy(TimeToStr(ExtraTime), 4, 2), 0);
    end;
    Price:=h*BasePrice;
    if (m>30) and (m<=59) then
        Price:=Price+Round(BasePrice/2);
    ExtraPrice:=Price;
end;

Function Money2Number(Nm: String): string;
var
i, j, Len : integer;
begin
    if Nm='' then Nm:='0';
    Len:=length(Nm);
    for i:=1 to Len do
        if Nm[i]=',' then
            for j:=i to Len do
                Nm[j]:=Nm[J+1];
    Money2Number:=Nm;
end;


procedure Refresh_Query(var SendQuery : TADOQuery);
var
    RowCount : Int64;
begin
    RowCount:=SendQuery.RecNo;
    SendQuery.Close;
    SendQuery.Open;
    SendQuery.MoveBy(RowCount-1);
end;

end.
