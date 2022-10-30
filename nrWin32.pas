{*******************************************************}
{                                                       }
{       nrCommLib Communication Library for Delphi      }
{       Base Library for Win32 platform (VCL)           }
{       Copyright (c) 1997-2011 Roman Novgorodov        }
{       v9.27                                           }
{       last update: 03 Mar 2011                        }
{                                                       }
{       e-mail:noro@deepsoftware.com                    }
{       DeepSoftware                                    }
{       http://www.deepsoftware.com/                    }
{                                                       }
{*******************************************************}

unit nrwin32;
interface
uses windows,classes;

Const

  GUID_DEVCLASS_ADAPTER         :TGUID = '{4d36e964-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_BLUETOOTH       :TGUID = '{e0cbf06c-cd8b-4647-bb8a-263b43f0f974}';
  GUID_DEVCLASS_BATTERY         :TGUID = '{72631e54-78a4-11d0-bcf7-00aa00b7b32a}';
  GUID_DEVCLASS_BIOMETRIC       :TGUID = '{53d29ef7-377c-4d14-864b-eb3a85769359}';
  GUID_DEVCLASS_CDROM           :TGUID = '{4d36e965-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_COMPUTER        :TGUID = '{4d36e966-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_ENUM1394        :TGUID = '{c459df55-db08-11d1-b009-00a0c9081ff6}';
  GUID_DEVCLASS_GPS             :TGUID = '{6bdd1fc3-810f-11d0-bec7-08002be2092f}';
  GUID_DEVCLASS_HIDCLASS        :TGUID = '{745a17a0-74d3-11d0-b6fe-00a0c90f57da}';
  GUID_DEVCLASS_INFRARED        :TGUID = '{6bdd1fc5-810f-11d0-bec7-08002be2092f}';
  GUID_DEVCLASS_LEGACYDRIVER    :TGUID = '{8ecc055d-047f-11d1-a537-0000f8753ed1}';
  GUID_DEVCLASS_MODEM           :TGUID = '{4d36e96d-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_MULTIFUNCTION   :TGUID = '{4d36e971-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_MULTIPORTSERIAL :TGUID = '{50906cb8-ba12-11d1-bf5d-0000f805f530}';
  GUID_DEVCLASS_NODRIVER        :TGUID = '{4d36e976-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_PORTS           :TGUID = '{4d36e978-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_PRINTER         :TGUID = '{4d36e979-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_UNKNOWN         :TGUID = '{4d36e97e-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_USB             :TGUID = '{36fc9e60-c465-11cf-8056-444553540000}';
  GUID_DEVCLASS_DISKDRIVE       :TGUID = '{4d36e967-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_VOLUME          :TGUID = '{71a27cdd-812a-11d0-bec7-08002be2092f}';
  GUID_DEVCLASS_MEDIA           :TGUID = '{4d36e96c-e325-11ce-bfc1-08002be10318}';
  GUID_DEVCLASS_VOLUMESNAPSHOT  :TGUID = '{533c5b84-ec70-11d2-9505-00c04f79deaf}';

  GUID_DEVCLASS_COM0COM         :TGUID = '{df799e12-3c56-421b-b298-b6d3642bc878}';
  GUID_DEVCLASS_LIB_USB         :TGUID = '{EB781AAF-9C70-4523-A5DF-642A87ECA567}';

  GUID_DEVINTERFACE_DISK        :TGUID = '{53f56307-b6bf-11d0-94f2-00a0c91efb8b}';
  GUID_DEVINTERFACE_VOLUME      :TGUID = '{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}';
  GUID_DEVINTERFACE_MODEM       :TGUID = '{2c7089aa-2e0e-11d1-b114-00c04fc2aae4}';
  GUID_DEVINTERFACE_COMPORT     :TGUID = '{86e0d1e0-8089-11d0-9ce4-08003e301f73}';
  GUID_DEVINTERFACE_SERENUM_BUS_ENUMERATOR  :TGUID = '{4D36E978-E325-11CE-BFC1-08002BE10318}';
  GUID_DEVINTERFACE_USB_DEVICE  :TGUID = '{A5DCBF10-6530-11D2-901F-00C04FB951ED}';

  GUID_DEVINTERFACE_PARALLEL    :TGUID = '{97F76EF0-F883-11D0-AF1F-0000F800845C}';
  GUID_DEVINTERFACE_PARCLASS    :TGUID = '{811FC6A5-F728-11D0-A537-0000F8753ED1}';

  FILE_DEVICE_UNKNOWN           = $00000022;

  // WM_DEVICECHANGE constants ...
  DBT_DEVICEARRIVAL             = $8000;
  DBT_DEVICEREMOVECOMPLETE      = $8004;
  DBT_DEVNODES_CHANGED          = $0007;
  DBT_DEVTYP_PORT               = 3;



  APPLICATION_ERROR_MASK        = $20000000;
  ERROR_SEVERITY_SUCCESS        = $00000000;
  ERROR_SEVERITY_INFORMATIONAL  = $40000000;
  ERROR_SEVERITY_WARNING        = $80000000;
  ERROR_SEVERITY_ERROR          = $C0000000;

Type

  dword = cardinal ;

  function WaitForIOCompletion(Hnd:THandle; const o: TOverlapped; var nn:DWORD; var rslt: integer): boolean;
  function GetLastSysErrorString:string;

  function GetMainWindowHandle:integer;
  function OpenPort(const s:string):THandle;
  procedure GetPortList(L:TStrings; const MoreInfo:boolean);
  function WriteSync(hCom:THandle;Buf:pointer;Len:cardinal; const aOvl: TOverlapped):boolean;
  function ReadSync(hCom:THandle;Buf:pointer;Len:cardinal; const aOvl: TOverlapped):boolean;
  function WriteAsync(hCom:THandle;Buf:pointer;Len:cardinal;const aOvl: TOverlapped):boolean;
  function nrCancelIO(hF:cardinal):boolean;

  function CreateFileFromRes(aResName,aFileName:string):boolean;
  function GetResAsStr(aResName:string):AnsiString;

  function RegGetKeyFullName(const hKey:THandle; pRoot:PHandle):string;
  function RegGetKeyParentName(const sKey:string):string;
  function RegReadString(Key: HKey; const KeyName,ValName: string): string;

  function nrGetVersion(const ExeName:string;Mask:string):string;

  function GetParsedWin32StrList(pBuffer:PChar; len : integer; sDelim:string):string;

  function GetW32Name(aName:string):PChar;

  function IsWow64:boolean;

  function IsConsole:boolean;


Const
  glu32 = 'glu32.dll';
  GL_DEPTH_BUFFER_BIT                 = $00000100;
  GL_DEPTH_TEST                       = $0B71;
  GL_POINT_SMOOTH                     = $0B10;
  GL_PROJECTION                       = $1701;
  GL_LIGHT0                           = $4000;
  GL_LIGHT1                           = $4001;
  GL_POSITION                         = $1203;
  GL_LIGHT_MODEL_AMBIENT              = $0B53;
  GL_LIGHTING                         = $0B50;
  GL_COLOR_MATERIAL                   = $0B57;
  GL_FRONT                            = $0404;
  GL_AMBIENT_AND_DIFFUSE              = $1602;
  GL_MODELVIEW                        = $1700;
  GL_QUADS                            = $0007    ;
  GL_TRIANGLES                        = $0004    ;

Type
  _GLUquadricObj = record end;
  GLUquadricObj = ^_GLUquadricObj;

  procedure glClear (mask: cardinal); stdcall; external opengl32;
  procedure glViewport (x,y: integer; width, height: integer); stdcall; external opengl32;
  procedure glEnable (cap: cardinal); stdcall; external opengl32;
  procedure glMatrixMode (mode: cardinal); stdcall;  external opengl32;
  procedure gluPerspective(fovy, aspect, zNear, zFar: double); stdcall; external glu32;
  procedure glLightfv (light, pname: cardinal; params: PSingle); stdcall; external opengl32;
  procedure glLightModelfv (pname: cardinal; params: PSingle); stdcall; external opengl32;
  procedure glColorMaterial (face, mode: cardinal); stdcall; external opengl32;
  procedure glLoadIdentity; stdcall;  external opengl32;
  procedure glTranslatef (x,y,z: single); stdcall; external opengl32;
  function  gluNewQuadric: GLUquadricObj; stdcall; external glu32;
  procedure glColor3d (red, green, blue: double); stdcall; external opengl32;
  procedure gluDeleteQuadric (state: GLUquadricObj); stdcall; external glu32;
  procedure gluSphere(quadObject: GLUquadricObj; radius: double; slices, loops: integer); stdcall; external glu32;
  procedure gluCylinder (quadObject: GLUquadricObj;
     baseRadius, topRadius, height: double; slices, stacks: integer); stdcall;  external glu32;
  procedure glBegin (mode: cardinal); stdcall; external opengl32;
  procedure glEnd; stdcall; stdcall; external opengl32;
  procedure glVertex3f (x,y,z: single); stdcall; external opengl32;

  function IsManifestAvailable:boolean;
  function IsThemeActive:boolean;
  function IsAppThemed:boolean;




implementation
uses sysutils,winspool;



Type

  OSVERSIONINFOEX  = packed record
    dwOSVersionInfoSize:DWORD;
    dwMajorVersion:DWORD;
    dwMinorVersion:DWORD;
    dwBuildNumber:DWORD;
    dwPlatformId:DWORD;
    szCSDVersion:array[0 .. 127] of char;
    wServicePackMajor:WORD;
    wServicePackMinor:WORD;
    wSuiteMask:WORD;
    wProductType:BYTE;
    wReserved:BYTE;
  end;

Const
  VER_NT_WORKSTATION              = 001;

function GetLastSysErrorString:string;
begin
  Result:=SysErrorMessage(GetLastError());
end;

function GetMainWindowHandle:integer;
begin
  Result := GetForegroundWindow;
end;


function OpenPort(const s:string):THandle;
begin
  Result := CreateFile(PChar('\\?\' + s),  GENERIC_READ + GENERIC_WRITE , 0, nil, OPEN_EXISTING, FILE_FLAG_OVERLAPPED, 0);
end;

function WaitForIOCompletion(Hnd:THandle; const o: TOverlapped;
  var nn:DWORD;
  var rslt: integer): boolean;
begin
  Result := False;
  rslt := GetLastError();
  if rslt = ERROR_IO_PENDING then begin
//    OutputDebugString('wait write pending');
    Result := GetOverlappedResult(Hnd,o,nn,True);
    if not Result then rslt := GetLastError();
  end;
end;

function WriteSync(hCom:THandle;Buf:pointer;Len:cardinal; const aOvl: TOverlapped):boolean;
var //o:TOverlapped;
    nn:dword;
    i:integer;
begin
  ZeroMemory(@aOvl,SizeOf(TOverlapped) - SizeOf(THandle));
  Result:=WriteFile(hCom,Buf^,Len,Nn,@aOvl);
  if not Result
    then Result:=WaitForIOCompletion(hCom,aOvl,nn,i);
end;

function WriteAsync(hCom:THandle;Buf:pointer;Len:cardinal; const aOvl: TOverlapped):boolean;
var nn:dword;
begin
  ZeroMemory(@aOvl,SizeOf(TOverlapped) - SizeOf(THandle));
  Result:=WriteFile(hCom,Buf^,Len,Nn,@aOvl);
  if not Result then
     Result:=(GetLastError()=ERROR_IO_PENDING);
end;

function ReadSync(hCom:THandle;Buf:pointer;Len:cardinal; const aOvl: TOverlapped):boolean;
var i:dword;
    ii:integer;
begin
  ZeroMemory(@aOvl,SizeOf(TOverlapped) - SizeOf(THandle));
  Result:=ReadFile(hCom,Buf^,Len,i,@aOvl);
  if not Result
    then Result:=WaitForIOCompletion(hCom,aOvl,i,ii);
end;

procedure AddSorted(S:string; No:integer; L:TStrings);
var j:integer;
begin
  if l.IndexOf(S) >= 0 then exit;
  if (L.Count=0)or(Integer(L.Objects[L.Count-1])<No)
  then L.AddObject(S,TObject(No))
  else for j:=0 to L.Count-1 do
    if Integer(L.Objects[j])>No then begin
      L.InsertObject(j,S,TObject(No));
      break;
    end;
end;

procedure GetPortList(L:TStrings; const MoreInfo:boolean);
var i,j, no:integer;
    Rslt:boolean;
    Size,Count,S:dword;
    pBuff,pcV:PChar;
    hK:HKEY;
//    pcPort:^cardinal;
    sn:string;
begin
  L.Clear;
  pBuff:=nil;
  if Win32Platform = VER_PLATFORM_WIN32_WINDOWS then begin
    // Windows 9x version ...
    Rslt:=EnumPorts(nil,1,nil,0,Size,Count);
    if (not Rslt) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) then begin
      GetMem(pBuff,Size);
      EnumPorts(nil,1,pBuff,Size,Size,Count);
      for i := 0 to Count - 1 do begin
        sn := String(PChar(Pointer(Integer(pBuff) + 4*i)^));
        if Pos('COM',sn) = 1 then begin
             j := Pos(':',sn);
             if j > 0 then Delete(sn, j, 1);
             sn := Trim(sn);
             AddSorted(sn + '='{ + sn},StrToInt(String(PChar(@sn[4]))), L);
           end;

      end;
    end;
  end else begin
    // Windows NT version ...
    GetMem(pBuff,MAX_PATH);
    // Get port list from registry ...
    if RegOpenKeyEx(HKEY_LOCAL_MACHINE,'HARDWARE\DEVICEMAP\SERIALCOMM',
                    0,KEY_QUERY_VALUE,hK)=ERROR_SUCCESS then begin
       i:=0;
       Size:=MAX_PATH;
       GetMem(pcV,Size);
       while True do begin
         Size:=MAX_PATH;
         S:=Size;
         count := RegEnumValue(hK,i,pBuff,S,nil,nil,PByte(pcV),@Size);
         if count <> 0 then break;
         sn := Trim(UpperCase(String(pcV)));
         if Pos('COM',sn) = 1 then begin
           if L.IndexOfName(sn) < 0 then begin
             try
               no := StrToInt(String(PChar(@sn[4])));
               if MoreInfo
                 then AddSorted(sn + '=' + String(pBuff), no , L)
                 else AddSorted(sn, no , L);
             except
             end;
           end;
         end;
         Inc(i);
       end;
       RegCloseKey(hK);
       FreeMem(pcV);
    end;
  end;
  if pBuff <> nil then FreeMem(pBuff);
end;

Var pCancelIO:function (hF:cardinal):BOOL; stdcall;

function nrCancelIO(hF:cardinal):boolean;
var hM:cardinal;
begin
  hM:=GetModuleHandle('kernel32.dll');
  Result:=false;
  if hM<>0 then begin
    @pCancelIO:=GetProcAddress(hM,'CancelIo');
    if @pCancelIO<>nil then Result:=pCancelIO(hF);
  end;
end;

function CreateFileFromRes(aResName,aFileName:string):boolean;
var hRes,hGlob,hF,Sz:cardinal;
    dwDone:dword;
    pData:PChar;
begin
  Result:=False;
  hRes:=FindResource(HInstance,PChar(aResName),PChar(10));
  if hRes<>0 then begin
    hGlob:= LoadResource(HInstance,hRes);
    if hGlob<>0 then begin
      pData:=LockResource(hGlob);
      if pData<>nil then begin
        hF:=CreateFile(PChar(aFileName),GENERIC_WRITE,0,nil,CREATE_ALWAYS,0,0);
        if hF<>INVALID_HANDLE_VALUE then begin
           Sz:=SizeofResource(HInstance,hRes);
           WriteFile(hF,pData^,Sz,dwDone,nil);
           CloseHandle(hF);
           Result:=(Sz=dwDone);
        end;
      end;
    end;
  end;
end;

function GetResAsStr(aResName:string):AnsiString;
var hRes,hGlob,Sz:cardinal;
    pData:PAnsiChar;
begin
  Result := '';
  hRes := FindResource(HInstance, PChar(aResName), PChar(10));
  if hRes <> 0 then begin
    hGlob := LoadResource(HInstance,hRes);
    if hGlob <> 0 then begin
      pData := LockResource(hGlob);
      if pData <> nil then begin
        Sz := SizeofResource(HInstance,hRes);
        SetLength(Result, Sz);
        CopyMemory(PAnsiChar(Result), pData, sz);
      end;
    end;
  end;
end;

function RegGetKeyFullName(const hKey:THandle; pRoot:PHandle):string;
var Sz:dword;
    hDll:THandle;
    P:PWideChar;
    ZwQueryKey:function (hK:THandle; KeyInfCls: integer; KeyInformation:pointer; Length:dword; var ResultLength:dword):dword; stdcall;
begin
  Result := '';
  if hKey = INVALID_HANDLE_VALUE then exit;
  hDll := LoadLibrary('ntdll.dll');
  if hDll <> 0 then begin
    @ZwQueryKey := GetProcAddress(hDll, 'ZwQueryKey');
    if @ZwQueryKey <> nil then begin
      ZwQueryKey(hKey, 3, nil, 0, Sz);
      Sz := Sz + 2;
      P := Pointer(LocalAlloc(LPTR, Sz));
      ZwQueryKey(hKey, 3, P, Sz, Sz);
      Result := String(WideString(PWChar(@(P[2]))));
      LocalFree(THandle(P));
      if pRoot <> nil then begin

        if Pos('\MACHINE\', Result) = 10 then begin
          pRoot^ := HKEY_LOCAL_MACHINE;
          Result := Copy(Result, 19, Length(Result));
        end else
        if Pos('\USER\', Result) = 10 then begin
          pRoot^ := HKEY_CURRENT_USER;
          Result := Copy(Result, 16, Length(Result));
          Result := Copy(Result, Pos('\',Result) + 1, Length(Result));
        end else pRoot^ := 0;

      end;
    end;
    FreeLibrary(hDll);
  end;
end;

function RegGetKeyParentName(const sKey:string):string;
var i:integer;
begin
  Result:='';
  for i:=Length(sKey) downto 1 do
    if sKey[i]='\' then begin
      Result:=Copy(sKey,1,i-1);
      break;
    end;
end;

function GetVersionEx(lpVersionInformation: pointer): BOOL; stdcall;
external 'kernel32.dll' name 'GetVersionExA';

function nrGetVersion(const ExeName:string;Mask:string):string;
var
  n, Len: DWORD;
  Buf: PChar;
  P:Pointer;
  Value: ^VS_FIXEDFILEINFO;
  infOsv:OSVERSIONINFOEX;
begin
  if Mask = '' then Mask := '%u.%u.%u.%u';
  Result := '';

  if ExeName = '' then begin
    infOsv.dwOSVersionInfoSize := SizeOf(OSVERSIONINFOEX);
    if not GetVersionEx(@infOsv) then exit;
    case infOsv.dwMajorVersion of
      3:Result := 'NT 3.51';
      4:case infOsv.dwMinorVersion of
          10:Result := '98';
          90:Result := 'Me';
          else begin
            if Win32Platform = VER_PLATFORM_WIN32_NT
              then Result := 'NT 4'
              else Result := '95';
          end;
        end;
      5:case infOsv.dwMinorVersion of
          0:Result := '2000';
          1:Result := 'XP';
          2:Result := '2003';
        end;
      6:begin
         if infOsv.wProductType = VER_NT_WORKSTATION then
            case infOsv.dwMinorVersion of
              0:Result := 'Vista';
              1:Result := '7';
              else Result := 'Future Workstation';
            end
         else
            case infOsv.dwMinorVersion of
              0:Result := 'Server 2008';
              1:Result := 'Server 2008 R2';
              else Result := 'Future Server';
            end;

        end;
    end;
    Result:='Windows ' + Result + ' ['+
       Format('%u.%u.%u',[infOsv.dwMajorVersion, infOsv.dwMinorVersion, infOsv.dwBuildNumber])+
      '] '+Win32CSDVersion;
    exit;
  end;

  n := GetFileVersionInfoSize(PChar(ExeName), n);
  if n > 0 then begin
    Buf := AllocMem(n);
    Len:=n;
    GetFileVersionInfo(PChar(ExeName), 0, n, Buf);
    VerQueryValue(Buf,'\', P, Len);
    Value:=p;
    Result:=Format(Mask,
    [Value^.dwFileVersionMS shr 16,
    Value^.dwFileVersionMS and $FFFF,
    Value^.dwFileVersionLS shr 16,
    Value^.dwFileVersionLS and $FFFF]);
    FreeMem(Buf, n);
  end;
end;

function RegReadString(Key: HKey; const KeyName,ValName: string): string;
var
  TmpKey: HKey;
  ValType, ValSize: integer;
begin
  Result := '';
  if RegOpenKeyEx(Key, PChar(KeyName), 0, KEY_READ, TmpKey)=ERROR_SUCCESS then begin
    if (RegQueryValueEx(TmpKey, PChar(ValName), nil, @ValType, nil, @ValSize)=ERROR_SUCCESS)
    //and
      // (ValType=REG_SZ)
     then begin
       SetLength(Result, ValSize + 1);
       FillChar(PChar(Result)^, ValSize, ' ');
       if RegQueryValueEx(TmpKey, PChar(ValName), nil, @ValType, Pointer(Result), @ValSize) <> ERROR_SUCCESS
        then Result := ''
        else begin
          {$IFDEF UNICODE}
          ValSize := ValSize shr 1;
          {$ENDIF}
          if (ValType = REG_SZ) and ((Result[ValSize - 1]) = #0) then Dec(ValSize);
          SetLength(Result, ValSize);
        end;
     end;
    RegCloseKey(TmpKey);
  end;
end;

function GetParsedWin32StrList(pBuffer:PChar; len : integer; sDelim:string):string;
var i:integer;
begin
  Result := '';
  for i := 0 to len - 2 do
    if (pBuffer[i] = #0) then begin
      if i = (len - 2)
        then break
        else Result := Result + sDelim;
    end
    else Result := Result + pBuffer[i];
end;

function GetW32Name(aName:string):PChar;
begin
  {$IFDEF UNICODE}
  aName[Length(aName)] := 'W';
  {$ENDIF}
  Result := Pointer(aName);
end;

function IsWow64:boolean;
var p:function( hProcess:dword; isWow64:pointer):boolean; stdcall;
    res:dword;
begin
  Result := False;
  @p := GetProcAddress(GetModuleHandle('kernel32'), 'IsWow64Process');
  if @p = nil then exit;
  if p(GetCurrentProcess(), @res)
    then Result := Bool(res);
end;

function IsConsole:boolean;
var p:function( idProcess:dword; var idConsole: dword):boolean; stdcall;
    res:dword;
begin
  Result := True; // by default
  @p := GetProcAddress(GetModuleHandle('kernel32'), 'ProcessIdToSessionId');
  if @p = nil then exit;
  if p(GetCurrentProcessId(), res)
    then Result := res <> $FFFFFFFF;
end;

{ theme and manifest utils }

Const
  UXTheme_DLL_NAME            = 'UxTheme.dll';
Var
  hUxTheme : THandle = 0;

function IsManifestAvailable:boolean;
begin
  Result := FindResource(hInstance, PChar(1), PChar(24)) <> 0;
end;

function IsThemeActive:boolean;
var p:function : boolean;
begin
  Result := False;
  if hUxTheme = 0
    then hUxTheme := LoadLibrary(UXTheme_DLL_NAME);
  if hUxTheme = 0 then exit;
  @p := GetProcAddress(hUxTheme, 'IsThemeActive');
  if @p = nil then exit;
  Result := p;
end;

function IsAppThemed:boolean;
var p:function : boolean;
begin
  Result := False;
  if hUxTheme = 0
    then hUxTheme := LoadLibrary(UXTheme_DLL_NAME);
  if hUxTheme = 0 then exit;
  @p := GetProcAddress(hUxTheme, 'IsAppThemed');
  if @p = nil then exit;
  Result := p;
end;

initialization
finalization
  if hUxTheme <> 0 then FreeLibrary(hUxTheme);

end.
