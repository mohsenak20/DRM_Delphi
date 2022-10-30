{*******************************************************}
{                                                       }
{       nrCommLib Communication Library for Delphi      }
{       TnrComm base class code (VCL)                   }
{       Copyright (c) 1997-2011 Roman Novgorodov        }
{       v9.27                                           }
{       last update: 12 Mar 2009                        }
{                                                       }
{       e-mail:noro@deepsoftware.com                    }
{       DeepSoftware                                    }
{       http://www.deepsoftware.com/                    }
{                                                       }
{*******************************************************}


unit nrcomm;
interface
uses Windows, Messages, registry, Classes, SysUtils,TypInfo,nrWin32;

Const
  errInitConnect  = 'Device Connect Initialization Error';
  errNotFound     = 'Not found Available COM port';
  errPNPDevice    = 'Plug''n''Play Serial Port Device Error';
  errRsLoadConfig = 'Error on load config information from registry';
  errRsSaveConfig = 'Error on save config information from registry';
  csFatal               = -1;
  csNone                =  0;
  csClosed              =  1;
  csOpened              =  2;
  csDeviceIdChanged     =  3;

  // ================================================================
  // Error Codes for DoFatalErrors method and OnFatalErrors event ...
  // ----------------------------------------------------------------
  ECC_UNKNOWN           = 0;
  ECC_NRCOMM            = 1;
  ECC_NRTAPI            = 2;
  ECC_NRBARCODE         = 3;
  ECC_NRWAVE            = 4;
  ECC_NRSPEECH          = 5;
  ECC_NRZMODEM          = 6;
  ECC_NRLOG             = 7;
  ECC_NRUSB             = 8;
  ECC_DDBASE            = 9;
  ECC_LPT               = 10;
  ECC_FAX               = 11;
  ECC_GSM               = 12;
  ECC_BT                = 13;
  ECC_NRUSBDRV          = 14;
  ECC_DATAPROC          = 15;
  ECC_HID               = 16;
  ECC_FTBASE            = 17;
  ECC_GPS               = 18;
  ECC_KERMIT            = 19;

  // ================================================================
  // Error Codes (Extended) for DoFatalErrors method and OnFatalErrors event ...
  // ----------------------------------------------------------------

  ECCE_NO_DEVICES               = 1;
  ECCE_NOT_SELECTED_DEVICE      = 2;
  ECCE_GENERAL_INIT             = 3;
  ECCE_INTERNAL                 = 4;
  ECCE_FILE_IO                  = 5;
  ECCE_NO_FILES                 = 6;
  ECCE_TO_MANY_ERRORS           = 7;

Type

  TnrCustomComm     = class; //forward declaration
  TnrBaseIO = class;
  TIgnoreType=(itTerminal,itEventList,itAfterReceive,itTraceState);
  TIgnoreTypes=set of TIgnoreType;
  TnrNotifyEvent = procedure(Sender:TObject;Code:integer)of object;

  TnrDevice = class(TPersistent)
  protected
    fIndex: integer;
    fParent: TnrBaseIO;
  public
    Handle: THandle;
    DevInst:THandle;
    Data: integer;
    DataEx: integer;
    NameFriendly: string;
    NamePDO: string;
    NameDeviceDos: string;
    NameSymbolic: string;
    RegKey: string;
    Description: string;
    Service: string;
    Driver: string;
    InstanceId:string;
    BusRelations:string;
    PortName:string;
    Manufacturer:string;
    SerialNumber:string;
    GuidClass:TGUID;
    property Index:integer read fIndex;
    property Parent:TnrBaseIO read fParent;
  end;

  TCommThread = class(TThread)
  private
    Com:TnrCustomComm;
    hDevice:THandle;
     ovl:TOverlapped;
  public
    constructor Create(AOwner:TnrCustomComm);
    procedure Execute; override;
    procedure Terminate; //override;
  end;


  TnrNotifyList =class(TList)
  protected
    function Get(Index: Integer): TnrNotifyEvent;
    procedure Put(Index: Integer; Item: TnrNotifyEvent);
  public
    function Add(Item: TnrNotifyEvent): Integer;
    procedure Delete(index:integer);
    procedure Clear;{$IFNDEF VER100} override; {$ENDIF}
    function IndexOf(Item: TnrNotifyEvent): Integer;
    procedure Call(Sender:TObject;Code:integer);
    property Items[Index: Integer]:TnrNotifyEvent read Get write Put;
  end;

  TOnFatalErrorEvent = procedure(Sender:TObject;ErrorCode,Detail:cardinal;ErrorMsg:string;var RaiseException:boolean)of object;
  TOnReceived        = procedure(Com:TObject;Buffer:Pointer;Received:Cardinal) of object;
  TOnSent            = procedure(Com:TObject) of object;

  TnrBaseIO = class(TComponent)
  private

    nrNotifyList:TnrNotifyList;
    fOnFatalError: TOnFatalErrorEvent;
    slDevices:TStringList;
    threadData:pointer;
    threadDataSize:dword;
    fOnClose: TNotifyEvent;
    fOnOpen: TNotifyEvent;
    fThreadIO: TThread;
    fOnReceived: TOnReceived;
    fUseMainThread:boolean;
    fPriority : TThreadPriority;

    function GetOnFatalError: TOnFatalErrorEvent;
    procedure SetOnFatalError(const Value: TOnFatalErrorEvent);
    function GetDevice(Index: integer): TnrDevice;
    function GetDeviceCount: integer;
    procedure DoInputDataInMainThread;

  protected
    fActive:boolean;  //for design time
    hPort:THandle;
    sLogPrefix:string;
    flClearDeviceListWithFree:boolean;
    fOvlRead, fOvlWrite, fOvlAsync: TOverlapped;
    isThreaded : boolean;
    IsThreadIOTerminated: boolean;
    function GetActive: boolean;
    function IsHandleValid:boolean; virtual;
    function RequestDeviceHandle:THandle; virtual;
    procedure RequestDeviceHandleClose(aHandle:THandle); virtual;

    function IsReadNeeded:boolean; virtual;

    procedure SetActive(const Value: boolean);
    procedure Open;  virtual;
    procedure Close; virtual;

    procedure ThreadStart; virtual;
    procedure ThreadStop; virtual;
    procedure ThreadExecute(aThread:TThread); virtual;

    procedure DoFatalErrors(Code,Detail:cardinal;Msg:string; flByThread:boolean);virtual;
    procedure DoNotify(CodeState:integer);virtual;

    function DoInputData(Data : PAnsiChar; Len:cardinal):boolean; virtual;
    function DoOutputData:boolean; virtual;

    procedure SetDeviceIndex(const Value: integer); virtual;
    function GetDeviceIndex: integer; virtual; abstract;
    function AddDevice(aDevice:TnrDevice):integer; virtual;
    function AddDeviceSorted(aDevice:TnrDevice):integer; virtual;
    procedure DeviceListLoad; virtual; abstract;
    function IndexOfDeviceData(aData:integer):integer;
    procedure DeviceListClear; virtual;

    procedure Loaded; override;
    property Handle:THandle read hPort;
    property OnFatalError:TOnFatalErrorEvent read GetOnFatalError write SetOnFatalError;
    property OnOpen:TNotifyEvent read fOnOpen write fOnOpen;
    property OnClose:TNotifyEvent read fOnClose write fOnClose;
    property Active:boolean read GetActive write SetActive;
    property UseMainThread:boolean read fUseMainThread write fUseMainThread;
    property OnAfterReceive:TOnReceived read fOnReceived write fOnReceived;
    property Priority : TThreadPriority read fPriority write fPriority;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Update; virtual;
    procedure NotifyAdd(NotifyEvent:TnrNotifyEvent);virtual;
    procedure NotifyDelete(NotifyEvent:TnrNotifyEvent);virtual;
    procedure SendChar(const Ch:Char);    virtual; abstract;
    procedure SendString(const S:AnsiString); virtual; abstract;
    procedure SendData(const Buff:PByte{PAnsiChar};const N:cardinal);virtual; abstract;
    procedure ClearDeviceInput; virtual;abstract;
    procedure ClearDeviceOutput;virtual;abstract;
    procedure ClearDeviceBuffers;virtual;abstract;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure GetDeviceList(L:TStrings); virtual;
    function WMDeviceChange(var Msg:TMessage):boolean; virtual; //message WM_DEVICECHANGE;
    function IndexOfDevice(aDevice:TnrDevice):integer;
    property DeviceIndex:integer read GetDeviceIndex write SetDeviceIndex;
    property Device[Index:integer]:TnrDevice read GetDevice;
    property DeviceCount:integer read GetDeviceCount;
  end;

  TMsgThread = class(TThread)
  private
    Com:TnrCustomComm;
    glMsg:TMsg;
    procedure ProcessMess;
  public
    constructor Create(AOwner:TnrCustomComm);
    procedure Terminate;
    procedure Execute; override;
    //destructor Destroy; override;
  end;

  TComPort = (cpCOM1,cpCOM2,cpCOM3,cpCOM4,cpCOM5,cpCOM6,cpCOM7,cpCOM8,cpCOMxx);

  TTraceState=(tsRxChar,tsRxFlag,tsTxEmpty,tsCTS,tsDSR,tsRLSD,tsBreak,
          tsErr,tsRing,tsRx80Full,tsEvent1,tsEvent2);
  TTraceStates=set of TTraceState;

  TModemSignal = (msCTS, msDSR, msRing, msRLSD);
  TModemSignals = set of TModemSignal;
  TStreamProtocol = ( spNone, spXonXoff, spHardware );

  TParity = (pNone, pOdd, pEven, pMark, pSpace);
  TStopBits = (sbOne, sbOneAndHalf, sbTwo);
  TOnTraceEvent=procedure(Com:TObject; Event:TTraceStates) of object;
  TOnListEvent=procedure(Com:TObject; EventNo:longint;
                         Buffer:pointer; Received:integer; var flHandled:boolean)of object;
  TOnCommErrorEvent=procedure(Com:TObject;CommCode,SysError:cardinal;
                              State:TComStateFlags;
                              var flFlashBuffers:boolean)of object;

  TnrCustomComm = class(TnrBaseIO)          // component object .
  private
    MsgThread:TMsgThread;
    CommThread:TCommThread;
    Stat:PComStat;    // CommPort Statistic Structure.
    ComProp:TCommProp;
    fCommTimeouts:TCommTimeouts;
    LastErrorString:string;
    fTotalSent: cardinal;
    fTotalReceived: cardinal;
    fOnSent: TOnSent;
    fTraceStates: TTraceStates;
    fBufferOutSize:word;
    fBufferInSize:word;
    glBuffer:PAnsiChar;
    fRS485Mode : boolean;

    fIsNotSupportRS485:boolean;
    fProtocol:TStreamProtocol;

    procedure InitBuffer;
    procedure FreeBuffer;
    procedure WinProc(var Message: TMsg);
    procedure DoTraceStates(Com:TnrCustomComm;Event:TTraceStates);
    procedure SetTraceState(const v:TTraceStates);
    function GetStateModemSignals:TModemSignals;
    function GetParity:TParity;
    procedure SetParity(const Value:TParity);
    function GetStopBits:TStopBits;
    procedure SetStopBits(const Value:TStopBits);
    function GetByteSize:byte;
    procedure SetByteSize(const Value:byte);
    procedure SetBaudRate(const Value:cardinal);
    function GetBaudRate:cardinal;
    function GetCommProp:PCommProp;
    function GetReadyForRead:cardinal;
    function GetNotYetSend:cardinal;
//    function GetTimeouts: PCommTimeouts;
    procedure SetTimeOuts(const Value: PCommTimeouts);
    function GetStreamProtocol: TStreamProtocol;
    procedure SetStreamProtocol(const Value: TStreamProtocol);
    function GetBufferInSize: word;
    function GetBufferOutSize: word;
    procedure SetBufferInSize(const Value: word);
    procedure SetBufferOutSize(const Value: word);
    procedure SetTimeoutRead(const Value: cardinal);
    procedure SetTimeoutWrite(const Value: cardinal);
    function GetTimeoutRead: cardinal;
    function GetTimeoutWrite: cardinal;
    function GetOnCommError: TOnCommErrorEvent;
    function GetOnSent: TOnSent;
    function GetOnTraceState: TOnTraceEvent;
    function GetTotalReceived: cardinal;
    function GetTotalSent: cardinal;
    function GetTraceStates: TTraceStates;
    procedure SetOnSent(Value:TOnSent);
    procedure SetOnTraceState(Value:TOnTraceEvent);
    procedure SetOnCommError(Value:TOnCommErrorEvent);
    procedure ForceHalt(aClear:boolean);
    function GetRS485: boolean;
    procedure SetRS485(const Value: boolean);

  protected
    fOnTraceState: TOnTraceEvent;
    fOnCommError: TOnCommErrorEvent;
    CommCfg:TCommConfig;
    function GetPortName: string; virtual;
    procedure InitAfterOpen;virtual;
    procedure ThreadStart; override;
    procedure ThreadStop; override;
    procedure Open;    override;
    procedure Close;   override;

    {$IFDEF NR_WITH_CONTROLS}
    procedure DoCheckMonitor(Ctrl:TControl;const fl:boolean);
    {$ENDIF}

    procedure DCBApply;
    procedure DCBUpdate;

    procedure SetEventChar(const Value: char);virtual;
    function GetEventChar:char;virtual;
    procedure DoCommError(CommCode,SysCode:integer;Flags:TComStateFlags); virtual;

    {$IFDEF NR_WITH_CONTROLS}
    property MonitorCTS:TControl read GetMonitorCTS write SetMonitorCTS;
    property MonitorDSR:TControl read GetMonitorDSR write SetMonitorDSR;
    property MonitorRLSD:TControl read GetMonitorRLSD write SetMonitorRLSD;
    property MonitorRing:TControl read GetMonitorRing write SetMonitorRing;
    {$ENDIF}

    property BaudRate:cardinal read GetBaudRate write SetBaudRate;
    property Parity:TParity read GetParity write SetParity;
    property StopBits:TStopBits read GetStopBits write SetStopBits;
    property ByteSize:byte read GetByteSize write SetByteSize;
    property TraceStates:TTraceStates read GetTraceStates write SetTraceState;
    property ModemSignals:TModemSignals read GetStateModemSignals;
    property EventChar:char read GetEventChar write SetEventChar;
    property StreamProtocol:TStreamProtocol read GetStreamProtocol write SetStreamProtocol;

    // Events ...
    property OnAfterSend:TOnSent read GetOnSent write SetOnSent;
    property OnTraceState:TOnTraceEvent read GetOnTraceState write SetOnTraceState;
    property OnCommError:TOnCommErrorEvent read GetOnCommError write SetOnCommError;
    property ComName:string read GetPortName;
    property ReadyForRead:cardinal read GetReadyForRead;
    property NotYetSend:cardinal read GetNotYetSend;
//    property TimeOuts:PCommTimeouts read GetTimeouts write SetTimeOuts;
    property TimeoutRead:cardinal read GetTimeoutRead write SetTimeoutRead;
    property TimeoutWrite:cardinal read GetTimeoutWrite write SetTimeoutWrite;
    property CommProp:PCommProp read GetCommProp;
    property TotalReceived:cardinal read GetTotalReceived;
    property TotalSent:cardinal read GetTotalSent;
    property BufferInSize:word read GetBufferInSize write SetBufferInSize;
    property BufferOutSize:word read GetBufferOutSize write SetBufferOutSize;
    property RS485Mode:boolean read GetRS485 write SetRS485;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy;                    override;
    procedure ConfigDialog;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ClearDeviceInput; override;
    procedure ClearDeviceOutput;override;
    procedure ClearDeviceBuffers;override;
    procedure FlushOutputBuffer;
    procedure SetStateDTR(const State:boolean);
    procedure SetStateRTS(const State:boolean);
    procedure SetStateX(const State:boolean);
    procedure SetStateBreak(const State:boolean);
    procedure Read(Buffer:PAnsiChar;Len:cardinal);
    procedure ReadAll(Buffer:PAnsiChar);
    function ReadMax(Buffer:PAnsiChar; MaxLen:integer):integer;
    function ReadString:AnsiString;
    procedure SendChar(const Ch:Char);    override;
    procedure SendAheadChar(const Ch:Char);
    procedure SendString(const S:AnsiString); override;
    procedure SendData(const Buff:PByte{PAnsiChar};const N:cardinal);override;
    function WaitForBytes(Count:cardinal;Ms:cardinal):boolean;
    function WaitForSignal(Signal:TModemSignal;Ms:cardinal):boolean;
  end;

  TnrEnumPorts = (epQuickAll, epFullInfo, epFullPresent);

  TnrCustomSerialComm = class(TnrCustomComm)
  private
    fComPortNo:word;
    fExtHandle : THandle;
    fEnumPorts: TnrEnumPorts;
    function GetComPort: TComPort;
    procedure SetComPort(const V:TComPort);
    procedure SetComPortNo(const Value: word);
    function GetComPortNo: word;
  protected
    function GetPortName: string; override;
    function RequestDeviceHandle:THandle;override;
    property ComPortNo:word read GetComPortNo write SetComPortNo;
    property ComPort:TComPort read GetComPort write SetComPort;
    property EnumPorts: TnrEnumPorts read fEnumPorts write fEnumPorts;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy;                    override;
    procedure SaveConfig(const Root:HKEY;const Key,Name:string);virtual;
    procedure LoadConfig(const Root:HKEY;const Key,Name:string);virtual;
    function GetPNPDeviceString:string; virtual;
    procedure InitDeviceConnect;        virtual;
    function GetDeviceIndex: integer; override;
    procedure SetDeviceIndex(const Value: integer);  override;
    procedure Update; override;
    procedure DeviceListLoad; override;
    procedure SetExtHandle(aHandle:THandle);
  published
    property OnFatalError;
  end;


  TnrComm = class(TnrCustomSerialComm)
  public
    property ComName;
    property ReadyForRead;
    property NotYetSend;
//    property TimeOuts;
    property CommProp;
    property TotalReceived;
    property TotalSent;
    property Handle;
  published
    property Active;
    property BaudRate;
    property Parity;
    property StopBits;
    property ByteSize;
    property ComPortNo;
    property ComPort;
    property TraceStates;
    property ModemSignals;
    property EventChar;
    property StreamProtocol;
    property BufferInSize;
    property BufferOutSize;
    property TimeoutRead;
    property TimeoutWrite;
    property RS485Mode;
    property EnumPorts;
    property UseMainThread;

    property OnAfterReceive;
    property OnAfterSend;
    property OnTraceState;
    property OnCommError;
    property OnClose;
  end;

  TnrThreadIO = class(TThread)
  private
    fnrComm:TnrBaseIO;
  public
    constructor Create(anrComm:TnrBaseIO; pr:TThreadPriority);
    procedure Execute; override;
    procedure Synchronize(Method: TThreadMethod);
  end;


implementation
uses activex;

Const
  DefaultCommName = 'COM1';

  CI_MIN_BUFFER_SIZE = 1024 * 8;

Var
  msgComEvent:dword=WM_USER+33;
  msgQComEvent:dword=WM_USER+34;



{ TCommThread }

{ TnrThreadIO }

constructor TnrThreadIO.Create(anrComm: TnrBaseIO; pr:TThreadPriority);
begin
  inherited Create(True);
  fnrComm := anrComm;
  FreeOnTerminate := True;
  Priority := pr;
  Resume;
end;

procedure TnrThreadIO.Execute;
begin
  try
    try
      CoInitializeEx(nil, COINIT_MULTITHREADED);
      fnrComm.ThreadExecute(Self);
    except
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TnrThreadIO.Synchronize(Method: TThreadMethod);
begin
  inherited Synchronize(Method);
end;

constructor TCommThread.Create(AOwner:TnrCustomComm);
begin
  FreeOnTerminate := True;
  Com := AOwner;
  hDevice := Com.Handle;
  inherited Create(False);
end;

procedure TCommThread.Execute;
var r,msk:dword;
begin
  ovl.hEvent := CreateEvent(Nil,False,False,Nil);
  if hDevice <> INVALID_HANDLE_VALUE then begin
    repeat
      ZeroMemory(@ovl, SizeOf(TOverlapped) - SizeOf(THandle));
      msk := 0;
      if WaitCommEvent(hDevice, msk, @ovl)
      then begin
        //Msk:=Msk or Mask;
      end else begin
        r := GetLastError();
        if {(r = 0) or }(r = ERROR_IO_PENDING) then begin
          r := WaitForSingleObject(ovl.hEvent,INFINITE);
          if Terminated then begin
            break;
          end;
          if (r = WAIT_OBJECT_0) //and GetOverlappedResult(hDevice,ovl,rs,False)
            then begin
              //Msk:=Mask;
            end
            else begin
              Msk := 0;
            end;
        end else begin
          if (Msk = 0)and(r = ERROR_INVALID_PARAMETER) then begin
          end else begin
            if r <> ERROR_INVALID_HANDLE then begin
              Com.ForceHalt(False);
            end;
            break;
          end;
        end;
      end;
      if Msk<>0 then
        while (not Terminated) and Com.IsHandleValid and
              (not PostThreadMessage(Com.MsgThread.ThreadID,msgComEvent,Msk,0))
          do begin
            Sleep(1);

          end;

    until (Terminated) or (not Com.Active);
  end;

  CloseHandle(ovl.hEvent);
  ovl.hEvent := 0;

end;

procedure TCommThread.Terminate;
begin
  inherited Terminate;
  if ovl.hEvent <> 0 then PulseEvent(ovl.hEvent);
end;

constructor TMsgThread.Create(AOwner: TnrCustomComm);
begin
  FreeOnTerminate := True;
  Com := AOwner;
  inherited Create(False);
end;

procedure TMsgThread.Execute;
begin
  if Com = nil then exit;

  while (not Terminated) and GetMessage(glMsg, 0, $C000, $FFFF) and Com.Active do begin
    if Terminated or (glMsg.message = msgQComEvent)
      then break;
    if (glMsg.hwnd = 0) and (glMsg.message = msgComEvent)
      then begin
        //Synchronize(ProcessMess); this line freezes DLL code :-(
        {$IFDEF NR_WITH_CONTROLS}
        if (Application <> nil) and Com.UseMainThread
          then Synchronize(ProcessMess) ///ProcessMess //!!!!Synchronize(ProcessMess)
          else
        {$ENDIF}
        Com.WinProc(glMsg);  //
        {}
        //Sleep(0);
      end
      else DispatchMessage(glMsg);
  end;

//  OutputDebugString('TMsgThread.Execute exit');

end;

procedure TMsgThread.ProcessMess;
begin
  if Terminated then exit;
  Com.WinProc(glMsg);
end;

procedure TMsgThread.Terminate;
begin
  inherited Terminate;
  PostThreadMessage(ThreadID,msgQComEvent,0,0);
end;

{ TnrCustomComm }

constructor TnrCustomComm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  GetMem(Stat,SizeOf(TComStat));
//  GetMem(fCommTimeouts,SizeOf(TCommTimeouts));
//  ZeroMemory(fCommTimeouts,SizeOf(TCommTimeouts));
//  fCommTimeouts^.WriteTotalTimeoutMultiplier:=100;

  UseMainThread := True;
  fTraceStates := [];
  CommCfg.dwSize:=SizeOf(TCommConfig);
  CommCfg.dcb.DCBlength:=SizeOf(TDCB);



  BufferInSize := 8192;
  BufferOutSize := 8192;

end;

destructor TnrCustomComm.Destroy;
begin

  OnTraceState := nil;
  Close;
  FreeMem(Stat);
//  FreeMem(fCommTimeouts);
  inherited Destroy;
end;

procedure TnrCustomComm.WinProc(var Message: TMsg);
label go_next;
var i:dword;
    ts:TTraceStates;
    Igt:TIgnoreTypes;
    flIgnoreCascade,flReadNeeded:boolean;
begin
  try

  if Message.Message = msgComEvent then begin
    ts := [];
    ClearCommError(Handle,i,Stat);
    if i <> 0 then begin //error ...
      DoCommError(i, 0, Stat.Flags);
      exit;
    end;
    //------------------------------------------------
    if ((Message.wParam and EV_RXCHAR) <> 0) and (Stat^.cbInQue > 0) then
      begin
        flReadNeeded := (tsRxChar in fTraceStates) or IsReadNeeded;
        fTotalReceived := fTotalReceived + Stat^.cbInQue;

        if flReadNeeded then
          repeat
            if ReadSync(Handle, glBuffer, Stat^.cbInQue, fOvlRead) then begin
              Igt:=[];
              if Stat^.cbInQue > 0 then begin
                DoInputData(glBuffer, Stat^.cbInQue);
                ClearCommError(Handle, i, Stat);
              end;
            end else break;
        until Stat^.cbInQue <= 0;
      end; //  EV_RXCHAR:;

      //------------------------------------------------
      if ((Message.wParam and EV_TXEMPTY) <> 0) then begin
      //EV_TXEMPTY:begin


        flIgnoreCascade := DoOutputData;

        if (tsTxEmpty in fTraceStates)and
           (not flIgnoreCascade)and
           Assigned(fOnSent)
          then fOnSent(Self);{ Transmitt Queue Empty }
      end;
      //------------------------------------------------
      if ((Message.wParam and EV_RXFLAG)<>0)
        then ts:=ts+[tsRxFlag];
      //------------------------------------------------
      if ((Message.wParam and EV_CTS)<>0)
        then ts:=ts+[tsCTS];
      //------------------------------------------------
      if ((Message.wParam and EV_DSR)<>0)
        then ts:=ts+[tsDSR];
      //------------------------------------------------
      if ((Message.wParam and EV_RLSD)<>0)
        then ts:=ts+[tsRLSD];
      //------------------------------------------------
      if ((Message.wParam and EV_RING)<>0)
        then ts:=ts+[tsRING];
      //------------------------------------------------
      if ((Message.wParam and EV_BREAK)<>0)
        then ts:=ts+[tsBreak];
      //------------------------------------------------
      if ((Message.wParam and EV_ERR)<>0)
        then ts:=ts+[tsErr];
      //------------------------------------------------
      if ((Message.wParam and EV_RX80FULL)<>0)
        then ts:=ts+[tsRx80Full];
      //------------------------------------------------
      if ((Message.wParam and EV_EVENT1)<>0)
        then ts:=ts+[tsEvent1];
      //------------------------------------------------
      if ((Message.wParam and EV_EVENT2)<>0)
        then ts:=ts+[tsEvent2];
      //================================================
      if (ts<>[])then DoTraceStates(Self,ts);
  end;

  except
    on E:Exception do begin
      DoFatalErrors(ECC_NRCOMM,GetLastError(),E.Message,True);
    end;
  end;

end;

procedure TnrCustomComm.ForceHalt(aClear:boolean);
begin
  if Handle <> INVALID_HANDLE_VALUE {Active and not(csDesigning in ComponentState) }then begin
//    SetCommMask(Handle,0);
    ThreadStop;
    if aClear and (NotYetSend > 0) then ClearDeviceBuffers;
    FreeBuffer;
    inherited Close;
    DoNotify(csClosed);
  end
end;

procedure TnrCustomComm.Close;
begin
  if Handle<>INVALID_HANDLE_VALUE {Active and not(csDesigning in ComponentState) }then begin
    try
      ForceHalt(True);
    except
      inherited Close;
    end;
  end;
  DoTraceStates(Self,[tsTxEmpty]);
end;

procedure TnrCustomComm.Open;
begin
  Close;
  fTotalReceived := 0;
  fTotalSent := 0;
  inherited Open;
  if Handle = INVALID_HANDLE_VALUE then begin
    LastErrorString:=Format('Device "%s" Open Error !!!'#13'%s',[ComName,GetLastSysErrorString]);
    DoFatalErrors(ECC_NRCOMM,0,LastErrorString,False);
  end else begin
    InitBuffer;

    InitAfterOpen;
    SetTraceState(fTraceStates);
    ThreadStart;
//    DoTraceStates(Self,[tsTxEmpty]);
    DoNotify(csOpened);
  end;
end;

procedure TnrCustomComm.ThreadStart;
begin
  if MsgThread = nil
    then  MsgThread := TMsgThread.Create(Self);
  if CommThread = nil
    then CommThread := TCommThread.Create(Self);
  sleep(25);
end;

procedure TnrCustomComm.ThreadStop;
begin
  if CommThread <> nil
    then CommThread.Terminate; //FreeAndNil(CommThread);

  if MsgThread <> nil then begin
    MsgThread.Terminate;
  end;
  sleep(25);
  CommThread := nil;
  MsgThread := Nil;
end;


{$IFDEF NR_WITH_CONTROLS}

procedure TnrCustomComm.SetMonitorCTS(const Value: TControl);
begin
  fMonitorCTS := Value;
  if Value<>nil then Value.FreeNotification(self);
end;

procedure TnrCustomComm.SetMonitorDSR(const Value: TControl);
begin
  fMonitorDSR := Value;
  if Value<>nil then Value.FreeNotification(self);
end;

procedure TnrCustomComm.SetMonitorRing(const Value: TControl);
begin
  fMonitorRing := Value;
  if Value<>nil then Value.FreeNotification(self);
end;

procedure TnrCustomComm.SetMonitorRLSD(const Value: TControl);
begin
  fMonitorRLSD := Value;
  if Value<>nil then Value.FreeNotification(self);
end;

procedure TnrCustomComm.DoCheckMonitor(Ctrl: TControl; const fl: boolean);
var p:pointer;
begin
  p:=GetPropInfo(Ctrl.ClassInfo,'Checked');
  if p<>nil then SetOrdProp(Ctrl,p,Integer(fl));
end;

function TnrCustomComm.GetMonitorCTS: TControl;
begin
  Result:=fMonitorCTS;
end;

function TnrCustomComm.GetMonitorDSR: TControl;
begin
  Result:=fMonitorDSR;
end;

function TnrCustomComm.GetMonitorRing: TControl;
begin
  Result:=fMonitorRing;
end;

function TnrCustomComm.GetMonitorRLSD: TControl;
begin
  Result:=fMonitorRLSD;
end;

{$ENDIF}

procedure TnrCustomComm.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation=opRemove then begin
    {$IFDEF NR_WITH_CONTROLS}
    if AComponent=fMonitorCTS then fMonitorCTS := nil else
    if AComponent=fMonitorDSR then fMonitorDSR := nil else
    if AComponent=fMonitorRLSD then fMonitorRLSD := nil else
    if AComponent=fMonitorRing then fMonitorRing := nil;
    {$ENDIF}
  end;
end;

Const
  dcbFlagBinary                    = 1;
  dcbFlagOutxCtsFlow               = $00000004;
  dcbFlagDtrControlEnable          = $00000010;
  dcbFlagOutX                      = $00000100;
  dcbFlagInX                       = $00000200;
  dcbFlagRtsControlEnable          = $00001000;
  dcbFlagRtsControlHandshake       = $00002000;
  dcbFlagRtsControlToggle          = $00003000;
  dcbFlagAbortOnError              = $00004000;
  dcbFlagReserved                  = $FFFF8000; // revers! must be zero

  dcbFlagProtocolCommon     = dcbFlagBinary or dcbFlagDtrControlEnable { or dcbFlagAbortOnError} ;
  //0x4011
  dcbFlagProtocolNone       = dcbFlagProtocolCommon or dcbFlagRtsControlEnable;
  //0x4311
  dcbFlagProtocolXOnXOff    = dcbFlagProtocolCommon or dcbFlagOutX or dcbFlagInX or dcbFlagRtsControlEnable;
  //0x6015
  dcbFlagProtocolHardware   = dcbFlagProtocolCommon or dcbFlagRtsControlHandshake or dcbFlagOutxCtsFlow;
  // 0x3011 = 12305
  dcbFlagProtocolRS485      = dcbFlagProtocolCommon or dcbFlagRtsControlToggle;
  // 0x3315 = 13077
  dcbFlagProtocolCLEAR      = not (dcbFlagProtocolHardware or dcbFlagProtocolXOnXOff or dcbFlagReserved or dcbFlagProtocolRS485);

procedure TnrCustomComm.DCBUpdate;
begin
  CommCfg.dwSize := SizeOf(TCommConfig);
  CommCfg.dcb.DCBlength := SizeOf(TDCB);
  if Active then begin
    GetCommConfig(Handle,CommCfg,CommCfg.dwSize);
    GetCommState(Handle,CommCfg.Dcb);
  end;

end;

procedure TnrCustomComm.DCBApply;
begin
  CommCfg.dcb.DCBlength := SizeOf(TDCB);

  CommCfg.dcb.Flags := CommCfg.dcb.Flags and dcbFlagProtocolCLEAR;
  if fRS485Mode
    then CommCfg.dcb.Flags := CommCfg.dcb.Flags or dcbFlagProtocolRS485
    else
  case fProtocol of
    spNone:
      CommCfg.dcb.Flags := CommCfg.dcb.Flags or dcbFlagProtocolNone;
    spHardware:
      CommCfg.dcb.Flags := CommCfg.dcb.Flags or dcbFlagProtocolHardware;
    spXonXoff:  begin
      CommCfg.dcb.Flags    := CommCfg.dcb.Flags or dcbFlagProtocolXOnXOff;
    end;
  end;

  CommCfg.dcb.XonLim   := 80;
  CommCfg.dcb.XoffLim  := 200;
  CommCfg.dcb.XonChar  := #$11;
  CommCfg.dcb.XoffChar := #$13;
//  CommCfg.dcb.Flags := CommCfg.dcb.Flags or $80000000;

  if Active then begin
    //SetCommConfig(Handle,CommCfg,CommCfg.dwSize);
    SetCommState(Handle,CommCfg.Dcb);
  end;

end;

procedure TnrCustomComm.ConfigDialog;
begin
  DCBUpdate;
  if CommConfigDialog(PChar(ComName),GetMainWindowHandle,CommCfg) then begin
    if Active then begin
      SetCommState(Handle, CommCfg.Dcb);
    end;
    DCBUpdate;
  end;  
end;

procedure TnrCustomComm.SetBaudRate(const Value:Cardinal);
begin
  CommCfg.dcb.BaudRate := Value;
  DCBApply;
end;

function TnrCustomComm.GetBaudRate:Cardinal;
begin
//  DCBUpdate;
  Result := CommCfg.dcb.BaudRate;
end;

procedure TnrCustomComm.SetParity(const Value:TParity);
begin
  CommCfg.dcb.Parity := Integer(Value);
  if Value = pNone
    then CommCfg.dcb.Flags := CommCfg.dcb.Flags and Cardinal(-3)
    else CommCfg.dcb.Flags := CommCfg.dcb.Flags or 2;
  DCBApply;
end;

function TnrCustomComm.GetParity:TParity;
begin
//  DCBUpdate;
  Result := TParity(CommCfg.dcb.Parity);
end;

procedure TnrCustomComm.SetStopBits(const Value:TStopBits);
begin
  CommCfg.DCB.StopBits := Integer(Value);
  DCBApply;
end;

function TnrCustomComm.GetStopBits:TStopBits;
begin
//  DCBUpdate;
  Result := TStopBits(CommCfg.DCB.StopBits);
end;

procedure TnrCustomComm.SetEventChar(const Value: char);
begin
  CommCfg.dcb.EvtChar := AnsiChar(Value);
  DCBApply;
end;

function TnrCustomComm.GetEventChar:char;
begin
//  DCBUpdate;
  Result := Char(CommCfg.dcb.EvtChar);
end;

procedure TnrCustomComm.SetByteSize(const Value:byte);
begin
  if (Value>8) or (Value<4)
      then CommCfg.dcb.ByteSize := 8
      else CommCfg.dcb.ByteSize := Value;
  DCBApply;
end;

function TnrCustomComm.GetByteSize:byte;
begin
//  DCBUpdate;
  Result := CommCfg.dcb.ByteSize;
end;

procedure TnrCustomComm.SetStreamProtocol(const Value: TStreamProtocol);
begin
  fProtocol := Value;
  DCBApply;
end;

function TnrCustomComm.GetStreamProtocol: TStreamProtocol;
begin
  Result := fProtocol;
end;

procedure TnrCustomComm.SetRS485(const Value: boolean);
begin
  fRS485Mode := Value;
  DCBApply;
end;

function TnrCustomComm.GetRS485: boolean;
begin
  Result := fRS485Mode;
end;

{====================}

function TnrCustomComm.GetReadyForRead: cardinal;
var Stat:TComStat;
    Err:dword;
begin
  if ClearCommError(Handle,Err,@Stat)
    then Result:=Stat.cbInQue
     else
     Result:=0
end;

function TnrCustomComm.GetNotYetSend:cardinal;
var Stat:TComStat;
    Err:dword;
begin
  if ClearCommError(Handle,Err,@Stat)
    then Result:=Stat.cbOutQue else Result:=0
end;

procedure TnrCustomComm.DoCommError(CommCode, SysCode:integer; Flags:TComStateFlags);
var fl:boolean;
begin
  if fRS485Mode and fIsNotSupportRS485 then SetStateRTS(False);
  fl := False;

  if Assigned(fOnCommError) then fOnCommError(Self,CommCode,SysCode,Flags,fl);
  if fl then ClearDeviceBuffers;
end;

procedure TnrCustomComm.Read(Buffer: PAnsiChar; Len: cardinal);
begin
  ReadSync(Handle,Buffer,Len, fOvlRead);
end;

procedure TnrCustomComm.ReadAll(Buffer: PAnsiChar);
begin
  Read(Buffer,GetReadyForRead);
end;

function TnrCustomComm.ReadMax(Buffer:PAnsiChar; MaxLen:integer) : integer;
begin
  Result := GetReadyForRead;
  if Result > MaxLen then Result := MaxLen;
  Read(Buffer, Result);
end;

function TnrCustomComm.ReadString:AnsiString;
var n:cardinal;
begin
  n := GetReadyForRead;
  SetLength(Result,n);
  if n>0 then Read(PAnsiChar(@Result[1]),n);
end;

function TnrCustomComm.GetCommProp:PCommProp;
begin
  if Handle<>INVALID_HANDLE_VALUE
    then GetCommProperties(Handle,ComProp);
  Result:=@ComProp;
end;

procedure TnrCustomComm.SendAheadChar(const Ch: Char);
begin
  if Handle<>INVALID_HANDLE_VALUE then begin
    if fRS485Mode and fIsNotSupportRS485 then SetStateRTS(True);
    if TransmitCommChar(Handle,AnsiChar(Ch))
       then Inc(fTotalSent)
       else DoCommError(0,GetLastError(),[]);
  end;
end;

procedure TnrCustomComm.SendChar(const Ch:Char);
begin
  if Handle<>INVALID_HANDLE_VALUE then begin

    if fRS485Mode and fIsNotSupportRS485 then SetStateRTS(True);
    if WriteSync(Handle,@Ch,1,fOvlWrite) then begin
      Inc(fTotalSent);
      //if Assigned(fOnSent) then fOnSent(Self);
    end else DoCommError(0,GetLastError(),[]);
  end;
end;

procedure TnrCustomComm.SendString(const S:AnsiString);
var len:cardinal;
    {$IFDEF UNICODE}
    sAnsi:AnsiString;
    {$ENDIF}
begin
  if Handle <> INVALID_HANDLE_VALUE then begin
    len := Length(S);
    if len <= 0 then exit;

    if fRS485Mode and fIsNotSupportRS485 then SetStateRTS(True);
    {$IFDEF UNICODE}
    sAnsi := AnsiString(S);
    if WriteSync(Handle, @sAnsi[1], len, fOvlWrite) then begin
    {$ELSE}
    if WriteSync(Handle, @S[1], len, fOvlWrite) then begin
    {$ENDIF}
      fTotalSent := fTotalSent + len;
      //if Assigned(fOnSent) then fOnSent(Self);
    end else DoCommError(0,GetLastError(),[]);
  end;
end;

procedure TnrCustomComm.SendData(const Buff:PByte{PAnsiChar};const N:cardinal);
begin
  if Handle<>INVALID_HANDLE_VALUE then begin

  //  if fRS485Mode and fIsNotSupportRS485 then SetStateRTS(True);
    if WriteAsync(Handle,Buff,N,fOvlAsync) then begin
      fTotalSent:=fTotalSent+n;

    end else DoCommError(0,GetLastError(),[]);
  end;
end;

procedure TnrCustomComm.SetTraceState(const v:TTraceStates);
var n:cardinal;
begin
  n := EV_RXCHAR {or EV_TXEMPTY};
  if tsRXFLAG in v then n := n or EV_RXFLAG;
  if (tsTXEMPTY in v) or (fRS485Mode and fIsNotSupportRS485) then n:=n or EV_TXEMPTY;
  if tsCTS in v then n:=n or EV_CTS;
  if tsDSR in v then n:=n or EV_DSR;
  if tsRLSD in v then n:=n or EV_RLSD;
  if tsBreak in v then n:=n or EV_BREAK;
  if tsERR in v then n:=n or EV_ERR;
  if tsRING in v then n:=n or EV_RING;
  if tsRX80FULL in v then n:=n or EV_RX80FULL;
  if tsEVENT1 in v then n:=n or EV_EVENT1;
  if tsEVENT2 in v then n:=n or EV_EVENT2;
  fTraceStates := V;
  if Handle <> INVALID_HANDLE_VALUE then begin
    SetCommMask(Handle,n);
  end;
end;

procedure TnrCustomComm.SetStateDTR(const State:boolean);
var i:integer;
begin
  if State then i:=SETDTR else i:=CLRDTR;
  if Handle <> INVALID_HANDLE_VALUE then begin
    EscapeCommFunction(Handle,i);
    DoTraceStates(Self,[tsDSR]);
  end;
end;

procedure TnrCustomComm.SetStateRTS(const State:boolean);
var i:integer;
begin
  if State then i := SETRTS else i := CLRRTS;
  if Handle <> INVALID_HANDLE_VALUE then begin
    EscapeCommFunction(Handle,i);
    DoTraceStates(Self,[tsCTS]);
  end;
end;

procedure TnrCustomComm.SetStateX(const State:boolean);
var i:integer;
begin
  if State then i := SETXON else i := SETXOFF;
  if Handle <> INVALID_HANDLE_VALUE then EscapeCommFunction(Handle,i);
end;

procedure TnrCustomComm.SetStateBreak(const State:boolean);
var i:integer;
begin
  if State then i:=SETBREAK else i:=CLRBREAK;
  if Handle <> INVALID_HANDLE_VALUE then EscapeCommFunction(Handle,i);
end;

function TnrCustomComm.GetStateModemSignals:TModemSignals;
var n:dword;
begin
  Result:=[];
  if Handle<>INVALID_HANDLE_VALUE then
    if GetCommModemStatus(Handle,n) then begin
      if (n and MS_CTS_ON)<>0 then Result:=[msCTS];
      if (n and MS_DSR_ON)<>0 then Result:=Result+[msDSR];
      if (n and MS_RING_ON)<>0 then Result:=Result+[msRing];
      if (n and MS_RLSD_ON)<>0 then Result:=Result+[msRLSD];
    end;
end;

procedure TnrCustomComm.ClearDeviceInput;
begin
 if Handle <> INVALID_HANDLE_VALUE then begin
   PurgeComm(Handle,PURGE_RXABORT or PURGE_RXCLEAR);
 end;
end;

procedure TnrCustomComm.ClearDeviceOutput;
begin
  if Handle <> INVALID_HANDLE_VALUE then begin
    PurgeComm(Handle,PURGE_TXABORT or PURGE_TXCLEAR);
    if fRS485Mode and fIsNotSupportRS485 then SetStateRTS(False);
  end;
  {$IFDEF LINUX}
  flTxWait:=False;
  {$ENDIF}
end;

procedure TnrCustomComm.ClearDeviceBuffers;
begin
  if Handle <> INVALID_HANDLE_VALUE then begin
    PurgeComm(Handle,PURGE_TXABORT or PURGE_TXCLEAR or PURGE_RXABORT or PURGE_RXCLEAR);
    nrCancelIO(Handle);
    if fRS485Mode and fIsNotSupportRS485 then SetStateRTS(False);
  end;
end;

procedure TnrCustomComm.SetTimeOuts(const Value: PCommTimeouts);
begin
  CopyMemory(@fCommTimeouts, Value, SizeOf(TCommTimeouts));
  if Handle <> INVALID_HANDLE_VALUE
    then SetCommTimeouts(Handle, fCommTimeouts);
end;

{
function TnrCustomComm.GetTimeouts:PCommTimeouts;
begin
  if Handle <> INVALID_HANDLE_VALUE
    then GetCommTimeouts(Handle,fCommTimeouts);
  Result := fCommTimeouts;
end;}

procedure TnrCustomComm.DoTraceStates(Com: TnrCustomComm; Event: TTraceStates);
var ms:TModemSignals;
begin
  ms := ModemSignals;
  {$IFDEF NR_WITH_CONTROLS}
  if Assigned(fMonitorCTS)then DoCheckMonitor(fMonitorCTS,msCTS in ms);
  if Assigned(fMonitorDSR)then DoCheckMonitor(fMonitorDSR,msDSR in ms);
  if Assigned(fMonitorRLSD)then DoCheckMonitor(fMonitorRLSD,msRLSD in ms);
  if (tsRing in Event) and Assigned(fMonitorRing)then DoCheckMonitor(fMonitorRing,True{msRing in ms});
  {$ENDIF}
  //user event ...
  if Assigned(fOnTraceState) then fOnTraceState(Com, Event);
end;

function TnrCustomComm.GetPortName: string;
begin
  Result := 'Unknown';//ComPortToStr(fComPortNo);
end;

function TnrCustomComm.WaitForBytes(Count, Ms: cardinal): boolean;
var v:TTraceStates;
begin
  Result := False;
  if Handle = INVALID_HANDLE_VALUE then exit;

  v := TraceStates;
  SetTraceState(v-[tsRxChar]);
  Ms := Ms + GetTickCount();
  while (ms >= GetTickCount()) and (Handle <> INVALID_HANDLE_VALUE) do begin
    Result := Boolean(GetReadyForRead >= Count);
    if Result then break;
    sleep(5);
    {$IFDEF NR_WITH_CONTROLS}
    if Assigned(Application) then Application.ProcessMessages;
    {$ENDIF}
  end;
  SetTraceState(v);
end;

function TnrCustomComm.WaitForSignal(Signal: TModemSignal; Ms: cardinal): boolean;
begin
  Result := False;
  if Handle = INVALID_HANDLE_VALUE then exit;
  Ms := Ms + GetTickCount();
  repeat
    Result:=Boolean(Signal in  ModemSignals);
    if Result then break;
    sleep(5);
    {$IFDEF NR_WITH_CONTROLS}
    if Assigned(Application) then Application.ProcessMessages;
    {$ENDIF}
  until (ms < GetTickCount()) or (Handle = INVALID_HANDLE_VALUE);
end;

procedure TnrCustomComm.InitAfterOpen;
var err:dword;
begin
  ClearCommError(Handle, err, nil);
  SetupComm(Handle, fBufferInSize, fBufferOutSize);
  SetTimeOuts(@fCommTimeouts);
  DCBApply;
end;

procedure TnrCustomComm.FlushOutputBuffer;
begin
  if Handle <> INVALID_HANDLE_VALUE then FlushFileBuffers(Handle);
end;

function TnrCustomComm.GetBufferInSize: word;
begin
  Result := fBufferInSize;
end;

function TnrCustomComm.GetBufferOutSize: word;
begin
  Result := fBufferOutSize;
end;

procedure TnrCustomComm.SetBufferInSize(const Value: word);
begin
  if Handle <> INVALID_HANDLE_VALUE
    then SetupComm(Handle,Value,BufferOutSize);
  fBufferInSize := Value;
end;

procedure TnrCustomComm.SetBufferOutSize(const Value: word);
begin
  if Handle <> INVALID_HANDLE_VALUE
     then SetupComm(Handle,BufferInSize,Value);
  fBufferOutSize := Value;
end;

procedure TnrCustomComm.InitBuffer;
var sz:cardinal;
begin
  FreeBuffer;
  sz := GetBufferInSize;
  if sz < CI_MIN_BUFFER_SIZE then sz := CI_MIN_BUFFER_SIZE;
  glBuffer := Pointer(LocalAlloc(LPTR, sz ));
end;

procedure TnrCustomComm.FreeBuffer;
begin
  try
    if glBuffer <> nil then begin
      LocalFree(DWord(glBuffer));
      glBuffer := nil;
    end;
  except
    glBuffer := nil;
  end;
end;

procedure TnrCustomComm.SetTimeoutRead(const Value: cardinal);
begin
  //fCommTimeOuts^.ReadTotalTimeoutMultiplier := Value;
  fCommTimeOuts.ReadIntervalTimeout := Value;
  SetTimeOuts(@fCommTimeOuts);
end;

procedure TnrCustomComm.SetTimeoutWrite(const Value: cardinal);
begin
//  fCommTimeOuts^.WriteTotalTimeoutMultiplier := Value;
  fCommTimeOuts.WriteTotalTimeoutConstant := Value;
  SetTimeOuts(@fCommTimeOuts);
end;

function TnrCustomComm.GetTimeoutRead: cardinal;
begin
  //Result := Timeouts^.ReadTotalTimeoutMultiplier;
  Result := fCommTimeOuts.ReadIntervalTimeout;
end;

function TnrCustomComm.GetTimeoutWrite: cardinal;
begin
//  Result := Timeouts^.WriteTotalTimeoutMultiplier;
  Result := fCommTimeOuts.WriteTotalTimeoutConstant
end;

function TnrCustomComm.GetOnCommError: TOnCommErrorEvent;
begin
  Result := fOnCommError;
end;

function TnrCustomComm.GetOnSent: TOnSent;
begin
  Result := fOnSent;
end;

function TnrCustomComm.GetOnTraceState: TOnTraceEvent;
begin
  Result := fOnTraceState;
end;

function TnrCustomComm.GetTotalReceived: cardinal;
begin
  Result := fTotalReceived;
end;

function TnrCustomComm.GetTotalSent: cardinal;
begin
  Result := fTotalSent;
end;

function TnrCustomComm.GetTraceStates: TTraceStates;
begin
  Result := fTraceStates;
end;

procedure TnrCustomComm.SetOnSent(Value:TOnSent);
begin
  fOnSent := Value;
end;

procedure TnrCustomComm.SetOnTraceState(Value:TOnTraceEvent);
begin
  fOnTraceState := Value;
end;

procedure TnrCustomComm.SetOnCommError(Value:TOnCommErrorEvent);
begin
  fOnCommError := Value;
end;

{ TnrComm }

constructor TnrCustomSerialComm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  sLogPrefix := 'nrComm: ';
  GetDefaultCommConfig('COM1',CommCfg,CommCfg.dwSize);
  ComPort := cpCOM1;
  BaudRate :=19200;
  ByteSize := 8;
  Parity := pNone;
  StopBits := sbOne;
  StreamProtocol := spHardware;
  EventChar := #0;

end;

destructor TnrCustomSerialComm.Destroy;
begin
  inherited ;
end;

function TnrCustomSerialComm.RequestDeviceHandle: THandle;
begin
  if fExtHandle <> 0
    then Result := fExtHandle
    else begin
      if DeviceIndex >= 0
        then Result := OpenPort(Device[DeviceIndex].PortName) //OpenPort(ComPortNo);
        else Result := OpenPort(Format('COM%u', [ComPortNo]));
    end;
  fExtHandle := 0;
end;

function TnrCustomSerialComm.GetComPort: TComPort;
begin
  if fComPortNo < (Word(cpCOMxx) + 1)
     then Result := TComPort(fComPortNo - 1)
     else Result := cpCOMxx;
end;

procedure TnrCustomSerialComm.SetComPort(const v:TComPort);
begin
  if v<>cpCOMxx then SetComPortNo(Word(v)+1);
end;

procedure TnrCustomSerialComm.SetComPortNo(const Value: word);
var flSave:boolean;
begin
  flSave := Active;
  Active := False;
  fComPortNo := Value;
  Active := flSave;
  DoNotify(csDeviceIdChanged);
end;

procedure TnrCustomSerialComm.InitDeviceConnect;
begin
  if Handle = INVALID_HANDLE_VALUE then exit;
  ClearDeviceBuffers;
  SetStateDTR(True);
  SetStateRTS(False);
  if not WaitForSignal(msDSR,200)
     then begin
       DoFatalErrors(ECC_NRCOMM,0,errInitConnect,False);
       exit;
     end;
  SetStateRTS(True);

end;

function TnrCustomSerialComm.GetPNPDeviceString: string;
label exit_proc;
var DCB0,DCB1:TDCB;
    v:TTraceStates;
    ch,chEnd:char;
    flSave:boolean;
begin
  Result:='';
  flSave:=Active;
  SetActive(True);
  if not Active then exit;
  //Check connection (like InitDeviceConnect) ...
  ClearDeviceBuffers;
  SetStateDTR(True);
  SetStateRTS(False);
  if not WaitForSignal(msDSR,200)
     then begin
       DoFatalErrors(ECC_NRCOMM,0,errInitConnect,False);
       exit;
     end;

  //save original DCB ...
  DCBApply;
  CopyMemory(@DCB0,@CommCfg.DCB,SizeOf(TDCB));
  CopyMemory(@DCB1,@DCB0,SizeOf(TDCB));

  //new options for PNP action
  v:=TraceStates;
  DCB1.BaudRate:=CBR_1200;
  DCB1.Parity:=0;
  DCB1.ByteSize:=7;
  DCB1.StopBits:=ONESTOPBIT;

  //SetDCB(@DCB1);
  SetCommState(Handle,DCB1);

  SetTraceState([]);
  SetStateDTR(False);
  SetStateRTS(False);
  Sleep(200);
  SetStateDTR(True);
  Sleep(200);
  SetStateRTS(True);
  if not WaitForBytes(1,200) then begin
    SetStateDTR(False);
    SetStateRTS(False);
    Sleep(200);
    SetStateDTR(True);
    SetStateRTS(True);
    if not WaitForBytes(1,200) then goto exit_proc;
  end;
  Read(@ch,1);
  case ch of
    #$28:chEnd:=#$29;
    #$08:chEnd:=#$09;
    else goto exit_proc;
  end;
  Result:=Result+ch;
  repeat
    if not WaitForBytes(1,200) then break;
    Read(@ch,1);
    Result:=Result+ch;
  until ch=chEnd;

exit_proc:
  SetCommState(Handle,DCB0);
  SetTraceState(v);
  SetActive(False);
  SetActive(flSave);
end;

function TnrCustomSerialComm.GetPortName: string;
begin
  if DeviceIndex >= 0
    then Result := Device[DeviceIndex].PortName //OpenPort(ComPortNo);
    else Result := Format('COM%u', [ComPortNo]);
end;

procedure TnrCustomSerialComm.LoadConfig(const Root: HKEY; const Key, Name: string);
var r:TRegistry;
    p:PChar;
begin
  p:=nil;
  try
    r:=TRegistry.Create;
    r.RootKey:=Root;
    r.OpenKey(Key,True);
    if r.ValueExists(Name) then
      if r.GetDataSize(Name)=SizeOf(TDCB)+SizeOf(TCommTimeouts)+1 then begin
      GetMem(p,SizeOf(TDCB)+SizeOf(TCommTimeouts)+1);
      r.ReadBinaryData(Name,p^,SizeOf(TDCB)+SizeOf(TCommTimeouts)+1);
      ComPortNo:=Byte(p[0]);
      CopyMemory(@CommCfg.DCB,@p[1], SizeOf(TDCB));
      DCBApply;
      SetTimeOuts(@p[SizeOf(TDCB)+1]);
    end;
    r.Free;

  except
    DoFatalErrors(ECC_NRCOMM,0,errRsLoadConfig,False);
  end;
  if p<>nil then FreeMem(p);
end;

procedure TnrCustomSerialComm.SaveConfig(const Root: HKEY; const Key, Name: string);
var r:TRegistry;
    p:PChar;
begin
  p:=nil;
  try
    r:=TRegistry.Create;
    r.RootKey:=Root;
    r.OpenKey(Key,True);
    GetMem(p,SizeOf(TDCB)+SizeOf(TCommTimeouts)+1);
    p[0]:=Char(Byte(ComPortNo));
    CopyMemory(@p[1],@CommCfg.DCB,SizeOf(TDCB));
    //CopyMemory(@p[SizeOf(TDCB)+1],GetTimeouts,SizeOf(TCommTimeouts));
    CopyMemory(@p[SizeOf(TDCB)+1], @fCommTimeouts,SizeOf(TCommTimeouts));

    r.WriteBinaryData(Name,p^,SizeOf(TDCB)+SizeOf(TCommTimeouts)+1);
    r.Free;

  except
    DoFatalErrors(ECC_NRCOMM,0,errRsSaveConfig,False);
  end;
  if p<>nil then FreeMem(p);
end;

procedure TnrCustomSerialComm.Update;
begin
  DeviceListClear;
  GetDeviceList(nil);
  inherited Update;
end;

procedure TnrCustomSerialComm.DeviceListLoad;
var slPorts, slDevices:TStringList;
    i,j : integer;
    Dev,d2:TnrDevice;
    fEnumPresent:boolean;
    s:string;
    dataPort:dword;
begin
  slPorts := TStringList.Create;
  slDevices := TStringList.Create;

  fEnumPresent := EnumPorts = epFullPresent;

  if EnumPorts <> epQuickAll  then begin

    // get all possible serial port interfaces ...

  end;

  // get ALL possible serial ports ...
  GetPortList(slPorts,True);

  for i := 0 to slPorts.Count-1 do begin
    Dev := TnrDevice.Create;
    Dev.NameFriendly := Trim(slPorts.Names[i]);
    Dev.NameDeviceDos := Dev.NameFriendly;
    Dev.NamePDO := slPorts.Values[Dev.NameFriendly];
    Dev.Data := Integer(slPorts.Objects[i]);
    Dev.PortName := Dev.NameDeviceDos;

    if (EnumPorts <> epQuickAll) then begin

      for j := 0 to slDevices.Count - 1 do begin
        d2 := TnrDevice(slDevices.Objects[j]);
        if {$IFDEF UNICODE}
           (WideCompareText(d2.PortName, Dev.NameDeviceDos) = 0)
           {$ELSE}
           (AnsiCompareText(d2.PortName, Dev.NameDeviceDos) = 0)
           {$ENDIF}
           or (Pos('(' + Dev.NameDeviceDos + ')', d2.Description) > 0)
        then begin
          Dev.Service := d2.Service;
          Dev.Description := d2.Description;
          if Dev.Description <> ''
            then Dev.NameFriendly := Dev.NameFriendly + ' (' + d2.Description + ')';
          Dev.Driver := d2.Driver;
          Dev.Manufacturer := d2.Manufacturer;
          Dev.PortName := Trim(d2.PortName);
          Dev.RegKey := d2.RegKey;
          slDevices.Delete(j);
          FreeAndNil(d2);
          break;
        end;
      end;

      if fEnumPresent and (d2 <> nil)  then FreeAndNil(Dev);

    end;

    if Dev <> nil then AddDeviceSorted(Dev);

  end;

  dataPort := $1000;

  if (EnumPorts <> epQuickAll) then
    for j := 0 to slDevices.Count - 1 do begin
      d2 := TnrDevice(slDevices.Objects[j]);
      if (Length(d2.PortName) > 0) and (Pos('LPT', d2.PortName) <> 1) then begin
        Dev := TnrDevice.Create;
        s := String(PChar(d2.PortName));
        Dev.NameFriendly := s;

        Dev.NameDeviceDos := Dev.NameFriendly;
        Dev.NamePDO := slPorts.Values[Dev.NameFriendly];

        if Pos('COM', d2.PortName) = 1 then
          Dev.Data := StrToIntDef(Copy(d2.PortName,4, Length(d2.PortName)),0)
        else begin
          Inc(dataPort);
          Dev.Data := dataPort;
        end;

        Dev.Service := d2.Service;
        Dev.Description := d2.Description;

        if Dev.Description <> ''
          then Dev.NameFriendly := String(Dev.NameFriendly) + ' (' + d2.Description + ')';
        Dev.Driver := d2.Driver;
        Dev.Manufacturer := d2.Manufacturer;
        Dev.PortName := Trim(d2.PortName);
        Dev.RegKey := d2.RegKey;
        AddDeviceSorted(Dev);
      end;
    end;

  if (EnumPorts <> epQuickAll) then  // clear memory ...
    for j := 0 to slDevices.Count - 1
      do TnrDevice(slDevices.Objects[j]).Free;

  slDevices.Free;
  slPorts.Free;

end;

procedure TnrCustomSerialComm.SetDeviceIndex(const Value:integer);
begin
  if (Value < 0) or (Value >= DeviceCount) then exit;
  SetComPortNo(Device[Value].Data);
end;

function TnrCustomSerialComm.GetDeviceIndex: integer;
begin
  Result := IndexOfDeviceData(ComPortNo);
end;

function TnrCustomSerialComm.GetComPortNo: word;
begin
  Result:=fComPortNo;
end;

procedure TnrCustomSerialComm.SetExtHandle(aHandle:THandle);
begin
  if (aHandle = 0) or (aHandle = INVALID_HANDLE_VALUE) then exit;
  if Active
    then Close;
  fExtHandle := aHandle;
  Open;
end;

{ TnrNotifyList }

function TnrNotifyList.Add(Item: TnrNotifyEvent): Integer;
var e:^TnrNotifyEvent;
begin
  New(e);
  e^ := item;
  Result := inherited Add(e);
end;

procedure TnrNotifyList.Delete(index: integer);
begin
  Dispose(inherited Items[Index]);
  inherited Delete(Index);
end;

procedure TnrNotifyList.Clear;
var i:integer;
begin
  for i := 0 to Count - 1 do Delete(0);
  inherited Clear;
end;

function TnrNotifyList.Get(Index: Integer): TnrNotifyEvent;
begin
  Result:=TnrNotifyEvent((inherited Get(Index))^);
end;

procedure TnrNotifyList.Put(Index: Integer; Item: TnrNotifyEvent);
var e:^TnrNotifyEvent;
begin
  e:=inherited Get(Index);
  e^:=Item;
end;

function TnrNotifyList.IndexOf(Item: TnrNotifyEvent): Integer;
var i:integer;
    j : TnrNotifyEvent;
begin
  Result := -1;
  for i := 0 to Count - 1 do begin
    j := Get(i);
    if(@j = @Item) then begin
      Result := i; //OK event handler was found!
      break;
    end;
  end;
end;


procedure TnrNotifyList.Call(Sender:TObject;Code:integer);
var i:integer;
    {$IFDEF GEN3}
    e:^TnrNotifyEvent;
    {$ENDIF}
begin
  for i:=0 to Count-1 do begin
    {$IFDEF GEN3}//This code is compatible for Delphi3 and C++Builder3 ...
    e:=inherited Items[i];
    e^(Sender,Code);
    {$ELSE}  //This code is compatible for Delphi4 and above ...
    TnrNotifyEvent(Items[i])(Sender,Code);
    {$ENDIF}
  end;
end;

 {TnrBaseIO }


procedure TnrBaseIO.DoFatalErrors(Code,Detail: cardinal;
  Msg: string; flByThread:boolean);
var fRaise:boolean;
begin
  fRaise := True;
  if Assigned(fOnFatalError) then fOnFatalError(Self,Code,Detail,Msg,fRaise);

  if fRaise and (not (csLoading in ComponentState))
    then begin
      if flByThread
        then ShowException(Exception.Create(Msg), ErrorAddr)
        else raise Exception.Create(Msg);
    end;
end;


procedure TnrBaseIO.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation=opRemove then begin

  end;
end;

constructor TnrBaseIO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Priority := tpNormal;
  sLogPrefix := ClassName;
  flClearDeviceListWithFree := True;
  slDevices := TStringList.Create;
  nrNotifyList := TnrNotifyList.Create;
  hPort := INVALID_HANDLE_VALUE;
  fOvlRead.hEvent := CreateEvent(nil,False,False,nil);
  fOvlWrite.hEvent := CreateEvent(nil,False,False,nil);
end;

destructor TnrBaseIO.Destroy;
begin
  CloseHandle(fOvlWrite.hEvent);
  CloseHandle(fOvlRead.hEvent);
  DeviceListClear;
  nrNotifyList.Free;
  slDevices.Free;
  inherited Destroy;
end;

procedure TnrBaseIO.NotifyAdd(NotifyEvent: TnrNotifyEvent);
begin
  if nrNotifyList.IndexOf(NotifyEvent) < 0
    then nrNotifyList.Add(NotifyEvent)
end;

procedure TnrBaseIO.NotifyDelete(NotifyEvent: TnrNotifyEvent);
var i:integer;
begin
  i:=nrNotifyList.IndexOf(NotifyEvent);
  if i>=0 then nrNotifyList.Delete(i);
end;

procedure TnrBaseIO.DoNotify(CodeState:integer);
begin
  nrNotifyList.Call(Self,CodeState);
end;

function TnrBaseIO.GetActive: boolean;
begin
  //For design time ...
  if(csDesigning in ComponentState)or
    (csLoading in ComponentState)
    then Result:=fActive
    else Result:=IsHandleValid;//Boolean(hPort<>INVALID_HANDLE_VALUE);
end;

function TnrBaseIO.IsHandleValid: boolean;
begin
  Result := hPort <> INVALID_HANDLE_VALUE;
end;

procedure TnrBaseIO.SetActive(const Value: boolean);
begin
  if(csLoading in ComponentState)then begin //for Load Time
    fActive:=Value;
    exit;
  end;
  if (Value=Active)and not (csDesigning in ComponentState) then exit;
  if Value then Open
           else Close;
  //For design time ...
  if csDesigning in ComponentState then begin
    fActive:=IsHandleValid;//Boolean(hPort<>INVALID_HANDLE_VALUE);
    if fActive then Close;
  end;
end;

procedure TnrBaseIO.ThreadStart;
begin
  IsThreadIOTerminated := False;
  fThreadIO := TnrThreadIO.Create(Self, Priority);
end;

procedure TnrBaseIO.ThreadStop;
begin
  if not IsThreadIOTerminated then begin
    IsThreadIOTerminated := True;
    fThreadIO.Terminate;
    fThreadIO.WaitFor;
  end;
end;

procedure TnrBaseIO.ThreadExecute(aThread: TThread);
begin
// virtual ...
end;

function TnrBaseIO.RequestDeviceHandle: THandle;
begin
  Result := INVALID_HANDLE_VALUE;
end;

procedure TnrBaseIO.RequestDeviceHandleClose(aHandle: THandle);
begin
  CloseHandle(aHandle);
end;

procedure TnrBaseIO.Open;
begin
  hPort := RequestDeviceHandle;
  if IsHandleValid then begin

    if isThreaded then ThreadStart;

    if Assigned(fOnOpen) then
      try
        fOnOpen(Self);
      except
      end;

  end;
end;

procedure TnrBaseIO.Close;
begin
  if (hPort <> INVALID_HANDLE_VALUE) then begin

    RequestDeviceHandleClose(hPort);

    if isThreaded then ThreadStop;

    hPort := INVALID_HANDLE_VALUE;

    if Assigned(fOnClose) then
      try
        fOnClose(Self);
      except
      end;

  end;
//  hPort := INVALID_HANDLE_VALUE;
end;


procedure TnrBaseIO.Update;
begin
//  Devices.Clear;
  DoNotify(csDeviceIdChanged);
end;


function TnrBaseIO.GetOnFatalError: TOnFatalErrorEvent;
begin
  Result := fOnFatalError;
end;

procedure TnrBaseIO.SetOnFatalError(const Value: TOnFatalErrorEvent);
begin
  fOnFatalError := Value;
end;

function TnrBaseIO.AddDevice(aDevice: TnrDevice): integer;
begin
  Result := slDevices.AddObject(aDevice.NameFriendly,aDevice);
  aDevice.fIndex := Result;
  aDevice.fParent := Self;
end;

function TnrBaseIO.AddDeviceSorted(aDevice: TnrDevice): integer;
var j, cnt:integer;
begin
  // adds device into list in ordering of Data value ...
  cnt := DeviceCount;
  Result := -1;
//  if l.IndexOf(S) >= 0 then exit;
  if (cnt = 0) or (Device[cnt - 1].Data < aDevice.Data)
    then Result := AddDevice(aDevice)
    else begin
      j := 0;
      while j < cnt do begin
        if Device[j].Data = aDevice.Data then exit; // skip duplicates
        if Device[j].Data > aDevice.Data then begin
          slDevices.InsertObject(j, aDevice.NameFriendly, aDevice);
          aDevice.fIndex := j;
          aDevice.fParent := Self;
          Result := j;
          Inc(j);
          while j < cnt do begin
            Device[j].fIndex := Device[j].fIndex + 1;
            inc(j);
          end;
          break;
        end;
        Inc(j);
      end;
    end;
end;

function TnrBaseIO.GetDevice(Index: integer): TnrDevice;
begin
  if (Index < 0) or (Index >= slDevices.Count)
    then Result := nil
    else Result := TnrDevice(slDevices.Objects[Index]);
end;

function TnrBaseIO.GetDeviceCount: integer;
begin
  Result :=  slDevices.Count;
end;

procedure TnrBaseIO.DoInputDataInMainThread;
begin
  DoInputData(threadData, threadDataSize);
end;

function TnrBaseIO.IndexOfDeviceData(aData: integer): integer;
var i : integer;
begin
  Result := -1;
  for i := 0 to DeviceCount - 1 do
    if Device[i].Data = aData then begin
      Result := i;
      break;
    end;
end;

function TnrBaseIO.IndexOfDevice(aDevice: TnrDevice): integer;
begin
  Result := slDevices.IndexOfObject(aDevice);
end;

procedure TnrBaseIO.DeviceListClear;
var i:integer;
begin
  if flClearDeviceListWithFree then
    for i := 0 to slDevices.Count-1 do
      if slDevices.Objects[i] <> nil
        then TnrDevice(slDevices.Objects[i]).Free;
  slDevices.Clear;
end;

procedure TnrBaseIO.GetDeviceList(L: TStrings);
var i:integer;
begin
  if DeviceCount = 0
    then DeviceListLoad;

  if L<>nil then begin
    L.Clear;
    for i:=0 to slDevices.Count-1
      do L.AddObject(slDevices.Strings[i],slDevices.Objects[i]);
  end;
end;


procedure TnrBaseIO.SetDeviceIndex(const Value: integer);
begin
  DoNotify(csDeviceIdChanged);
end;
function TnrBaseIO.IsReadNeeded: boolean;
begin
  Result :=  Assigned(fOnReceived) ;
end;

function TnrBaseIO.DoInputData(Data: PAnsiChar; Len: cardinal): boolean;
var r:TIgnoreTypes;
begin

  r := [];
  Result := false;

  if (fThreadIO <> nil) and (UseMainThread) and (GetCurrentThreadId = fThreadIO.ThreadID) then begin
    threadData := Data;
    threadDataSize := Len;
    TnrThreadIO(fThreadIO).Synchronize(DoInputDataInMainThread);
    exit;
  end;

//  Result := false;





  if Assigned(fOnReceived)
    then fOnReceived(Self, Data, Len);

end;

procedure TnrBaseIO.Loaded;
begin
  inherited Loaded;

  try
    {$IFDEF NR_WITH_CONTROLS}
    SetTerminal(fTerminal);
    SetTerminalUsage(fTerminalUsage);
    {$ENDIF}
    SetActive(fActive);
  except
    MessageBox(GetMainWindowHandle,'error','Error',MB_ICONERROR);
  end;

end;

function TnrBaseIO.WMDeviceChange(var Msg: TMessage):boolean;
begin
  Result := False;
  if (Msg.Msg = WM_DEVICECHANGE) and
     ((Msg.WParam = DBT_DEVICEREMOVECOMPLETE) or
     (Msg.WParam = DBT_DEVICEARRIVAL) or
     (Msg.WParam = DBT_DEVNODES_CHANGED)
     ) then begin
    if (Msg.WParam = DBT_DEVNODES_CHANGED) or (PDWORD(Msg.lParam + 4)^ = DBT_DEVTYP_PORT)
    then begin
      Update;// nr Reload;// nrCom.Update;
      Result := True;
    end;
  end;
end;

function TnrBaseIO.DoOutputData: boolean;
begin
  Result := False;
  
end;


initialization
  msgComEvent := RegisterWindowMessage('nrCommMsgComEvent');
  msgQComEvent := RegisterWindowMessage('nrCommMsgQuitComEvent');

finalization

{$IFDEF TRIAL}
  cnt_alrt;
{$ENDIF}

end.

