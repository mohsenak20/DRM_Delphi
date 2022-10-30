object frmUsedAttraction: TfrmUsedAttraction
  Left = 382
  Top = 132
  BiDiMode = bdRightToLeft
  BorderStyle = bsNone
  Caption = #1587#1585#1587#1585#1607
  ClientHeight = 726
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  ParentBiDiMode = False
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 28
  object Label1: TLabel
    Left = 448
    Top = 94
    Width = 236
    Height = 234
    Caption = #1705#1605#1583':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -133
    Font.Name = 'B Titr'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 449
    Top = 338
    Width = 299
    Height = 234
    Caption = #1578#1593#1583#1575#1583':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -133
    Font.Name = 'B Titr'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 622
    Top = 619
    Width = 30
    Height = 47
    Caption = #1606#1575#1605':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Koodak'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 622
    Top = 671
    Width = 109
    Height = 47
    Caption = #1605#1610#1586#1575#1606' '#1588#1575#1585#1688':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Koodak'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lblName: TLabel
    Left = 566
    Top = 619
    Width = 30
    Height = 47
    Caption = #1606#1575#1605':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'Koodak'
    Font.Style = []
    ParentFont = False
  end
  object lblCredit: TLabel
    Left = 487
    Top = 671
    Width = 109
    Height = 47
    Caption = #1605#1610#1586#1575#1606' '#1588#1575#1585#1688':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Koodak'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 621
    Top = 575
    Width = 31
    Height = 47
    Caption = #1705#1583':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Koodak'
    Font.Style = []
    ParentFont = False
  end
  object lblReceptionID: TLabel
    Left = 566
    Top = 575
    Width = 30
    Height = 47
    Caption = #1606#1575#1605':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'Koodak'
    Font.Style = []
    ParentFont = False
  end
  object lblUser: TLabel
    Left = 529
    Top = 6
    Width = 123
    Height = 70
    Caption = #1606#1575#1605' '#1705#1575#1585#1576#1585
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -40
    Font.Name = 'B Titr'
    Font.Style = []
    ParentFont = False
  end
  object edtKeyNumber: TEdit
    Left = 7
    Top = 89
    Width = 433
    Height = 242
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -133
    Font.Name = 'B Titr'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnExit = edtKeyNumberExit
  end
  object edtNumber: TEdit
    Left = 8
    Top = 333
    Width = 432
    Height = 242
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -133
    Font.Name = 'B Titr'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnDeleteInfo: TBitBtn
    Left = 8
    Top = 577
    Width = 223
    Height = 129
    Caption = '?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -93
    Font.Name = 'Wingdings'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnDeleteInfoClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 707
    Width = 759
    Height = 19
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Color = clInfoBk
    Panels = <
      item
        Text = #1582#1575#1604#1610' '#1606#1605#1608#1583#1606' '#1601#1585#1605':   F5'
        Width = 139
      end>
    ParentBiDiMode = False
  end
  object SP_Factor: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_TFactor;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@FactorID'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@ReceptionID'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@Active'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Description'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@UserID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Discount'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PercentDiscount'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DocID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Documentation'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Action'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 6
        Value = Null
      end
      item
        Name = '@OutFactorID'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdOutput
        Precision = 10
        Value = Null
      end>
    Left = 248
    Top = 594
  end
  object SP_SubFactor: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_TSubFactorMainOperation;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Code'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@FactorID'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@ProductID'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@Number'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@VahedPrice'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Active'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Description'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@StorageTitleID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Action'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 6
        Value = Null
      end>
    Left = 288
    Top = 594
  end
  object QSearch: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'KeyNumber'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * from TReception inner join TClosed on'
      'TReception.ClosedID=TClosed.ClosedID'
      'where KeyNumber =  :KeyNumber and EndTime='#39'99:99'#39)
    Left = 352
    Top = 591
  end
  object SP_GetCurrentCredit: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_GetCurrentCredit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ClosedID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CurrentCredit'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 352
    Top = 623
  end
  object QKala: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'KalaID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from TKala'
      'where KalaID = :KalaID')
    Left = 248
    Top = 631
  end
  object ActionList1: TActionList
    Left = 440
    Top = 599
    object Clear: TAction
      Caption = 'ClearForm'
      ShortCut = 116
      OnExecute = ClearExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 704
    Top = 102
    object N1: TMenuItem
      Caption = #1662#1585#1608#1606#1583#1607
      object mnuDelete: TMenuItem
        Caption = #1581#1584#1601
        OnClick = mnuDeleteClick
      end
      object mnuReport: TMenuItem
        Caption = #1711#1586#1575#1585#1588
        OnClick = mnuReportClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuExit: TMenuItem
        Caption = #1582#1585#1608#1580
        OnClick = mnuExitClick
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 40
    object N2: TMenuItem
      Caption = #1582#1584#1601
      OnClick = mnuDeleteClick
    end
  end
end
