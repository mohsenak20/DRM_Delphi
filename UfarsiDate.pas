unit UFarsiDate;
{-----------------------------------------}
{          Farsi functions unit           }
{      Use this unit for persian date     }
{                                         }
{      Written by: Salar Khalilzadeh      }
{            Copyright © 2005             }
{             SalarSoftwares              }
{                                         }
{  Website: www.geocities.com/salarsoftxp }
{  Website:    www.SalarSoft.somee.com    }
{                                         }
{    E-mail: SalarSoftwares@allmail.net   }
{        Last update: 2005/04/19          }
{-----------------------------------------}

{-----------------------------------------
Updates:
 1-Support time included in TDateTime
 2-Support Old version of Delphi
-----------------------------------------}

{IMPORTANT: TfarDateTime = TDateTime}

{Important note:
You never need to create TFarDate class.
Only add TFarDate string before functions.

Always use first: (FarEncodeDate or MiladyToShamsi or
                  MiladyToShamsiInt or MiladyToShamsiStr or
                  farStrToDate or farStrToDateDef )
after them use other functions.
}
{-------------------------------------------}
{                                           }
{    OO      O     O          O     OOO     }
{  OO       O O    O         O O    O  OO   }
{    OO    O   O   O        O   O   OOOO    }
{     OO  OOOOOOO  O       OOOOOOO  O OO    }
{   OOO  O       O OOOOOO O       O O  OO   }
{                                           }
{-------------------------------------------}

interface

uses windows,sysutils,SysConst,math;

{$IFDEF VER140}
  {$DEFINE OldDelphi}
{$ENDIF}
{$IFDEF VER130}
  {$DEFINE OldDelphi}
{$ENDIF}
{$IFDEF VER120}
  {$DEFINE OldDelphi}
{$ENDIF}

const
  FarMonthDays: array [Boolean] of TDayTable =
    ((31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29),
     (31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 30));

const
  EngMonthDays: array [Boolean] of TDayTable =
    ((31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31),
     (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31));

     
const
  DaysPerWeek = 7;
  WeeksPerFortnight = 2;
  MonthsPerYear = 12;
  YearsPerDecade = 10;
  YearsPerCentury = 100;
  YearsPerMillennium = 1000;

  DayMonday = 1;
  DayTuesday = 2;
  DayWednesday = 3;
  DayThursday = 4;
  DayFriday = 5;
  DaySaturday = 6;
  DaySunday = 7;

type
  TDateOrder = (doMDY, doDMY, doYMD);
  TfarDateTime=TDateTime;

{$IfDef OldDelphi}
type
  TFormatSettings = record
    CurrencyFormat: Byte;
    NegCurrFormat: Byte;
    ThousandSeparator: Char;
    DecimalSeparator: Char;
    CurrencyDecimals: Byte;
    DateSeparator: Char;
    TimeSeparator: Char;
    ListSeparator: Char;
    CurrencyString: string;
    ShortDateFormat: string;
    LongDateFormat: string;
    TimeAMString: string;
    TimePMString: string;
    ShortTimeFormat: string;
    LongTimeFormat: string;
    ShortMonthNames: array[1..12] of string;
    LongMonthNames: array[1..12] of string;
    ShortDayNames: array[1..7] of string;
    LongDayNames: array[1..7] of string;
    TwoDigitYearCenturyWindow: Word;
  end;
{$EndIf}

type
  TFarDate=class
  Private
    class function farIsLeapYear(Year: Word): Boolean;
    //class procedure farDivMod(Dividend: Integer; Divisor: Word;
    //  var Result, Remainder: Word);
    class function FarDecodeDateFully(const DateTime: TDateTime; var Year, Month, Day, DOW: Word): Boolean;
    class function farGetDateOrder(const DateFormat: string): TDateOrder;
    class function farGetEraYearOffset(const Name: string): Integer;
    class procedure farScanBlanks(const S: string; var Pos: Integer);
    class function farScanChar(const S: string; var Pos: Integer; Ch: Char): Boolean;
    class function farScanDate(const S: string; var Pos: Integer;
      var Date: TDateTime): Boolean; overload;
    class function farScanDate(const S: string; var Pos: Integer; var Date: TDateTime;
      const FormatSettings: TFormatSettings): Boolean; overload;
    class function farScanNumber(const S: string; var Pos: Integer;
      var Number: Word; var CharCount: Byte): Boolean;
    class procedure farScanToNumber(const S: string; var Pos: Integer);
    class function farTryEncodeDate(Year, Month, Day: Word; out Date: TDateTime): Boolean;
    class function farTryStrToDate(const S: string; out Value: TDateTime): Boolean;overload;
    class function farTryStrToDate(const S: string; out Value: TDateTime;
      const FormatSettings: TFormatSettings): Boolean;overload;
    class procedure farDateTimeToString(var Result: string; const Format: string;
      DateTime: TDateTime);overload;
    class procedure farDateTimeToString(var Result: string; const Format: string;
      DateTime: TDateTime; const FormatSettings: TFormatSettings);overload;
    //class procedure farDateTimeToStringFarsi(var Result: string;
    //  const Format: string; DateTime: TDateTime);
    class function farTryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,
      AMilliSecond: Word; out AValue: TDateTime): Boolean;
    class procedure farDivMod(Dividend: Integer; Divisor: Word;
      var Result, Remainder: Word);
    class function farTryEncodeTime(Hour, Min, Sec, MSec: Word; out Time: TDateTime): Boolean;

  public
    class function farEncodeDate(const Year, Month, Day: Word): TfarDateTime;
    class procedure farDecodeDate(const DateTime: TfarDateTime; var Year, Month, Day: Word);
    class procedure farDecodeDateTime(const AValue: TfarDateTime; out AYear, AMonth, ADay,
            AHour, AMinute, ASecond, AMilliSecond: Word);
    class function farEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,
      AMilliSecond: Word): TfarDateTime;

    class Function MiladyToShamsi(const DTime:tdateTime):TfarDateTime;
    class Function MiladyToShamsistr(const DTime:tdateTime):String;
    class Function MiladyToShamsiInt( const DTime:tdateTime;var Year,Month,Day:word):TfarDateTime;

    class function farDateToStr(dateTime:TfarDateTime):string;overload;
    class function farDateToStr(const DateTime: TfarDateTime;
      const FormatSettings: TFormatSettings): string;overload;
    class function farDateTimeToStr(const DateTime: TfarDateTime): string;overload;
    class function farDateTimeToStr(const DateTime: TfarDateTime;
      const FormatSettings: TFormatSettings): string;overload;

    class function farFormatDateTime(const Format: string; DateTime: TfarDateTime): string;overload;
    class function farFormatDateTime(const Format: string; DateTime: TfarDateTime;
      const FormatSettings: TFormatSettings): string;overload;

    class function farStrToDateDef(const S: string; const Default: TfarDateTime): TfarDateTime;overload;
    class function farStrToDateDef(const S: string; const Default: TfarDateTime;
      const FormatSettings: TFormatSettings): TfarDateTime;overload;
    class function farStrToDate(const S: string): TfarDateTime;overload;
    class function farStrToDate(const S: string;
      const FormatSettings: TFormatSettings): TfarDateTime;overload;

    class function farYearOf(const AValue: TfarDateTime): Word;
    class function farMonthOf(const AValue: TfarDateTime): Word;
    class function farWeekOf(const AValue: TfarDateTime): Word;                       {ISO 8601}
    class function farDayOf(const AValue: TfarDateTime): Word;
    class function farDayOfTheWeek(const AValue: TfarDateTime): Word;

    {-------------------------}
    class function farWeekOfTheYear(const AValue: TfarDateTime): Word; overload;      {ISO 8601}
    class function farWeekOfTheYear(const AValue: TfarDateTime;                       {ISO 8601}
      var AYear: Word): Word; overload;

    { Encode/decode functions that work with week of year and day of week }
    class procedure farDecodeDateWeek(const AValue: TfarDateTime; out AYear,          {ISO 8601}
      AWeekOfYear, ADayOfWeek: Word);
  end;

{ Pick-a-field functions }


implementation

uses StrUtils;

class function TFarDate.farIsLeapYear(Year: Word): Boolean;
begin
  Result := (Year mod 4 = 0) and ((Year mod 100 <> 0) or (Year mod 400 = 0));
end;

{procedure farDivMod(Dividend: Integer; Divisor: Word;
  var Result, Remainder: Word);
asm
        PUSH    EBX
        MOV     EBX,EDX
        MOV     EDX,EAX
        SHR     EDX,16
        DIV     BX
        MOV     EBX,Remainder
        MOV     [ECX],AX
        MOV     [EBX],DX
        POP     EBX
end;}
class procedure TFarDate.farDivMod(Dividend: Integer; Divisor: Word;
  var Result, Remainder: Word);
begin
Result:=  Dividend div  Divisor;
Remainder:=Dividend-(Result * Divisor);
end;

class function TFarDate.farTryEncodeDate(Year, Month, Day: Word; out Date: TDateTime): Boolean;
var
  I: Integer;
  DayTable: PDayTable;
begin
  Result := False;
  DayTable := @farMonthDays[farIsLeapYear(Year)];
  if (Year >= 1) and (Year <= 9999) and (Month >= 1) and (Month <= 12) and
    (Day >= 1) and (Day <= DayTable^[Month]) then
  begin
    for I := 1 to Month - 1 do Inc(Day, DayTable^[I]);
    I := Year - 1;
    Date := int(I * 365 + I div 4 - I div 100 + I div 400 + Day - DateDelta);
    Result := True;
  end;
end;

class function TFarDate.FarEncodeDate(const Year, Month, Day: Word): TfarDateTime;
begin
  if not FarTryEncodeDate(Year, Month, Day, Result) then
    raise EConvertError.CreateRes(@SDateEncodeError);
end;


class function TFarDate.FarDecodeDateFully(const DateTime: TfarDateTime; var Year, Month, Day, DOW: Word): Boolean;
const
  D1 = 365;
  D4 = D1 * 4 + 1;
  D100 = D4 * 25 - 1;
  D400 = D100 * 4 + 1;
var
  Y, M, D, I: Word;
  T: Integer;
  DayTable: PDayTable;
begin
  T := DateTimeToTimeStamp(int(DateTime)).Date;
  if T <= 0 then
  begin
    Year := 0;
    Month := 0;
    Day := 0;
    DOW := 0;
    Result := False;
  end else
  begin
    DOW := T mod 7 + 1;
    Dec(T);
    Y := 1;
    while T >= D400 do
    begin
      Dec(T, D400);
      Inc(Y, 400);
    end;
    farDivMod(T, D100, I, D);
    if I = 4 then
    begin
      Dec(I);
      Inc(D, D100);
    end;
    Inc(Y, I * 100);
    farDivMod(D, D4, I, D);
    Inc(Y, I * 4);
    farDivMod(D, D1, I, D);
    if I = 4 then
    begin
      Dec(I);
      Inc(D, D1);
    end;
    Inc(Y, I);
    Result := IsLeapYear(Y);
    DayTable := @farMonthDays[Result];
    M := 1;
    while True do
    begin
      I := DayTable^[M];
      if D < I then Break;
      Dec(D, I);
      Inc(M);
    end;
    Year := Y;
    Month := M;
    Day := D + 1;
  end;
end;

class procedure TFarDate.FarDecodeDate(const DateTime: TfarDateTime; var Year, Month, Day: Word);
var
  Dummy: Word;
begin
  FarDecodeDateFully(int(DateTime), Year, Month, Day, Dummy);
end;

class Function TFarDate.MiladyToShamsiInt(const DTime:tdateTime;var Year,Month,Day:word):TfarDateTime;
begin
Result:=MiladyToShamsi(int(DTime));
FarDecodeDate(Result,Year,Month,Day);
end;

class Function TFarDate.MiladyToShamsiStr(const DTime:tdateTime):String;
var Year,Month,Day:word;
begin
FarDecodeDate(MiladyToShamsi(int(DTime)),Year,Month,Day);
Result:=inttostr(Year)+DateSeparator+IfThen(Month<10,'0'+inttostr(Month),inttostr(Month))+DateSeparator+IfThen(Day<10,'0'+inttostr(Day),inttostr(Day));
end;

class Function TFarDate.MiladyToShamsi(const DTime:tdateTime):TfarDateTime;
var
  YearEqual:array[0..2,0..2] of integer;
  AddOneDay,AddFarDay:boolean;
  AddTodays:byte;
  Farday:byte;
  ThisDay:word;
  ThisMonth:word;
  ThisYear:word;
  YearDif1:Integer;
  YearDif2:Integer;
  TestRange1,testRange2,
  FarsiRange1,FarsiRange2,P:Integer;
  CurM,CurD:string;
  sYear,sMonth,sDay:Variant;
  Counter:Integer;
  CurDay,CurMonth,CurYear:word;
  hour,min,sec,msec:word;
Begin
CurM:='';
CurD:='';
YearEqual[1,1]:=1997;
YearEqual[1,2]:=1998;
YearEqual[2,1]:=1376;
YearEqual[2,2]:=1377;
DecodeDate(int(DTime),thisyear,thismonth,thisday);
DecodeTime(DTime,hour,min,sec,msec);
YearDif1:=ThisYear-1997;
YearDif2:=ThisYear-1998;
Testrange1:=1996-(100*4);
Testrange2:=1996+(100*4);
FarsiRange1:=1375-(100*4);
FarsiRange2:=1375+(100*4);
AddOneDay:=false;
//Rem------------------------------
Counter:=TestRange1;
while TestRange2>=Counter do begin /////////////////////////
  If thisYear=counter then begin
    AddOneDay:=true;
    break;
  end;
  If counter=TestRange2 then break;
  counter:=counter+4
end;//while

If AddOneDay then
  addtodays:=1
Else
  AddTodays:=0;
//Rem---------------------------------/////////////////
If (((ThisMonth = 3) and (thisday<(20+AddtoDays)))
    or ( ThisMonth<3)) then
  YearDif1:=yearDif1-1;
//Rem------------
If  (((thisYear mod 2)<>0) and
    (((thismonth=3) and (thisday>(20-addTodays)))
    or (thisMonth>4))) then
  CurYear:=yearEqual[2,1]+YearDif1
else begin
  CurYear:=YearEqual[2,1]+YearDif2;
  Counter:=FarsiRange1;
  while counter>FarsiRange2 do begin /////////////////////////
    If CurYear=Counter then begin
      AddFarDay:=true;
      break;
    end;
  If FarsiRange2>=Counter then break;
  counter:=counter+4
  end;//while

  If AddFarDay then
    FarDay:=1  else   Farday:=0;

  If (((thismonth=3) and (thisday>20-(addToDays)+FarDay)) or  (thismonth>3) ) then
    CurYear:=CurYear+1;
end; //First If

If AddtoDays=1 then FarDay:=0;
//Rem---------------------------------
Case thismonth of
  1:Begin
      If thisday<(21-Farday) then begin
        CurMonth:=10;
        CurDay:=(ThisDay+10)+FarDay;
      end else begin
        CurMonth:=11;
        CurDay:=(ThisDay-20)+FarDay;
      end;
    end;

  2:Begin
      If thisday<(20-Farday) then begin
        CurMonth:=11;
        CurDay:=(ThisDay+11)+FarDay;
      end else begin
        CurMonth:=12;
        CurDay:=(ThisDay-19)+FarDay;
      end;
    End;

  3:Begin
      If thisday<(21-AddToDays) then begin
        CurMonth:=12;
        CurDay:=(ThisDay+9)+AddToDays+FarDay;
      end else begin
        CurMonth:=1;
        CurDay:=(ThisDay-20)+AddToDays;
      end;
    End;

  4:Begin
      If thisday<(21-AddToDays) then begin
        CurMonth:=1;
        CurDay:=(ThisDay+11)+AddToDays;
      end else begin
        CurMonth:=2;
        CurDay:=(ThisDay-20)+AddToDays;
      end;
    End;

  5:Begin
      If thisday<(22-AddToDays) then begin
        CurMonth:=2;
        CurDay:=(ThisDay+10)+AddToDays;
      end else begin
        CurMonth:=3;
        CurDay:=(ThisDay-21)+AddToDays;
      end;
    End;

  6:Begin
      If thisday<(22-AddToDays) then begin
        CurMonth:=3;
        CurDay:=(ThisDay+10)+AddToDays;
      end else begin
        CurMonth:=4;
        CurDay:=(ThisDay-21)+AddToDays;
      end;
    End;

  7:Begin
      If thisday<(23-AddToDays) then begin
        CurMonth:=4;
        CurDay:=(ThisDay+9)+AddToDays;
      end else begin
        CurMonth:=5;
        CurDay:=(ThisDay-22)+AddToDays;
      end;
    End;

  8:Begin
      If thisday<(23-AddToDays) then begin
        CurMonth:=5;
        CurDay:=(ThisDay+9)+AddToDays;
      end else begin
        CurMonth:=6;
        CurDay:=(ThisDay-22)+AddToDays;
      end;
    End;

  9:Begin
      If thisday<(23-AddToDays) then begin
        CurMonth:=6;
        CurDay:=(ThisDay+9)+AddToDays;
      end else begin
        CurMonth:=7;
        CurDay:=(ThisDay-22)+AddToDays;
      end;
    End;

 10:Begin
      If thisday<(23-AddToDays) then begin
        CurMonth:=7;
        CurDay:=(ThisDay+8)+AddToDays;
      end else begin
        CurMonth:=8;
        CurDay:=(ThisDay-22)+AddToDays;
      end;
    End;

 11:Begin
      If thisday<(22-AddToDays) then begin
        CurMonth:=8;
        CurDay:=(ThisDay+9)+AddToDays;
      end else begin
        CurMonth:=9;
        CurDay:=(ThisDay-21)+AddToDays;
      end;
    End;

 12:Begin
      If thisday<(22-AddToDays) then begin
        CurMonth:=9;
        CurDay:=(ThisDay+9)+AddToDays;
      end else begin
        CurMonth:=10;
        CurDay:=(ThisDay-21)+AddToDays;
      end;
    End;

end;//case
//Rem-----------------
CurM:=Trim(IntTostr(CurMonth));
CurD:=Trim(IntTostr(CurDay));
//Rem-----------------
If CurMonth<10 then
  CurM:='0'+Trim(IntToStr(CurMonth));
If CurDay<10 then
  CurD:='0'+Trim(IntTostr(CurDay));

Result:=farEncodeDateTime(CurYear,CurMonth,CurDay,hour,min,sec,msec);

//Result:=farEncodeDate(CurYear,CurMonth,CurDay);
//Result:=int(Result)+EncodeTime(hour,min,sec,msec));
end;


class procedure TFarDate.farDateTimeToString(var Result: string; const Format: string;
  DateTime: TDateTime);
var
  BufPos, AppendLevel: Integer;
  Buffer: array[0..255] of Char;

  procedure AppendChars(P: PChar; Count: Integer);
  var
    N: Integer;
  begin
    N := SizeOf(Buffer) - BufPos;
    if N > Count then N := Count;
    if N <> 0 then Move(P[0], Buffer[BufPos], N);
    Inc(BufPos, N);
  end;

  procedure AppendString(const S: string);
  begin
    AppendChars(Pointer(S), Length(S));
  end;

  procedure AppendNumber(Number, Digits: Integer);
  const
    Format: array[0..3] of Char = '%.*d';
  var
    NumBuf: array[0..15] of Char;
  begin
    AppendChars(NumBuf, FormatBuf(NumBuf, SizeOf(NumBuf), Format,
      SizeOf(Format), [Digits, Number]));
  end;

  procedure AppendFormat(Format: PChar);
  var
    Starter, Token, LastToken: Char;
    DateDecoded, TimeDecoded, Use12HourClock,
    BetweenQuotes: Boolean;
    P: PChar;
    Count: Integer;
    Year, Month, Day, Hour, Min, Sec, MSec, H: Word;

    procedure GetCount;
    var
      P: PChar;
    begin
      P := Format;
      while Format^ = Starter do Inc(Format);
      Count := Format - P + 1;
    end;

    procedure GetDate;
    begin
      if not DateDecoded then
      begin
        farDecodeDate(DateTime, Year, Month, Day);
        DateDecoded := True;
      end;
    end;

    procedure GetTime;
    begin
      if not TimeDecoded then
      begin
        DecodeTime(DateTime, Hour, Min, Sec, MSec);
        TimeDecoded := True;
      end;
    end;

{$IFDEF MSWINDOWS}
    function ConvertEraString(const Count: Integer) : string;
    var
      FormatStr: string;
      SystemTime: TSystemTime;
      Buffer: array[Byte] of Char;
      P: PChar;
    begin
      Result := '';
      with SystemTime do
      begin
        wYear  := Year;
        wMonth := Month;
        wDay   := Day;
      end;

      FormatStr := 'gg';
      if GetDateFormat(GetThreadLocale, DATE_USE_ALT_CALENDAR, @SystemTime,
        PChar(FormatStr), Buffer, SizeOf(Buffer)) <> 0 then
      begin
        Result := Buffer;
        if Count = 1 then
        begin
          case SysLocale.PriLangID of
            LANG_JAPANESE:
              Result := Copy(Result, 1, CharToBytelen(Result, 1));
            LANG_CHINESE:
              if (SysLocale.SubLangID = SUBLANG_CHINESE_TRADITIONAL)
                and (ByteToCharLen(Result, Length(Result)) = 4) then
              begin
                P := Buffer + CharToByteIndex(Result, 3) - 1;
                SetString(Result, P, CharToByteLen(P, 2));
              end;
          end;
        end;
      end;
    end;

    function ConvertYearString(const Count: Integer): string;
    var
      FormatStr: string;
      SystemTime: TSystemTime;
      Buffer: array[Byte] of Char;
    begin
      Result := '';
      with SystemTime do
      begin
        wYear  := Year;
        wMonth := Month;
        wDay   := Day;
      end;

      if Count <= 2 then
        FormatStr := 'yy' // avoid Win95 bug.
      else
        FormatStr := 'yyyy';

      if GetDateFormat(GetThreadLocale, DATE_USE_ALT_CALENDAR, @SystemTime,
        PChar(FormatStr), Buffer, SizeOf(Buffer)) <> 0 then
      begin
        Result := Buffer;
        if (Count = 1) and (Result[1] = '0') then
          Result := Copy(Result, 2, Length(Result)-1);
      end;
    end;
{$ENDIF}

{$IFDEF LINUX}
    function FindEra(Date: Integer): Byte;
    var
      I : Byte;
    begin
      Result := 0;
      for I := 1 to EraCount do
      begin
        if (EraRanges[I].StartDate <= Date) and
          (EraRanges[I].EndDate >= Date) then
        begin
          Result := I;
          Exit;
        end;
      end;
    end;

    function ConvertEraString(const Count: Integer) : String;
    var
      I : Byte;
    begin
      Result := '';
      I := FindEra(Trunc(DateTime));
      if I > 0 then
        Result := EraNames[I];
    end;

    function ConvertYearString(const Count: Integer) : String;
    var
      I : Byte;
      S : string;
    begin
      I := FindEra(Trunc(DateTime));
      if I > 0 then
        S := IntToStr(Year - EraYearOffsets[I])
      else
        S := IntToStr(Year);
      while Length(S) < Count do
        S := '0' + S;
      if Length(S) > Count then
        S := Copy(S, Length(S) - (Count - 1), Count);
      Result := S;
    end;
{$ENDIF}

  begin
    if (Format <> nil) and (AppendLevel < 2) then
    begin
      Inc(AppendLevel);
      LastToken := ' ';
      DateDecoded := False;
      TimeDecoded := False;
      Use12HourClock := False;
      while Format^ <> #0 do
      begin
        Starter := Format^;
        if Starter in LeadBytes then
        begin
          AppendChars(Format, StrCharLength(Format));
          Format := StrNextChar(Format);
          LastToken := ' ';
          Continue;
        end;
        Format := StrNextChar(Format);
        Token := Starter;
        if Token in ['a'..'z'] then Dec(Token, 32);
        if Token in ['A'..'Z'] then
        begin
          if (Token = 'M') and (LastToken = 'H') then Token := 'N';
          LastToken := Token;
        end;
        case Token of
          'Y':
            begin
              GetCount;
              GetDate;
              if Count <= 2 then
                AppendNumber(Year mod 100, 2) else
                AppendNumber(Year, 4);
            end;
          'G':
            begin
              GetCount;
              GetDate;
              AppendString(ConvertEraString(Count));
            end;
          'E':
            begin
              GetCount;
              GetDate;
              AppendString(ConvertYearString(Count));
            end;
          'M':
            begin
              GetCount;
              GetDate;
              case Count of
                1, 2: AppendNumber(Month, Count);
                3: AppendString(ShortMonthNames[Month]);
              else
                AppendString(LongMonthNames[Month]);
              end;
            end;
          'D':
            begin
              GetCount;
              case Count of
                1, 2:
                  begin
                    GetDate;
                    AppendNumber(Day, Count);
                  end;
                3: AppendString(ShortDayNames[DayOfWeek(DateTime)]);
                4: AppendString(LongDayNames[DayOfWeek(DateTime)]);
                5: AppendFormat(Pointer(ShortDateFormat));
              else
                AppendFormat(Pointer(LongDateFormat));
              end;
            end;
          'H':
            begin
              GetCount;
              GetTime;
              BetweenQuotes := False;
              P := Format;
              while P^ <> #0 do
              begin
                if P^ in LeadBytes then
                begin
                  P := StrNextChar(P);
                  Continue;
                end;
                case P^ of
                  'A', 'a':
                    if not BetweenQuotes then
                    begin
                      if ( (StrLIComp(P, 'AM/PM', 5) = 0)
                        or (StrLIComp(P, 'A/P',   3) = 0)
                        or (StrLIComp(P, 'AMPM',  4) = 0) ) then
                        Use12HourClock := True;
                      Break;
                    end;
                  'H', 'h':
                    Break;
                  '''', '"': BetweenQuotes := not BetweenQuotes;
                end;
                Inc(P);
              end;
              H := Hour;
              if Use12HourClock then
                if H = 0 then H := 12 else if H > 12 then Dec(H, 12);
              if Count > 2 then Count := 2;
              AppendNumber(H, Count);
            end;
          'N':
            begin
              GetCount;
              GetTime;
              if Count > 2 then Count := 2;
              AppendNumber(Min, Count);
            end;
          'S':
            begin
              GetCount;
              GetTime;
              if Count > 2 then Count := 2;
              AppendNumber(Sec, Count);
            end;
          'T':
            begin
              GetCount;
              if Count = 1 then
                AppendFormat(Pointer(ShortTimeFormat)) else
                AppendFormat(Pointer(LongTimeFormat));
            end;
          'Z':
            begin
              GetCount;
              GetTime;
              if Count > 3 then Count := 3;
              AppendNumber(MSec, Count);
            end;
          'A':
            begin
              GetTime;
              P := Format - 1;
              if StrLIComp(P, 'AM/PM', 5) = 0 then
              begin
                if Hour >= 12 then Inc(P, 3);
                AppendChars(P, 2);
                Inc(Format, 4);
                Use12HourClock := TRUE;
              end else
              if StrLIComp(P, 'A/P', 3) = 0 then
              begin
                if Hour >= 12 then Inc(P, 2);
                AppendChars(P, 1);
                Inc(Format, 2);
                Use12HourClock := TRUE;
              end else
              if StrLIComp(P, 'AMPM', 4) = 0 then
              begin
                if Hour < 12 then
                  AppendString(TimeAMString) else
                  AppendString(TimePMString);
                Inc(Format, 3);
                Use12HourClock := TRUE;
              end else
              if StrLIComp(P, 'AAAA', 4) = 0 then
              begin
                GetDate;
                AppendString(LongDayNames[DayOfWeek(DateTime)]);
                Inc(Format, 3);
              end else
              if StrLIComp(P, 'AAA', 3) = 0 then
              begin
                GetDate;
                AppendString(ShortDayNames[DayOfWeek(DateTime)]);
                Inc(Format, 2);
              end else
              AppendChars(@Starter, 1);
            end;
          'C':
            begin
              GetCount;
              AppendFormat(Pointer(ShortDateFormat));
              GetTime;
              if (Hour <> 0) or (Min <> 0) or (Sec <> 0) then
              begin
                AppendChars(' ', 1);
                AppendFormat(Pointer(LongTimeFormat));
              end;
            end;
          '/':
            if DateSeparator <> #0 then
              AppendChars(@DateSeparator, 1);
          ':':
            if TimeSeparator <> #0 then
              AppendChars(@TimeSeparator, 1);
          '''', '"':
            begin
              P := Format;
              while (Format^ <> #0) and (Format^ <> Starter) do
              begin
                if Format^ in LeadBytes then
                  Format := StrNextChar(Format)
                else
                  Inc(Format);
              end;
              AppendChars(P, Format - P);
              if Format^ <> #0 then Inc(Format);
            end;
        else
          AppendChars(@Starter, 1);
        end;
      end;
      Dec(AppendLevel);
    end;
  end;

begin
  BufPos := 0;
  AppendLevel := 0;
  if Format <> '' then AppendFormat(Pointer(Format)) else AppendFormat('C');
  SetString(Result, Buffer, BufPos);
end;

class procedure TFarDate.farDateTimeToString(var Result: string; const Format: string;
  DateTime: TDateTime; const FormatSettings: TFormatSettings);
var
  BufPos, AppendLevel: Integer;
  Buffer: array[0..255] of Char;

  procedure AppendChars(P: PChar; Count: Integer);
  var
    N: Integer;
  begin
    N := SizeOf(Buffer) - BufPos;
    if N > Count then N := Count;
    if N <> 0 then Move(P[0], Buffer[BufPos], N);
    Inc(BufPos, N);
  end;

  procedure AppendString(const S: string);
  begin
    AppendChars(Pointer(S), Length(S));
  end;

  procedure AppendNumber(Number, Digits: Integer);
  const
    Format: array[0..3] of Char = '%.*d';
  var
    NumBuf: array[0..15] of Char;
  begin
    AppendChars(NumBuf, FormatBuf(NumBuf, SizeOf(NumBuf), Format,
      SizeOf(Format), [Digits, Number]));
  end;

  procedure AppendFormat(Format: PChar);
  var
    Starter, Token, LastToken: Char;
    DateDecoded, TimeDecoded, Use12HourClock,
    BetweenQuotes: Boolean;
    P: PChar;
    Count: Integer;
    Year, Month, Day, Hour, Min, Sec, MSec, H: Word;

    procedure GetCount;
    var
      P: PChar;
    begin
      P := Format;
      while Format^ = Starter do Inc(Format);
      Count := Format - P + 1;
    end;

    procedure GetDate;
    begin
      if not DateDecoded then
      begin
        farDecodeDate(DateTime, Year, Month, Day);
        DateDecoded := True;
      end;
    end;

    procedure GetTime;
    begin
      if not TimeDecoded then
      begin
        DecodeTime(DateTime, Hour, Min, Sec, MSec);
        TimeDecoded := True;
      end;
    end;

{$IFDEF MSWINDOWS}
    function ConvertEraString(const Count: Integer) : string;
    var
      FormatStr: string;
      SystemTime: TSystemTime;
      Buffer: array[Byte] of Char;
      P: PChar;
    begin
      Result := '';
      with SystemTime do
      begin
        wYear  := Year;
        wMonth := Month;
        wDay   := Day;
      end;

      FormatStr := 'gg';
      if GetDateFormat(GetThreadLocale, DATE_USE_ALT_CALENDAR, @SystemTime,
        PChar(FormatStr), Buffer, SizeOf(Buffer)) <> 0 then
      begin
        Result := Buffer;
        if Count = 1 then
        begin
          case SysLocale.PriLangID of
            LANG_JAPANESE:
              Result := Copy(Result, 1, CharToBytelen(Result, 1));
            LANG_CHINESE:
              if (SysLocale.SubLangID = SUBLANG_CHINESE_TRADITIONAL)
                and (ByteToCharLen(Result, Length(Result)) = 4) then
              begin
                P := Buffer + CharToByteIndex(Result, 3) - 1;
                SetString(Result, P, CharToByteLen(P, 2));
              end;
          end;
        end;
      end;
    end;

    function ConvertYearString(const Count: Integer): string;
    var
      FormatStr: string;
      SystemTime: TSystemTime;
      Buffer: array[Byte] of Char;
    begin
      Result := '';
      with SystemTime do
      begin
        wYear  := Year;
        wMonth := Month;
        wDay   := Day;
      end;

      if Count <= 2 then
        FormatStr := 'yy' // avoid Win95 bug.
      else
        FormatStr := 'yyyy';

      if GetDateFormat(GetThreadLocale, DATE_USE_ALT_CALENDAR, @SystemTime,
        PChar(FormatStr), Buffer, SizeOf(Buffer)) <> 0 then
      begin
        Result := Buffer;
        if (Count = 1) and (Result[1] = '0') then
          Result := Copy(Result, 2, Length(Result)-1);
      end;
    end;
{$ENDIF}

{$IFDEF LINUX}
    function FindEra(Date: Integer): Byte;
    var
      I : Byte;
    begin
      Result := 0;
      for I := 1 to EraCount do
      begin
        if (EraRanges[I].StartDate <= Date) and
          (EraRanges[I].EndDate >= Date) then
        begin
          Result := I;
          Exit;
        end;
      end;
    end;

    function ConvertEraString(const Count: Integer) : String;
    var
      I : Byte;
    begin
      Result := '';
      I := FindEra(Trunc(DateTime));
      if I > 0 then
        Result := EraNames[I];
    end;

    function ConvertYearString(const Count: Integer) : String;
    var
      I : Byte;
      S : string;
    begin
      I := FindEra(Trunc(DateTime));
      if I > 0 then
        S := IntToStr(Year - EraYearOffsets[I])
      else
        S := IntToStr(Year);
      while Length(S) < Count do
        S := '0' + S;
      if Length(S) > Count then
        S := Copy(S, Length(S) - (Count - 1), Count);
      Result := S;
    end;
{$ENDIF}

  begin
    if (Format <> nil) and (AppendLevel < 2) then
    begin
      Inc(AppendLevel);
      LastToken := ' ';
      DateDecoded := False;
      TimeDecoded := False;
      Use12HourClock := False;
      while Format^ <> #0 do
      begin
        Starter := Format^;
        if Starter in LeadBytes then
        begin
          AppendChars(Format, StrCharLength(Format));
          Format := StrNextChar(Format);
          LastToken := ' ';
          Continue;
        end;
        Format := StrNextChar(Format);
        Token := Starter;
        if Token in ['a'..'z'] then Dec(Token, 32);
        if Token in ['A'..'Z'] then
        begin
          if (Token = 'M') and (LastToken = 'H') then Token := 'N';
          LastToken := Token;
        end;
        case Token of
          'Y':
            begin
              GetCount;
              GetDate;
              if Count <= 2 then
                AppendNumber(Year mod 100, 2) else
                AppendNumber(Year, 4);
            end;
          'G':
            begin
              GetCount;
              GetDate;
              AppendString(ConvertEraString(Count));
            end;
          'E':
            begin
              GetCount;
              GetDate;
              AppendString(ConvertYearString(Count));
            end;
          'M':
            begin
              GetCount;
              GetDate;
              case Count of
                1, 2: AppendNumber(Month, Count);
                3: AppendString(FormatSettings.ShortMonthNames[Month]);
              else
                AppendString(FormatSettings.LongMonthNames[Month]);
              end;
            end;
          'D':
            begin
              GetCount;
              case Count of
                1, 2:
                  begin
                    GetDate;
                    AppendNumber(Day, Count);
                  end;
                3: AppendString(FormatSettings.ShortDayNames[DayOfWeek(DateTime)]);
                4: AppendString(FormatSettings.LongDayNames[DayOfWeek(DateTime)]);
                5: AppendFormat(Pointer(FormatSettings.ShortDateFormat));
              else
                AppendFormat(Pointer(FormatSettings.LongDateFormat));
              end;
            end;
          'H':
            begin
              GetCount;
              GetTime;
              BetweenQuotes := False;
              P := Format;
              while P^ <> #0 do
              begin
                if P^ in LeadBytes then
                begin
                  P := StrNextChar(P);
                  Continue;
                end;
                case P^ of
                  'A', 'a':
                    if not BetweenQuotes then
                    begin
                      if ( (StrLIComp(P, 'AM/PM', 5) = 0)
                        or (StrLIComp(P, 'A/P',   3) = 0)
                        or (StrLIComp(P, 'AMPM',  4) = 0) ) then
                        Use12HourClock := True;
                      Break;
                    end;
                  'H', 'h':
                    Break;
                  '''', '"': BetweenQuotes := not BetweenQuotes;
                end;
                Inc(P);
              end;
              H := Hour;
              if Use12HourClock then
                if H = 0 then H := 12 else if H > 12 then Dec(H, 12);
              if Count > 2 then Count := 2;
              AppendNumber(H, Count);
            end;
          'N':
            begin
              GetCount;
              GetTime;
              if Count > 2 then Count := 2;
              AppendNumber(Min, Count);
            end;
          'S':
            begin
              GetCount;
              GetTime;
              if Count > 2 then Count := 2;
              AppendNumber(Sec, Count);
            end;
          'T':
            begin
              GetCount;
              if Count = 1 then
                AppendFormat(Pointer(FormatSettings.ShortTimeFormat)) else
                AppendFormat(Pointer(FormatSettings.LongTimeFormat));
            end;
          'Z':
            begin
              GetCount;
              GetTime;
              if Count > 3 then Count := 3;
              AppendNumber(MSec, Count);
            end;
          'A':
            begin
              GetTime;
              P := Format - 1;
              if StrLIComp(P, 'AM/PM', 5) = 0 then
              begin
                if Hour >= 12 then Inc(P, 3);
                AppendChars(P, 2);
                Inc(Format, 4);
                Use12HourClock := TRUE;
              end else
              if StrLIComp(P, 'A/P', 3) = 0 then
              begin
                if Hour >= 12 then Inc(P, 2);
                AppendChars(P, 1);
                Inc(Format, 2);
                Use12HourClock := TRUE;
              end else
              if StrLIComp(P, 'AMPM', 4) = 0 then
              begin
                if Hour < 12 then
                  AppendString(FormatSettings.TimeAMString) else
                  AppendString(FormatSettings.TimePMString);
                Inc(Format, 3);
                Use12HourClock := TRUE;
              end else
              if StrLIComp(P, 'AAAA', 4) = 0 then
              begin
                GetDate;
                AppendString(FormatSettings.LongDayNames[DayOfWeek(DateTime)]);
                Inc(Format, 3);
              end else
              if StrLIComp(P, 'AAA', 3) = 0 then
              begin
                GetDate;
                AppendString(FormatSettings.ShortDayNames[DayOfWeek(DateTime)]);
                Inc(Format, 2);
              end else
              AppendChars(@Starter, 1);
            end;
          'C':
            begin
              GetCount;
              AppendFormat(Pointer(FormatSettings.ShortDateFormat));
              GetTime;
              if (Hour <> 0) or (Min <> 0) or (Sec <> 0) then
              begin
                AppendChars(' ', 1);
                AppendFormat(Pointer(FormatSettings.LongTimeFormat));
              end;
            end;
          '/':
            if DateSeparator <> #0 then
              AppendChars(@FormatSettings.DateSeparator, 1);
          ':':
            if TimeSeparator <> #0 then
              AppendChars(@FormatSettings.TimeSeparator, 1);
          '''', '"':
            begin
              P := Format;
              while (Format^ <> #0) and (Format^ <> Starter) do
              begin
                if Format^ in LeadBytes then
                  Format := StrNextChar(Format)
                else
                  Inc(Format);
              end;
              AppendChars(P, Format - P);
              if Format^ <> #0 then Inc(Format);
            end;
        else
          AppendChars(@Starter, 1);
        end;
      end;
      Dec(AppendLevel);
    end;
  end;

begin
  BufPos := 0;
  AppendLevel := 0;
  if Format <> '' then AppendFormat(Pointer(Format)) else AppendFormat('C');
  SetString(Result, Buffer, BufPos);
end;


class function TFarDate.farDateToStr(dateTime:TfarDateTime):string;
begin
farDateTimeToString(Result, ShortDateFormat, DateTime);
end;

class function TFarDate.farDateToStr(const DateTime: TfarDateTime;
  const FormatSettings: TFormatSettings): string;
begin
  farDateTimeToString(Result, FormatSettings.ShortDateFormat, DateTime,
    FormatSettings);
end;

class function TFarDate.farFormatDateTime(const Format: string; DateTime: TfarDateTime): string;
begin
  farDateTimeToString(Result, Format, DateTime);
end;

class function TFarDate.farFormatDateTime(const Format: string; DateTime: TfarDateTime;
  const FormatSettings: TFormatSettings): string;
begin
  farDateTimeToString(Result, Format, DateTime, FormatSettings);
end;

class function TFarDate.farDateTimeToStr(const DateTime: TfarDateTime): string;
begin
  farDateTimeToString(Result, '', DateTime);
end;

class function TFarDate.farDateTimeToStr(const DateTime: TfarDateTime;
  const FormatSettings: TFormatSettings): string;
begin
  farDateTimeToString(Result, '', DateTime, FormatSettings);
end;

class function TFarDate.farGetDateOrder(const DateFormat: string): TDateOrder;
var
  I: Integer;
begin
  Result := doMDY;
  I := 1;
  while I <= Length(DateFormat) do
  begin
    case Chr(Ord(DateFormat[I]) and $DF) of
      'E': Result := doYMD;
      'Y': Result := doYMD;
      'M': Result := doMDY;
      'D': Result := doDMY;
    else
      Inc(I);
      Continue;
    end;
    Exit;
  end;
  Result := doMDY;
end;

class procedure TFarDate.farScanBlanks(const S: string; var Pos: Integer);
var
  I: Integer;
begin
  I := Pos;
  while (I <= Length(S)) and (S[I] = ' ') do Inc(I);
  Pos := I;
end;

class function TFarDate.farScanNumber(const S: string; var Pos: Integer;
  var Number: Word; var CharCount: Byte): Boolean;
var
  I: Integer;
  N: Word;
begin
  Result := False;
  CharCount := 0;
  farScanBlanks(S, Pos);
  I := Pos;
  N := 0;
  while (I <= Length(S)) and (S[I] in ['0'..'9']) and (N < 1000) do
  begin
    N := N * 10 + (Ord(S[I]) - Ord('0'));
    Inc(I);
  end;
  if I > Pos then
  begin
    CharCount := I - Pos;
    Pos := I;
    Number := N;
    Result := True;
  end;
end;

class procedure TFarDate.farScanToNumber(const S: string; var Pos: Integer);
begin
  while (Pos <= Length(S)) and not (S[Pos] in ['0'..'9']) do
  begin
    if S[Pos] in LeadBytes then
      Pos := NextCharIndex(S, Pos)
    else
      Inc(Pos);
  end;
end;

class function TFarDate.farGetEraYearOffset(const Name: string): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := Low(EraNames) to High(EraNames) do
  begin
    if EraNames[I] = '' then Break;
    if AnsiStrPos(PChar(EraNames[I]), PChar(Name)) <> nil then
    begin
      Result := EraYearOffsets[I];
      Exit;
    end;
  end;
end;

class function TFarDate.farScanChar(const S: string; var Pos: Integer; Ch: Char): Boolean;
begin
  Result := False;
  farScanBlanks(S, Pos);
  if (Pos <= Length(S)) and (S[Pos] = Ch) then
  begin
    Inc(Pos);
    Result := True;
  end;
end;

class function TFarDate.farScanDate(const S: string; var Pos: Integer; var Date: TDateTime;
  const FormatSettings: TFormatSettings): Boolean;
var
  DateOrder: TDateOrder;
  N1, N2, N3, Y, M, D: Word;
  L1, L2, L3, YearLen: Byte;
  CenturyBase: Integer;
  EraName : string;
  EraYearOffset: Integer;

  function EraToYear(Year: Integer): Integer;
  begin
{$IFDEF MSWINDOWS}
    if SysLocale.PriLangID = LANG_KOREAN then
    begin
      if Year <= 99 then
        Inc(Year, (CurrentYear + Abs(EraYearOffset)) div 100 * 100);
      if EraYearOffset > 0 then
        EraYearOffset := -EraYearOffset;
    end
    else
      Dec(EraYearOffset);
{$ENDIF}
    Result := Year + EraYearOffset;
  end;

begin
  Y := 0;
  M := 0;
  D := 0;
  YearLen := 0;
  Result := False;
  DateOrder := farGetDateOrder(FormatSettings.ShortDateFormat);
  EraYearOffset := 0;
  if FormatSettings.ShortDateFormat[1] = 'g' then  // skip over prefix text
  begin
    farScanToNumber(S, Pos);
    EraName := Trim(Copy(S, 1, Pos-1));
    EraYearOffset := farGetEraYearOffset(EraName);
  end
  else
    if AnsiPos('e', FormatSettings.ShortDateFormat) > 0 then
      EraYearOffset := EraYearOffsets[1];
  if not (farScanNumber(S, Pos, N1, L1) and farScanChar(S, Pos, FormatSettings.DateSeparator) and
    farScanNumber(S, Pos, N2, L2)) then Exit;
  if farScanChar(S, Pos, FormatSettings.DateSeparator) then
  begin
    if not farScanNumber(S, Pos, N3, L3) then Exit;
    case DateOrder of
      doMDY: begin Y := N3; YearLen := L3; M := N1; D := N2; end;
      doDMY: begin Y := N3; YearLen := L3; M := N2; D := N1; end;
      doYMD: begin Y := N1; YearLen := L1; M := N2; D := N3; end;
    end;
    if EraYearOffset > 0 then
      Y := EraToYear(Y)
    else
    if (YearLen <= 2) then
    begin
      CenturyBase := CurrentYear - FormatSettings.TwoDigitYearCenturyWindow;
      Inc(Y, CenturyBase div 100 * 100);
      if (FormatSettings.TwoDigitYearCenturyWindow > 0) and (Y < CenturyBase) then
        Inc(Y, 100);
    end;
  end else
  begin
    Y := CurrentYear;
    if DateOrder = doDMY then
    begin
      D := N1; M := N2;
    end else
    begin
      M := N1; D := N2;
    end;
  end;
  farScanChar(S, Pos, FormatSettings.DateSeparator);
  farScanBlanks(S, Pos);
  if SysLocale.FarEast and (System.Pos('ddd', FormatSettings.ShortDateFormat) <> 0) then
  begin     // ignore trailing text
    if FormatSettings.ShortTimeFormat[1] in ['0'..'9'] then  // stop at time digit
      farScanToNumber(S, Pos)
    else  // stop at time prefix
      repeat
        while (Pos <= Length(S)) and (S[Pos] <> ' ') do Inc(Pos);
        farScanBlanks(S, Pos);
      until (Pos > Length(S)) or
        (AnsiCompareText(FormatSettings.TimeAMString,
         Copy(S, Pos, Length(FormatSettings.TimeAMString))) = 0) or
        (AnsiCompareText(FormatSettings.TimePMString,
         Copy(S, Pos, Length(FormatSettings.TimePMString))) = 0);
  end;
  Result := farTryEncodeDate(Y, M, D, Date);
end;

class function TFarDate.farScanDate(const S: string; var Pos: Integer;
  var Date: TDateTime): Boolean;
var
  DateOrder: TDateOrder;
  N1, N2, N3, Y, M, D: Word;
  L1, L2, L3, YearLen: Byte;
  CenturyBase: Integer;
  EraName : string;
  EraYearOffset: Integer;

  function EraToYear(Year: Integer): Integer;
  begin
{$IFDEF MSWINDOWS}
    if SysLocale.PriLangID = LANG_KOREAN then
    begin
      if Year <= 99 then
        Inc(Year, (CurrentYear + Abs(EraYearOffset)) div 100 * 100);
      if EraYearOffset > 0 then
        EraYearOffset := -EraYearOffset;
    end
    else
      Dec(EraYearOffset);
{$ENDIF}
    Result := Year + EraYearOffset;
  end;

begin
  Y := 0;
  M := 0;
  D := 0;
  YearLen := 0;
  Result := False;
  DateOrder := farGetDateOrder(ShortDateFormat);
  EraYearOffset := 0;
  if (ShortDateFormat <> '') and (ShortDateFormat[1] = 'g') then  // skip over prefix text
  begin
    farScanToNumber(S, Pos);
    EraName := Trim(Copy(S, 1, Pos-1));
    EraYearOffset := farGetEraYearOffset(EraName);
  end
  else
    if AnsiPos('e', ShortDateFormat) > 0 then
      EraYearOffset := EraYearOffsets[1];
  if not (farScanNumber(S, Pos, N1, L1) and farScanChar(S, Pos, DateSeparator) and
    farScanNumber(S, Pos, N2, L2)) then Exit;
  if farScanChar(S, Pos, DateSeparator) then
  begin
    if not farScanNumber(S, Pos, N3, L3) then Exit;
    case DateOrder of
      doMDY: begin Y := N3; YearLen := L3; M := N1; D := N2; end;
      doDMY: begin Y := N3; YearLen := L3; M := N2; D := N1; end;
      doYMD: begin Y := N1; YearLen := L1; M := N2; D := N3; end;
    end;
    if EraYearOffset > 0 then
      Y := EraToYear(Y)
    else
    if (YearLen <= 2) then
    begin
      CenturyBase := CurrentYear - TwoDigitYearCenturyWindow;
      Inc(Y, CenturyBase div 100 * 100);
      if (TwoDigitYearCenturyWindow > 0) and (Y < CenturyBase) then
        Inc(Y, 100);
    end;
  end else
  begin
    Y := CurrentYear;
    if DateOrder = doDMY then
    begin
      D := N1; M := N2;
    end else
    begin
      M := N1; D := N2;
    end;
  end;
  farScanChar(S, Pos, DateSeparator);
  farScanBlanks(S, Pos);
  if SysLocale.FarEast and (System.Pos('ddd', ShortDateFormat) <> 0) then
  begin     // ignore trailing text
    if ShortTimeFormat[1] in ['0'..'9'] then  // stop at time digit
      farScanToNumber(S, Pos)
    else  // stop at time prefix
      repeat
        while (Pos <= Length(S)) and (S[Pos] <> ' ') do Inc(Pos);
        farScanBlanks(S, Pos);
      until (Pos > Length(S)) or
        (AnsiCompareText(TimeAMString, Copy(S, Pos, Length(TimeAMString))) = 0) or
        (AnsiCompareText(TimePMString, Copy(S, Pos, Length(TimePMString))) = 0);
  end;
  Result := farTryEncodeDate(Y, M, D, Date);
end;

class function TFarDate.farTryStrToDate(const S: string; out Value: TDateTime): Boolean;
var
  Pos: Integer;
begin
  Pos := 1;
  Result := farScanDate(S, Pos, Value) and (Pos > Length(S));
end;

class function TFarDate.farTryStrToDate(const S: string; out Value: TDateTime;
  const FormatSettings: TFormatSettings): Boolean;
var
  Pos: Integer;
begin
  Pos := 1;
  Result := farScanDate(S, Pos, Value, FormatSettings) and (Pos > Length(S));
end;

class function TFarDate.farStrToDate(const S: string): TfarDateTime;
begin
  if not farTryStrToDate(S, Result) then
    raise EConvertError.Createfmt(SInvalidDate,[S]);
end;

class function TFarDate.farStrToDate(const S: string;
  const FormatSettings: TFormatSettings): TfarDateTime;
begin
  if not farTryStrToDate(S, Result, FormatSettings) then
    raise EConvertError.Createfmt(SInvalidDate,[S]);
end;

class function TFarDate.farStrToDateDef(const S: string; const Default: TfarDateTime): TfarDateTime;
begin
  if not farTryStrToDate(S, Result) then
    Result := Default;
end;

class function TFarDate.farStrToDateDef(const S: string; const Default: TfarDateTime;
  const FormatSettings: TFormatSettings): TfarDateTime;
begin
  if not farTryStrToDate(S, Result, FormatSettings) then
    Result := Default;
end;

{----AValue is Shamsi date-----}
class function TFarDate.farYearOf(const AValue: TDateTime): Word;
var
  LMonth, LDay: Word;
begin
  TFarDate.FarDecodeDate(AValue, Result, LMonth, LDay);
end;

{----AValue is Shamsi date-----}
class function TFarDate.farMonthOf(const AValue: TDateTime): Word;
var
  LYear, LDay: Word;
begin
  TFarDate.FarDecodeDate(AValue, LYear, Result, LDay);
end;

{----AValue is Shamsi date-----}
class function TFarDate.farWeekOf(const AValue: TDateTime): Word;                       {ISO 8601}
begin
  Result := farWeekOfTheYear(AValue);
end;

{----AValue is Shamsi date-----}
class function TFarDate.farDayOf(const AValue: TfarDateTime): Word;
var
  LYear, LMonth: Word;
begin
  TFarDate.FarDecodeDate(AValue, LYear, LMonth, Result);
end;

class function TFarDate.farWeekOfTheYear(const AValue: TfarDateTime): Word;
var
  LYear, LDOW: Word;
begin
  farDecodeDateWeek(AValue, LYear, Result, LDOW);
end;

class function TFarDate.farWeekOfTheYear(const AValue: TfarDateTime; var AYear: Word): Word;
var
  LDOW: Word;
begin
  farDecodeDateWeek(AValue, AYear, Result, LDOW);
end;

class function TFarDate.farDayOfTheWeek(const AValue: TfarDateTime): Word;
begin
  Result := (DateTimeToTimeStamp(AValue).Date - 1) mod 7 + 1;
end;

const
  CDayMap: array [1..7] of Word = (7, 1, 2, 3, 4, 5, 6);

class procedure TFarDate.farDecodeDateWeek(const AValue: TfarDateTime; out AYear, AWeekOfYear,
  ADayOfWeek: Word);
var
  LDayOfYear: Integer;
  LMonth, LDay: Word;
  LStart: TDateTime;
  LStartDayOfWeek, LEndDayOfWeek: Word;
  LLeap: Boolean;
begin
  LLeap := farDecodeDateFully(AValue, AYear, LMonth, LDay, ADayOfWeek);
  ADayOfWeek := CDayMap[ADayOfWeek];
  LStart := farEncodeDate(AYear, 1, 1);
  LDayOfYear := Trunc(AValue - LStart + 1);
  LStartDayOfWeek := farDayOfTheWeek(LStart);
  if LStartDayOfWeek in [DayFriday, DaySaturday, DaySunday] then
    Dec(LDayOfYear, 8 - LStartDayOfWeek)
  else
    Inc(LDayOfYear, LStartDayOfWeek - 1);
  if LDayOfYear <= 0 then
    farDecodeDateWeek(LStart - 1, AYear, AWeekOfYear, LDay)
  else
  begin
    AWeekOfYear := LDayOfYear div 7;
    if LDayOfYear mod 7 <> 0 then
      Inc(AWeekOfYear);
    if AWeekOfYear > 52 then
    begin
      LEndDayOfWeek := LStartDayOfWeek;
      if LLeap then
      begin
        if LEndDayOfWeek = DaySunday then
          LEndDayOfWeek := DayMonday
        else
          Inc(LEndDayOfWeek);
      end;
      if LEndDayOfWeek in [DayMonday, DayTuesday, DayWednesday] then
      begin
        Inc(AYear);
        AWeekOfYear := 1;
      end;
    end;
  end;
end;

class procedure TFarDate.farDecodeDateTime(const AValue: TfarDateTime;
  out AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word);
begin
  farDecodeDate(int(AValue), AYear, AMonth, ADay);
  DecodeTime(AValue, AHour, AMinute, ASecond, AMilliSecond);
end;

class function TFarDate.farTryEncodeTime(Hour, Min, Sec, MSec: Word; out Time: TDateTime): Boolean;
begin
  Result := False;
  if (Hour < HoursPerDay) and (Min < MinsPerHour) and (Sec < SecsPerMin) and (MSec < MSecsPerSec) then
  begin
    Time := (Hour * (MinsPerHour * SecsPerMin * MSecsPerSec) +
             Min * (SecsPerMin * MSecsPerSec) +
             Sec * MSecsPerSec +
             MSec) / MSecsPerDay;
    Result := True;
  end;
end;

class function TFarDate.farTryEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,
  AMilliSecond: Word; out AValue: TDateTime): Boolean;
var
  LTime: TDateTime;
  tmp:integer;
begin
  Result := farTryEncodeDate(AYear, AMonth, ADay, AValue);
  AValue:=int(AValue);
  tmp:=1;
  If AValue<>0 then
    tmp:=trunc((AValue) / ABS(AValue));

  if Result then
  begin
    Result := farTryEncodeTime(AHour, AMinute, ASecond, AMilliSecond, LTime);
    if Result then  begin
      AValue := (abs(AValue) + LTime)*tmp;
    end;
  end;
end;

class function TFarDate.farEncodeDateTime(const AYear, AMonth, ADay, AHour, AMinute, ASecond,
  AMilliSecond: Word): TfarDateTime;
begin
  if not farTryEncodeDateTime(AYear, AMonth, ADay,
                           AHour, AMinute, ASecond, AMilliSecond, Result) then
    raise EConvertError.CreateRes(@SDateEncodeError);
end;

{==================================================================}
{==================================================================}
{==================================================================}
{==================================================================}
{==================================================================}
{====================FOR OLD VERSION OF DELPHI=====================}
{==================================================================}
{==================================================================}
{==================================================================}
{==================================================================}
{==================================================================}
{$IfDef OldDelphi}
  var
    DefShortMonthNames: array[1..12] of Pointer = (@SShortMonthNameJan,
      @SShortMonthNameFeb, @SShortMonthNameMar, @SShortMonthNameApr,
      @SShortMonthNameMay, @SShortMonthNameJun, @SShortMonthNameJul,
      @SShortMonthNameAug, @SShortMonthNameSep, @SShortMonthNameOct,
      @SShortMonthNameNov, @SShortMonthNameDec);

    DefLongMonthNames: array[1..12] of Pointer = (@SLongMonthNameJan,
      @SLongMonthNameFeb, @SLongMonthNameMar, @SLongMonthNameApr,
      @SLongMonthNameMay, @SLongMonthNameJun, @SLongMonthNameJul,
      @SLongMonthNameAug, @SLongMonthNameSep, @SLongMonthNameOct,
      @SLongMonthNameNov, @SLongMonthNameDec);

    DefShortDayNames: array[1..7] of Pointer = (@SShortDayNameSun,
      @SShortDayNameMon, @SShortDayNameTue, @SShortDayNameWed,
      @SShortDayNameThu, @SShortDayNameFri, @SShortDayNameSat);

    DefLongDayNames: array[1..7] of Pointer = (@SLongDayNameSun,
      @SLongDayNameMon, @SLongDayNameTue, @SLongDayNameWed,
      @SLongDayNameThu, @SLongDayNameFri, @SLongDayNameSat);

  {$IFDEF MSWINDOWS}
  function EnumEraNames(Names: PChar): Integer; stdcall;
  var
    I: Integer;
  begin
    Result := 0;
    I := Low(EraNames);
    while EraNames[I] <> '' do
      if (I = High(EraNames)) then
        Exit
      else Inc(I);
    EraNames[I] := Names;
    Result := 1;
  end;

  function EnumEraYearOffsets(YearOffsets: PChar): Integer; stdcall;
  var
    I: Integer;
  begin
    Result := 0;
    I := Low(EraYearOffsets);
    while EraYearOffsets[I] <> -1 do
      if (I = High(EraYearOffsets)) then
        Exit
      else Inc(I);
    EraYearOffsets[I] := StrToIntDef(YearOffsets, 0);
    Result := 1;
  end;

  function TranslateDateFormat(const FormatStr: string): string;
  var
    I: Integer;
    L: Integer;
    CalendarType: CALTYPE;
    RemoveEra: Boolean;
  begin
    I := 1;
    Result := '';
    CalendarType := StrToIntDef(GetLocaleStr(GetThreadLocale,
      LOCALE_ICALENDARTYPE, '1'), 1);
    if not (CalendarType in [CAL_JAPAN, CAL_TAIWAN, CAL_KOREA]) then
    begin
      RemoveEra := SysLocale.PriLangID in [LANG_JAPANESE, LANG_CHINESE, LANG_KOREAN];
      if RemoveEra then
      begin
        While I <= Length(FormatStr) do
        begin
          if not (FormatStr[I] in ['g', 'G']) then
            Result := Result + FormatStr[I];
          Inc(I);
        end;
      end
      else
        Result := FormatStr;
      Exit;
    end;

    while I <= Length(FormatStr) do
    begin
      if FormatStr[I] in LeadBytes then
      begin
        L := CharLength(FormatStr, I);
        Result := Result + Copy(FormatStr, I, L);
        Inc(I, L);
      end else
      begin
        if StrLIComp(@FormatStr[I], 'gg', 2) = 0 then
        begin
          Result := Result + 'ggg';
          Inc(I, 1);
        end
        else if StrLIComp(@FormatStr[I], 'yyyy', 4) = 0 then
        begin
          Result := Result + 'eeee';
          Inc(I, 4-1);
        end
        else if StrLIComp(@FormatStr[I], 'yy', 2) = 0 then
        begin
          Result := Result + 'ee';
          Inc(I, 2-1);
        end
        else if FormatStr[I] in ['y', 'Y'] then
          Result := Result + 'e'
        else
          Result := Result + FormatStr[I];
        Inc(I);
      end;
    end;
  end;
  {$ENDIF}

  procedure GetMonthDayNames;
  {$IFDEF MSWINDOWS}
  var
    I, Day: Integer;
    DefaultLCID: LCID;

    function LocalGetLocaleStr(LocaleType, Index: Integer;
      const DefValues: array of Pointer): string;
    begin
      Result := GetLocaleStr(DefaultLCID, LocaleType, '');
      if Result = '' then Result := LoadResString(DefValues[Index]);
    end;

  begin
    DefaultLCID := GetThreadLocale;
    for I := 1 to 12 do
    begin
      ShortMonthNames[I] := LocalGetLocaleStr(LOCALE_SABBREVMONTHNAME1 + I - 1,
        I - Low(DefShortMonthNames), DefShortMonthNames);
      LongMonthNames[I] := LocalGetLocaleStr(LOCALE_SMONTHNAME1 + I - 1,
        I - Low(DefLongMonthNames), DefLongMonthNames);
    end;
    for I := 1 to 7 do
    begin
      Day := (I + 5) mod 7;
      ShortDayNames[I] := LocalGetLocaleStr(LOCALE_SABBREVDAYNAME1 + Day,
        I - Low(DefShortDayNames), DefShortDayNames);
      LongDayNames[I] := LocalGetLocaleStr(LOCALE_SDAYNAME1 + Day,
        I - Low(DefLongDayNames), DefLongDayNames);
    end;
  end;
  {$ELSE}
  {$IFDEF LINUX}
    function GetLocaleStr(LocaleIndex, Index: Integer;
      const DefValues: array of Pointer): string;
    var
      temp: PChar;
    begin
      temp := nl_langinfo(LocaleIndex);
      if (temp = nil) or (temp^ = #0) then
        Result := LoadResString(DefValues[Index])
      else
        Result := temp;
    end;

  var
    I: Integer;
  begin
    for I := 1 to 12 do
    begin
      ShortMonthNames[I] := GetLocaleStr(ABMON_1 + I - 1,
        I - Low(DefShortMonthNames), DefShortMonthNames);
      LongMonthNames[I] := GetLocaleStr(MON_1 + I - 1,
        I - Low(DefLongMonthNames), DefLongMonthNames);
    end;
    for I := 1 to 7 do
    begin
      ShortDayNames[I] := GetLocaleStr(ABDAY_1 + I - 1,
        I - Low(DefShortDayNames), DefShortDayNames);
      LongDayNames[I] := GetLocaleStr(DAY_1 + I - 1,
        I - Low(DefLongDayNames), DefLongDayNames);
    end;
  end;
  {$ELSE}
  var
    I: Integer;
  begin
    for I := 1 to 12 do
    begin
      ShortMonthNames[I] := LoadResString(DefShortMonthNames[I]);
      LongMonthNames[I] := LoadResString(DefLongMonthNames[I]);
    end;
    for I := 1 to 7 do
    begin
      ShortDayNames[I] := LoadResString(DefShortDayNames[I]);
      LongDayNames[I] := LoadResString(DefLongDayNames[I]);
    end;
  end;
  {$ENDIF}
  {$ENDIF}

  procedure GetEraNamesAndYearOffsets;
  var
    J: Integer;
    CalendarType: CALTYPE;
  begin
    CalendarType := StrToIntDef(GetLocaleStr(GetThreadLocale,
      LOCALE_IOPTIONALCALENDAR, '1'), 1);
    if CalendarType in [CAL_JAPAN, CAL_TAIWAN, CAL_KOREA] then
    begin
      EnumCalendarInfoA(@EnumEraNames, GetThreadLocale, CalendarType,
        CAL_SERASTRING);
      for J := Low(EraYearOffsets) to High(EraYearOffsets) do
        EraYearOffsets[J] := -1;
      EnumCalendarInfoA(@EnumEraYearOffsets, GetThreadLocale, CalendarType,
        CAL_IYEAROFFSETRANGE);
    end;
  end;

  {$IFDEF MSWINDOWS}
  function LCIDToCodePage(ALcid: LCID): Integer;
  var
    Buffer: array [0..6] of Char;
  begin
    GetLocaleInfo(ALcid, LOCALE_IDEFAULTANSICODEPAGE, Buffer, SizeOf(Buffer));
    Result:= StrToIntDef(Buffer, GetACP);
  end;
  {$ENDIF}

  procedure InitSysLocale;
  {$IFDEF MSWINDOWS}
  var
    DefaultLCID: LCID;
    DefaultLangID: LANGID;
    AnsiCPInfo: TCPInfo;
    I: Integer;
    BufferA: array [128..255] of Char;
    BufferW: array [128..256] of Word;
    PCharA: PChar;

    procedure InitLeadBytes;
    var
      I: Integer;
      J: Byte;
    begin
      GetCPInfo(LCIDToCodePage(SysLocale.DefaultLCID), AnsiCPInfo);
      with AnsiCPInfo do
      begin
        I := 0;
        while (I < MAX_LEADBYTES) and ((LeadByte[I] or LeadByte[I + 1]) <> 0) do
        begin
          for J := LeadByte[I] to LeadByte[I + 1] do
            Include(LeadBytes, Char(J));
          Inc(I, 2);
        end;
      end;
    end;

    function IsWesternGroup: Boolean;
    type
      TLangGroup = $00..$1D;
      TLangGroups = set of TLangGroup;
    const
      lgNeutral = TLangGroup($00);
      lgDanish = TLangGroup($06);
      lgDutch = TLangGroup($13);
      lgEnglish  = TLangGroup($09);
      lgFinnish = TLangGroup($0B);
      lgFrench = TLangGroup($0C);
      lgGerman = TLangGroup($07);
      lgItalian  = TLangGroup($10);
      lgNorwegian = TLangGroup($14);
      lgPortuguese = TLangGroup($16);
      lgSpanish  = TLangGroup($0A);
      lgSwedish  = TLangGroup($1D);

      WesternGroups: TLangGroups = [
        lgNeutral,
        lgDanish,
        lgDutch,
        lgEnglish,
        lgFinnish,
        lgFrench,
        lgGerman,
        lgItalian,
        lgNorwegian,
        lgPortuguese,
        lgSpanish,
        lgSwedish
      ];
    begin
      Result := SysLocale.PriLangID in WesternGroups;
    end;

  begin
    { Set default to English (US). }
    SysLocale.DefaultLCID := $0409;
    SysLocale.PriLangID := LANG_ENGLISH;
    SysLocale.SubLangID := SUBLANG_ENGLISH_US;

    DefaultLCID := GetThreadLocale;
    if DefaultLCID <> 0 then SysLocale.DefaultLCID := DefaultLCID;

    DefaultLangID := Word(DefaultLCID);
    if DefaultLangID <> 0 then
    begin
      SysLocale.PriLangID := DefaultLangID and $3ff;
      SysLocale.SubLangID := DefaultLangID shr 10;
    end;

    LeadBytes := [];
    if Win32Platform = VER_PLATFORM_WIN32_NT then
    begin
      if IsWesternGroup then
      begin
        SysLocale.MiddleEast := False;
        SysLocale.FarEast    := False;
      end
      else
      begin
        { Far East (aka MBCS)? - }
        InitLeadBytes;
        SysLocale.FarEast := LeadBytes <> [];
        if SysLocale.FarEast then
        begin
          SysLocale.MiddleEast := False;
          Exit;
        end;

        { Middle East? }
        for I := Low(BufferA) to High(BufferA) do
          BufferA[I] := Char(I);
        PCharA := @BufferA; { not null terminated: include length in GetStringTypeExA call }
        GetStringTypeEx(SysLocale.DefaultLCID, CT_CTYPE2, PCharA, High(BufferA) - Low(BufferA) + 1, BufferW);
        for I := Low(BufferA) to High(BufferA) do
        begin
          SysLocale.MiddleEast := BufferW[I] = C2_RIGHTTOLEFT;
          if SysLocale.MiddleEast then
            Exit;
        end;
      end;
    end
    else
    begin
      SysLocale.MiddleEast := GetSystemMetrics(SM_MIDEASTENABLED) <> 0;
      SysLocale.FarEast    := GetSystemMetrics(SM_DBCSENABLED) <> 0;
      if SysLocale.FarEast then
        InitLeadBytes;
    end;
  end;
  {$ENDIF}
  {$IFDEF LINUX}
  var
    I: Integer;
    buf: array [0..3] of char;
  begin
    FillChar(SysLocale, sizeof(SysLocale), 0);
    SysLocale.FarEast := MB_CUR_MAX <> 1;
    if not SysLocale.FarEast then Exit;

    buf[1] := #0;
    for I := 1 to 255 do
    begin
      buf[0] := Chr(I);
      if mblen(buf, 1) <> 1 then Include(LeadBytes, Char(I));
    end;
  end;
  {$ENDIF}

  procedure GetFormatSettings;
  {$IFDEF MSWINDOWS}
  var
    HourFormat, TimePrefix, TimePostfix: string;
    DefaultLCID: Integer;
  begin
    InitSysLocale;
    GetMonthDayNames;
    if SysLocale.FarEast then GetEraNamesAndYearOffsets;
    DefaultLCID := GetThreadLocale;
    CurrencyString := GetLocaleStr(DefaultLCID, LOCALE_SCURRENCY, '');
    CurrencyFormat := StrToIntDef(GetLocaleStr(DefaultLCID, LOCALE_ICURRENCY, '0'), 0);
    NegCurrFormat := StrToIntDef(GetLocaleStr(DefaultLCID, LOCALE_INEGCURR, '0'), 0);
    ThousandSeparator := GetLocaleChar(DefaultLCID, LOCALE_STHOUSAND, ',');
    DecimalSeparator := GetLocaleChar(DefaultLCID, LOCALE_SDECIMAL, '.');
    CurrencyDecimals := StrToIntDef(GetLocaleStr(DefaultLCID, LOCALE_ICURRDIGITS, '0'), 0);
    DateSeparator := GetLocaleChar(DefaultLCID, LOCALE_SDATE, '/');
    ShortDateFormat := TranslateDateFormat(GetLocaleStr(DefaultLCID, LOCALE_SSHORTDATE, 'm/d/yy'));
    LongDateFormat := TranslateDateFormat(GetLocaleStr(DefaultLCID, LOCALE_SLONGDATE, 'mmmm d, yyyy'));
    TimeSeparator := GetLocaleChar(DefaultLCID, LOCALE_STIME, ':');
    TimeAMString := GetLocaleStr(DefaultLCID, LOCALE_S1159, 'am');
    TimePMString := GetLocaleStr(DefaultLCID, LOCALE_S2359, 'pm');
    TimePrefix := '';
    TimePostfix := '';
    if StrToIntDef(GetLocaleStr(DefaultLCID, LOCALE_ITLZERO, '0'), 0) = 0 then
      HourFormat := 'h' else
      HourFormat := 'hh';
    if StrToIntDef(GetLocaleStr(DefaultLCID, LOCALE_ITIME, '0'), 0) = 0 then
      if StrToIntDef(GetLocaleStr(DefaultLCID, LOCALE_ITIMEMARKPOSN, '0'), 0) = 0 then
        TimePostfix := ' AMPM'
      else
        TimePrefix := 'AMPM ';
    ShortTimeFormat := TimePrefix + HourFormat + ':mm' + TimePostfix;
    LongTimeFormat := TimePrefix + HourFormat + ':mm:ss' + TimePostfix;
    ListSeparator := GetLocaleChar(DefaultLCID, LOCALE_SLIST, ',');
  end;
  {$ELSE}
  {$IFDEF LINUX}
  const
    //first boolean is p_cs_precedes, second is p_sep_by_space
    CurrencyFormats: array[boolean, boolean] of byte = ((1, 3),(0, 2));
    //first boolean is n_cs_precedes, second is n_sep_by_space and finally n_sign_posn
    NegCurrFormats: array[boolean, boolean, 0..4] of byte =
      (((4,5,7,6,7),(15,8,10,13,10)),((0,1,3,1,2),(14,9,11,9,12)));

    function TranslateFormat(s: PChar; const Default: string): string;
    begin
      Result := '';
      while s^ <> #0 do
      begin
        if s^ = '%' then
        begin
          inc(s);
          case s^ of
            'a': Result := Result + 'ddd';
            'A': Result := Result + 'dddd';
            'b': Result := Result + 'MMM';
            'B': Result := Result + 'MMMM';
            'c': Result := Result + 'c';
  //        'C':  year / 100 not supported
            'd': Result := Result + 'dd';
            'D': Result := Result + 'MM/dd/yy';
            'e': Result := Result + 'd';
  //        'E': alternate format not supported
            'g': Result := Result + 'yy';
            'G': Result := Result + 'yyyy';
            'h': Result := Result + 'MMM';
            'H': Result := Result + 'HH';
            'I': Result := Result + 'hh';
  //        'j': day of year not supported
            'k': Result := Result + 'H';
            'l': Result := Result + 'h';
            'm': Result := Result + 'MM';
            'M': Result := Result + 'nn';  // minutes! not months!
            'n': Result := Result + sLineBreak;  // line break
  //        'O': alternate format not supported
            'P',   // P's implied lowercasing of locale string is not supported
            'p': Result := Result + 'AMPM';
            'r': Result := Result + TranslateFormat(nl_langInfo(T_FMT_AMPM),'');
            'R': Result := Result + 'HH:mm';
  //        's': number of seconds since Epoch not supported
            'S': Result := Result + 'ss';
            't': Result := Result + #9;  // tab char
            'T': Result := Result + 'HH:mm:ss';
  //        'u': day of week 1..7 not supported
  //        'U': week number of the year not supported
  //        'V': week number of the year not supported
  //        'w': day of week 0..6 not supported
  //        'W': week number of the year not supported
            'x': Result := Result + TranslateFormat(nl_langInfo(D_FMT),'');
            'X': Result := Result + TranslateFormat(nl_langinfo(T_FMT),'');
            'y': Result := Result + 'yy';
            'Y': Result := Result + 'yyyy';
  //        'z': GMT offset is not supported
            '%': Result := Result + '%';
          end;
        end
        else
          Result := Result + s^;
        Inc(s);
      end;
      if Result = '' then
        Result := Default;
    end;

    function GetFirstCharacter(const SrcString, match: string): char;
    var
      i, p: integer;
    begin
      result := match[1];
      for i := 1 to length(SrcString) do begin
        p := Pos(SrcString[i], match);
        if p > 0 then
        begin
          result := match[p];
          break;
        end;
      end;
    end;

  var
    P: PLConv;
  begin
    InitSysLocale;
    GetMonthDayNames;
    if SysLocale.FarEast then InitEras;

    CurrencyString := '';
    CurrencyFormat := 0;
    NegCurrFormat := 0;
    ThousandSeparator := ',';
    DecimalSeparator := '.';
    CurrencyDecimals := 0;

    P := localeconv;
    if P <> nil then
    begin
      if P^.currency_symbol <> nil then
        CurrencyString := P^.currency_symbol;

      if (Byte(P^.p_cs_precedes) in [0..1]) and
         (Byte(P^.p_sep_by_space) in [0..1]) then
      begin
        CurrencyFormat := CurrencyFormats[P^.p_cs_precedes, P^.p_sep_by_space];
        if P^.p_sign_posn in [0..4] then
          NegCurrFormat := NegCurrFormats[P^.n_cs_precedes, P^.n_sep_by_space,
                                          P^.n_sign_posn];
      end;

      // #0 is valid for ThousandSeparator.  Indicates no thousand separator.
      ThousandSeparator := P^.thousands_sep^;

      // #0 is not valid for DecimalSeparator.
      if P^.decimal_point <> #0 then
        DecimalSeparator := P^.decimal_point^;
      CurrencyDecimals := P^.frac_digits;
    end;

    ShortDateFormat := TranslateFormat(nl_langinfo(D_FMT),'m/d/yy');
    LongDateFormat := TranslateFormat(nl_langinfo(D_T_FMT), ShortDateFormat);
    ShortTimeFormat := TranslateFormat(nl_langinfo(T_FMT), 'hh:mm AMPM');
    LongTimeFormat := TranslateFormat(nl_langinfo(T_FMT_AMPM), ShortTimeFormat);

    DateSeparator := GetFirstCharacter(ShortDateFormat, '/.-');
    TimeSeparator := GetFirstCharacter(ShortTimeFormat, ':.');

    TimeAMString := nl_langinfo(AM_STR);
    TimePMString := nl_langinfo(PM_STR);
    ListSeparator := ',';
  end;
  {$ELSE}
  var
    HourFormat, TimePrefix, TimePostfix: string;
  begin
    InitSysLocale;
    GetMonthDayNames;
    CurrencyString := '';
    CurrencyFormat := 0;
    NegCurrFormat := 0;
    ThousandSeparator := ',';
    DecimalSeparator := '.';
    CurrencyDecimals := 0;
    DateSeparator := '/';
    ShortDateFormat := 'm/d/yy';
    LongDateFormat := 'mmmm d, yyyy';
    TimeSeparator := ':';
    TimeAMString := 'am';
    TimePMString := 'pm';
    TimePrefix := '';
    TimePostfix := '';
    HourFormat := 'h';
    TimePostfix := ' AMPM';
    ShortTimeFormat := TimePrefix + HourFormat + ':mm' + TimePostfix;
    LongTimeFormat := TimePrefix + HourFormat + ':mm:ss' + TimePostfix;
    ListSeparator := ',';
  end;
  {$ENDIF}
  {$ENDIF}
{$EndIf}//OldDelphi

initialization
{$IfDef OldDelphi}
  GetFormatSettings; { Win implementation uses platform id }
{$EndIf}

end.

