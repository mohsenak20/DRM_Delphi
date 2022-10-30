{*******************************************************}
{                                                       }
{       last update: 05 Tir 1397                       }
{                                                       }
{       Behpardakht Mellat                              }
{                                                       }
{*******************************************************}

unit Application_Layer;
interface
uses Prepare_Message, Prepare_Received_Message, Result_Transaction,Classes,
   Check_Parameter,UTools,Send_And_Received_TCP , Send_And_Received_To_Media;
Type
  TApplication_Layer = class{(TComponent)}
  Private
    R : Result_Transaction_Table;
    fResponse_Second :Integer;
    MediaTCP : TPOS_Media_TCP;
    fPortNumber : Integer;
    fIpAddress : String;
	  fBaudRate : Cardinal;
  	fParity : Byte;
  	fStopBits : Byte;
  	fComport : Byte;
    MediaType : TMediaType;
   	Media : TPOS_Media;

  Public
	constructor Createe(BaudRate : Cardinal;Parity : Byte;StopBits : Byte;ComPortNo : Byte;Response_Second :Integer);overload;
  constructor Createe(IpAddress : String;PortNumber : Integer;Response_Second :Integer);overload;

    Function POS_PC_Debits_Goods_And_Service(Str_Money : String;Str_Payerid : String;Str_Merchant : String;Var Result_Message : String;MerchantAdditionalData : String ='') : Result_Transaction_Table;
   { Function POS_PC_Bill_Payment_Service(Str_Money : String;Str_BillId : String;Str_PayId : String;Str_Merchant : String;Var Result_Message : String;MerchantAdditionalData : String ='') : Result_Transaction_Table;
    Function POS_PC_Payment(Str_Money : String;Str_Payerid : String;Str_AccountId : String;Var Result_Message : String;MerchantAdditionalData : String ='') : Result_Transaction_Table;   }

    destructor Destroy; override;
End;

implementation


destructor TApplication_Layer.Destroy;
Begin
    inherited;
    If (MediaTCP <> nil) Then Begin
       MediaTCP.Free;
       MediaTCP := nil;
    End;

End;

constructor TApplication_Layer.Createe(BaudRate : Cardinal;Parity : Byte;StopBits : Byte;ComPortNo : Byte;Response_Second :Integer);

Begin
    fBaudRate := BaudRate;
    fParity := Parity;
    fStopBits := StopBits;
    fComport := ComPortNo;
    fResponse_Second := Response_Second;
    MediaType := mt_Serial;
    Media := TPOS_Media.Create;

    R := Result_Transaction_Table.Create;
End;

constructor TApplication_Layer.Createe(IpAddress : String;PortNumber : Integer;Response_Second :Integer);
Begin
    fResponse_Second := Response_Second;
    fPortNumber := PortNumber;
    fIpAddress :=  IpAddress;
    MediaType := mt_TCP;
    MediaTCP := TPOS_Media_TCP.Create;
    R := Result_Transaction_Table.Create;
End;

Function TApplication_Layer.POS_PC_Debits_Goods_And_Service(Str_Money : String;Str_Payerid : String;Str_Merchant : String; Var Result_Message : String;MerchantAdditionalData : String ='') : Result_Transaction_Table;
Var
   READ_Message : TByteArr;
   Send_Message : TByteArr;
Begin
      Result := R;
      Send_Message := Prepare_Message.MESSAGE_Debit_Transaction(Str_Money,Str_Payerid,Str_Merchant,MerchantAdditionalData);

      If (MediaType = mt_Serial) Then Begin
      Result := R;
      If AmountValidity(Str_Money,Result_Message) And PayerIDValidity(Str_Payerid,Result_Message) Then Begin
          Media.Config_Serial_Port(mt_Serial,fBaudRate,fParity,fStopBits,fComport);
          Media.Send_Message_Then_Read_Data(Send_Message,READ_Message,fResponse_Second,Result_Message);
          Prepare_Received_Message.IS_OK_Received_Debit_Message(READ_Message,Str_Money,Result_Message,Result );

      End;
   End
   Else
   If (MediaType = mt_TCP) Then Begin
      Result := R;
      If AmountValidity(Str_Money,Result_Message) And PayerIDValidity(Str_Payerid,Result_Message) Then Begin
          MediaTCP.Config_TCP_IP(fIpAddress,fPortNumber,fResponse_Second);
          MediaTCP.Send_Message_Then_Read_Data(Send_Message,READ_Message,fResponse_Second,Result_Message);
          Prepare_Received_Message.IS_OK_Received_Debit_Message(READ_Message,Str_Money,Result_Message,Result );
      End;
   End;
   
      End;




{Function TApplication_Layer.POS_PC_Bill_Payment_Service(Str_Money : String;Str_BillId : String;Str_PayId : String;Str_Merchant : String;Var Result_Message : String;MerchantAdditionalData : String ='') : Result_Transaction_Table;
Var
   READ_Message : TByteArr;
Begin

      Result := R;
      If AmountValidity(Str_Money,Result_Message) And BillIDValidity(Str_BillId,Result_Message) And PayIDValidity(Str_PayId,Result_Message) Then Begin
          MediaTCP.Config_TCP_IP(fPortNumber,fResponse_Second);
          MediaTCP.Send_Message_Then_Read_Data((Prepare_Message.MESSAGE_Bill_Transaction(Str_Money,Str_BillId,Str_PayId,Str_Merchant,MerchantAdditionalData)),READ_Message,fResponse_Second,Result_Message);
          Prepare_Received_Message.IS_OK_Received_Bill_Message(READ_Message,Str_Money,Result_Message,Result );
      End;

End; }

{Function TApplication_Layer.POS_PC_Payment(Str_Money : String;Str_Payerid : String;Str_AccountId : String;Var Result_Message : String;MerchantAdditionalData : String ='') : Result_Transaction_Table;
Var
   READ_Message : TByteArr;
Begin

      Result := R;
      If AmountValidity(Str_Money,Result_Message) And PayerIDValidity(Str_Payerid,Result_Message)
         And AccountIDValidity(Str_AccountId,Result_Message) Then Begin
          MediaTCP.Config_TCP_IP(fPortNumber,fResponse_Second);
          MediaTCP.Send_Message_Then_Read_Data((Prepare_Message.MESSAGE_Payment_Transaction(Str_Money,Str_Payerid,Str_AccountId,'',MerchantAdditionalData)),READ_Message,fResponse_Second,Result_Message);
          Prepare_Received_Message.IS_OK_Received_Peyment_Message(READ_Message,Str_Money,Result_Message,Result );
           
      End;


 End; }


end.
