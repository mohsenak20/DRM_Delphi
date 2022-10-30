unit MyDate;


interface
uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Math,DateUtils,StrUtils;



const
   SolarDayOfWeek: array [0..6] of string = ('‘‰ÌÂ',
  'Ìò ‘‰»Â',
  'œÊ‘‰»Â',
  '”Â ‘‰»Â',
  'çÂ«—‘‰»Â',
  'Å‰Ã ‘‰»Â',
  'Ã„⁄Â');
  GregorianDayOfWeek: array [0..6] of string = ('Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday');

  INVALID_SOLAR_DATE = '1300/01/01';
  INVALID_GREGORIAN_DATE = '1921/03/21';

var
  FormatSetting: TFormatSettings;

type
  TDateBase = (dbSolar, dbGregorian);

type
  TStringArray = array of string;

function Date_DaysBetween(Dt1, Dt2: string; DateBase: TDateBase): integer;
function Date_SolarToGregorian(SolarDate: string; CanZero: boolean = false): string;
function Date_IsValidDate(Dt: string; DateBase: TDateBase): boolean;
function Date_GregorianToSolar(GregorianDate: string): string;



implementation



function JalCal(JY: Integer; var GY: Integer; var March: integer): boolean;
const
  breaks: Array[1..20] of Integer = (-61, 9, 38, 199, 426, 686, 756, 818,
                                     1111, 1181, 1210, 1635, 2060, 2097,
                                     2192, 2262, 2324, 2394, 2456, 3178);
var
  leapJ, jp, jm, jump, N: Integer;
  j: Integer;
  leap, leapG: Integer;
begin
  GY := JY +621;
  leapJ := -14;
  jp := breaks[1];
  if (JY < jp) or (JY >= breaks[20]) then
    begin
    writeln('error');
    exit;
    end;

  for j := 2 to 20 do
    begin
    jm := breaks[j];
    jump := jm -jp;
    if Jy < jm then
      Break;
    leapJ := leapJ +jump div 33 * 8 +(jump mod 33) div 4;
    jp := jm;
    end;

  N := Jy -jp;
  leapJ := leapJ +N div 33 * 8 +((N mod 33) +3) div 4;
  if(jump mod 33 = 4) and (jump -N = 4)then
    leapJ := leapJ +1;

  leapG := Gy div 4 -(Gy div 100 +1) * 3 div 4 -150;
  March := 20 +leapJ -leapG;
  if (jump -N < 6) then
    N := N -jump +(jump +4) div 33 * 33;
  leap := ((N +1) mod 33 -1) mod 4;
  if leap = -1 then
    leap := 4;

  Result := leap = 0;
end;

function Date_IsZeroValidDate(Dt: string; DateBase: TDateBase): boolean;
var
  DD, MM, YY: integer;
begin
  if length(Dt) <> 10 then
    begin
    Result := false;
    exit;
    end;

  DD := StrToInt(Copy(Dt, 9, 2));
  MM := StrToInt(Copy(Dt, 6, 2));
  YY := StrToInt(Copy(Dt, 1, 4));

  if DateBase = dbSolar then
    Result := ((DD = 0) and (MM in [0..12]))
              or
              ((MM = 0) and (DD in [0..31]))
              or
              ((YY = 0) and (DD in [0..31]) and (MM in [0..12]))

  else
    Result := false;
end;
function Date_IsLeapYear(Y: integer; DateBase: TDateBase): boolean;
var
  DD, YY: integer;
begin
  if DateBase = dbSolar then
    Result := JalCal(Y, YY, DD)
  else
    Result := SysUtils.IsLeapYear(Y);
end;
function Date_IsValidDate(Dt: string; DateBase: TDateBase): boolean;
var
  DD, MM, YY: integer;
begin
  if length(Dt) <> 10 then
    begin
    Result := false;
    exit;
    end;

  DD := StrToInt(Copy(Dt, 9, 2));
  MM := StrToInt(Copy(Dt, 6, 2));
  YY := StrToInt(Copy(Dt, 1, 4));

  if DateBase = dbSolar then
    Result := (MM in [1..12])
              and (
                   (MM in [1..6]) and (DD in [1..31]))
                   or
                   ((MM in [7..11]) and (DD in [1..30]))
                   or
                   ((MM = 12) and (DD in [1..IfThen(Date_IsLeapYear(YY, dbSolar), 30, 29)])
                   )

  else
    Result := IsValidDate(YY, MM, DD);
end;

function Date_DaysOfYear(Dt: string; DateBase: TDateBase): integer;
var
   SMonth, SDay: integer;
begin
  if DateBase = dbSolar then
    begin
    SMonth := StrToInt(Copy(Dt, 6, 2));
    SDay := StrToInt(Copy(Dt, 9, 2));

    case SMonth of
      1: Result := SDay;
      2: Result := SDay +31;
      3: Result := SDay +62;
      4: Result := SDay +93;
      5: Result := SDay +124;
      6: Result := SDay +155;
      7: Result := SDay +186;
      8: Result := SDay +216;
      9: Result := SDay +246;
     10: Result := SDay +276;
     11: Result := SDay +306;
     12: Result := SDay +336;
    end;
    end

  else
    Result := DayOfTheYear(StrToDate(Dt, FormatSetting));
end;
///////////111111111
function Date_SolarToGregorian(SolarDate: string; CanZero: boolean = false): string;
var
  SYear, SMonth, SDay: integer;
  GYear, GMonth, GDay: integer;
  SIsLeap, GIsLeap: boolean;
  GDate: TDate;
begin
  if CanZero and Date_IsZeroValidDate(SolarDate, dbSolar) then
    begin
    Result := '0000/00/00';
    Exit;
    end;

  if (SolarDate <= INVALID_SOLAR_DATE) or (SolarDate > '3000/12/30') or (length(SolarDate) <> 10) then
    begin
    Result := INVALID_GREGORIAN_DATE;
//    MessageBeep(0);
    exit;
    end;

  if not Date_IsValidDate(SolarDate, dbSolar) then
    begin
    Result := INVALID_GREGORIAN_DATE;
//    MessageBeep(0);
    exit;
    end;

  SYear := StrToInt(Copy(SolarDate, 1, 4));
  SMonth := StrToInt(Copy(SolarDate, 6, 2));
  SDay := StrToInt(Copy(SolarDate, 9, 2));

  SIsLeap := JalCal(SYear, GYear, GDay);

  GMonth := 3;
  GIsLeap := SysUtils.IsLeapYear(GYear);
  GDate := StrToDate(RightStr('000' + IntToStr(GYear), 4) + '/' + RightStr('0' + IntToStr(GMonth), 2) + '/' + RightStr('0' + IntToStr(GDay), 2), FormatSetting);
  GDate := GDate +Date_DaysOfYear(SolarDate, dbSolar) -1;
  Result := DateToStr(GDate, FormatSetting);
end;
function Date_DaysPerYear(Y: integer; DateBase: TDateBase): integer;
begin
  Result := DaysPerYear[Date_IsLeapYear(Y, DateBase)];
end;
function Date_DaysBetween(Dt1, Dt2: string; DateBase: TDateBase): integer;
var
  SYear1: integer;
  SYear2: integer;
  i, Day: integer;
  X1, X2: integer;
begin
  if DateBase = dbSolar then
    begin
    SYear1 := StrToInt(Copy(Dt1, 1, 4));
    SYear2 := StrToInt(Copy(Dt2, 1, 4));

    Day := 0;
    for i := SYear1 +1 to SYear2 -1 do
      Day := Day +Date_DaysPerYear(i, dbSolar);

    X1 := Date_DaysOfYear(Dt1, dbSolar);
    X2 := Date_DaysOfYear(Dt2, dbSolar);
    Result := Day + X2 -X1 +IfThen(SYear1 = SYear2, 0, Date_DaysPerYear(SYear1, dbSolar));
    end

  else
    Result := DaysBetween(StrToDate(Dt1, FormatSetting), StrToDate(Dt2, FormatSetting));
end;



function Date_MoveDate(Dt: string; Step: integer; DateBase: TDateBase): string;
var
  D: TDate;
begin
  if DateBase = dbSolar then
    Dt := Date_SolarToGregorian(Dt);

  D := StrToDate(Dt, FormatSetting) +Step;
  Dt := DateToStr(D, FormatSetting);

  if DateBase = dbSolar then
    Dt := Date_GregorianToSolar(Dt);

  Result := Dt;
end;

function Date_DaysPerMonth(Y, M: integer; DateBase: TDateBase): integer;
begin
  if DateBase = dbSolar then
    case M of
      1..6: Result := 31;
      7..11: Result := 30;
      12: Result := IfThen(Date_IsLeapYear(Y, dbSolar), 30, 29);
    end

  else
    Result := MonthDays[(M = 2) and SysUtils.IsLeapYear(Y), M];
end;
function MinimalMoveDateSolar(Dt: string; Step: integer): string;
var
  SYear, SMonth, SDay: integer;
  GYear, GDay: integer;
  DPX: integer;
begin
  SYear := StrToInt(Copy(Dt, 1, 4));
  SMonth := StrToInt(Copy(Dt, 6, 2));
  SDay := StrToInt(Copy(Dt, 9, 2));

  repeat
    DPX := Date_DaysPerYear(SYear, dbSolar);
    if Step < DPX then
      break;
    dec(Step, DPX);
    inc(SYear);
  until false;

  repeat
    DPX := Date_DaysPerMonth(SYear, SMonth, dbSolar);
    if Step < DPX then
      break;
    dec(Step, DPX);
    inc(SMonth);
    if SMonth > 12 then
      begin
      SMonth := 1;
      inc(SYear);
      end;
  until false;

  inc(SDay, Step);
  if SDay > Date_DaysPerMonth(SYear, SMonth, dbSolar) then
    begin
    SDay := 1;
    inc(SMonth);
    if SMonth > 12 then
      begin
      SMonth := 1;
      inc(SYear);
      end;
    end;

  Result := RightStr('000' + IntToStr(SYear), 4) + '/' + RightStr('0' + IntToStr(SMonth), 2) + '/' + RightStr('0' + IntToStr(SDay), 2);
end;
function Date_GregorianToSolar(GregorianDate: string): string;
var
  S, S1, S2: string;
  G, G1, G2: string;
  LoopCounter: integer;
begin
  if (GregorianDate <= INVALID_GREGORIAN_DATE) or (GregorianDate > '3622/03/20') or (length(GregorianDate) <> 10) then
    begin
    Result := INVALID_SOLAR_DATE;
//    MessageBeep(0);
    exit;
    end;

  if not Date_IsValidDate(GregorianDate, dbGregorian) then
    begin
    Result := INVALID_SOLAR_DATE;
//    MessageBeep(0);
    exit;
    end;

  S1 := IntToStr(StrToInt(Copy(GregorianDate, 1, 4)) -622) + '/01/01';
  S2 := IntToStr(StrToInt(Copy(GregorianDate, 1, 4)) -621) + '/12/29';

  G1 := Date_SolarToGregorian(S1);
  G2 := Date_SolarToGregorian(S2);

  while G1 > GregorianDate do
    begin
    S1 := Date_MoveDate(S1, -100, dbSolar);
    G1 := Date_SolarToGregorian(S1);
    end;

  while G2 < GregorianDate do
    begin
    S2 := Date_MoveDate(S2, 100, dbSolar);
    G2 := Date_SolarToGregorian(S2);
    end;

  LoopCounter := 0;

  if G1 = GregorianDate then
    Result := S1

  else if G2 = GregorianDate then
    Result := S2

  else
    begin

    repeat
      S := MinimalMoveDateSolar(S1, round(Date_DaysBetween(S1 ,S2, dbSolar) / 2));
      G := Date_SolarToGregorian(S);

      if G = GregorianDate then
        begin
        Result := S;
        break;
        end

      else if G > GregorianDate then
        S2 := S

      else if G < GregorianDate then
        S1 := S;

      inc(LoopCounter);
    until LoopCounter >= 13;

    if LoopCounter >= 13 then
      begin
      Result := INVALID_GREGORIAN_DATE;
//      MessageBeep(0);
      end
    else
      Result := S;

    end;
end;
initialization
  GetLocaleFormatSettings(Locale_system_default, FormatSetting);
  FormatSetting.ShortTimeFormat := 'HH:MM:SS';
  FormatSetting.ShortDateFormat := 'YYYY/MM/DD';
 // FormatSetting.DecimalSeparator := DECIMAL_DELIMITER;//
 // FormatSetting.ThousandSeparator := THOUSAND_DELIMITER;//


end.
