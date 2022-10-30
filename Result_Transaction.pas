{*******************************************************}
{                                                       }
{       last update: 24 Mordad 1395                       }
{                                                       }
{       Behpardakht Mellat                              }
{                                                       }
{*******************************************************}

unit Result_Transaction;

interface
uses Classes;
Type
  Result_Transaction_Table = class{(TComponent)}
  private
    { Private declarations }
     l_SerialTransaction : String ;
     l_TraceNumber : String ;
     l_TransactionDate : String ;
     l_TransactionTime : String ;
     l_PAN : String ;
     l_BIN : String ;
     l_TerminalNo : String ;
     l_AccountNo : String ;
     l_recTransResult : String ;
     l_recTransAmount : String ;
     l_ProccessCode : String ;

  Protected

  public
    { Public declarations }
     Procedure Set_Result_SerialTransaction(Value : String);
     Procedure Set_Result_TraceNumber(Value : String);
     Procedure Set_Result_TransactionDate(Value : String);
     Procedure Set_Result_TransactionTime(Value : String);
     Procedure Set_Result_PAN(Value : String);
     Procedure Set_Result_BIN(Value : String);
     Procedure Set_Result_TerminalNo(Value : String);
     Procedure Set_Result_AccountNo(Value : String);
     Procedure Set_Result_recTransResult(Value : String);
     Procedure Set_Result_recTransAmount(Value : String);
     Procedure Set_Result_ProccessCode(Value : String);

     property Result_SerialTransaction : String Read l_SerialTransaction  Write Set_Result_SerialTransaction;
     property Result_TraceNumber       : String Read l_TraceNumber        Write Set_Result_TraceNumber;
     property Result_TransactionDate   : String Read l_TransactionDate    Write Set_Result_TransactionDate;
     property Result_TransactionTime   : String Read l_TransactionTime    Write Set_Result_TransactionTime;
     property Result_PAN               : String Read l_PAN                Write Set_Result_PAN;
     property Result_BIN               : String Read l_BIN                Write Set_Result_BIN;
     property Result_TerminalNo        : String Read l_TerminalNo         Write Set_Result_TerminalNo;
     property Result_AccountNo         : String Read l_AccountNo          Write Set_Result_AccountNo;
     property Result_recTransResult    : String Read l_recTransResult     Write Set_Result_recTransResult;
     property Result_recTransAmount    : String Read l_recTransAmount     Write Set_Result_recTransAmount;
     property Result_ProccessCode      : String Read l_ProccessCode       Write Set_Result_ProccessCode;


Published
     constructor Create();
  end;

implementation

   constructor Result_Transaction_Table.Create();
   begin
     l_SerialTransaction := '000000';
     l_TraceNumber := '000000000000';
     l_TransactionDate := '0000000000';
     l_TransactionTime := '00000';
     l_PAN := '000000******0000'; //change 4-0
     l_BIN := '000000';
     l_TerminalNo := '00000000';
     l_AccountNo := '00000000000000';
     l_recTransResult := '';
     l_recTransAmount := '';
     l_ProccessCode := '';
   end;
   Procedure Result_Transaction_Table.Set_Result_SerialTransaction(Value : String);
   Begin
      l_SerialTransaction := Value;
   End;


   Procedure Result_Transaction_Table.Set_Result_TraceNumber(Value : String);
   Begin
      l_TraceNumber := Value;
   End;
   Procedure Result_Transaction_Table.Set_Result_TransactionDate(Value : String);
   Begin
      l_TransactionDate := Value;
   End;
   Procedure Result_Transaction_Table.Set_Result_TransactionTime(Value : String);
   Begin
      l_TransactionTime := Value;
   End;
   Procedure Result_Transaction_Table.Set_Result_PAN(Value : String);
   Begin
      l_PAN := Value;
   End;
   Procedure Result_Transaction_Table.Set_Result_BIN(Value : String);
   Begin
      l_BIN := Value;
   End;
   Procedure Result_Transaction_Table.Set_Result_TerminalNo(Value : String);
   Begin
      l_TerminalNo := Value;
   End;
   Procedure Result_Transaction_Table.Set_Result_AccountNo(Value : String);
   Begin
      l_AccountNo := Value;
   End;
   Procedure Result_Transaction_Table.Set_Result_recTransResult(Value : String);
   Begin
      if Value = '000' then
         Value := '100';
      l_recTransResult := Value;
   End;
   Procedure Result_Transaction_Table.Set_Result_recTransAmount(Value : String);
   Begin
      l_recTransAmount := Value;
   End;
   Procedure Result_Transaction_Table.Set_Result_ProccessCode(Value : String);
   Begin
      l_ProccessCode := Value;
   End;


end.
