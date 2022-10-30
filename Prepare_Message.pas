{*******************************************************}
{                                                       }
{       last update: 05 Tir 1397                        }
{                                                       }
{       Behpardakht Mellat                              }
{                                                       }
{*******************************************************}
unit Prepare_Message;

interface
uses SysUtils,Dateutils,UTools,Classes,Util_UTF8, check_parameter;


Function MESSAGE_Debit_Transaction(MoneyString:string;PayerIdString: string;Merchant_Message: AnsiString;MerchantAdditionalData : String) : TByteArr;

implementation

uses UConst, UCRC;


Var
   Process_Code : string;
    PC_Id : String;
   CALC_CRC : Integer;
   SENDMessage_BYTE,Value : TByteArr;

Function MESSAGE_Debit_Transaction(MoneyString:string;PayerIdString: string;Merchant_Message: Ansistring;MerchantAdditionalData : String) : TByteArr;
Var

   LenStr : String;

Begin

   Process_Code :='01';
   PC_Id := '123';

   SENDMessage_BYTE := nil;

   AddByteArrays(SENDMessage_BYTE,$A0);
   Value := ArrOfByte(dllName,False);
   MergeArrays(SENDMessage_BYTE, NumberToBCD(IntTOSTr(Length(Value))));
   MergeArrays(SENDMessage_BYTE, Value);

   AddByteArrays(SENDMessage_BYTE,$A1);
   Value := NumberToBCD(dllVersion);
   MergeArrays(SENDMessage_BYTE, NumberToBCD(IntTOSTr(Length(Value))));
   MergeArrays(SENDMessage_BYTE,Value);

   AddByteArrays(SENDMessage_BYTE,$A2);
   Value := NumberToBCD(Process_Code);
   MergeArrays(SENDMessage_BYTE, NumberToBCD(IntTOSTr(Length(Value))));
   MergeArrays(SENDMessage_BYTE,Value);

    AddByteArrays(SENDMessage_BYTE,$A4);
   Value := NumberToBCD(PC_Id);
   MergeArrays(SENDMessage_BYTE, NumberToBCD(IntTOSTr(Length(Value))));
   MergeArrays(SENDMessage_BYTE,Value);

// -------------------------------------------------
   AddByteArrays(SENDMessage_BYTE,$B0);
   Value := NumberToBCD(MoneyString);
   MergeArrays(SENDMessage_BYTE, NumberToBCD(IntTOSTr(Length(Value))));
   MergeArrays(SENDMessage_BYTE,Value);
   If PayerIdString <> '' Then Begin
      AddByteArrays(SENDMessage_BYTE,$B1);
      Value := NumberToBCD(PayerIdString);
      MergeArrays(SENDMessage_BYTE, NumberToBCD(IntTOSTr(Length(Value))));
      MergeArrays(SENDMessage_BYTE,Value);
   End;
   If Merchant_Message <> '' Then Begin
      AddByteArrays(SENDMessage_BYTE,$B6);
      Value := Merchanet_TO_Byte(Merchant_Message);
      AddByteArrays(SENDMessage_BYTE,Byte(Length(Value)));
      MergeArrays(SENDMessage_BYTE,Value);
   End;
   If MerchantAdditionalData <> '' Then Begin
      AddByteArrays(SENDMessage_BYTE,$B9);
      if (Length(MerchantAdditionalData) > MerchantDataSize) Then
           MerchantAdditionalData := Copy(MerchantAdditionalData,MerchantDataSize,Length(MerchantAdditionalData) - MerchantDataSize);
      Value := StringToBytes(WideToUTF8(MerchantAdditionalData));
//      AddByteArrays(SENDMessage_BYTE,Byte(Length(Value)));
      MergeArrays(SENDMessage_BYTE, NumberToBCD(IntTOSTr(Length(Value))));
      MergeArrays(SENDMessage_BYTE,Value);
   End;
   //Compute CRC

   Init(CRC_16);
   CALC_CRC := crctablefast(SENDMessage_BYTE);

   //Value := NumberToBCD('0'+IntToStr(Length(SENDMessage_BYTE)+4));
   LenStr := RightPad(IntToStr(Length(SENDMessage_BYTE)+6),'0',4);
   Value := ArrOfByte(LenStr,False);
   MergeArrays(Value,SENDMessage_BYTE );
   AddByteArrays(Value,Byte(StrToInt('$' +Mid(IntToHex(CALC_CRC,4),3,2))));
   AddByteArrays(Value,Byte(StrToInt('$' +Mid(IntToHex(CALC_CRC,4),1,2))));
   SENDMessage_BYTE := Value;
   Result := SENDMessage_BYTE;

End;

end.
