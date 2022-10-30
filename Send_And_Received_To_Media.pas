{*******************************************************}
{                                                       }
{       last update: 24 Mordad 1395                     }
{                                                       }
{       Behpardakht Mellat                              }
{                                                       }
{*******************************************************}

unit Send_And_Received_To_Media;

interface

uses nrcomm, SysUtils, Dateutils,UTools;
Type
  TMediaType = (mt_Serial,mt_TCP,mt_USB);
  TPOSParity = (pNone, pOdd, pEven, pMark, pSpace);
  TPOSStopBits = (sbOne, sbOneAndHalf, sbTwo);

  TPOS_Media = Class
     PC_ComPort: TnrComm;
     BaudRate : Cardinal;
     Parity   : TParity;
     StopBits : TStopBits;


  public
    { Public declarations }

     constructor Create();
     Procedure Config_Serial_Port(Media_Type : TMediaType;BaudRate : Cardinal;Parity : Byte;StopBits : Byte;fComPortNo : Byte);
     Function Send_Message_Then_Read_Data(Send_Message : TByteArr;Var Rec_Message : TByteArr; ResponseTime : Integer;Var Result_Message : String) : String;
     Function Send_Message_Ready(Var Result_Message : String) : Boolean;

  Published

End;

implementation

uses Prepare_Message, Prepare_Received_Message, nrwin32;

   Constructor TPOS_Media.Create();
   Begin
      PC_ComPort := TnrComm.Create(PC_ComPort);
   End;

   Function TPOS_Media.Send_Message_Ready(Var Result_Message : String) : Boolean;
   var
   ReadString : String;
   EdtMoney : String;
   EdtPayerid : String;
   EdtMerchant : AnsiString;
   MSG_OK : String;
   Begin

      Result := False;
      PC_ComPort.Active := True;
      If  PC_ComPort.Active  then Begin
         PC_ComPort.SendData( PByte(Prepare_Message.MESSAGE_Debit_Transaction(EdtMoney,EdtPayerid,EdtMerchant,MSG_OK)), Length(Prepare_Message.MESSAGE_Debit_Transaction(EdtMoney,EdtPayerid,EdtMerchant,MSG_OK)));
         Sleep(1000);

         ReadString := PC_ComPort.ReadString();  {*}
         Result :=  Prepare_Received_Message.IS_OK_Received_Ready_Message(ReadString,Result_Message);
      End
      Else
         Result_Message := 'ERR_PC_INVALID_PORT_STATE';
   End;
   Procedure TPOS_Media.Config_Serial_Port(Media_Type : TMediaType;BaudRate : Cardinal;Parity : Byte;StopBits : Byte;fComPortNo : Byte);
   Var
     ffComPortNo: Byte;
   Begin
      If Media_Type = mt_Serial then Begin
         ffComPortNo := fComPortNo-1;
         PC_ComPort.BaudRate := BaudRate;
         PC_ComPort.Parity   := TParity(Parity);
         PC_ComPort.StopBits := TStopBits(StopBits);
         PC_ComPort.UseMainThread := True;
         PC_ComPort.ComPortNo := fComPortNo;
         PC_ComPort.ComPort := TComPort(ffComPortNo);
         PC_ComPort.BufferInSize := 8192;
         PC_ComPort.BufferOutSize := 8192;
         PC_ComPort.TimeoutWrite := 15000;
         PC_ComPort.TimeoutRead := 180000;
         PC_ComPort.ByteSize := 8;

         PC_ComPort.StreamProtocol := spNone;
         PC_ComPort.EnumPorts := epQuickAll;

      End;
   End;
   Function TPOS_Media.Send_Message_Then_Read_Data(Send_Message : TByteArr;Var Rec_Message : TByteArr; ResponseTime : Integer;Var Result_Message : String) : String;
   Var
      Start: TDateTime;
      Count_Byte_From_Read : Cardinal;
      Orginal_Read_Byte_From_Port : TByteArr;
   Begin
      SetLength(Orginal_Read_Byte_From_Port,0);
      try
         If Not PC_ComPort.Active then
             PC_ComPort.Active := True;
         //If Send_Message_Ready(Result_Message) Then Begin
            PC_ComPort.SendData(PByte(Send_Message), Length(Send_Message));
            Sleep(500);
            Start := Now;
            while Now < IncSecond(Start, ResponseTime) do Begin
               Count_Byte_From_Read := PC_ComPort.ReadyForRead;
               SetLength(Orginal_Read_Byte_From_Port, Count_Byte_From_Read);
               If Count_Byte_From_Read > 0 Then
                  PC_ComPort.Read(@Orginal_Read_Byte_From_Port[0], Count_Byte_From_Read);
               If Length(Orginal_Read_Byte_From_Port) <> 0 then  Begin
                  Rec_Message := Orginal_Read_Byte_From_Port;
                  Break;
               End;
               Sleep(1000);
            End;
            If (Length(Orginal_Read_Byte_From_Port) = 0) then Begin
               Result_Message := 'ERR_PC_PORT_TIMEOUT_FOR_REC';
               Result := 'ERR_PC_PORT_TIMEOUT_FOR_REC';
            End;
       //  End
       //  Else Begin
        //    Result := Result_Message;
       //  End;

       finally
          PC_ComPort.Active := False;
       end;

   End;


end.
