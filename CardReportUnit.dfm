object frmCardReport: TfrmCardReport
  Left = 390
  Top = 228
  Width = 630
  Height = 640
  BiDiMode = bdRightToLeft
  Caption = #1711#1586#1575#1585#1588' '#1705#1575#1585#1578#1607#1575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 28
  object DBGrid1: TDBGrid
    Left = 0
    Top = 129
    Width = 614
    Height = 410
    Align = alClient
    DataSource = dsViewBargain
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
        FieldName = 'CardID'
        Title.Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CompanyName'
        Title.Caption = #1606#1575#1605' '#1575#1587#1578#1601#1575#1583#1607' '#1705#1606#1606#1583#1607
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CompanyName'
        Title.Caption = #1589#1575#1581#1576' '#1602#1585#1575#1585#1583#1575#1583
        Width = 258
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 539
    Width = 614
    Height = 62
    Align = alBottom
    TabOrder = 1
    object BtnReturn: TBitBtn
      Left = 26
      Top = 14
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
    object BtnPrint: TBitBtn
      Left = 125
      Top = 15
      Width = 108
      Height = 36
      Caption = #1670#1575#1662'  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtnPrintClick
      Glyph.Data = {
        060C0000424D060C00000000000036000000280000001C0000001B0000000100
        200000000000D00B0000120B0000120B00000000000000000000D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00DAEAEC00DEECEE00DEEBEE00D9E9EC00D8E9EC00D8E9
        EC00D9E9EC00DAEAED00DBEAEC00DBEAED00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00DCEBEE00DFECEE00D1D4D4009F9F
        9F00A2A3A300CED2D300E0EAEC00E0ECEE00D3DBDC00BEC2C300D1D1D100E9EB
        EB00DAE9EC00DEECEF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D9E9EC00E3EF
        F200DDE3E500A2A2A200949494006B6B6B005151510055565600797C7C00938C
        8C0090888800616060005858580087888800C3C5C500E5E9EA00E1EEF000E7F1
        F300DAE9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D9EAED00E3E9EA00AEAEAE008C8D8D00A8A8A800EBEBEB00C2C2
        C2009E9F9F007B7A7A00705E5E0084676700AC9E9E00B6B5B5009A9A9A006666
        66004B4B4B0072727200AAAAAA00DBDBDB00E7EEEF00D7E8EB00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E8EFF100D1D5D6008D8D8D009F9F
        9F00D9D9D900FDFDFD00F4F4F400B7B7B700BBBCBC00B7B4B400826F6F006F64
        64007676760099999900BABABA00C1C1C100AFAFAF007C7C7C00505050005F5F
        5F0095959500CED7D900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00EAF1
        F200A2A2A20090909000D5D5D500F6F6F600FBFBFB00EDEDED00E7E7E700B1B1
        B100AFAFAF00ADADAD005C5C5C003F414100585858006A696900808080009E9E
        9E00BDBDBD00CECECE00CACACA009B9B9B0078787800BBBCBC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00EEF6F700B9B9B900C8C8C800F3F3F300FCFCFC00F3F3
        F300EDEDED00E9E9E900E3E3E300AEAEAE00A8A8A800AEAEAE00ADADAD009999
        99007F7F7F00717171006F6F6F007E7E7E0093939300ABABAB00BABABA009898
        98009E9E9E00DDEAEC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00ECF2F300C6C6
        C600F5F5F500F8F8F800F3F3F300F0F0F000E7E7E700D4D4D400BBBBBB009393
        930098989800A3A3A300ADADAD00B6B6B600BDBDBD00B4B4B400AAAAAA009B9B
        9B00757575006E6D6D00B6B5B6006F6F6F00BEC4C500D9E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00EEF4F500C6C6C600F5F5F500F6F6F600E7E7E700CCCC
        CC00B1B1B100AAAAAA00B9B9B9009595950087878700898989008E8E8E009999
        9900A5A5A500B2B2B200BDBDBD00C4C4C400BCBCBC00ABAAAB00C5C5C5007878
        7800C1C7C800D8E8EB00DAEAED00E9F2F400E8F2F400E6F1F300F6F9FA00C3C3
        C300DCDCDC00C8C8C800B1B1B100B0B0B000C4C4C400D8D8D800DCDCDC00C6C6
        C600B8B8B800A6A6A6009A9A9A008E8E8E008A8A8A00929292009A9A9A00A5A5
        A500BAB6B900B2C3B90090BFA00069736C00C2C7C800D8E8EB00DCEBEE00EBE8
        E700E9E6E500EAE7E600EAE6E600A8A8A800B2B2B200BEBEBE00D0D0D000E3E3
        E300DEDEDE00CFCFCF00DEDEDE00F0F0F000E4E4E400E0E0E000D4D4D400C9C9
        C900BBBBBB00A6A6A6009A9A9A0094949400979496008A988F00739A81006068
        6300C4C9CB00D8E8EB00CDDADF0076828900626F7600647279005E6C71009B9C
        9C00E1DFDE00E6E6E600E3E3E300D8D8D800CECECE00D6D6D600EBEBEB00C9C9
        C900D0D0D000D0D0D000D3D3D300D7D7D700DADADA00E0E0E000D7D7D700C4C4
        C400B4B5B400ACABAC00A5A0A40067676700B9BBBB00D8E8EA003291BA002988
        B400338DBA00318FBC002082B0009EBCCB00EDE9E600DFDEDE00D6D6D600CFCF
        CF00D3D3D300EBEBEB00D0D0D000DADADA00EDEDED00E5E5E500D9D9D900D0D0
        D000CCCCCC00C7C7C700CACACA00D8D8D800DBDBDB00DAD9D900D2D1D1008181
        8200C1C1C100D9E8EB0034A1D00056C0F0006FD6FF006AD2FF0061CFFF0091BE
        D500DED9D600DBD7D600D3D2D100D7D7D700E2E2E200D3D3D300E0E0E000F7F7
        F700F4F4F400F2F2F200F0F0F000EDEDED00E7E7E700E1E1E100D8D8D800C9C9
        C900C3C3C300CCCCCC00C1C1C100A1A1A100E1E1E100DBEAED004BACD4005FBC
        E70079DDFF0070D5FF0071D9FF006FCDF30097C1D100B5C1C600BFC3C600CBCB
        CB00CDCECD00C8C7C800D3D3D300E4E3E300EBEAEA00EEEEEE00F0F0F000EFEF
        EF00EDEDED00ECECEC00ECECEC00EDEDED00E4E4E400BCBCBC009B9B9B00CBCB
        CB00DDEBEE00D8E9EC0053B4D40061B7DE007FE0FF0074DBFF0076DBFF0075DD
        FF006FDCFF006ACDED008BB8C900DFDAD800F2F5F700C2C5C9009CA0A200A9AC
        AD00B5B8B900C7C8C900D6D6D700DFDFDF00E3E2E100EBEBEB00E9E9E900DCDC
        DC00C2C3C300B5B5B500CECFD000DCE9EC00D8E9EC00D8E9EC005BC0DB005FB8
        DE008AE1FD007AE2FF007BE0FF007BE0FF007CE1FF0077E3FD0099D3E600F0E6
        E300FFEDE800E2C5C000CCB9B500C7BDBC00C3BFC000BFBFC000BFC2C500C6CB
        D000DBDFE100C1C1C100B6B6B600CBCDCD00C4C6C600D3DBDD00E0ECEE00D8E9
        EC00D8E9EC00D8E9EC005EC7DF0057B6DD009DE4FA007DE8FF0080E6FF0080E6
        FF0080E6FF007FE6FF007FDBF100B5C4C200FFC9A200FFCFAB00FFD2B200FDCE
        B100F7CEB300F0D1BA00ECD4C000E9D7C600DCD5D0009B9A9C00C6C6C600D8E4
        E700DCE8EA00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0066CBE4005BBB
        E500A5E4F60084EFFF0086EDFF0087EDFF0087EDFF0086EFFF007EE5F500B7C0
        B900FFD9AC00FFDCB300FFD8B000FFD8AF00FFD9B000FFD9B100FFDAB100FFE2
        B600A68C7E009A999C00F5F7F700D9E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC0071D0E70062C2EF009DDEF30096F7FF0089F2FF008CF2
        FF008CF2FF008AF5FF008CE4ED00D2BFAF00FFE2BE00FFE0BF00FFE0C000FFE0
        C000FFE0BF00FFE0BF00FFE3C100FFDEBC00948076008E8E9000EEF0F000D9E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007CD3E90068C9
        FA0095DAF400AAFFFF0089F8FF0090F8FF0090F9FF008CF9FF0098D8DD00EACE
        B900FFE8CC00FFE4CA00FFE4CA00FFE4CA00FFE4CA00FFE4CA00FFEACF00F3D8
        C100B4A8A40087898A00E2E2E200D9E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC0083D5EA006FD2FD008ED6F800BDFFFF009FFFFF00A3FE
        FF00A3FFFF009EFAFB00B0CFCC00FBDCC700FFEFD900FFEAD500FFEAD500FFEA
        D500FFEAD500FFEAD500FFEDD600E5DCCC00CCD1D100B5B5B600E6E9EA00D9E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0089D7EB007CDE
        FF0071D2FD009EE0FE00ADEBFF00A8EAFF00A8EBFF00A4E1F500D0C6C000FFF0
        DE00FFF0E000FFEFDF00FFEFDF00FFEFDF00FFEFDF00FFF2E200FDEBD900D3C7
        BF00D1D4D400E8ECED00DAEAEC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC0090D9EC0087E9FF0078E2FF0072DCFF0077DBFF0078DB
        FF0074E1FE0083BFD900ECD7CF00FFFCEF00FFF3E700FFF4E800FFF4E800FFF4
        E800FFF4E800FFFDF100E9DBD000AB979500D8DEDF00DBEBED00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009DDDED0099F5
        FF007DECFF0084EDFF0081ECFF0081EEFF0082E0EE00CFD0D000FFFFFE00FFFF
        FD00FFFFFA00FFFFFB00FFFFFA00FFFFFB00FFFFFD00FFFFFC00C9C0BE00B5B2
        B500E4F0F200D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC009BD4E700CFFAFD00AEFEFF00A4FCFF00A6FDFF00A4FF
        FF00BAE0E200A2B2BD00BBC3C800E2DDDD00E7E3E200E4D9D800E8DEDE00E1DF
        E000E5DBDB00E3D9D900D7D3D300E7F0F100D9E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00CCE5EB009ED5
        E8009BDBED009ADDED009ADCED009EDDED008CD0E60090CADE00DAE8EA00D8E8
        EB00D9E8EA00D8E5E800D9E6E900DCEAED00F0EDEE00DBE8EB00D9E7EA00DAEA
        ED00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 129
    Align = alTop
    TabOrder = 2
    object Label14: TLabel
      Left = 556
      Top = 15
      Width = 42
      Height = 26
      Caption = #1575#1586' '#1578#1575#1585#1610#1582':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 449
      Top = 15
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
    object Label12: TLabel
      Left = 272
      Top = 16
      Width = 67
      Height = 27
      Caption = #1606#1575#1605' '#1588#1585#1705#1578':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 273
      Top = 58
      Width = 90
      Height = 27
      Caption = #1588#1605#1575#1585#1607' '#1602#1585#1575#1585#1583#1575#1583':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtStartDate: TMaskEdit
      Left = 465
      Top = 11
      Width = 90
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
      Left = 356
      Top = 11
      Width = 88
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
    object BBtnAccept: TBitBtn
      Left = 6
      Top = 97
      Width = 603
      Height = 24
      Caption = #1580#1587#1578#1580#1608
      TabOrder = 2
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
    object edtCompanyID: TEdit
      Left = 228
      Top = 14
      Width = 41
      Height = 34
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edtCompanyName: TEdit
      Left = 53
      Top = 14
      Width = 176
      Height = 34
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object btnCompany: TBitBtn
      Left = 17
      Top = 14
      Width = 35
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnCompanyClick
      Glyph.Data = {
        B6040000424DB604000000000000360000002800000012000000100000000100
        20000000000080040000120B0000120B00000000000000000000D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D7E8EB00D8E9EC00CADBE100D6E6E900D8E9EC00D7E7
        EA00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EB00D7E8EB00A2B9D000496DA1001A20
        3B00D8E9EC00D8E9EC00D9EAEC00D8E9EC00DAEAEC00DAEAEC00D9E9EC00D9E9
        EC00D9E9EC00D9E9EC00D9E9EC00D9E9EC00D8E9EC00D6E5E700869FC1004A6E
        A3007E8B9E001A203B00D8E9EC00D8E9EC00D8E9EC00D8E9EC00DAEAEC00D9E9
        EC00D8E9EC00DBE8EB00D9E9EB00D8E9EC00D8E9EC00D8E9EC00D8E9EC0087A0
        C2004A6EA3007D8A9D001A203B00D2E1E500D8E9EC00D8E9EC00D8E9EC00DAEA
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC008C9DB2004A6EA3007E8B9E001A203B00BDC6CC00DAEAEC00D8E9EC00DAEA
        ED00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00CBC2A100978557001A203B001A203B00C9D7DB00D8E9EC00D9E9
        EC00D9EAED00D9EAEC00D8E9EC00D8E9EC00D8E9EC00989B940066604000403B
        200037321D00514D3A009EA39E00A7905200B6A8850060512A00C6D1D500D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00999063008479
        4500B1A97800C1B88700B4AE82008F8A6A003C371C00342F1C007A683500D4E1
        E000D8E9EC00D8E9EC00D8E9EC00DAEAED00DAEAED00DAEAED00D8E9EC00BBC3
        BE00A3955200D8D6C000D2CFB400CECAA900EBEBE300D4CFB100AFA983003C37
        1C00B8C1BF00D8E9EC00D9E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00A1955600D1CCA900DEDECF00D8D7C400D5D3BD00DBDAC800EFF0
        EE00E2E1D200908B6B004F4C3900D8E9EC00D9E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00A4985700E6E6DB00E2E4DC00DEDFD300D9D9
        C900D7D5C200D8D6C100E1E1D100B3AD830037321D00D8E9EC00D8E9EC00D9E9
        EC00D9EAEC00DBEAED00DBEAED00DAEAED00D8E9EC00BAAD6B00ECEDE700EAEB
        E900E1E3DC00DDDED300D9D9C900D4D2BD00CDC9AA00C1B98900403B2000D8E9
        EC00D8E9EC00D9E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C8C5
        9900E5E2D000F0F2F200E8EAE800E3E4DE00DFE0D400DAD9C700D3D0B700B3AB
        7D00645D3E00D8E9EC00D8E9EC00D8E9EC00E0EDEF00E0EDEF00E0EDEF00E0ED
        EF00D8E9EC00C3C5B700D6CEA300F6F7F700F2F4F400ECEEEB00E6E6DF00E2E1
        D300DDDBC60081774400A4A49F00DAEAED00DCEBEE00DBEBED00DEECEE00DEEC
        EE00DEECEE00DDECEE00D8E9EC00D8E9EC00CCC29000D7D5B400E6E3D000F0F0
        EB00ECECE100D6D0AF009F9352009E966800DBEAED00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C9CD
        C400C2B47300AE9E500098894500A1945600B0B0A700D9E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00}
    end
    object edtBargainNumber: TEdit
      Left = 160
      Top = 54
      Width = 112
      Height = 34
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  object dsViewBargain: TDataSource
    DataSet = QCard
    Left = 64
    Top = 152
  end
  object QCard: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'BargainNumber'
        Size = -1
        Value = Null
      end
      item
        Name = 'CompanyID'
        Size = -1
        Value = Null
      end
      item
        Name = 'StartDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'EndDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'Declare @StartDate Char(10), @EndDate Char(10), @BargainNumber n' +
        'varchar(10), @CompanyID int, @specialPOS nvarchar(20)'
      'set @BargainNumber = :BargainNumber'
      'set @CompanyID = :CompanyID'
      'Set @StartDate= :StartDate'
      'Set @EndDate= :EndDate'
      'set @specialPOS = '#39#1605#1582#1575#1576#1585#1575#1578' - '#1662#1608#1586#39
      ''
      ''
      ''
      'if @BargainNumber = '#39'-1'#39
      'begin'
      '  if @CompanyID = -1'
      '  begin'
      
        '    select TReception.CardID, CustomerName, (case TReception.Car' +
        'dID when 4 then @specialPOS else CompanyName end) as CompanyName' +
        ', TCompany.CompanyID from TReception'
      '    inner join TCard on TReception.CardID=TCard.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      '    inner join TCompany on TBargain.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID<>1'
      ''
      ''
      '    union'
      ''
      
        '    select TReception.CardID2, CustomerName, (case TReception.Ca' +
        'rdID2 when 4 then @specialPOS else CompanyName end) as CompanyNa' +
        'me, TCompany.CompanyID from TReception'
      '    inner join TCard on TReception.CardID2=TCard.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      '    inner join TCompany on TBargain.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID2<>1'
      ''
      '    union'
      ''
      
        '    select TReception.CardID3, CustomerName, (case TReception.Ca' +
        'rdID3 when 4 then @specialPOS else CompanyName end) as CompanyNa' +
        'me, TCompany.CompanyID from TReception'
      '    inner join TCard on TReception.CardID3=TCard.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      '    inner join TCompany on TBargain.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID3<>1'
      '    order by TCompany.CompanyID'
      '  end'
      '  else'
      '  begin'
      ''
      
        '    select TReception.CardID, CustomerName, (case TReception.Car' +
        'dID when 4 then @specialPOS else CompanyName end) as CompanyName' +
        ', TCompany.CompanyID from TReception'
      '    inner join TCard on TReception.CardID=TCard.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      '    inner join TCompany on TBargain.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID<>1 and TCompany.CompanyID = @CompanyID'
      ''
      ''
      '    union'
      ''
      
        '    select TReception.CardID2, CustomerName, (case TReception.Ca' +
        'rdID2 when 4 then @specialPOS else CompanyName end) as CompanyNa' +
        'me, TCompany.CompanyID from TReception'
      '    inner join TCard on TReception.CardID2=TCard.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      '    inner join TCompany on TBargain.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID2<>1 and TCompany.CompanyID = @CompanyID'
      ''
      '    union'
      ''
      
        '    select TReception.CardID3, CustomerName, (case TReception.Ca' +
        'rdID3 when 4 then @specialPOS else CompanyName end) as CompanyNa' +
        'me, TCompany.CompanyID from TReception'
      '    inner join TCard on TReception.CardID3=TCard.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      '    inner join TCompany on TBargain.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID3<>1 and TCompany.CompanyID = @CompanyID'
      '    order by TCompany.CompanyID'
      ''
      '  end'
      'end'
      'else'
      'begin'
      ''
      
        '    select TReception.CardID, CustomerName, (case TReception.Car' +
        'dID when 4 then @specialPOS else CompanyName end) as CompanyName' +
        ', TCompany.CompanyID from TReception'
      '    inner join TCard on TReception.CardID=TCard.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      '    inner join TCompany on TBargain.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID<>1 and BargainNumber = @BargainNumber'
      ''
      ''
      '    union'
      ''
      ''
      
        '    select TReception.CardID2, CustomerName, (case TReception.Ca' +
        'rdID2 when 4 then @specialPOS else CompanyName end) as CompanyNa' +
        'me, TCompany.CompanyID from TReception'
      '    inner join TCard on TReception.CardID2=TCard.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      '    inner join TCompany on TBargain.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID2<>1 and BargainNumber = @BargainNumber'
      ''
      '    union'
      ''
      
        '    select TReception.CardID3, CustomerName, (case TReception.Ca' +
        'rdID3 when 4 then @specialPOS else CompanyName end) as CompanyNa' +
        'me, TCompany.CompanyID from TReception'
      '    inner join TCard on TReception.CardID3=TCard.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      '    inner join TCompany on TBargain.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID3<>1 and BargainNumber = @BargainNumber'
      ''
      '    order by TCompany.CompanyID'
      ''
      'end'
      ''
      '')
    Left = 8
    Top = 152
  end
  object QGroupCard: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'BargainNumber'
        Size = -1
        Value = Null
      end
      item
        Name = 'CompanyID'
        Size = -1
        Value = Null
      end
      item
        Name = 'StartDate'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'EndDate'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'Declare @StartDate Char(10), @EndDate Char(10), @BargainNumber n' +
        'varchar(10), @CompanyID int, @specialPOS nvarchar(20)'
      'set @BargainNumber = :BargainNumber'
      'set @CompanyID = :CompanyID'
      'Set @StartDate= :StartDate'
      'Set @EndDate= :EndDate'
      'set @specialPOS = '#39#1605#1582#1575#1576#1585#1575#1578' - '#1662#1608#1586#39
      'if @BargainNumber = '#39'-1'#39
      'begin'
      '  if @CompanyID = '#39'-1'#39
      '  begin'
      
        '    select (case T1.CompanyID when 1 then @specialPOS else Compa' +
        'nyName end) as CompanyName, T1.CompanyID, (Count(ReceptionID)+'
      '    (select Count(ReceptionID)'
      
        '    from TReception inner join TCard on Treception.CardID2=TCard' +
        '.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID2<>1 and CompanyID=T1.CompanyID)+'
      ''
      '    (select  Count(ReceptionID)'
      
        '    from TReception inner join TCard on Treception.CardID3=TCard' +
        '.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID3<>1 and CompanyID=T1.CompanyID))'
      ''
      '    as CardNumber'
      
        '    from TReception  inner join TCard on TReception.CardID=TCard' +
        '.CardID'
      '    inner join TBargain as T1 on TCard.BargainID=T1.BargainID'
      '    inner join TCompany  on T1.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID<>1 and TCompany.CompanyID=T1.CompanyID'
      '    Group by CompanyName, T1.CompanyID'
      '  end'
      '  else'
      '  begin'
      
        '    select (case T1.CompanyID when 1 then @specialPOS else Compa' +
        'nyName end) as CompanyName, T1.CompanyID, (Count(ReceptionID)+'
      '    (select Count(ReceptionID)'
      
        '    from TReception inner join TCard on Treception.CardID2=TCard' +
        '.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID2<>1 and CompanyID = @CompanyID)+'
      ''
      '    (select  Count(ReceptionID)'
      
        '    from TReception inner join TCard on Treception.CardID3=TCard' +
        '.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID3<>1 and CompanyID = @CompanyID))'
      ''
      '    as CardNumber'
      
        '    from TReception  inner join TCard on TReception.CardID=TCard' +
        '.CardID'
      '    inner join TBargain as T1 on TCard.BargainID=T1.BargainID'
      '    inner join TCompany  on T1.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID<>1 and TCompany.CompanyID = @CompanyID'
      '    Group by CompanyName, T1.CompanyID'
      '  end'
      'end'
      'else'
      'begin'
      
        '    select (case T1.CompanyID when 1 then @specialPOS else Compa' +
        'nyName end) as CompanyName, T1.CompanyID, (Count(ReceptionID)+'
      '    (select Count(ReceptionID)'
      
        '    from TReception inner join TCard on Treception.CardID2=TCard' +
        '.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID2<>1 and CompanyID=T1.CompanyID and Barga' +
        'inNumber = @BargainNumber)  +'
      ''
      '    (select  Count(ReceptionID)'
      
        '    from TReception inner join TCard on Treception.CardID3=TCard' +
        '.CardID'
      '    inner join TBargain on TCard.BargainID=TBargain.BargainID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID3<>1 and CompanyID=T1.CompanyID and Barga' +
        'inNumber = @BargainNumber ))'
      ''
      '    as CardNumber'
      
        '    from TReception  inner join TCard on TReception.CardID=TCard' +
        '.CardID'
      '    inner join TBargain as T1 on TCard.BargainID=T1.BargainID'
      '    inner join TCompany  on T1.CompanyID=TCompany.CompanyID'
      
        '    where ReceptionDate>= @StartDate and ReceptionDate<= @EndDat' +
        'e and TReception.CardID<>1 and TCompany.CompanyID=T1.CompanyID a' +
        'nd BargainNumber = @BargainNumber'
      '    Group by CompanyName, T1.CompanyID'
      'end')
    Left = 8
    Top = 192
  end
  object QRCompositeReport: TQRCompositeReport
    OnAddReports = QRCompositeReportAddReports
    Options = []
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Orientation = poPortrait
    PrinterSettings.PaperSize = Letter
    Left = 64
    Top = 192
  end
end
