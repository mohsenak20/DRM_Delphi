object frmGeneralReport: TfrmGeneralReport
  Left = 551
  Top = 181
  Width = 834
  Height = 702
  BiDiMode = bdRightToLeft
  Caption = #1711#1586#1575#1585#1588' '#1585#1608#1586#1575#1606#1607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 818
    Height = 97
    Align = alTop
    TabOrder = 0
    object lblStartDate: TLabel
      Left = 742
      Top = 25
      Width = 47
      Height = 29
      Caption = #1575#1586' '#1578#1575#1585#1610#1582':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 160
      Top = 27
      Width = 43
      Height = 26
      Caption = #1575#1586' '#1587#1575#1593#1578
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 90
      Top = 27
      Width = 15
      Height = 26
      Caption = #1575#1604#1610
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEndDate: TLabel
      Left = 626
      Top = 25
      Width = 18
      Height = 29
      Caption = #1575#1604#1610
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtStartDate: TMaskEdit
      Left = 646
      Top = 23
      Width = 94
      Height = 34
      Color = clInfoBk
      EditMask = '1000/00/00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '1   /  /  '
    end
    object edtEndDate: TMaskEdit
      Left = 534
      Top = 23
      Width = 89
      Height = 34
      Color = clInfoBk
      EditMask = '1000/00/00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '1   /  /  '
    end
    object edtStartTime: TMaskEdit
      Left = 111
      Top = 23
      Width = 48
      Height = 34
      Color = clInfoBk
      EditMask = '00:00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      Text = '  :  '
    end
    object edtEndTime: TMaskEdit
      Left = 41
      Top = 23
      Width = 46
      Height = 34
      Color = clInfoBk
      EditMask = '00:00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 3
      Text = '  :  '
    end
    object BBtnAccept: TBitBtn
      Left = 5
      Top = 60
      Width = 808
      Height = 32
      Caption = #1580#1587#1578#1580#1608
      TabOrder = 4
      OnClick = BBtnAcceptClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 592
    Width = 818
    Height = 71
    Align = alBottom
    TabOrder = 1
    object Label5: TLabel
      Left = 260
      Top = 22
      Width = 51
      Height = 29
      Caption = #1605#1576#1604#1594' '#1705#1604':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAllSum: TLabel
      Left = 197
      Top = 22
      Width = 51
      Height = 29
      Caption = #1605#1576#1604#1594' '#1705#1604':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnReturn: TBitBtn
      Left = 26
      Top = 19
      Width = 87
      Height = 36
      Caption = #1576#1575#1586#1711#1588#1578
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
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
  object Panel3: TPanel
    Left = 520
    Top = 97
    Width = 298
    Height = 495
    Align = alRight
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 296
      Height = 327
      Align = alClient
      DataSource = dsReport
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
          FieldName = 'ReceptionTitle'
          Title.Caption = #1593#1606#1608#1575#1606
          Width = 143
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numberOfAdult'
          Title.Caption = #1578#1593#1583#1575#1583
          Width = 91
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 1
      Top = 328
      Width = 296
      Height = 166
      Align = alBottom
      TabOrder = 1
      object Label13: TLabel
        Left = 188
        Top = 84
        Width = 60
        Height = 29
        Caption = #1578#1593#1583#1575#1583' '#1705#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSum: TLabel
        Left = 116
        Top = 84
        Width = 60
        Height = 29
        Caption = #1578#1593#1583#1575#1583' '#1705#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 188
        Top = 48
        Width = 94
        Height = 29
        Caption = #1578#1593#1583#1575#1583' '#1582#1585#1583#1587#1575#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSumChild: TLabel
        Left = 116
        Top = 48
        Width = 60
        Height = 29
        Caption = #1578#1593#1583#1575#1583' '#1705#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 188
        Top = 13
        Width = 96
        Height = 29
        Caption = #1578#1593#1583#1575#1583' '#1576#1586#1585#1711#1587#1575#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSumAdult: TLabel
        Left = 116
        Top = 13
        Width = 60
        Height = 29
        Caption = #1578#1593#1583#1575#1583' '#1705#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 188
        Top = 122
        Width = 51
        Height = 29
        Caption = #1605#1576#1604#1594' '#1705#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSumPrice: TLabel
        Left = 125
        Top = 122
        Width = 51
        Height = 29
        Caption = #1605#1576#1604#1594' '#1705#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel4: TPanel
    Left = 257
    Top = 97
    Width = 263
    Height = 495
    Align = alClient
    TabOrder = 3
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 261
      Height = 452
      Align = alClient
      DataSource = dsDebit
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
          FieldName = 'CreditGroupName'
          Title.Caption = #1711#1585#1608#1607
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Price'
          Title.Caption = #1605#1576#1604#1594
          Width = 95
          Visible = True
        end>
    end
    object Panel6: TPanel
      Left = 1
      Top = 453
      Width = 261
      Height = 41
      Align = alBottom
      TabOrder = 1
      object Label2: TLabel
        Left = 102
        Top = 6
        Width = 153
        Height = 29
        Caption = #1588#1575#1585#1688' '#1705#1575#1585#1578' '#1607#1575#1610' '#1593#1590#1608#1610#1578':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSumDebit: TLabel
        Left = 45
        Top = 6
        Width = 51
        Height = 29
        Caption = #1605#1576#1604#1594' '#1705#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 97
    Width = 257
    Height = 495
    Align = alLeft
    TabOrder = 4
    object DBGrid3: TDBGrid
      Left = 1
      Top = 1
      Width = 255
      Height = 452
      Align = alClient
      DataSource = dsOrder
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
          FieldName = 'OrderType'
          Title.Caption = #1711#1585#1608#1607' '#1576#1585#1711#1607' '#1578#1582#1601#1610#1601
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sumOrderCount'
          Title.Caption = #1578#1593#1583#1575#1583
          Width = 95
          Visible = True
        end>
    end
    object Panel8: TPanel
      Left = 1
      Top = 453
      Width = 255
      Height = 41
      Align = alBottom
      TabOrder = 1
      object Label7: TLabel
        Left = 171
        Top = 6
        Width = 60
        Height = 29
        Caption = #1578#1593#1583#1575#1583' '#1705#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 85
        Top = 6
        Width = 51
        Height = 29
        Caption = #1605#1576#1604#1594' '#1705#1604':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object QReport: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select ReceptionTitle, sum(NumberOfAdult)  numberOfAdult'
      
        'from TReception inner join TReceptionType on TReception.Receptio' +
        'nType = TReceptionType.ReceptionTypeID'
      'group by ReceptionTitle')
    Left = 512
    Top = 184
  end
  object dsReport: TDataSource
    DataSet = QReport
    Left = 568
    Top = 184
  end
  object dsDebit: TDataSource
    DataSet = QDebit
    Left = 384
    Top = 176
  end
  object QDebit: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      
        'select CreditCardID, name+'#39' '#39'+lastName name, TCReditGroup.Credit' +
        'GroupName, TCreditCardCharge.Price '
      'from TCreditCardCharge '
      
        'inner join TCreditCard on TCreditCardCharge.CreditCardID = TCred' +
        'itCard.CardID'
      
        'inner join TCReditGroup on TCreditCard.CreditGroupID = TCReditGr' +
        'oup.CreditGroupID')
    Left = 328
    Top = 176
  end
  object QOrder: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      
        'select TOrderType.OrderType, isNull(sum(NumberOfAdult), 0) sumOr' +
        'derCount from TOrder inner join TOrderType on TOrder.OrderType =' +
        ' TOrderType.id'
      'inner join TReception on TOrder.OrderID = TReception.OrderNumber'
      'group by TOrderType.OrderType')
    Left = 48
    Top = 200
  end
  object dsOrder: TDataSource
    DataSet = QOrder
    Left = 104
    Top = 200
  end
end
