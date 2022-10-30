unit CalculatUnit;

interface

  Uses
      Windows, Messages, SysUtils, Variants, Classes, Controls,
      Dialogs, ExtCtrls, ComCtrls, StdCtrls, Adodb, DCPcrypt2, DCPsha512, Math;

const
   SolarDayOfWeek: array [0..6] of string = ('????', 
  '?? ????', 
  '??????', 
  '?? ????', 
  '????????', 
  '??? ????', 
  '????');
  GregorianDayOfWeek: array [0..6] of string = ('Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday');
 
  INVALID_SOLAR_DATE = '1300/01/01';
  INVALID_GREGORIAN_DATE = '1921/03/21';


 
type
  TDateBase = (dbSolar, dbGregorian);

type TUserType = (Admin = 1, Supervisour = 2, IT = 3, Acc = 4, Cashier = 5, Normal = 6, Special = 7);

type User = record
    UserID : integer;
    UserName : string;
    Permission : integer;
    WorkSection : Integer;
    UseMenu     : Boolean;
    Shift       : Smallint;
    WorkSectionID : integer;
    Entrance      : integer;
    KalaID : integer;
    Service_center_id : integer;
    service_center : string;
    service_center_shortTitle: string;
    userType: TUserType;
    amrieh: Boolean;
    saleByBarcode: Boolean;
end;

  Var
      UserName,CurrentDate:String;
      UserInfo : User;
    {*********************  Data & Time Function  ************************}
    Function ConvertDate2Shamsi(DTDate:TDate):string;
    Function Sub2Date(StrDate1,StrDate2:String):Integer;
    Function Sub2Time(StrTime1,StrTime2:String):String;
    Function BetweenDates(_KDate,_BetweenDate,_BDate:String):Boolean;
    Function CheckDate(StrDate:string):Boolean;
    Function CheckTime(StrTime:string): Boolean;
    Function CheckYear(StrTime:string): Boolean;
    Function CheckMonth(StrTime:string): Boolean;
    Function CheckDay(StrTime,CMonth:string): Boolean;
    Function Month2Number(StrMonth:String):Byte;

    Function Biger(X,Y:String):Shortint;
    Function _Year(X:String):Integer;
    Function _Month(X:String):Integer;
    Function _Day(X:String):integer;

    Function Fix(X:String):String;
    Function _Fix(X:Integer):String;

    Function Sub2DateShamsi(BDate,LDate : String): String;
    Function AddDayToDate(StrDate :String; Count: Integer):String;
    {*********************  Number Function  ************************}
    Function Number2Str(Nm: string): string;
    Function IsNumeric(Key: Char):Boolean;
    Function CheckNumeric(Var Key: Char):Char;
    {*********************  ComboBox  ************************}
    Procedure AssignItemToComboBox (ComboBoxName : TComboBox; QueryName : TADOQuery ; FieldName : String);
    Function Number2WeakDay(Day : integer) : string;
    Function Fnc_ReturnNum(Prm_Str: String): String;
    function sha512(Code: string):string;
var
    FormatSetting: TFormatSettings;

implementation

uses DateUtils, MainUnit, StrUtils;


{***************************************************************************************}
{******************************         ComboBox       *********************************}
{***************************************************************************************}



function sha512(Code: string):string;
const HASHSIZE_BYTES = 64;
var
Digest: array[0..HASHSIZE_BYTES - 1] of byte;
i: integer;
r : string;
begin
    with TDCP_sha512.Create(nil) do
    try
    Init();
    UpdateStr(Code);

    final(Digest[0]);

    r := '';

    for i := 0 to HASHSIZE_BYTES - 1 do
    r := r + IntToHex((Digest[i]), 2);

    r := LowerCase(r);
    finally
    Free();
    end;
    sha512 := r;
end;


Function Fnc_ReturnNum(Prm_Str: String): String;
begin
  while Pos(',', Prm_Str) > 0 do
    Delete(Prm_Str, Pos(',', Prm_Str), 1);
  if Prm_Str = '' then
      Prm_Str := '0';
  Result := Prm_Str;
end;


Procedure AssignItemToComboBox (ComboBoxName : TComboBox; QueryName : TADOQuery ; FieldName : String);
Begin
  ComboBoxName.Text:='';
  QueryName.Close;
  QueryName.Open;
  while QueryName.Eof=False do
  Begin
    ComboBoxName.Items.Add(QueryName[FieldName]);
    QueryName.Next;
  End;
End;


Function Number2WeakDay(Day : integer) : string;
begin
    Case Day of
    7: Number2WeakDay:='‘‰»Â';
    1: Number2WeakDay:='Ìò‘‰»Â';
    2: Number2WeakDay:='œÊ‘‰»Â';
    3: Number2WeakDay:='”Â ‘‰»Â';
    4: Number2WeakDay:='çÂ«—‘‰»Â';
    5: Number2WeakDay:='Å‰Ã‘‰»Â';
    6: Number2WeakDay:='Ã„⁄Â';
    else
        Number2WeakDay:='—Ê“ «‘ »«Â „Ì »«‘œ';
    end;
end;

{***************************************************************************************}
{******************************   Year , Month , Day   *********************************}
{***************************************************************************************}
    Function Fix(X:String):String;
    begin
        if Length(x)<2 then Fix:='0'+X Else Fix:=X;
    end;

    Function _Fix(X:Integer):String;
    begin
        if Length(IntToStr(x))<2 then _Fix:='0'+IntToStr(x) Else _Fix:=IntToStr(x);
    end;

    Function _Year(X:String):Integer;
    begin
        if Length(x)=10 then _Year:=StrToInt(copy(x,1,4));
    end;
    {************************}
    Function _Month(X:String):Integer;
    begin
        if Length(x)=10 then _Month:=StrToInt(copy(x,6,2));
    end;
    {************************}
    Function _Day(X:String):integer;
    begin
        if Length(x)=10 then _Day:=StrToInt(copy(x,9,2));
    end;
    {*************************}
    Function AddDayToDate(StrDate :String; Count: Integer):String;
    var
    IntDay, IntMonth, IntYear,TempDay , TempYear, TempMonth :Integer;
    Begin
        IntDay:=_Day(StrDate); IntMonth:=_Month(StrDate); IntYear:=_Year(StrDate);
        IF (IntMonth <= 6) Then TempDay:=(IntMonth-1)*31+IntDay+Count Else TempDay:=(IntMonth-7)*30+IntDay+Count+186;
        TempYear:=(TempDay div 365); TempDay:=(TempDay mod 365);
        IF TempDay <= 186 Then
        Begin
            TempMonth:=(TempDay div 31);
            TempDay:=(TempDay mod 31);
        End
        Else
        Begin
            TempDay:=TempDay-186;
            TempMonth:=(TempDay div 30)+7;
            TempDay:=(TempDay mod 30);
        End;
        TempYear:=IntYear+TempYear;
        AddDayToDate:=IntToStr(TempYear)+'/'+Fix(IntToStr(TempMonth))+'/'+Fix(IntToStr(TempDay));
    End;
    {*************************}
    Function Sub2DateShamsi(BDate,LDate : String): String;
    var
    Day,Month,Year,Temp : Integer;
    begin
        Day:=_Day(BDate)-_Day(LDate);
        IF Day<0 then begin Day:=_Day(BDate)+30-_Day(LDate); Temp:=1; end else Temp:=0;
        Month:=(_Month(BDate)-Temp)-_Month(LDate);
        IF Month<0 then begin Month:=(_Month(BDate)-Temp)+12-_Month(LDate); Temp:=1; end else Temp:=0;
        Year:=(_Year(BDate)-Temp)-_Year(LDate);
        Day:=abs(Day);
        Month:=abs(Month);
        Year:=abs(Year);
        Sub2DateShamsi:=IntToStr(Day)+' —Ê“ '+IntToStr(Month)+' „«Â '+IntToStr(Year)+' ”«· ';
    end;

{***************************************************************************************}
{******************************   Convert Date To Shamsi  ******************************}
{***************************************************************************************}
Function ConvertDate2Shamsi(DTDate:TDate):string;
var
   StrDate:String;
   A,B:array[1..12] of word;
   MM,YY,DD,M,Y,D:word;
   Sal,Mah:String;
Begin
     A[1]:=10;  B[1]:=30;
     A[2]:=11;  B[2]:=30;
     A[3]:=09;  B[3]:=29;
     A[4]:=11;  B[4]:=31;
     A[5]:=10;  B[5]:=31;
     A[6]:=10;  B[6]:=31;
     A[7]:=09;  B[7]:=31;
     A[8]:=09;  B[8]:=31;
     A[9]:=09;  B[9]:=31;
     A[10]:=8;  B[10]:=30;
     A[11]:=9;  B[11]:=30;
     A[12]:=9;  B[12]:=30;
     StrDate:=DateToStr(DTDate+2);
     D:=StrToInt(Copy(StrDate,9,2));
     M:=StrToInt(Copy(StrDate,6,2));
     Y:=StrToInt(Copy(StrDate,1,4));
     YY:=Y-621;
     If (Y mod 4 =0) And (M=3) And (D<21) Then {kabiseh}
     Begin
          A[3]:=A[3]+1;
          B[3]:=B[3]+1;
     End;
     MM:=M+9;
     DD:=D+A[M];
     If DD>B[M] Then
     Begin
          DD:=DD-B[M];
          MM:=MM+1;
     End;
     If MM>12 Then MM:=MM-12;
     If (MM=10) And (DD>10) Then YY:=YY-1;
     If MM=10 Then YY:=YY-1;
     If MM=12 Then YY:=YY-1;
     If (MM<=6) And (DD+1>31) Then
     Begin
          DD:=1;
          Inc(MM);
     End
     else
         If (MM>6) And (DD+1>30) Then
         Begin
              DD:=1;
              Inc(MM);
              If MM>12 Then
              Begin
                   MM:=1;
                   YY:=YY+1;
              End;
         End
         else
             inc(DD);
    Mah:=IntToStr(MM);
    If length(Mah)=1 Then Mah:='0'+Mah;
    If YY MOd 2=0 then Dec(DD);
    StrDate:=IntToStr(DD);
    If length(StrDate)=1 Then StrDate:='0'+StrDate;
    Sal:=IntToStr(YY);
    Sal:=Sal+'/'+Mah+'/'+StrDate;
    ConvertDate2Shamsi :=Sal;
End;
{***************************************************************************************}
{******************************   Check Date To True Date   ****************************}
{***************************************************************************************}
Function CheckDate(StrDate:string): Boolean;
    var
       Err,N:integer;TempMount:string;
    label   Error,tmp;
    begin
        err:=0;n:=0;TempMount:='';
        if Length(StrDate)<>10 then
        begin
          MessageDlg('!  «—ÌŒ «‘ »«Â Ê«—œ ‘œÂ «”  ',mtinformation,[mbok],0);
          goto error;
        end;
        TempMount:=StrDate;
        val(copy(TempMount,1,4),N,Err);
        if (n>1399) or (n<1320) then
        begin
          MessageDlg('! ”«· «‘ »«Â Ê«—œ ‘œÂ «”  ',mtinformation,[mbok],0);
          goto error;
        end;
        val(copy(TempMount,6,2),N,Err);
        if (n>12) or (n<1) then
        begin
          MessageDlg('! „«Â «‘ »«Â Ê«—œ ‘œÂ «”  ',mtinformation,[mbok],0);
          goto error;
        end;
        val(copy(StrDate,9,2),N,Err);
        if (n>31) or (n<1) then
        begin
          MessageDlg('! —Ê“ «‘ »«Â Ê«—œ ‘œÂ «”  ',mtinformation,[mbok],0);
          goto error;
        end;
        CheckDate:=True;
        goto tmp;
    error:
        CheckDate:=False;
    tmp:
    end;

{***************************************************************************************}
{******************************   Check Time To True Time   ****************************}
{***************************************************************************************}
Function CheckTime(StrTime:string): Boolean;
    var
       Err,N:integer;
       TempTime:string;

    label   Error,tmp;

begin
      err:=0;n:=0;TempTime:='';
      if Length(StrTime)<>5 then
      begin
        MessageDlg('! ”«⁄  «‘ »«Â Ê«—œ ‘œÂ «”  ',mtinformation,[mbok],0);
        goto error;
      end;
      TempTime:=StrTime;
      val(copy(TempTime,1,2),N,Err);
      if (n>24) or (n<0) then
      begin
        MessageDlg('! ”«⁄  «‘ »«Â Ê«—œ ‘œÂ «”  ',mtinformation,[mbok],0);
        goto error;
      end;
      val(copy(TempTime,4,2),N,Err);
      if (n>60) or (n<0) then
      begin
        MessageDlg('! œﬁÌﬁÂ «‘ »«Â Ê«—œ ‘œÂ «”  ',mtinformation,[mbok],0);
        goto error;
      end;
      CheckTime:=True;
      goto tmp;
  error:
      CheckTime:=False;
  tmp:
end;

{****************************************************************************}
{******************************   Sub 2 Date   ******************************}
{****************************************************************************}
Function Sub2Date(StrDate1,StrDate2:String):Integer;
Var DaySub,MonthSub,YearSub:Integer;
    DayTemp1,MonthTemp1,YearTemp1,DayTemp2,MonthTemp2,YearTemp2:integer;
    Err:Integer;
begin

    val(copy(StrDate1,1,4),YearTemp1,Err);
    val(copy(StrDate1,6,2),MonthTemp1,Err);
    val(copy(StrDate1,9,2),DayTemp1,Err);

    val(copy(StrDate2,1,4),YearTemp2,Err);
    val(copy(StrDate2,6,2),MonthTemp2,Err);
    val(copy(StrDate2,9,2),DayTemp2,Err);

    IF YearTemp2>YearTemp1 then
        Begin
            Sub2Date:=-1;
        End
      Else
        Begin
            IF (YearTemp2=YearTemp1) And (MonthTemp2=MonthTemp1) And (DayTemp1=DayTemp2) then
              Begin
                  Sub2Date:=0;
              End
             Else
              Begin
                  if DayTemp1>=DayTemp2 then
                    begin
                        DaySub:=DayTemp1-DayTemp2;
                    end
                  else
                    begin
                        Dec(MonthTemp1);
                        DaySub:=DayTemp1+30-DayTemp2;
                    end;

                  if MonthTemp1>=MonthTemp2 then
                    begin
                        MonthSub:=MonthTemp1-MonthTemp2;
                    end
                  else
                    begin
                        Dec(YearTemp1);
                        MonthSub:=MonthTemp1+12-MonthTemp2;
                    end;
                  YearSub:=YearTemp1-YearTemp2;
                  Sub2Date:=(YearSub*365+MonthSub*30+DaySub);
                  //Sub2Date:=(MonthSub*30+DaySub);
              End;
        End;
End;

{***************************************************************************************}
{*************************************  Biger 2 Date ***********************************}
{***************************************************************************************}
Function Biger(X,Y:String):Shortint;
Var Y1,M1,D1,Y2,M2,D2:integer;

//*****************************//
begin
    Y1:=_Year(X);M1:=_Month(X);D1:=_Day(X);
    Y2:=_Year(Y);M2:=_Month(Y);D2:=_Day(Y);

    if y1>y2 then Begin Biger:=1; Exit;end;
    if y1<y2 then Begin Biger:=-1;Exit;end;
    if y1=y2 then
      Begin
        if M1>M2 then Begin Biger:=1; Exit;end;
        if M1<M2 then Begin Biger:=-1;Exit;end;
        if M1=M2 then
          Begin
              if D1>D2 then Begin Biger:=1; Exit;end;
              if D1<D2 then Begin Biger:=-1;Exit;end;
              if D1=D2 then Begin Biger:=0; Exit;end;
          End;
      End;
end;
{***************************************************************************************}
{*************************************  Between 3 Date ***********************************}
{***************************************************************************************}
Function BetweenDates(_KDate,_BetweenDate,_BDate:String):Boolean;
 Begin
    IF (Biger(_BetweenDate,_KDate)=1) And (Biger(_BDate,_BetweenDate)=1) Then BetweenDates:=True Else BetweenDates:=False;  
 end;

{****************************************************************************}
{******************************   Sub 2 Time   ******************************}
{****************************************************************************}
Function Sub2Time(StrTime1,StrTime2:String):String;
Var hoursSub,minuteSub:Integer;
    StrhoursSub,StrminuteSub:String;
    hoursTemp1,minuteTemp1,hoursTemp2,minuteTemp2:integer;
    Err:Integer;

begin

    val(copy(StrTime1,1,2),hoursTemp1,Err);
    val(copy(StrTime1,4,2),minuteTemp1,Err);

    val(copy(StrTime2,1,2),hoursTemp2,Err);
    val(copy(StrTime2,4,2),minuteTemp2,Err);


    IF hoursTemp2>hoursTemp1 then
        Begin
            Sub2Time:='Err';
        End
      Else
        Begin
            IF (hoursTemp2=hoursTemp1) And (minuteTemp2=minuteTemp1) then
              Begin
                  Sub2Time:='Equ';
              End
             Else
              Begin
                  if minuteTemp1>=minuteTemp2 then
                    begin
                        minuteSub:=minuteTemp1-minuteTemp2;
                    end
                  else
                    begin
                        Dec(hoursTemp1);
                        minuteSub:=minuteTemp1+60-minuteTemp2;
                    end;
                  hoursSub:=hoursTemp1-hoursTemp2;
                  If (hoursSub>=0) And (hoursSub<=9) Then StrhoursSub:='0'+IntToStr(hoursSub) Else StrhoursSub:=IntToStr(hoursSub);
                  If (minuteSub>=0) And (minuteSub<=9) Then StrminuteSub:='0'+IntToStr(minuteSub) Else StrminuteSub:=IntToStr(minuteSub);
                  Sub2Time:=StrhoursSub+':'+StrminuteSub;
              End;
        End;
End;

Function CheckYear(StrTime:string): Boolean;
 Begin
    CheckYear:=True;
    IF (StrToInt(StrTime)>1390) OR (StrToInt(StrTime)<1380) Then
      Begin
          MessageBox(FMain.Handle,'⁄œœ „—»Êÿ »Â ”«· «‘ »«Â Ê«—œ ‘œÂ «” ','Œÿ« œ— Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT );
          CheckYear:=False;
      End;
 End;

 Function CheckMonth(StrTime:string): Boolean;
  Begin
    CheckMonth:=True;
    IF (StrToInt(StrTime)>12) OR (StrToInt(StrTime)<1) Then
      Begin
          MessageBox(FMain.Handle,'⁄œœ „—»Êÿ »Â „«Â «‘ »«Â Ê«—œ ‘œÂ «” ','Œÿ« œ— Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT );
          CheckMonth:=False;
      End;
 End;

Function CheckDay(StrTime,CMonth:string): Boolean;
  Begin
      IF (CMonth='›—Ê—œÌ‰') OR (CMonth='«—œÌ»Â‘ ') Or (CMonth='Œ—œ«œ') Or (CMonth=' Ì—') OR (CMonth='„—œ«œ') Or (CMonth='‘Â—ÌÊ—') Or (CMonth='1') Or (CMonth='2') Or (CMonth='3') Or (CMonth='4') Or (CMonth='5') Or (CMonth='6') OR (CMonth='01') Or (CMonth='02') Or (CMonth='03') Or (CMonth='04') Or (CMonth='05') Or (CMonth='06')Then
        IF (StrToInt(StrTime)<1) Or (StrToInt(StrTime)>31) Then
          Begin
              MessageBox(FMain.Handle,'⁄œœ „—»Êÿ »Â —Ê“ «‘ »«Â Ê«—œ ‘œÂ «” ','Œÿ« œ— Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT );
              CheckDay:=False;
          End;

      IF (CMonth='„Â—') Or (CMonth='¬»«‰') Or (CMonth='¬–—') Or (CMonth='œÌ') Or (CMonth='»Â„‰') Or (CMonth='7') Or (CMonth='8') Or (CMonth='9') Or (CMonth='10') Or (CMonth='11') Or (CMonth='07') Or (CMonth='08') Or (CMonth='09') Or (CMonth='10') Or (CMonth='11') Then
        IF (StrToInt(StrTime)<1) Or (StrToInt(StrTime)>30) Then
          Begin
              MessageBox(FMain.Handle,'⁄œœ „—»Êÿ »Â —Ê“ «‘ »«Â Ê«—œ ‘œÂ «” ','Œÿ« œ— Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT );
              CheckDay:=False;
          End;

     IF  (CMonth='«”›‰œ') Or (CMonth='12') Then
        IF (StrToInt(StrTime)<>29) Then
          Begin
              MessageBox(FMain.Handle,'⁄œœ „—»Êÿ »Â —Ê“ «‘ »«Â Ê«—œ ‘œÂ «” ','Œÿ« œ— Ê—Êœ «ÿ·«⁄« ',MB_OK+MB_DEFBUTTON1+MB_ICONERROR+MB_RIGHT );
              CheckDay:=False;
          End;
       End;
Function Month2Number(StrMonth:String):Byte;
 Begin
    StrMonth:=Trim(StrMonth);
    IF StrMonth='›—Ê—œÌ‰'  Then Begin Month2Number:=1; Exit; End;
    IF StrMonth='«—œÌ»Â‘ ' Then Begin Month2Number:=2; Exit;  End;
    IF StrMonth='Œ—œ«œ'    Then Begin Month2Number:=3; Exit;  End;
    IF StrMonth=' Ì—'      Then Begin Month2Number:=4; Exit;  End;
    IF StrMonth='„—œ«œ'    Then Begin Month2Number:=5; Exit;  End;
    IF StrMonth='‘Â—ÌÊ—'   Then Begin Month2Number:=6; Exit;  End;
    IF StrMonth='„Â—'      Then Begin Month2Number:=7; Exit;  End;
    IF StrMonth='¬»«‰'     Then Begin Month2Number:=8; Exit;  End;
    IF StrMonth='¬–—'      Then Begin Month2Number:=9; Exit;  End;
    IF StrMonth='œÌ'       Then Begin Month2Number:=10; Exit; End;
    IF StrMonth='»Â„‰'     Then Begin Month2Number:=11; Exit; End;
    IF StrMonth='«”›‰œ'    Then Begin Month2Number:=12; Exit; End;
    IF (StrMonth<>('›—Ê—œÌ‰')) And (StrMonth<>('«—œÌ»Â‘ '))  And (StrMonth<>('Œ—œ«œ')) And
       (StrMonth<>(' Ì—')) And (StrMonth<>('„—œ«œ')) And (StrMonth<>('‘Â—ÌÊ—')) And
       (StrMonth<>('„Â—')) And (StrMonth<>('¬»«‰')) And (StrMonth<>('¬–—')) And
       (StrMonth<>('œÌ')) And (StrMonth<>('»Â„‰')) And (StrMonth<>('«”›‰œ')) Then Month2Number:=0;
 End;

function Number2Str(Nm: string): string;
const
  Main: array[1..3,0..9]of string = (('', 'Ìﬂ’œ Ê', 'œÊÌ”  Ê', '”Ì’œ Ê', 'çÂ«—’œ Ê', 'Å«‰’œ Ê', '‘‘’œ Ê', 'Â› ’œ Ê', 'Â‘ ’œ Ê', '‰Â’œ Ê'),
                                     ('', '', '»Ì”  Ê', '”Ì Ê', 'çÂ· Ê', 'Å‰Ã«Â Ê', '‘’  Ê', 'Â› «œ Ê', 'Â‘ «œ Ê', '‰Êœ Ê'),
                                     ('', 'Ìﬂ', 'œÊÊ', '”Â', 'çÂ«—', 'Å‰Ã', '‘‘', 'Â› ', 'Â‘ ', '‰Â'));
  NPos: array[1..4]of string = ('„Ì·Ì«—œ Ê', '„Ì·ÌÊ‰ Ê', 'Â“«— Ê', '');
  _10_19: array[10..19]of string = ('œÂ', 'Ì«“œÂ', 'œÊ«“œÂ', '”Ì“œÂ', 'çÂ«—œÂ', 'Å«‰“œÂ', '‘«‰“œÂ', 'Â›œÂ', 'ÂÃœÂ', '‰Ê“œÂ');
var
  TMP2, TMP: string;
  Cntr2, Cntr: Integer;
begin
  case Length(Nm) mod 3 of
    1: TMP := '00';
    2: TMP := '0';
  end;
  Nm := TMP + Nm;
  TMP := '';
  if Length(Nm) <=3 then begin
    for Cntr := 1 to 3 do
      if (Cntr = 2) and (Nm[Cntr] = '1') then begin
        TMP := TMP + _10_19[StrToInt(Copy(Nm, 2, 2))] + ' ';
        Break;
      end else
            TMP := TMP + Main[Cntr, StrToInt(Nm[Cntr])] + ' ';
    TMP := Trim(TMP);
    Cntr := Length(TMP);
    if TMP <> '' then
      if TMP[Cntr] = 'Ê' then
        Delete(TMP, Cntr, 1);
    Result := TMP + ' ';
    Exit;
  end;
  Cntr2 := 0;
  for Cntr := (4 - (Length(Nm) div 3)) + 1 to 4 do begin
    TMP2 := Number2Str(Copy(Nm, (Cntr2 * 3) + 1, 3));
    if Trim(TMP2) <> '' then
      TMP := TMP + TMP2 + NPos[Cntr] + ' ';
    Inc(Cntr2);
  end;
  TMP := Trim(TMP);
  Cntr := Length(TMP);
  if TMP <> '' then
    if TMP[Cntr] = 'Ê' then
      Delete(TMP, Cntr, 1);
  Result := TMP+'—Ì«·';
end;

Function IsNumeric(Key: Char):Boolean;
begin
    IsNumeric:=True;
    IF Not (key In ['0','1','2','3','4','5','6','7','8','9',#8,#13]) Then IsNumeric:=False;
end;

Function CheckNumeric(Var Key: Char):Char;
begin
    IF IsNumeric(Key) Then CheckNumeric:=Key Else CheckNumeric:=#7;
end;


Begin
    {Only For Test
    CurrentDate:='1384/02/04';
    UserName:='ò«—»— ÃœÌœ'}
end.
