object frmReceptionChart: TfrmReceptionChart
  Left = 371
  Top = 325
  Width = 840
  Height = 743
  BiDiMode = bdRightToLeft
  Caption = #1606#1605#1608#1583#1575#1585' '#1662#1584#1610#1585#1588
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 247
      Top = 17
      Width = 43
      Height = 28
      Caption = #1575#1586' '#1578#1575#1585#1610#1582':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 122
      Top = 17
      Width = 16
      Height = 28
      Caption = #1575#1604#1610
    end
    object Label1: TLabel
      Left = 763
      Top = 17
      Width = 43
      Height = 28
      Caption = #1575#1586' '#1578#1575#1585#1610#1582':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 643
      Top = 17
      Width = 16
      Height = 28
      Caption = #1575#1604#1610
    end
    object edtStartDate2: TMaskEdit
      Left = 146
      Top = 13
      Width = 103
      Height = 37
      Color = clInfoBk
      EditMask = '1000/00/00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '1   /  /  '
    end
    object edtEndDate2: TMaskEdit
      Left = 21
      Top = 13
      Width = 97
      Height = 37
      Color = clInfoBk
      EditMask = '1000/00/00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '1   /  /  '
    end
    object BBtnAccept: TBitBtn
      Left = 21
      Top = 60
      Width = 794
      Height = 25
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
    object edtStartDate1: TMaskEdit
      Left = 664
      Top = 13
      Width = 99
      Height = 37
      Color = clInfoBk
      EditMask = '1000/00/00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '1   /  /  '
    end
    object edtEndDate1: TMaskEdit
      Left = 543
      Top = 13
      Width = 97
      Height = 37
      Color = clInfoBk
      EditMask = '1000/00/00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '1   /  /  '
    end
    object rbMen: TRadioButton
      Left = 468
      Top = 23
      Width = 57
      Height = 17
      Caption = #1570#1602#1575#1610#1575#1606
      TabOrder = 5
    end
    object rbWomen: TRadioButton
      Left = 384
      Top = 23
      Width = 57
      Height = 17
      Caption = #1576#1575#1606#1608#1575#1606
      TabOrder = 6
    end
    object RadioButton3: TRadioButton
      Left = 300
      Top = 23
      Width = 57
      Height = 17
      Caption = #1607#1585#1583#1608
      Checked = True
      TabOrder = 7
      TabStop = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 655
    Width = 824
    Height = 49
    Align = alBottom
    TabOrder = 1
    object btnReturn: TBitBtn
      Left = 9
      Top = 8
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
    object btnPrint: TBitBtn
      Left = 113
      Top = 8
      Width = 87
      Height = 36
      Caption = #1670#1575#1662' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
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
  object Panel3: TPanel
    Left = 0
    Top = 97
    Width = 824
    Height = 240
    Align = alTop
    TabOrder = 2
    object Chart: TChart
      Left = 1
      Top = 1
      Width = 822
      Height = 238
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.Visible = True
      LeftWall.Brush.Color = clWhite
      Title.Font.Charset = ARABIC_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -16
      Title.Font.Name = 'Koodak'
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        #1606#1605#1608#1583#1575#1585' '#1601#1585#1608#1588' '#1605#1581#1589#1608#1604#1575#1578)
      LeftAxis.LabelsFont.Charset = ARABIC_CHARSET
      LeftAxis.LabelsFont.Color = clBlack
      LeftAxis.LabelsFont.Height = -13
      LeftAxis.LabelsFont.Name = 'Arial'
      LeftAxis.LabelsFont.Style = [fsBold]
      LeftAxis.Title.Font.Charset = ARABIC_CHARSET
      LeftAxis.Title.Font.Color = clBlack
      LeftAxis.Title.Font.Height = -13
      LeftAxis.Title.Font.Name = 'Koodak'
      LeftAxis.Title.Font.Style = [fsBold]
      LeftAxis.TitleSize = 2
      LeftAxis.Visible = False
      Legend.Font.Charset = ARABIC_CHARSET
      Legend.Font.Color = clBlack
      Legend.Font.Height = -13
      Legend.Font.Name = 'Koodak'
      Legend.Font.Style = [fsBold]
      Legend.Visible = False
      Align = alClient
      Color = 14215660
      TabOrder = 0
      object Series1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Font.Charset = ARABIC_CHARSET
        Marks.Font.Color = clBlack
        Marks.Font.Height = -13
        Marks.Font.Name = 'Koodak'
        Marks.Font.Style = [fsBold]
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clTeal
        Title = #1578#1575#1585#1610#1582' '#1575#1608#1604
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
      object Series2: TBarSeries
        Marks.ArrowLength = 20
        Marks.Font.Charset = ARABIC_CHARSET
        Marks.Font.Color = clBlack
        Marks.Font.Height = -13
        Marks.Font.Name = 'Koodak'
        Marks.Font.Style = [fsBold]
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clRed
        Title = #1578#1575#1585#1610#1582' '#1583#1608#1605
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 337
    Width = 824
    Height = 318
    Align = alClient
    TabOrder = 3
    object Chart1: TChart
      Left = 1
      Top = 1
      Width = 407
      Height = 316
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.EndColor = 8421631
      Gradient.Visible = True
      Title.Font.Charset = ARABIC_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -16
      Title.Font.Name = 'Koodak'
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        #1606#1605#1608#1583#1575#1585' '#1601#1585#1608#1588' '#1605#1581#1589#1608#1604#1575#1578)
      LeftAxis.LabelsFont.Charset = ARABIC_CHARSET
      LeftAxis.LabelsFont.Color = clBlack
      LeftAxis.LabelsFont.Height = -13
      LeftAxis.LabelsFont.Name = 'Arial'
      LeftAxis.LabelsFont.Style = [fsBold]
      LeftAxis.Title.Font.Charset = ARABIC_CHARSET
      LeftAxis.Title.Font.Color = clBlack
      LeftAxis.Title.Font.Height = -13
      LeftAxis.Title.Font.Name = 'Koodak'
      LeftAxis.Title.Font.Style = [fsBold]
      LeftAxis.Visible = False
      Legend.Font.Charset = ARABIC_CHARSET
      Legend.Font.Color = clBlack
      Legend.Font.Height = -16
      Legend.Font.Name = 'Koodak'
      Legend.Font.Style = [fsBold]
      Legend.Visible = False
      Align = alClient
      TabOrder = 0
      object BarSeries8: TBarSeries
        Marks.ArrowLength = 20
        Marks.Font.Charset = ARABIC_CHARSET
        Marks.Font.Color = clBlack
        Marks.Font.Height = -13
        Marks.Font.Name = 'Koodak'
        Marks.Font.Style = [fsBold]
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clTeal
        Title = #1578#1575#1585#1610#1582' '#1575#1608#1604
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
      object Series3: TBarSeries
        Marks.ArrowLength = 20
        Marks.Font.Charset = ARABIC_CHARSET
        Marks.Font.Color = clBlack
        Marks.Font.Height = -13
        Marks.Font.Name = 'Koodak'
        Marks.Font.Style = [fsBold]
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clRed
        Title = #1578#1575#1585#1610#1582' '#1583#1608#1605
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
    end
    object Chart2: TChart
      Left = 408
      Top = 1
      Width = 415
      Height = 316
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Foot.Font.Charset = DEFAULT_CHARSET
      Foot.Font.Color = clRed
      Foot.Font.Height = -13
      Foot.Font.Name = 'Koodak'
      Foot.Font.Style = [fsItalic]
      Gradient.EndColor = 4227327
      Gradient.Visible = True
      Title.Font.Charset = ARABIC_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -16
      Title.Font.Name = 'Koodak'
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        #1606#1605#1608#1583#1575#1585' '#1601#1585#1608#1588' '#1605#1581#1589#1608#1604#1575#1578)
      LeftAxis.LabelsFont.Charset = ARABIC_CHARSET
      LeftAxis.LabelsFont.Color = clBlack
      LeftAxis.LabelsFont.Height = -13
      LeftAxis.LabelsFont.Name = 'Arial'
      LeftAxis.LabelsFont.Style = [fsBold]
      LeftAxis.Title.Font.Charset = ARABIC_CHARSET
      LeftAxis.Title.Font.Color = clBlack
      LeftAxis.Title.Font.Height = -13
      LeftAxis.Title.Font.Name = 'Koodak'
      LeftAxis.Title.Font.Style = [fsBold]
      LeftAxis.Visible = False
      Legend.Font.Charset = ARABIC_CHARSET
      Legend.Font.Color = clBlack
      Legend.Font.Height = -13
      Legend.Font.Name = 'Koodak'
      Legend.Font.Style = [fsBold]
      Legend.Visible = False
      Align = alRight
      TabOrder = 1
      object BarSeries1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Font.Charset = ARABIC_CHARSET
        Marks.Font.Color = clBlack
        Marks.Font.Height = -13
        Marks.Font.Name = 'Koodak'
        Marks.Font.Style = [fsBold]
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clTeal
        Title = #1578#1575#1585#1610#1582' '#1575#1608#1604
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
      object BarSeries2: TBarSeries
        Marks.ArrowLength = 20
        Marks.Font.Charset = ARABIC_CHARSET
        Marks.Font.Color = clBlack
        Marks.Font.Height = -13
        Marks.Font.Name = 'Koodak'
        Marks.Font.Style = [fsBold]
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clRed
        Title = #1578#1575#1585#1610#1582' '#1583#1608#1605
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
    end
  end
  object QReception: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'StartDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'EndDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'service_center_id'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'Declare @StartDate char(10), @EndDate char(10), @service_center_' +
        'id int'
      'set @StartDate= :StartDate'
      'set @EndDate= :EndDate'
      'set @service_center_id = :service_center_id'
      'if @service_center_id = -1'
      'begin'
      
        '  select sum(cast(Price as bigint)) as Reception, (select Sum(ca' +
        'st(Price as bigint)) from TReception where'
      
        '  ReceptionDate>=@StartDate and ReceptionDate<=@EndDate and Cust' +
        'omerType=1) as Bozorgsal,'
      '  (select Sum(cast(Price as bigint)) from TReception where'
      
        '  ReceptionDate>=@StartDate and ReceptionDate<=@EndDate and Cust' +
        'omerType=2) as Khordsal,'
      
        '  (select sum(NumberOfAdult) from TReception where  ReceptionDat' +
        'e>=@StartDate and ReceptionDate<=@EndDate) as TedadB,'
      
        '  (select sum(NumberOfChild) from TReception where  ReceptionDat' +
        'e>=@StartDate and ReceptionDate<=@EndDate) as TedadK,'
      
        '  (select sum(NumberOfAdult)+sum(NumberOfChild) from TReception ' +
        'where ReceptionDate>=@StartDate and ReceptionDate<=@EndDate) as ' +
        'TBK,'
      
        '  (select Sum(cast(TCredit.Credit as bigint)) from TReception in' +
        'ner join TCredit on TReception.ReceptionID=TCredit.ReceptionID w' +
        'here ReceptionDate>=@StartDate and ReceptionDate<=@EndDate) as C' +
        'harge,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate) as SumFactor,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=4) as FastFood1,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=377) as FastFood2,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=20) as CofeeShop,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=28) as Photo,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=32 and ProductID<>157) as Sona,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=285) as Hamam1,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=281) as Hamam2,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=38) as Revagh,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=95) as Joice,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=52) as Orange,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=49) as sport1,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=50) as sport2,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=378) as CofeeShop2,'
      
        '  (select Count(ReceptionID) from TReception where ReceptionDate' +
        '>=@StartDate and ReceptionDate<=@EndDate and CardID<>1) as CardC' +
        'ount'
      
        '  from TReception where ReceptionDate>=@StartDate and ReceptionD' +
        'ate<=@EndDate'
      'end'
      'else'
      'begin'
      
        '  select sum(cast(Price as bigint)) as Reception, (select Sum(ca' +
        'st(Price as bigint)) from TReception where'
      
        '  ReceptionDate>=@StartDate and ReceptionDate<=@EndDate and Cust' +
        'omerType=1 and service_center_id = @service_center_id) as Bozorg' +
        'sal,'
      '  (select Sum(cast(Price as bigint)) from TReception where'
      
        '  ReceptionDate>=@StartDate and ReceptionDate<=@EndDate and Cust' +
        'omerType=2  and service_center_id = @service_center_id) as Khord' +
        'sal,'
      
        '  (select sum(NumberOfAdult) from TReception where  ReceptionDat' +
        'e>=@StartDate and ReceptionDate<=@EndDate  and service_center_id' +
        ' = @service_center_id) as TedadB,'
      
        '  (select sum(NumberOfChild) from TReception where  ReceptionDat' +
        'e>=@StartDate and ReceptionDate<=@EndDate  and service_center_id' +
        ' = @service_center_id) as TedadK,'
      
        '  (select sum(NumberOfAdult)+sum(NumberOfChild) from TReception ' +
        'where ReceptionDate>=@StartDate and ReceptionDate<=@EndDate and ' +
        'service_center_id = @service_center_id) as TBK,'
      
        '  (select Sum(cast(TCredit.Credit as bigint)) from TReception in' +
        'ner join TCredit on TReception.ReceptionID=TCredit.ReceptionID w' +
        'here ReceptionDate>=@StartDate and ReceptionDate<=@EndDate and s' +
        'ervice_center_id = @service_center_id) as Charge,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and service_center_id = @service_center_id) as SumFactor,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=4 and service_center_id = @service_cen' +
        'ter_id) as FastFood1,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=377 and service_center_id = @service_c' +
        'enter_id) as FastFood2,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=20 and service_center_id = @service_ce' +
        'nter_id) as CofeeShop,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=28 and service_center_id = @service_ce' +
        'nter_id) as Photo,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=32 and ProductID<>157 and service_cent' +
        'er_id = @service_center_id) as Sona,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=285 and service_center_id = @service_c' +
        'enter_id) as Hamam1,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=281 and service_center_id = @service_c' +
        'enter_id) as Hamam2,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=38 and service_center_id = @service_ce' +
        'nter_id) as Revagh,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=95 and service_center_id = @service_ce' +
        'nter_id) as Joice,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=52 and service_center_id = @service_ce' +
        'nter_id) as Orange,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=49 and service_center_id = @service_ce' +
        'nter_id) as sport1,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=50 and service_center_id = @service_ce' +
        'nter_id) as sport2,'
      
        '  (select Sum(cast(Number*TSubFactor.VahedPrice as bigint)) from' +
        ' TReception inner join TFactor on TReception.ReceptionID=TFactor' +
        '.ReceptionID inner join TSubFactor on TFactor.FactorID=TSubFacto' +
        'r.FactorID where ReceptionDate>=@StartDate and ReceptionDate<=@E' +
        'ndDate and TFactor.UserID=378 and service_center_id = @service_c' +
        'enter_id) as CofeeShop2,'
      
        '  (select Count(ReceptionID) from TReception where ReceptionDate' +
        '>=@StartDate and ReceptionDate<=@EndDate and CardID<>1 and servi' +
        'ce_center_id = @service_center_id) as CardCount'
      
        '  from TReception where ReceptionDate>=@StartDate and ReceptionD' +
        'ate<=@EndDate and service_center_id = @service_center_id'
      'end')
    Left = 16
    Top = 119
  end
end
