object frmExitFactoryReport: TfrmExitFactoryReport
  Left = 377
  Top = 140
  Width = 1033
  Height = 552
  BiDiMode = bdRightToLeft
  Caption = #1711#1586#1575#1585#1588' '#1582#1585#1608#1580' '#1575#1586' '#1705#1575#1585#1582#1575#1606#1607
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
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1017
    Height = 123
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 474
      Top = 13
      Width = 16
      Height = 28
      Caption = #1575#1604#1610
    end
    object Label1: TLabel
      Left = 596
      Top = 13
      Width = 43
      Height = 28
      Caption = #1575#1586' '#1578#1575#1585#1610#1582':'
    end
    object Label2: TLabel
      Left = 980
      Top = 56
      Width = 21
      Height = 28
      Caption = #1705#1575#1604#1575':'
    end
    object Label4: TLabel
      Left = 980
      Top = 13
      Width = 17
      Height = 28
      Caption = #1606#1575#1605':'
    end
    object Label5: TLabel
      Left = 283
      Top = 13
      Width = 47
      Height = 28
      Caption = #1575#1586' '#1588#1605#1575#1585#1607':'
    end
    object Label6: TLabel
      Left = 162
      Top = 10
      Width = 16
      Height = 28
      Caption = #1575#1604#1610
    end
    object edtStartDate: TMaskEdit
      Left = 495
      Top = 9
      Width = 95
      Height = 37
      Color = clInfoBk
      EditMask = '1300/00/00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '13  /  /  '
    end
    object edtEndDate: TMaskEdit
      Left = 376
      Top = 9
      Width = 93
      Height = 37
      Color = clInfoBk
      EditMask = '1300/00/00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
      Text = '13  /  /  '
    end
    object edtKalaID: TEdit
      Left = 882
      Top = 52
      Width = 92
      Height = 37
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object edtKalaName: TEdit
      Left = 744
      Top = 52
      Width = 134
      Height = 37
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object btnKala: TBitBtn
      Left = 710
      Top = 51
      Width = 33
      Height = 37
      TabOrder = 7
      OnClick = btnKalaClick
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
    object edtPersonID: TEdit
      Left = 882
      Top = 9
      Width = 92
      Height = 37
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edtPersonName: TEdit
      Left = 744
      Top = 9
      Width = 134
      Height = 37
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btnPerson: TBitBtn
      Left = 710
      Top = 8
      Width = 33
      Height = 37
      TabOrder = 2
      OnClick = btnPersonClick
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
    object BBtnAccept: TBitBtn
      Left = 16
      Top = 93
      Width = 993
      Height = 25
      Caption = #1580#1587#1578#1580#1608
      TabOrder = 10
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
    object edtStartSerialNumber: TEdit
      Left = 184
      Top = 9
      Width = 92
      Height = 37
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object edtEndSerialNumber: TEdit
      Left = 66
      Top = 9
      Width = 92
      Height = 37
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 396
    Width = 1017
    Height = 117
    Align = alBottom
    TabOrder = 1
    object Label7: TLabel
      Left = 152
      Top = 8
      Width = 84
      Height = 28
      Caption = #1580#1605#1593' '#1705#1604' '#1601#1585#1608#1588':'
    end
    object lblSum: TLabel
      Left = 103
      Top = 8
      Width = 45
      Height = 28
      Caption = 'lblSum'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object btnPrint: TBitBtn
      Left = 793
      Top = 76
      Width = 87
      Height = 36
      Caption = #1670#1575#1662' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnPrintClick
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
    object btnReturn: TBitBtn
      Left = 9
      Top = 76
      Width = 87
      Height = 36
      Caption = #1576#1575#1586#1711#1588#1578
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnReturnClick
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
    object btnGroup: TBitBtn
      Left = 891
      Top = 75
      Width = 116
      Height = 36
      Caption = #1576#1607' '#1578#1601#1705#1610#1705' '#1705#1575#1604#1575
      TabOrder = 2
      OnClick = btnGroupClick
      Glyph.Data = {
        5E0A0000424D5E0A0000000000003600000028000000190000001A0000000100
        200000000000280A0000120B0000120B00000000000000000000D8E9EC00DBEB
        ED00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00DAEAED00DAEAED00D9E9EC00DAEAED00D8E9EC00CAD9DE00C5D1DA002224
        4200151819000E101000CAD6D800BECDD000D8E9EC00D8E9EC00D9EAED00DCEC
        EF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00DDECEE00D8E9EC00D9E9EC00C3CDCE0042415300272A
        680043488600000001000404010000000000181E1A008A959700D0E0E200D8E9
        EC00DDECEF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00AFB7B9006C706E000D1428004F62
        9900869AFF003B449B0000000B00040201000209010000080000020200003438
        3800D8E8EA00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00D8E9EC00AAB3B8004B4F4F0004062400576CB1005E7A
        DD00698DFF006888FF002D3C9D00000017000200070001030100000105000602
        05000E050500BAC7C900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D8E9EC00CEDEE000A9B6B9002324380022263B0050669E006A8FE400577F
        F6005981FB004A72F9005E86FF00283DA100110C3800100D2300020208001A1C
        2B00666A7000C9D8DB00D6E6E900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00D6E6E900B3BEBE0048474B00272C3E003F4D9400759AFA005580EE004C7F
        EB005E97FF006298FF004274F7005B87FF00233AA2000C0B4900131545000D0F
        2600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
        EC00858E8F00797D7900161E39003D528A007092F900557EF9003F6EE9005E90
        FF00649CFF005C9CFF005F99FF004575F8006087FF002236A90001054E000D1B
        6F000F103D00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC008993
        96006265700012132B005C6E9F005B7EDD004F85FF003669F5004576F5005483
        FA006498FF005E97FF005E99FF006197FF004B75FA00607FFF002534AB000003
        51002A46B2000D2074005F667500D8E9EC00D8E9EC00D8E9EC00D3E0DF002628
        2A000B0D25004562AE005681E900507FF700446FEE005D85F5004873F6005283
        FA00427BF600629FFF00649AFF00648FFC00567DFE003F65F9006584FF002C3B
        AE0000004E003055D0001130A4001F233900D2E3E700D8E9EC00D8E9EC000B0B
        13004E577C0087A6FA004579EE003875FD003D79F9004D7FF400577FF900517A
        F6005584F8004A82F700538EFA005589F4004B74EB005A83FA004872FB006488
        FE002537A400000054002A4FD6003267F00000004E0098A1B100D8E9EC00D8E9
        EC00232657008AA8FA005780EA004071ED005288FB00467EF700467EF300538A
        F8004679F1005888FA004675F0004B7DF4004E81EF006D9FFB006A9EFE004477
        F2005D86FE00263AA90000005900182DBA002E5EF60012269A00585D8300D8E6
        E900D8E9EC00212857006C96E8005684ED004A7BFA005184FA004879F5004D7F
        F6005487FA003A6FF0004073F6004374F0006391FE006D9BFF00689CFA00659B
        FE004479F7005980FF002639B0000004590000008D003559FA00245DF2000000
        3700C1C9D100D8E9EC00212851006E9BE6005A8CF1004679F9004E80FC004978
        FB004C7CF6003F70F2003F70F5004A7BFA004A7BFA006D9BFF006997FE006598
        FF006199FF004277FA006083FF002434A90000075100031197000811B6002A6A
        F6003557A50031324500D7E5E900262B56007596E7004369D2004374F4004A7D
        FB00386CF600396EF3005587F9004B76F5005980FC00507CF9006598FE00669D
        FE006A9AFF005E95FD003970F3006383FF002E399E0002073E00000D87000E1C
        B2005D89DA00C5CFD40040434B00D6E4E8001A1D4B003E5AAB00000371002852
        D2003F77FB00477AF7004B7FF6005485F900517BF3005983F7004778F300669F
        FF005C95FF005287F400447FF600427FF6006E96FF005567B20000000400202B
        780029429E0029375F004E545500ABB9BB00D8E9EC000D0F39002A4E9F00436F
        CF003F73E6005388FD004C7DF6004C7DF3005687F7004977ED005486FC00467F
        FB004885F7003F7DF3004783F3005290F8007AB8FF008FBCFF004D587C003438
        3B00252D3D0099A4B2009AA5AC00D8E9EC00D8E9EC00D8E9EC00212848008CB6
        F2007AAAFF00507BF5005B83FA004D7FF700457FF7004B85FA004376F7004F82
        FA00386EF0004A88F7005699F30070B1F8008FCAF900445B7E00232A43008E8F
        A000736F770000000000D8E8EB00D8E9EC00D8E9EC00D8E9EC00646B6C00222A
        450075A6EB005884F4004F72F7005D82F8004B7CEF004784F9003E7FF8003A72
        F700467AF600679DFF007BB2FF007AADDB006084A30021272900656D77009196
        9900CBC6CA00E3D5DD005D58590021222300BFCED000CCDBDF00858E8F000000
        0000212848006B98E7005082F2004C79FD005A87FC004576EC004981F4003A77
        F1005B98FF007FBEFF00709CD6006C86A2002529390047485200AAADB500C5BF
        C200D3D0CB00DDDAD400E6E1E200F7F3F4006565660033333600000000000000
        00000000000022274C006E97EE005383F6004273F500457BF1004B88EF00508D
        E90083BEFF008CB9F8004A6373003F4C63003D4447009FA8B200C3BEC800DBCD
        D800E4D8E200E1DBDA00F0EFE800F4F7F100FFFFFF00FFFFFF00FBFEFF004B4C
        4C0000000000969C9E00222850006C96EA003C6DE7005185FC00568FF70071B1
        F90094D1FE0042597A0032394B005E6062008B919600C0CBD200D0D1DB00DFD5
        E200E3D8E700EDE5F200F6F4F600FFFFFF00FFFFFF00F0F7F600D8DEE200464A
        4A005B616200B9C4C600D8E9EC001E2445007AA7ED00639CFF0071A8FF0087B6
        E800607DA1001C2427005D6A7000848B8A00C7CACC00CFD0D100E0DADC00E5E0
        E200E8E8EC00F6FAFC00FBFEFF00FFFFFF00FAF5F600D2D2CF004E5152003B3E
        4000BCCBCD00CFDFE200D8E9EC00D8E9EC00232A4500A1CFFF006C98D4006A8B
        BA0052596E003A3E44004E575E00BEC6C800D3D7D200DDDAD600E3E0DF00EDE5
        E500FDF7F600FDFFFE00FEFFFF00FFFFFF00BAB7B6009691910060646500B3C0
        C200D8E9EC00D8E9EC00D9E9EC00DAEAED00D9E9EC0013172B00708894007A89
        970061697000D8E9EC00D8E9EC00CCD8DC006D6D7500EAEAEB00FBF9F600F8F8
        F600FFFFFE00FFFFFD00FFFFFF00B4B9B100676F67004F55560089949300D8E9
        EC00DDECEE00DEECEF00DFEDEF00DEECEE00E0EDF000D9EAED008D99A0008A95
        9700D1E2E500D8E9EC00D9E9EC00D9E9EC00D8E9EC00ABB8BC00414041008A8B
        8D00FFFFFF00FFFFFD00E6E2DE0056545300888E8F00BEC9CB00D8E9EC00D8E9
        EC00D8E9EC00DDECEE00DCEBEE00DDECEF00DCEBEE00DCEBEE00D8E9EC00D8E9
        EC00D8E9EC00D8E9EC00DCEBEE00D9EAEC00DBEAED00DAEAED00D8E9EC00BCCB
        CD00BAC5C80033343400302F300036373600B2C0C200D2E2E500D8E9EC00DDEC
        EF00D9E9EC00DAEAED00D9E9EC00DCEBEE00DBEBED00DFEDF000D8E9EC00D8E9
        EC00}
    end
    object btnExportToExcel: TBitBtn
      Left = 674
      Top = 76
      Width = 104
      Height = 36
      Caption = #1575#1585#1587#1575#1604' '#1576#1607' '#1575#1705#1587#1604
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnExportToExcelClick
      Glyph.Data = {
        760C0000424D760C00000000000036000000280000001C0000001C0000000100
        200000000000400C0000120B0000120B00000000000000000000457E5B002653
        3E0026533E0026533E0026533E0026533E0026533E001F4938001F4938001F49
        38001F4938001F4938001F493800193A2E00193A2E00193A2E00193A2E00193A
        2E00193A2E00132D2400132D2400132D2400132D2400132D240010241E001024
        1E0010241E0010241E00417B57005CAA650045A35F0045A35F0045A35F0045A3
        5F003F9E5A003F9E5A003F9E5A00399755003997550039975500358C4F00358C
        4F002D8747002D8747002D874700227F4000227F4000227F40001A7A3C001A7A
        3C001274370012743700127437000F6C33000A6D30000A1F1900417B57005CAA
        65006C977E005176660051766600517666005176660051766600517666005176
        66004B6B60004B6B60004B6B60004B6B60004B6B60004B6B60004B6B6000435F
        5900435F5900435F5900435F5900435F5900435F5900435F5900435F5900435F
        59000F6C33000A1F190047815D0063B276006C977E00E8F1E800E8F1E800E6F0
        E600E4EFE400E2EEE300E2EEE300E0EEE000DFECDF00DEEBDE00DCEADB00DCEA
        DB00DAE9DA00D9E8D900D8E7D800D8E7D800D5E5D500D5E5D500D5E5D500D2E4
        D200D2E4D200D2E4D200D2E4D200435F5900127437000A1F190047815D0063B2
        76006C977E00EAF2E900E8F1E800E8F1E800E6F0E600E4EFE400E2EEE300E2EE
        E300E0EEE000DFECDF00DEEBDE00DCEADB00DCEADB00DAE9DA00D9E8D900D8E7
        D800D8E7D800D5E5D500D5E5D500D5E5D500D2E4D200D2E4D200D2E4D200435F
        5900127437000D281F0047815D0063B276006C977E00EBF3EB00EAF2E900E8F1
        E800E8F1E800E6F0E600E4EFE400E2EEE300E2EEE300E0EEE000DFECDF00DEEB
        DE00DCEADB00DCEADB00DAE9DA00D9E8D900D8E7D800D8E7D800D5E5D500D5E5
        D500D5E5D500D2E4D200D2E4D200435F5900127437000D281F004D87620073BA
        83006C977E00EDF5ED00EBF3EB00EAF2E900E8F1E800E8F1E800E6F0E600E4EF
        E400E2EEE300E2EEE300E0EEE000DFECDF00DEEBDE00DCEADB00DCEADB00DAE9
        DA00D9E8D900D8E7D800D8E7D800D5E5D500D5E5D500D5E5D500D2E4D200435F
        59001A7A3C000D281F004D87620073BA83006C977E00EDF5ED00EDF5ED00EBF3
        EB00EAF2E900E8F1E800E8F1E800E6F0E600E4EFE400E2EEE300E2EEE300E0EE
        E000DFECDF00AAD6B2006199640026422D00213B2700213B2700213B2700213B
        2700213B2700213B2700D5E5D500435F59001A7A3C000D281F004D8762007CC1
        850076A08600EFF6EF004B964D0026422D0026422D0026422D0026422D002642
        2D0026422D0026422D0026422D0026422D001A4D2A000F601500328735003287
        3500127437001C6C3A002C6642002C6642003A5F5100213B2700D5E5D500435F
        5900227F40000D281F00558E670081BC900076A08600F1F7F1004B964D001274
        3700127437001C6C3A001C6C3A002C6642002C6642003A5F51003A5F51003A5F
        5100046904001D781E0088C792006DB675002D8747002D874700227F4000227F
        400004690400D8E7D800D5E5D500435F5900227F400013352900558E670088C7
        920076A08600F3F8F300DAE9DA004B964D006DB6750073BB7C0073BB7C006DB6
        750068B06F005CAA650055A45A0004690400409347009DD0A7006DB675004093
        4700358C4F002D8747002D8747000469040094C79C00D8E7D800D8E7D800435F
        5900227F400013352900558E670094C79C0076A08600F3F8F300F3F8F300DAE9
        DA004B964D006DB6750073BB7C0073BB7C0064AC690055A45A00046904004093
        47009DD0A70068B06F00499B5400499B540040934700358C4F00046904001A4D
        2A00A8C2A800D9E8D900D8E7D8004B6B60002D8747001335290058966B0094C7
        9C0076A08600F5F9F500F3F8F300F3F8F300DAE9DA004B964D006DB6750068B0
        6F0055A45A0004690400409347009DD0A7006DB6750055A45A0055A45A00499B
        5400499B5400046904002D874700227F40000F601500DAE9DA00D9E8D9004B6B
        60002D8747001335290058966B009DD0A70081AA8D00F6FAF500F5F9F500F3F8
        F300F3F8F300DAE9DA004B964D0055A45A000469040040934700AAD6B20073BB
        7C0055A45A0055A45A0055A45A0055A45A00046904003A734C0057825A00558E
        670057825A00DCEADB00DAE9DA004B6B60002D874700133529005F9B72009DD0
        A70081AA8D00F6FAF600F6FAF500F5F9F500F3F8F300F3F8F300DAE9DA001D78
        1E0040934700AAD6B2007CC185005CAA65005CAA650055A45A0055A45A003A73
        4C00A8C2A800E2EEE300E0EEE000DFECDF00DEEBDE00DCEADB00DCEADB004B6B
        6000358C4F00133529005F9B7200AAD6B20081AA8D00F8FAF800F6FAF600F6FA
        F500F5F9F500F3F8F30094C79C004B964D00BADEC00088C7920064AC690064AC
        69005CAA650055A45A0057825A0004690400CDDACD00E2EEE300E2EEE300E0EE
        E000DFECDF00DEEBDE00DCEADB004B6B6000358C4F001A4533005F9B7200AAD6
        B20081AA8D00F9FBFA00F8FAF800F6FAF600F6FAF50094C79C00499B5400BADE
        C00094C79C006DB6750068B06F0064AC69005CAA650057825A00579A5E005782
        5A0004690400CDDACD00E2EEE300E2EEE300E0EEE000DFECDF00DEEBDE004B6B
        6000399755001A45330066A07700AAD6B20081AA8D00FAFDFA00F9FBFA00F8FA
        F80094C79C0055A45A00C4E5CA0094C79C0073BB7C0073BB7C006DB6750064AC
        690057825A0068B06F006DB6750055A45A0057825A0004690400CDDACD00E2EE
        E300E2EEE300E0EEE000DFECDF0051766600399755001A45330066A07700BADE
        C00081AA8D00FAFDFA00FAFDFA0094C79C005CAA6500C4E5CA0088C792007CC1
        85007CC1850073BB7C0068B06F0057825A0068B06F0073BB7C0073BB7C006DB6
        750055A45A0057825A0004690400CDDACD00E2EEE300E2EEE300E0EEE0005176
        6600399755001A4533006CA67C00BADEC0008AB79500FBFEFB0094C79C0068B0
        6F00C4E5CA009DD0A70088C792007CC185007CC1850073BB7C0061996400A8C2
        A800619964006DB6750073BB7C0073BB7C006DB6750055A45A0057825A000469
        0400CDDACD00E2EEE300E2EEE300517666003F9E5A001A4533006CA67C00BADE
        C0008AB79500FDFEFD006DB67500C4E5CA009DD0A70088C7920088C7920088C7
        920073BA830061996400D8E7D800F3F8F300CDDACD00619964006DB6750073BB
        7C0073BB7C006DB6750055A45A0057825A0004690400E4EFE400E2EEE3005176
        66003F9E5A001A4533006CA67C00C4E5CA008AB79500FEFFFE006DB675006DB6
        750068B06F0064AC690064AC69006199640061996400E3EBE300F5F9F500F3F8
        F300F3F8F300CDDACD00619964006199640061996400558E670057825A005782
        5A0057825A00E6F0E600E4EFE400517666003F9E5A00214F390071AA8100C4E5
        CA008AB79500FFFFFF00FEFFFE00FDFEFD00FBFEFB00FAFDFA00FAFDFA00F9FB
        FA00F8FAF800F6FAF600F6FAF500F5F9F500F3F8F300F3F8F300F1F7F100EFF6
        EF00EDF5ED00EDF5ED00EBF3EB00EAF2E900E8F1E800E8F1E800E6F0E6005176
        660045A35F00214F390071AA8100C4E5CA008AB79500FFFFFF00FFFFFF00FEFF
        FE00FDFEFD00FBFEFB00FAFDFA00FAFDFA00F9FBFA00F8FAF800F6FAF600F6FA
        F500F5F9F500F3F8F300F3F8F300F1F7F100EFF6EF00EDF5ED00EDF5ED00EBF3
        EB00EAF2E900E8F1E800E8F1E8005176660045A35F00214F390071AA8100CCE9
        D2008AB79500FFFFFF00FFFFFF00FFFFFF00FEFFFE00FDFEFD00FBFEFB00FAFD
        FA00FAFDFA00F9FBFA00F8FAF800F6FAF600F6FAF500F5F9F500F3F8F300F3F8
        F300F1F7F100EFF6EF00EDF5ED00EDF5ED00EBF3EB00EAF2E900E8F1E8005176
        660045A35F00214F390076AF8500CCE9D20081AA8D008AB795008AB795008AB7
        95008AB795008AB795008AB795008AB7950081AA8D0081AA8D0081AA8D0081AA
        8D0081AA8D0076A0860076A0860076A0860076A0860076A0860076A086006C97
        7E006C977E006C977E006C977E006C977E0045A35F00214F390076AF8500CCE9
        D200CCE9D200CCE9D200C4E5CA00C4E5CA00C4E5CA00BADEC000BADEC000BADE
        C000AAD6B200AAD6B200AAD6B2009DD0A7009DD0A70094C79C0094C79C0088C7
        920081BC90007CC1850073BA830073BA830063B2760063B2760063B276005CAA
        65005CAA6500214F390076AF850076AF850076AF850071AA810071AA810071AA
        81006CA67C006CA67C006CA67C0066A0770066A0770066A077005F9B72005F9B
        72005F9B720058966B00558E6700558E6700558E67004D8762004D8762004D87
        620047815D0047815D0047815D00417B5700417B5700417B5700}
    end
  end
  object dbGrid: TDBGrid
    Left = 0
    Top = 123
    Width = 1017
    Height = 273
    Align = alClient
    DataSource = dsReport
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SerialNumber'
        Title.Alignment = taCenter
        Title.Caption = #1588#1605#1575#1585#1607
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KalaID'
        Title.Alignment = taCenter
        Title.Caption = #1705#1583' '#1705#1575#1604#1575
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KalaName'
        Title.Alignment = taCenter
        Title.Caption = #1606#1575#1605' '#1705#1575#1604#1575
        Width = 167
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VahedName'
        Title.Alignment = taCenter
        Title.Caption = #1608#1575#1581#1583
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Number'
        Title.Alignment = taCenter
        Title.Caption = #1578#1593#1583#1575#1583
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PriceInFactor'
        Title.Alignment = taCenter
        Title.Caption = #1602#1610#1605#1578
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ExportDate'
        Title.Alignment = taCenter
        Title.Caption = #1578#1575#1585#1610#1582
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PersonName'
        Title.Alignment = taCenter
        Title.Caption = #1575#1586'/'#1576#1607
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SubComment'
        Title.Caption = #1578#1608#1590#1610#1581#1575#1578
        Visible = True
      end>
  end
  object QReport: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'FactorType'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'select TExitFactory.ExitFactoryID, SerialNumber, TExitFactory.Pe' +
        'rsonID, ExportDate, TExitFactory.Comment, UserID, TExitFactory.T' +
        'ype, '
      
        'SubExitFactoryID, TSubExitFactory.KalaID, Round(Number, 3) as Nu' +
        'mber, TSubExitFactory.VahedPrice as PriceInFactor,'
      'PersonName, (TSubExitFactory.VahedPrice*Number) as sumPrice,'
      
        'KalaName, VahedName from TExitFactory inner join TSubExitFactory' +
        ' on TExitFactory.ExitFactoryID=TSubExitFactory.ExitFactoryID'
      'inner join TPerson on TExitFactory.PersonID=TPerson.PersonID'
      'inner join TKala on TSubExitFactory.KalaID=TKala.KalaID'
      'inner join TVahed on TKala.VahedID = TVahed.VahedID'
      'Order By ExportDate'
      '')
    Left = 56
    Top = 216
  end
  object dsReport: TDataSource
    DataSet = QReport
    Left = 16
    Top = 216
  end
end
