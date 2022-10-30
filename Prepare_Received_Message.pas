{*******************************************************}
{                                                       }
{       last update: 05 Tir 1397                       }
{                                                       }
{       Behpardakht Mellat                              }
{                                                       }
{*******************************************************}
unit Prepare_Received_Message;

interface
uses  SysUtils,Dateutils,UTools,Result_Transaction ;

Function IS_OK_Received_Ready_Message(Read_Message : String;Var Result_Message : String) : Boolean;
Procedure IS_OK_Received_Debit_Message(Orginal_Read_Byte_From_Port : TByteArr ;MoneyString : String;Var Result_Message : String;Var Result_Table: Result_Transaction_Table);

implementation

uses UConst, Variants,UCRC;

Procedure Fill_Result_Transaction_From_Byte(vTemp_Byte : TByteArr;Var vResult_Trans: Result_Transaction_Table);

Var
  TagId  : Byte;
  TagLen : Byte;

Begin

  If Length(vTemp_Byte) <> 0 then  Begin
     vTemp_Byte := Copy(vTemp_Byte, 2, Length(vTemp_Byte) - 4);
     while Length(vTemp_Byte) > 0 do Begin
        TagId := vTemp_Byte[0];
        vTemp_Byte := Copy(vTemp_Byte,1,Length(vTemp_Byte)-1);
        case TagId of
           $C0 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_recTransResult(ByteArrayToString(Copy(vTemp_Byte,1,TagLen)));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
           $C1 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_SerialTransaction(ByteArrayToString64(BCD2ByteArray((Copy(vTemp_Byte,1,TagLen)))));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
           $C2 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_TraceNumber(ByteArrayToString64(BCD2ByteArray((Copy(vTemp_Byte,1,TagLen)))));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
           $C3 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_TransactionDate(ByteArrayToString(Copy(vTemp_Byte,1,TagLen)));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
           $C4 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_TransactionTime(ByteArrayToString(Copy(vTemp_Byte,1,TagLen)));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
           $C5 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_PAN(ByteArrayToString64(BCD2ByteArray((Copy(vTemp_Byte,1,TagLen)))));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
           $C6 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_BIN(ByteArrayToString64(BCD2ByteArray((Copy(vTemp_Byte,1,TagLen)))));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
           $C7 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_TerminalNo(ByteArrayToString64(BCD2ByteArray((Copy(vTemp_Byte,1,TagLen)))));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
           $C8 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_AccountNo(ByteArrayToString64(BCD2ByteArray((Copy(vTemp_Byte,1,TagLen)))));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
           $A2 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_ProccessCode(ByteArrayToString64(BCD2ByteArray((Copy(vTemp_Byte,1,TagLen)))));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
           $B0 : Begin
                    TagLen := vTemp_Byte[0];
                    vResult_Trans.Set_Result_recTransAmount(ByteArrayToString64(BCD2ByteArray((Copy(vTemp_Byte,1,TagLen)))));
                    vTemp_Byte := Copy(vTemp_Byte,TagLen+1,Length(vTemp_Byte)-TagLen-1);
                 End;
        end;

     End;{End While TAG}
  End;{If Len <> 0}
                                       

End;

Function IS_OK_Received_Ready_Message(Read_Message : String;Var Result_Message : String) : Boolean;
Begin
   Result := False;
   if (Read_Message <> '') then Begin
      If (StrToIntDef(Copy(Read_Message,1,4),0) <> Length(Trim(Read_Message))) Then
         Result_Message := 'ERR_PC_INVALID_REC_SIZE'
      Else If (Copy(Read_Message,7,2) <> '03') Then
         Result_Message := 'ERR_PC_INVALID_REC_PROCESS_CODE'
      Else If (Copy(Read_Message,5,2) = 'OK') then Begin
         Result_Message := 'RET_OK';
         Result := True;
      End
   End
   Else
      Result_Message := 'ERR_POS_CARD_SWIPE_FAILED';

End;
Procedure IS_OK_Received_Debit_Message(Orginal_Read_Byte_From_Port : TByteArr ;MoneyString : String;Var Result_Message : String;Var Result_Table: Result_Transaction_Table);
Var
  Temp_Byte : TByteArr;
  Value: TByteArr;
  TagId  : Byte;
  TagLen : Byte;
  Result_Trans : Result_Transaction_Table;
Begin

  Result_Trans := Result_Table;
  Temp_Byte := Orginal_Read_Byte_From_Port;
  If Length(Temp_Byte) <> 0 then  Begin
     SetLength(Value, 4);
     Value := Copy(Temp_Byte, 0, 2);

     If ByteArrayToInteger(BCD2ByteArray(Value)) <> Length(Temp_Byte) Then
        Result_Message := 'ERR_PC_INVALID_REC_SIZE';

     SetLength(Value, 2);
     Value := Copy(Temp_Byte, Length(Temp_Byte) - 2, 2);

     if CheckCRC(Copy(Temp_Byte, 4, Length(Temp_Byte) - 5), Value) then
        Result_Message := 'ERR_POS_PC_CRCERROR_INVALID_DATA';

     Temp_Byte := Copy(Temp_Byte, 2, Length(Temp_Byte) - 4);


     while Length(Temp_Byte) > 0 do Begin
        TagId := Temp_Byte[0];
        Temp_Byte := Copy(Temp_Byte,1,Length(Temp_Byte)-1);
        case TagId of
           $C0 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_recTransResult(ByteArrayToString(Copy(Temp_Byte,1,TagLen)));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
           $C1 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_SerialTransaction(ByteArrayToString64(BCD2ByteArray((Copy(Temp_Byte,1,TagLen)))));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
           $C2 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_TraceNumber(ByteArrayToString64(BCD2ByteArray((Copy(Temp_Byte,1,TagLen)))));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
           $C3 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_TransactionDate(ByteArrayToString(Copy(Temp_Byte,1,TagLen)));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
           $C4 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_TransactionTime(ByteArrayToString(Copy(Temp_Byte,1,TagLen)));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
           $C5 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_PAN(ByteArrayToString64(BCD2ByteArray((Copy(Temp_Byte,1,TagLen)))));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
           $C6 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_BIN(ByteArrayToString64(BCD2ByteArray((Copy(Temp_Byte,1,TagLen)))));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
           $C7 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_TerminalNo(ByteArrayToString64(BCD2ByteArray((Copy(Temp_Byte,1,TagLen)))));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
           $C8 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_AccountNo(ByteArrayToString64(BCD2ByteArray((Copy(Temp_Byte,1,TagLen)))));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
           $A2 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_ProccessCode(ByteArrayToString64(BCD2ByteArray((Copy(Temp_Byte,1,TagLen)))));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
           $B0 : Begin
                    TagLen := Temp_Byte[0];
                    Result_Trans.Set_Result_recTransAmount(ByteArrayToString64(BCD2ByteArray((Copy(Temp_Byte,1,TagLen)))));
                    Temp_Byte := Copy(Temp_Byte,TagLen+1,Length(Temp_Byte)-TagLen-1);
                 End;
        end;

     End;{End While TAG}
     If (Result_Trans.Result_recTransResult = '00') Then Begin
        Result_Message := 'RET_OK';
     End
     Else
       Result_Message := Get_Result_Error_Name (Result_Trans.Result_recTransResult, True);
  End;{If Len <> 0}
  Result_Table := Result_Trans;


End;



end.
