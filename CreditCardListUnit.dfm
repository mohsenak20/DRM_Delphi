object frmCreditCardList: TfrmCreditCardList
  Left = 364
  Top = 195
  Width = 667
  Height = 479
  BiDiMode = bdRightToLeft
  Caption = #1604#1610#1587#1578' '#1588#1575#1585#1688#1607#1575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 129
    Align = alTop
    TabOrder = 0
    object Label7: TLabel
      Left = 554
      Top = 21
      Width = 21
      Height = 27
      Caption = #1606#1575#1605':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 554
      Top = 69
      Width = 78
      Height = 27
      Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 310
      Top = 21
      Width = 49
      Height = 27
      Caption = #1602#1585#1575#1585#1583#1575#1583':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCreditGroupName: TLabel
      Left = 254
      Top = 23
      Width = 49
      Height = 27
      Caption = #1602#1585#1575#1585#1583#1575#1583':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblName: TLabel
      Left = 478
      Top = 23
      Width = 49
      Height = 27
      Caption = #1602#1585#1575#1585#1583#1575#1583':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCardID: TLabel
      Left = 454
      Top = 71
      Width = 73
      Height = 27
      Caption = #1578#1575#1585#1610#1582' '#1589#1583#1608#1585':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 129
    Width = 651
    Height = 311
    Align = alClient
    DataSource = dsCredit
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'koodak'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CreditCardChargeID'
        Title.Alignment = taCenter
        Title.Caption = #1705#1583
        Width = 54
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Price'
        Title.Alignment = taCenter
        Title.Caption = #1605#1576#1604#1594
        Width = 131
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumberOfSession'
        Title.Caption = #1578#1593#1583#1575#1583' '#1580#1604#1587#1607
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ChargeDate'
        Title.Alignment = taCenter
        Title.Caption = #1578#1575#1585#1610#1582
        Width = 126
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ChargeTime'
        Title.Alignment = taCenter
        Title.Caption = #1587#1575#1593#1578
        Width = 113
        Visible = True
      end>
  end
  object QCredit: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'CardID'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from TCreditCardCharge'
      'where CreditCardID = :CardID')
    Left = 248
    Top = 232
  end
  object dsCredit: TDataSource
    DataSet = QCredit
    Left = 296
    Top = 232
  end
end
