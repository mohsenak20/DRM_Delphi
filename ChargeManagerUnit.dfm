object frmChargeManager: TfrmChargeManager
  Left = 318
  Top = 367
  Width = 524
  Height = 383
  BiDiMode = bdRightToLeft
  Caption = #1605#1583#1610#1585#1610#1578' '#1588#1575#1585#1688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 282
    Width = 516
    Height = 67
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      516
      67)
    object Label1: TLabel
      Left = 463
      Top = 18
      Width = 29
      Height = 28
      Caption = #1588#1575#1585#1688':'
    end
    object DBNavigator1: TDBNavigator
      Left = 16
      Top = 39
      Width = 216
      Height = 25
      DataSource = dsCharge
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 336
      Top = 15
      Width = 121
      Height = 36
      DataField = 'Credit'
      DataSource = dsCharge
      TabOrder = 1
    end
    object btnDelete: TBitBtn
      Left = 16
      Top = 6
      Width = 76
      Height = 27
      Anchors = [akTop, akRight]
      Caption = #1581#1584#1601
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnDeleteClick
      Kind = bkCancel
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 516
    Height = 225
    Align = alClient
    DataSource = dsCharge
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CreditID'
        Title.Caption = #1705#1583
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Credit'
        Title.Caption = #1605#1610#1586#1575#1606' '#1588#1575#1585#1688
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ChargeTime'
        Title.Caption = #1587#1575#1593#1578
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UserName'
        Title.Caption = #1606#1575#1605' '#1705#1575#1585#1576#1585
        Width = 243
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 57
    Align = alTop
    TabOrder = 2
    object Label4: TLabel
      Left = 471
      Top = 12
      Width = 21
      Height = 29
      Caption = #1606#1575#1605':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCustomerName: TLabel
      Left = 444
      Top = 13
      Width = 21
      Height = 29
      Caption = #1606#1575#1605':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 150
      Top = 12
      Width = 30
      Height = 29
      Caption = #1705#1605#1583':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblLocker: TLabel
      Left = 124
      Top = 13
      Width = 21
      Height = 29
      Caption = #1606#1575#1605':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dsCharge: TDataSource
    DataSet = QCharge
    Left = 16
    Top = 24
  end
  object QCharge: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ReceptionID'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'select CreditID, Credit, ChargeTime,'
      
        '(select UserName from TUser where UserID = TCredit.UserID) as Us' +
        'erName'
      'from TCredit'
      'where ReceptionID= :ReceptionID')
    Left = 56
    Top = 24
  end
  object QDelete: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'CreditID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Delete TCredit'
      'where CreditID= :CreditID')
    Left = 8
    Top = 176
  end
end
