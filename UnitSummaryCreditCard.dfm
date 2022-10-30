object frmSummaryCreditCard: TfrmSummaryCreditCard
  Left = 384
  Top = 263
  Width = 839
  Height = 570
  BiDiMode = bdRightToLeft
  Caption = #1582#1604#1575#1589#1607' '#1575#1587#1578#1601#1575#1583#1607' '#1705#1575#1585#1578' '#1575#1593#1578#1576#1575#1585#1610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 823
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 625
      Top = 32
      Width = 131
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1580#1604#1587#1607' '#1575#1587#1578#1601#1575#1583#1607' '#1588#1583#1607':'
    end
    object Label2: TLabel
      Left = 310
      Top = 32
      Width = 110
      Height = 28
      Caption = #1580#1605#1593' '#1588#1575#1585#1688' '#1575#1606#1580#1575#1605' '#1588#1583#1607':'
    end
    object lblSummaryReception: TLabel
      Left = 467
      Top = 32
      Width = 145
      Height = 28
      Caption = 'lblSummaryReception'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblSummaryCreduit: TLabel
      Left = 180
      Top = 32
      Width = 120
      Height = 28
      Caption = 'lblSummaryCredit'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 141
      Top = 32
      Width = 23
      Height = 28
      Caption = #1585#1610#1575#1604
    end
    object Label4: TLabel
      Left = 628
      Top = 58
      Width = 91
      Height = 28
      Caption = #1605#1576#1604#1594' '#1575#1587#1578#1601#1575#1583#1607' '#1588#1583#1607':'
    end
    object lblPriceUsed: TLabel
      Left = 467
      Top = 61
      Width = 145
      Height = 28
      Caption = 'lblSummaryReception'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 312
      Top = 56
      Width = 58
      Height = 28
      Caption = #1605#1575#1606#1583#1607' '#1588#1575#1585#1688':'
    end
    object lblMod: TLabel
      Left = 180
      Top = 56
      Width = 120
      Height = 28
      Caption = 'lblSummaryCredit'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label7: TLabel
      Left = 141
      Top = 56
      Width = 23
      Height = 28
      Caption = #1585#1610#1575#1604
    end
    object Label8: TLabel
      Left = 429
      Top = 57
      Width = 23
      Height = 28
      Caption = #1585#1610#1575#1604
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 823
    Height = 335
    Align = alClient
    TabOrder = 1
    object Panel4: TPanel
      Left = 304
      Top = 1
      Width = 518
      Height = 333
      Align = alRight
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 516
        Height = 331
        Align = alClient
        DataSource = dsReception
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
            FieldName = 'ReceptionID'
            Title.Caption = #1705#1583' '#1662#1584#1610#1585#1588
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CustomerName'
            Title.Caption = #1606#1575#1605' '#1605#1610#1607#1605#1575#1606
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ReceptionDate'
            Title.Caption = #1578#1575#1585#1610#1582' '#1662#1584#1610#1585#1588
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClosedID'
            Title.Caption = #1705#1605#1583
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NumberOfAdult'
            Title.Caption = #1576#1586#1585#1711#1587#1575#1604
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NumberOfChild'
            Title.Caption = #1582#1585#1583#1587#1575#1604
            Width = 52
            Visible = True
          end>
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 303
      Height = 333
      Align = alClient
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 1
        Top = 1
        Width = 301
        Height = 331
        Align = alClient
        DataSource = dsCredit
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Koodak'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Price'
            Title.Caption = #1605#1576#1604#1594
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ChargeDate'
            Title.Caption = #1578#1575#1585#1610#1582' '#1588#1575#1585#1688
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NumberOfSession'
            Title.Caption = #1578#1593#1583#1575#1583' '#1580#1604#1587#1607
            Width = 70
            Visible = True
          end>
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 424
    Width = 823
    Height = 107
    Align = alBottom
    TabOrder = 2
    object BtnReturn: TBitBtn
      Left = 16
      Top = 39
      Width = 97
      Height = 36
      Caption = #1576#1575#1586#1711#1588#1578
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnReturnClick
      Glyph.Data = {
        1A070000424D1A07000000000000360000002800000015000000150000000100
        200000000000E4060000120B0000120B00000000000000000000D8DAE5004B64
        CB001B38AB00233EA800223EAE00223EAD00223EAD00223EAD00223EAD00233E
        AE001C3BAF001B3AAF001B3AAF001B3BAE001C3BAE001C3BAE001C3BAE001C3B
        AE001935AB00425BB800D8D8E5004A64CA000024B700143AC6001D42C8002246
        CA002145CA002145CA002245CA002246CA002143C6001B40CA001940CB00153D
        CD00103BD0000E39D2000835D4000835D3000937D6000832C900001FA7003B57
        B6001A41D1001542D8001F49D6002A4FDB003054E3003053E2003054E200294F
        E100244AE1001C44DF001F46DF001743E0001342E2001647E3001648E5001244
        E3000C3DDE000839DD000A3ADC000E39D1001332A9001D4ADF001A47E1002A4F
        DD003155E4003A5AE4003656E4003455E4005470EC008DA4EF00B4C3F500B8C5
        F500B4C3F4008CA1F0004262EB001042E3001144E400184AE5000E3FDF000C3C
        DB001A41CB001836AD00214EE100244EE3003355E3003B5BE4003A5AE5004A69
        E700AAB7F800FEFFFF00EEF5FE00DCE5FA00D5DEF900DCE6FE00E9F9FD00FAFE
        FF00A4B4F7002051E4001044E4001547E4000E3EDC00183FCB001736AD00254F
        E0002F54E4003B5BE5004260E700516EE700C6D5F500FFFFFF00A8B6F600647D
        ED003959E5002246E0003154E8004E7BE70093ABF400FFFFFF00BDCBF7001C4B
        E7000F42E3000E3DDC001E42CA001B39AC002B54E1003657E400405FE6004A66
        E600AEBBF800FDFDFF008799E9003D5CE7003C5CE5005B75EA006780EA004E6B
        E6002F4FE2002448E2007289F300FBFAFF00A3B3F8001143E3001647E4002245
        CA001E3BAB00305AE6003A5AE4004664E700627BED00FEFFFE00ADBBF6004663
        E6004865E700395AE500AAB8F400FFFFFF00A5B4F200284BE2002A4FE1001C44
        E10091A9F500FFFFFE003B5FEC001246E3002245CA001E3BAB00385BDC004362
        E7004965E6009FB6F400EFF4FE006C83ED004C69E6004E6AE7003959E500A5B4
        F300FFFFFF009CAEF100294CE2002C51E2001F48E1003D64EB00F0F2FF00839F
        F0000E40E2002145CA001E3BAB003A5FE6004865E6004966E500C2CDF700E0E6
        FB004C69E600536EE7004966E7003758E500A6B4F300FFFFFF009DAEF100294C
        E2002C51E2002A50E2001B47E200DAE1FA00B2C2F5000A3CE2002145CA001E3B
        AB004363E5004D69E6004966E500C8D0F700DFE4FB004965E6005570E7004B68
        E7003758E500A5B4F300FFFFFF009FAFF100284BE2002C51E2002E52E200103F
        E100D1DCFA00B5C4F6000A3DE2002245CA001E3BAB004565E600516CE7004864
        E500C1CDF600DFE5FA004C69E600536EE7004866E7003859E500A6B4F300FFFF
        FF00A0AFF2002046E0002C51E200284FE2001041E300D9E0FA00B4C2F6001944
        E0002346CA001E3BAB004B69E6005873E8005872E700A3B9F400EFF3FE006B83
        ED004D68E6004966E7003757E500A4B3F300FFFFFF009FAFF1002046E0002C51
        E2001B48E2003B5FE400E8EDFB0093AEF0001E46E0002246CA001E3BAB004E6B
        E600647DE9006882E9007A90EF00FFFFFF00ACBAF6004864E6004765E7003556
        E400A6B5F300FFFFFF00A5B4F3001F45E000294FE1002046E10095AAF400FEFF
        FD004F6BE100284EE2002246CA001E3BAB004F6DE700647EEA006983ED00607C
        E900BBC8F900FDFEFE0094A3F400405EE6003B5BE5005B76EA00667FEA004F6B
        E7002B4EE3002047E100647DEA00FCFCFF00A8B6F800254BE3002B51E2002246
        CA001E3BAB005974E8006C85EA007389EE006B84E5006F8BEA00CEDFF800FFFF
        FF00ACBAF600657EED003C5CE500294CE3002F51E300526EE1009CADF500FFFF
        FF00C3D2F4003257E300274DE2002C51E2002247CB001E3CAC005873E7007B91
        EF008799E6007D90F100677FED006782EA00BAC6F900FFFFFF00F0F4FE00DFE4
        FA00DAE0FB00DCE2FA00ECF1F900FFFFFF00A9B7F8003E5FE5003052E3003154
        E3003054E2002646CC00223CAE005F79EE008195E8009CAAF1008A9BEB00768B
        EE006B84E600647FE800798FF000ACC1F500C9D1F700CED6F800CAD2F800A4BA
        F5006D83ED004663E6004562E7004664E7003D5CE5003557E3002245CA001E3B
        AB00637AE80096A5F000A5B1FD0094A3F0008395EA007B8FEB006C85EC006681
        E900627DE9005975E8005D79E8005A77E8005974E7005973E8005670E7005570
        E7004A67E7004260E6002E53E3002246CB001B37AB007591EC006E84F00094A4
        FC008598E900748AF1006780EA00627CEA00647DE900647EE9005D77E800627C
        E9005C77E900516DE800526EE700526DE7004966E6004360E6003356E4002C51
        DD001135BC004963C800E0E3EC007894EF005973EC00526EE7004E6DE6004A69
        E5004966E6004162E5004262E5004363E5004363E5004061E5003F5FE500385C
        E500375CE5003359E5003158E5002855E600204ADA00506CCB00D5D6E400}
    end
  end
  object QSummaryReception: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'CreditCardID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'select sum(NumberOfAdult) sumNumber, SUM((creditCardOwnerPrice*c' +
        'reditCardOwner)+(creditCardSubSetPrice*creditCardSubSet)) used f' +
        'rom TReception'
      'where CreditCardID = :CreditCardID')
    Left = 56
    Top = 33
  end
  object QCredit: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CreditCardID'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from TCreditCardCharge'
      'where CreditCardID = :CreditCardID')
    Left = 48
    Top = 145
    object QCreditCreditCardChargeID: TAutoIncField
      FieldName = 'CreditCardChargeID'
      ReadOnly = True
    end
    object QCreditCreditCardID: TWideStringField
      FieldName = 'CreditCardID'
      Size = 10
    end
    object QCreditPrice: TIntegerField
      FieldName = 'Price'
    end
    object QCreditChargeTime: TStringField
      FieldName = 'ChargeTime'
      FixedChar = True
      Size = 5
    end
    object QCreditChargeDate: TStringField
      FieldName = 'ChargeDate'
      FixedChar = True
      Size = 10
    end
    object QCreditNumberOfSession: TIntegerField
      FieldName = 'NumberOfSession'
    end
    object QCreditChargeGroupID: TIntegerField
      FieldName = 'ChargeGroupID'
    end
    object QCreditUserID: TIntegerField
      FieldName = 'UserID'
    end
    object QCreditActive: TSmallintField
      FieldName = 'Active'
    end
  end
  object QReception: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CreditCardID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from TReception'
      'where CreditCardID = :CreditCardID'
      'order by ReceptionID DESC')
    Left = 528
    Top = 162
    object QReceptionReceptionID: TLargeintField
      FieldName = 'ReceptionID'
    end
    object QReceptionCustomerName: TWideStringField
      FieldName = 'CustomerName'
      Size = 100
    end
    object QReceptionReceptionDate: TStringField
      FieldName = 'ReceptionDate'
      FixedChar = True
      Size = 10
    end
    object QReceptionClosedID: TIntegerField
      FieldName = 'ClosedID'
    end
    object QReceptionNumberOfAdult: TIntegerField
      FieldName = 'NumberOfAdult'
    end
    object QReceptionNumberOfChild: TIntegerField
      FieldName = 'NumberOfChild'
    end
  end
  object dsCredit: TDataSource
    DataSet = QCredit
    Left = 49
    Top = 186
  end
  object dsReception: TDataSource
    DataSet = QReception
    Left = 536
    Top = 226
  end
  object QSummaryCredit: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'CreditCardID'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select isNull(sum(price), 0) sumPrice from TCreditCardCharge'
      'where CreditCardID = :CreditCardID')
    Left = 456
    Top = 48
  end
  object QDeleteCredit: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'CreditCardChargeID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'delete TCreditCardCharge'
      'where CreditCardChargeID = :CreditCardChargeID')
    Left = 49
    Top = 234
  end
  object PopupMenu1: TPopupMenu
    Left = 57
    Top = 338
    object mnuDeleteCreditCardCharge: TMenuItem
      Caption = #1581#1584#1601' '#1588#1575#1585#1688
      OnClick = mnuDeleteCreditCardChargeClick
    end
  end
end
