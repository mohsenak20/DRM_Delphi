object frmCreditCard: TfrmCreditCard
  Left = 226
  Top = 171
  Width = 1354
  Height = 754
  BiDiMode = bdRightToLeft
  Caption = #1589#1583#1608#1585' '#1705#1575#1585#1578' '#1575#1593#1578#1576#1575#1585#1610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 28
  object Label4: TLabel
    Left = 1063
    Top = 161
    Width = 37
    Height = 29
    Caption = #1593#1606#1608#1575#1606':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pgcCreditCard: TPageControl
    Left = 0
    Top = 0
    Width = 1338
    Height = 715
    ActivePage = tabEdit
    Align = alClient
    TabOrder = 0
    object tabList: TTabSheet
      Caption = #1604#1610#1587#1578
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1330
        Height = 132
        Align = alTop
        Color = clMoneyGreen
        TabOrder = 0
        object Label7: TLabel
          Left = 1278
          Top = 18
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
        object Label8: TLabel
          Left = 1091
          Top = 20
          Width = 49
          Height = 29
          Caption = #1705#1583' '#1605#1604#1610':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 924
          Top = 20
          Width = 38
          Height = 29
          Caption = #1705#1575#1585#1578':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 752
          Top = 18
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
        object Label12: TLabel
          Left = 643
          Top = 17
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
        object Label19: TLabel
          Left = 507
          Top = 16
          Width = 35
          Height = 29
          Caption = #1711#1585#1608#1607':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 1092
          Top = 60
          Width = 98
          Height = 29
          Caption = #1588#1605#1575#1585#1607' '#1588#1606#1575#1587#1575#1610#1610':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtSName: TEdit
          Left = 1144
          Top = 14
          Width = 129
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
        object edtSNID: TEdit
          Left = 967
          Top = 15
          Width = 121
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
        object edtSCardNumber: TEdit
          Left = 797
          Top = 15
          Width = 121
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object BBtnAccept: TBitBtn
          Left = 4
          Top = 100
          Width = 1317
          Height = 29
          Caption = #1580#1587#1578#1580#1608
          TabOrder = 3
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
        object btnCredit: TBitBtn
          Left = 31
          Top = 14
          Width = 120
          Height = 36
          Caption = ' '#1584#1582#1610#1585#1607' '#1588#1575#1585#1688
          TabOrder = 4
          OnClick = btnCreditClick
          Glyph.Data = {
            46030000424D460300000000000036000000280000000E0000000E0000000100
            20000000000010030000120B0000120B00000000000000000000FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000808000008080000000
            0000000000000000000000000000000000000000000000FFFF0000FFFF000000
            0000008080000000000000000000008080000080800000000000000000000000
            000000000000000000000000000000FFFF0000FFFF0000000000008080000000
            0000000000000080800000808000000000000000000000000000000000000000
            00000000000000FFFF0000FFFF00000000000080800000000000000000000080
            8000008080000000000000000000000000000000000000000000000000000000
            0000000000000000000000808000000000000000000000808000008080000080
            8000008080000080800000808000008080000080800000808000008080000080
            8000008080000000000000000000008080000080800000000000000000000000
            0000000000000000000000000000000000000000000000808000008080000000
            000000000000008080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
            FF0000FFFF0000FFFF0000FFFF00000000000080800000000000000000000080
            80000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
            FF0000FFFF0000000000008080000000000000000000008080000000000000FF
            FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
            0000008080000000000000000000008080000000000000FFFF0000FFFF0000FF
            FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008080000000
            000000000000008080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
            FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000080
            80000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
            FF0000FFFF0000000000C0C0C000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000}
        end
        object edtStartDate: TMaskEdit
          Left = 661
          Top = 14
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
          TabOrder = 5
          Text = '1   /  /  '
        end
        object edtEndDate: TMaskEdit
          Left = 552
          Top = 14
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
          TabOrder = 6
          Text = '1   /  /  '
        end
        object edtSGroupID: TEdit
          Left = 462
          Top = 14
          Width = 42
          Height = 34
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object edtSGroupName: TEdit
          Left = 353
          Top = 15
          Width = 107
          Height = 34
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
        object btnSGroupInfo: TBitBtn
          Left = 317
          Top = 15
          Width = 35
          Height = 33
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          OnClick = btnSGroupInfoClick
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
        object ExportToExcel: TBitBtn
          Left = 173
          Top = 14
          Width = 124
          Height = 36
          Caption = #1575#1585#1587#1575#1604' '#1576#1607' '#1575#1705#1587#1604
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = ExportToExcelClick
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
        object edtSGeneralCode: TEdit
          Left = 969
          Top = 55
          Width = 121
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 132
        Width = 1330
        Height = 540
        Align = alClient
        DataSource = dsCreditCard
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmnuGrid
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Koodak'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CardID'
            Title.Alignment = taCenter
            Title.Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Name'
            Title.Alignment = taCenter
            Title.Caption = #1606#1575#1605
            Width = 154
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lastName'
            Title.Alignment = taCenter
            Title.Caption = #1606#1575#1605' '#1582#1575#1606#1608#1575#1583#1711#1610
            Width = 218
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NID'
            Title.Alignment = taCenter
            Title.Caption = #1588#1605#1575#1585#1607' '#1605#1604#1610
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FatherName'
            Title.Alignment = taCenter
            Title.Caption = #1606#1575#1605' '#1662#1583#1585
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Tel'
            Title.Alignment = taCenter
            Title.Caption = #1578#1604#1601#1606
            Width = 172
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IssueDate'
            Title.Alignment = taCenter
            Title.Caption = #1578#1575#1585#1610#1582' '#1589#1583#1608#1585
            Width = 135
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IssueTime'
            Title.Alignment = taCenter
            Title.Caption = #1587#1575#1593#1578
            Visible = True
          end>
      end
    end
    object tabEdit: TTabSheet
      Caption = #1575#1601#1586#1608#1583#1606' '#1608' '#1608#1610#1585#1575#1610#1588
      ImageIndex = 1
      OnShow = tabEditShow
      object Panel3: TPanel
        Left = 649
        Top = 0
        Width = 681
        Height = 672
        Align = alClient
        TabOrder = 0
        object Label2: TLabel
          Left = 521
          Top = 340
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
        object Label1: TLabel
          Left = 521
          Top = 385
          Width = 69
          Height = 29
          Caption = #1588#1605#1575#1585#1607' '#1605#1604#1610':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 236
          Top = 386
          Width = 47
          Height = 29
          Caption = #1606#1575#1605' '#1662#1583#1585':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 521
          Top = 522
          Width = 45
          Height = 29
          Caption = #1570#1583#1585#1587':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 521
          Top = 478
          Width = 32
          Height = 29
          Caption = #1578#1604#1601#1606':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 521
          Top = 252
          Width = 80
          Height = 29
          Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 281
          Top = 252
          Width = 35
          Height = 29
          Caption = #1711#1585#1608#1607':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 521
          Top = 294
          Width = 24
          Height = 29
          Caption = #1606#1608#1593':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 236
          Top = 429
          Width = 81
          Height = 29
          Caption = #1607#1586#1610#1606#1607' '#1589#1583#1608#1585':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 521
          Top = 430
          Width = 65
          Height = 29
          Caption = #1606#1601#1585' '#1607#1605#1585#1575#1607':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 236
          Top = 476
          Width = 98
          Height = 29
          Caption = #1588#1605#1575#1585#1607' '#1588#1606#1575#1587#1575#1610#1610':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 236
          Top = 296
          Width = 52
          Height = 29
          Caption = #1580#1606#1587#1610#1578':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 236
          Top = 339
          Width = 80
          Height = 29
          Caption = #1606#1575#1605' '#1582#1575#1606#1608#1575#1583#1711#1610':'
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Traffic'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtName: TEdit
          Left = 344
          Top = 336
          Width = 173
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object edtNID: TEdit
          Left = 344
          Top = 381
          Width = 173
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
        end
        object edtFatherName: TEdit
          Left = 48
          Top = 382
          Width = 177
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
        end
        object edtTel: TEdit
          Left = 344
          Top = 473
          Width = 173
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
        end
        object edtAddress: TEdit
          Left = 48
          Top = 520
          Width = 468
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 18
        end
        object edtCardID: TEdit
          Left = 344
          Top = 248
          Width = 174
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnExit = edtCardIDExit
        end
        object edtGroupName: TEdit
          Left = 84
          Top = 251
          Width = 150
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
        object btnGroupInfo: TBitBtn
          Left = 50
          Top = 251
          Width = 33
          Height = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnGroupInfoClick
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
        object edtGroupID: TEdit
          Left = 236
          Top = 251
          Width = 42
          Height = 34
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object edtLastName: TEdit
          Left = 48
          Top = 336
          Width = 177
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
        end
        object edtCreditCardTypeID: TEdit
          Left = 475
          Top = 293
          Width = 42
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
        object edtCreditCardTypeTitle: TEdit
          Left = 379
          Top = 294
          Width = 94
          Height = 34
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object btnCreditCardType: TBitBtn
          Left = 344
          Top = 294
          Width = 35
          Height = 33
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = btnCreditCardTypeClick
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
        object edtCardIssuePrice: TEdit
          Left = 48
          Top = 427
          Width = 177
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
        end
        object edtNumberOfCustomer: TEdit
          Left = 344
          Top = 426
          Width = 173
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          Text = '1'
        end
        object edtGeneralCode: TEdit
          Left = 48
          Top = 473
          Width = 177
          Height = 37
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
        end
        object edtGenderID: TEdit
          Left = 187
          Top = 293
          Width = 42
          Height = 34
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object edtGenderTitle: TEdit
          Left = 84
          Top = 294
          Width = 101
          Height = 34
          Color = clInfoBk
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
        object btnGender: TBitBtn
          Left = 48
          Top = 294
          Width = 35
          Height = 33
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          OnClick = btnGenderClick
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
        object chbNotActive: TCheckBox
          Left = 524
          Top = 570
          Width = 65
          Height = 17
          Caption = #1594#1610#1585#1601#1593#1575#1604
          TabOrder = 19
        end
        object chbIsSessioned: TCheckBox
          Left = 444
          Top = 570
          Width = 65
          Height = 17
          Caption = #1580#1604#1587#1607' '#1575#1610
          TabOrder = 20
        end
        object Panel2: TPanel
          Left = 1
          Top = 601
          Width = 679
          Height = 70
          Align = alBottom
          TabOrder = 21
          object BtnSave: TBitBtn
            Left = 374
            Top = 18
            Width = 63
            Height = 36
            Caption = #1584#1582#1610#1585#1607
            TabOrder = 0
            OnClick = BtnSaveClick
            Glyph.Data = {
              46030000424D460300000000000036000000280000000E0000000E0000000100
              20000000000010030000120B0000120B00000000000000000000FFFFFF000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000808000008080000000
              0000000000000000000000000000000000000000000000FFFF0000FFFF000000
              0000008080000000000000000000008080000080800000000000000000000000
              000000000000000000000000000000FFFF0000FFFF0000000000008080000000
              0000000000000080800000808000000000000000000000000000000000000000
              00000000000000FFFF0000FFFF00000000000080800000000000000000000080
              8000008080000000000000000000000000000000000000000000000000000000
              0000000000000000000000808000000000000000000000808000008080000080
              8000008080000080800000808000008080000080800000808000008080000080
              8000008080000000000000000000008080000080800000000000000000000000
              0000000000000000000000000000000000000000000000808000008080000000
              000000000000008080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
              FF0000FFFF0000FFFF0000FFFF00000000000080800000000000000000000080
              80000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
              FF0000FFFF0000000000008080000000000000000000008080000000000000FF
              FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
              0000008080000000000000000000008080000000000000FFFF0000FFFF0000FF
              FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008080000000
              000000000000008080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
              FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000080
              80000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
              FF0000FFFF0000000000C0C0C000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000}
          end
          object BtnCancel: TBitBtn
            Left = 466
            Top = 18
            Width = 70
            Height = 36
            Caption = #1575#1606#1589#1585#1575#1601
            TabOrder = 1
            OnClick = BtnCancelClick
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
              44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
              00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
              33833F333383F33300003333AA463362A433333333383F333833F33300003333
              6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
              33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
              6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
              000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
              333383333333F3330000333333322AAA4333333333333833333F333300003333
              333322A4333333333333338333F333330000333333344A433333333333333338
              3F333333000033333336A24333333333333333833F333333000033333336AA43
              33333333333333833F3333330000333333336663333333333333333888333333
              0000}
            NumGlyphs = 2
          end
          object BtnNew: TBitBtn
            Left = 558
            Top = 18
            Width = 67
            Height = 36
            Caption = #1580#1583#1610#1583
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Koodak'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = BtnNewClick
            Glyph.Data = {
              6A080000424D6A08000000000000360000002800000015000000190000000100
              20000000000034080000120B0000120B00000000000000000000FFFFFF00FFFF
              FF00EBEFEF00979B9B008F949300919595009195950091959500919595009195
              95009195950091959500919595009195950091959500919595008F939300A9AA
              AA00F5F4F400FFFFFF00FFFFFF00FFFFFF00ECE2E2008C6E6F006E5152007559
              5900755959007559590075595900755959007559590075595900755959007559
              5900755959007559590075585800785E5E00827F7F00B4B5B500D6D6D600FDFD
              FD00FFFFFF00CDB1B100BE8E8F00E4C4C400DFBDBE00DFBDBE00DFBDBE00DFBD
              BE00DFBDBE00DFBDBE00DFBDBE00DFBDBE00DFBDBE00DFBDBE00DFBDBE00E3C4
              C400C68B8D0063585900696A6A0084858500B7B8B800D6D3D30078565700E5C6
              C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6A1A400775E5F009663
              6400755E5E0085898900A26B6C00A7737400DCBFBF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00D19B9E0084797A00C6ACAC0071525300868A8A00B88C
              8D00D8B9BA00D7B8B800FFFFFF00FEFCFC00FCF4F400FCF5F500FCF5F500FCF5
              F500FCF5F500FFFEFE00FBFBFB00F5F5F500FBFBFB00FFFFFF00FFFFFF00D19B
              9E00837B7C00C4ABAB0071535400878B8B00B78A8B00D7B6B600DABBBB00FFFF
              FF00FEF5F500FADBDB00FADEDE00FADEDE00FADEDE00FADDDD00FFFDFD00F2F4
              F400C0C0C000C8C8C800FAFBFB00FFFFFF00D19B9E00837B7C00C4ABAB007053
              5400868B8B00B98D8E00D8B9B900DBBDBD00FFFFFF00FFFDFD00FEF9F900FEFA
              FA00FEFAFA00FEFAFA00FEFAFA00FFFFFF00BCBCBC00484746007B767400C5C6
              C600FEFBFB00D39DA000837B7C00C4ABAB0070535400868B8B00BD919300DBBC
              BC00DEC0C000FFFFFF00FEF6F600F9DEDE00F9E1E100F9E1E100F9E1E100F9E1
              E100FFEDED00B09D9D0000000000273D470073716F00C8C7C700CD989B00857D
              7D00C4ABAB0070535400868B8B00C1979700DEC0C000E0C3C300FFFFFF00FFFB
              FB00FDF0F000FDF1F100FDF1F100FDF1F100FDF1F100FFF5F500BEB1B000063E
              5100016B9A0028536C0075747200AA7C7F00877D7E00C5ABAB0070535400868B
              8B00C59C9C00E1C3C400E3C6C700FFFFFF00FEFAFA00FBECEC00FBEDED00FBED
              ED00FBEDED00FBEDED00FFF2F200DEC4C3007CADB60052C2F9004368B5005D47
              47007C5B5C0080787900C5ACAC0070535400868B8B00C9A0A100E4C8C800E5CA
              CA00FFFFFF00FEF7F700FCE3E300FCE5E500FCE5E500FCE5E500FCE5E500FEE7
              E700EFCCCB00B6B9B9007ED8FB005C8BDF0056486100583C3A006F6A6A00C6AC
              AC0070535400868B8B00CDA6A700E7CCCC00E8CECE00FFFFFF00FFFDFD00FDF8
              F800FDF9F900FDF9F900FDF9F900FDF9F900FDF8F800FFF3F300D5AFAE0095D0
              D50064C2FF005A5EA8004828280053535100BBA1A10072555500868B8B00D3AC
              AD00EACFCF00EBD1D100FFFFFF00FEF5F500FADBDB00FADEDE00FADEDE00FADE
              DE00FADEDE00FADEDE00FBE2E200F6CFCF00B9ADAD007FD8F4005891EF004D3D
              63003D3A3500A189890072555600878B8B00D7B2B300EDD2D200EED4D400FFFF
              FF00FFFDFD00FEF9F900FEF9F900FEF9F900FEF9F900FEF9F900FEF9F900FEF9
              F900FFFAFA00D5B8B70097D2DB0065BBFF0056599A00352D30007A6463006D54
              5400878B8B00DCB9B900F0D7D700F1D8D800FFFFFF00FEF6F600F9DFDF00F9E1
              E100F9E1E100F9E1E100F9E1E100F9E1E100F9E1E100FBE2E200F9DAD900B6B5
              B2007EDFFD00578EEB0056425D0052423F005A4747008E919100E2BFBF00F3DA
              DA00F3DADA00FFFFFF00FFFBFB00FDEFEF00FDF0F000FDF0F000FDF0F000FDF0
              F000FDF0F000FDF0F000FDEFEF00FFFCFC00D9BBBA0098CCD40068BEFD005663
              A40051363B004B3D3D00979A9900E6C6C500F5DDDD00F5DDDD00FFFFFF00FEFA
              FA00FBEDED00FBEFEF00FBEFEF00FBEFEF00FBEFEF00FBEFEF00FBEFEF00FBEE
              EE00FFFFFF00F7E3E200B2BBB8007BDEFE005888E800513C5400454240008A8B
              8B00EACBCB00F7DFDF00F6DFDF00FFFFFF00FEF6F600FBE0E000FBE2E200FBE2
              E200FBE2E200FBE2E200FBE2E200FBE2E200FBE1E100FFFBFB00FFFAFA00DAB7
              B60097CED40065C5FF005965B1005042410062656400EED0D000F9E2E200F9E1
              E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1E4E300AFBCBE0078BDE7005E60
              AF003E2A4A00423F3C00F2D5D500FBE3E300FAE3E300FBF1F100FBF1F100FBF1
              F100FBF1F100FBF1F100FBF0F000FBF0F000FBF0F000FBF0F000FBF0F000FBF0
              F000FBF0F000FEF3F300D2AEAC008078A500384AD40043307F003D322E00F6D9
              D900FBE8E800FADFDF00F9DEDE00F7D7D700F4D8D800F3D5D500F1D3D300EFD0
              D000EDCECE00EBCBCB00E9C9C900E7C5C500E5C3C300E3C1C100E5C4C300D9B6
              B8004441B0005E79F5005A66DA005B456500F9DBDB00FBF4F400FEFBFB00FDF7
              F700FBDEDE00FAE6E600FAE5E500F9E4E400F8E4E400F7E2E200F6E1E100F5E0
              E000F5DFDF00F4DEDE00F2DCDC00F5DCDC00F6DBD8006D62B4002D42CB00122B
              CE009E98C800FAD9D900F9DEDE00F7DBDB00F6D9D900F5D1D100F2CCCC00EFC9
              C900EDC7C700EAC2C200E7BFBF00E3B9B900E0B5B500DDB2B200DBAFAF00DBAC
              AC00C09D9D00D6C5C400F4E1DD00A59FD2009E9CD600F6F8FF00FEF7F700FEF5
              F500FDF5F500FDF4F400FCF5F500FBF4F400FAF3F300FAF2F200F9F1F100F9F1
              F100F8F0F000F8EFEF00F7EEEE00F7EEEE00F8EEEE00ECE8E800F6FBFB00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00}
          end
          object BtnPrint: TBitBtn
            Left = 98
            Top = 18
            Width = 63
            Height = 36
            Caption = #1585#1608
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Koodak'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
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
          object btnPrintBack: TBitBtn
            Left = 6
            Top = 18
            Width = 69
            Height = 36
            Caption = #1662#1588#1578
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Koodak'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = btnPrintBackClick
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
          object btnAmoozesh: TBitBtn
            Left = 282
            Top = 18
            Width = 72
            Height = 36
            Caption = #1570' - '#1662
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Koodak'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            OnClick = btnAmoozeshClick
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
          object mnuDiscountCard: TBitBtn
            Left = 190
            Top = 18
            Width = 80
            Height = 36
            Caption = #1578#1582#1601#1610#1601#1610
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Koodak'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            OnClick = mnuDiscountCardClick
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
        object rbMembership: TRadioButton
          Left = 549
          Top = 212
          Width = 73
          Height = 17
          Caption = #1593#1590#1608#1610#1578
          Checked = True
          TabOrder = 23
          TabStop = True
          OnClick = rbMembershipClick
        end
        object gbLesson: TGroupBox
          Left = 1
          Top = 1
          Width = 679
          Height = 200
          Align = alTop
          Enabled = False
          TabOrder = 24
          object Label20: TLabel
            Left = 567
            Top = 32
            Width = 22
            Height = 29
            Caption = #1705#1583':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object Label21: TLabel
            Left = 555
            Top = 72
            Width = 42
            Height = 29
            Caption = #1588#1605#1575#1585#1607':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object Label22: TLabel
            Left = 555
            Top = 108
            Width = 22
            Height = 29
            Caption = #1705#1583':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object Label23: TLabel
            Left = 352
            Top = 32
            Width = 37
            Height = 29
            Caption = #1593#1606#1608#1575#1606':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object Label24: TLabel
            Left = 555
            Top = 144
            Width = 66
            Height = 29
            Caption = #1711#1585#1608#1607' '#1587#1606#1610':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object Label25: TLabel
            Left = 357
            Top = 72
            Width = 24
            Height = 29
            Caption = #1606#1608#1593':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object Label26: TLabel
            Left = 357
            Top = 108
            Width = 35
            Height = 29
            Caption = #1711#1585#1608#1607':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object Label27: TLabel
            Left = 357
            Top = 144
            Width = 40
            Height = 29
            Caption = #1602#1610#1605#1578':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object Label28: TLabel
            Left = 65
            Top = 72
            Width = 52
            Height = 29
            Caption = #1592#1585#1601#1610#1578':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object Label29: TLabel
            Left = 65
            Top = 108
            Width = 83
            Height = 29
            Caption = #1592#1585#1601#1610#1578' '#1582#1575#1604#1610':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object lblLessonId: TLabel
            Left = 507
            Top = 72
            Width = 42
            Height = 29
            Caption = #1588#1605#1575#1585#1607':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object lblLessonCode: TLabel
            Left = 527
            Top = 108
            Width = 22
            Height = 29
            Caption = #1705#1583':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object lblAgeCategory: TLabel
            Left = 483
            Top = 144
            Width = 66
            Height = 29
            Caption = #1711#1585#1608#1607' '#1587#1606#1610':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object lblLessonType: TLabel
            Left = 325
            Top = 72
            Width = 24
            Height = 29
            Caption = #1606#1608#1593':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object lblLessonGroup: TLabel
            Left = 314
            Top = 108
            Width = 35
            Height = 29
            Caption = #1711#1585#1608#1607':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object lblLessonPrice: TLabel
            Left = 309
            Top = 144
            Width = 40
            Height = 29
            Caption = #1602#1610#1605#1578':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object lblLessonCapacity: TLabel
            Left = 9
            Top = 72
            Width = 52
            Height = 29
            Caption = #1592#1585#1601#1610#1578':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object lblLessonCapacityRemain: TLabel
            Left = -22
            Top = 108
            Width = 83
            Height = 29
            Caption = #1592#1585#1601#1610#1578' '#1582#1575#1604#1610':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object lblLessonTitle: TLabel
            Left = 311
            Top = 33
            Width = 37
            Height = 29
            Caption = #1593#1606#1608#1575#1606':'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = BBtnAcceptClick
          end
          object btnLessonCode: TBitBtn
            Left = 401
            Top = 32
            Width = 33
            Height = 32
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Koodak'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btnLessonCodeClick
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
          object edtLessonCode: TEdit
            Left = 435
            Top = 31
            Width = 127
            Height = 34
            Color = clInfoBk
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Koodak'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object rbLesson: TRadioButton
          Left = 549
          Top = 8
          Width = 73
          Height = 17
          Caption = #1570#1605#1608#1586#1588#1610
          TabOrder = 22
          OnClick = rbLessonClick
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 649
        Height = 672
        Align = alLeft
        TabOrder = 1
        object Shape1: TShape
          Left = 279
          Top = 16
          Width = 122
          Height = 162
        end
        object Image: TImage
          Left = 280
          Top = 17
          Width = 120
          Height = 160
          Stretch = True
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = 228
          Width = 647
          Height = 443
          Align = alBottom
          Caption = #1575#1601#1585#1575#1583' '#1586#1610#1585' '#1605#1580#1605#1608#1593#1607
          TabOrder = 0
          object Shape4: TShape
            Left = 90
            Top = 45
            Width = 90
            Height = 120
          end
          object Shape3: TShape
            Left = 293
            Top = 45
            Width = 90
            Height = 120
          end
          object Shape2: TShape
            Left = 497
            Top = 45
            Width = 90
            Height = 120
          end
          object imgSubSet1: TImage
            Left = 497
            Top = 45
            Width = 90
            Height = 120
            Stretch = True
            OnDblClick = imgSubSet1DblClick
          end
          object imgSubset2: TImage
            Left = 293
            Top = 45
            Width = 90
            Height = 120
            Stretch = True
            OnDblClick = imgSubset2DblClick
          end
          object imgSubset3: TImage
            Left = 90
            Top = 45
            Width = 90
            Height = 120
            Stretch = True
            OnDblClick = imgSubset3DblClick
          end
          object lblPerson1: TLabel
            Left = 568
            Top = 171
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
          object lblPerson2: TLabel
            Left = 360
            Top = 171
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
          object lblPerson3: TLabel
            Left = 152
            Top = 171
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
          object lblSubsetTel1: TLabel
            Left = 502
            Top = 201
            Width = 86
            Height = 29
            Caption = 'lblSubsetTel1'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSubsetTel2: TLabel
            Left = 359
            Top = 201
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
          object lblSubsetTel3: TLabel
            Left = 151
            Top = 201
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
          object Shape5: TShape
            Left = 88
            Top = 245
            Width = 90
            Height = 120
          end
          object Shape6: TShape
            Left = 293
            Top = 245
            Width = 90
            Height = 120
          end
          object Shape7: TShape
            Left = 497
            Top = 245
            Width = 90
            Height = 120
          end
          object imgSubset4: TImage
            Left = 497
            Top = 245
            Width = 90
            Height = 120
            Stretch = True
            OnDblClick = imgSubset4DblClick
          end
          object imgSubset5: TImage
            Left = 293
            Top = 245
            Width = 90
            Height = 120
            Stretch = True
            OnDblClick = imgSubset5DblClick
          end
          object imgSubset6: TImage
            Left = 88
            Top = 245
            Width = 90
            Height = 120
            Stretch = True
            OnDblClick = imgSubset6DblClick
          end
          object lblPerson4: TLabel
            Left = 570
            Top = 371
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
          object lblPerson5: TLabel
            Left = 362
            Top = 371
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
          object lblPerson6: TLabel
            Left = 152
            Top = 371
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
          object lblSubsetTel4: TLabel
            Left = 504
            Top = 399
            Width = 86
            Height = 29
            Caption = 'lblSubsetTel1'
            Font.Charset = ARABIC_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Traffic'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblSubsetTel5: TLabel
            Left = 361
            Top = 399
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
          object lblSubsetTel6: TLabel
            Left = 151
            Top = 399
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
        end
        object btnOpenPic: TBitBtn
          Left = 276
          Top = 187
          Width = 124
          Height = 36
          Caption = #1575#1606#1578#1582#1575#1576' '#1578#1589#1608#1610#1585
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Koodak'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnOpenPicClick
          Glyph.Data = {
            36090000424D3609000000000000360000002800000018000000180000000100
            20000000000000090000120B0000120B00000000000000000000D7E6E700CDC2
            B6009565460078411F00986A4B00B8998200C9BAAC00D1CDC500D5DCD900D7E5
            E700D7E6E700D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D5DCD9006E46
            2A00523524003E2A1E0044291700552E170068381B007D442000914F2500A358
            2900CDC2B600D3D5CF00D7E2E200D7E6E700D8E9EC00D8E9EC00D8E9EC00D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00CCC3B700894F
            1C00A540030081310A0061290F0046291A0039291E003E291A004D2B16005D32
            1800723E1D00874922009C542700C9BAAC00D1CDC500D5DCD900D7E6E700D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C4B09F008D53
            1D00AE440200D0896000D38B6000B35E2F00953F110075321000542A14003E29
            1D003B281D0044291800552E160068381B007D44200097522600D1CDC500D7E6
            E700D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C5B4A4009858
            1F00AB410200E9BC9A00FFF3D700FEDBB900F5C69F00E09E7100C8774500A953
            2300873A0F006430150046291A0039281E003F281A005E33180098522700D5DC
            D900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00BAA08C009F5C
            2200AF470700E7BC9D00FFEBCF00FFE3C400FFE2C200FFE4C100FFE0BA00FCD0
            A600F1B88900DC905B00C06A31009F4B190069371A00432A1B00894A2300D3D5
            CF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B89D8800A561
            2300B04D0F00EEC9B000FFEBD300FFE3C700FFE0C200FFDFBC00FFDDB700FFDB
            B400FFDDB600FFD59B00FFCA8000EA9D6000903E0D00412C1E00894A2300D3D5
            CF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00A9887000AD67
            2900AE4B0E00EECCB300FFEDD800FFE5CD00FFE6C600D3D5C400CCD0C000FFDD
            B700FFD9B400FFBF7200FFBB5B00EDA460008E411200432C1E008F4D2400D5DC
            D900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009F7B6100B169
            2900B4561A00F5DCC800FFEEDB00FFEAD200F5E4CC002BA5CB0071B8C700FFE2
            BF00FFD9AE00FFB33E00FFCB7900EFB2820085411500422A1B008E4D2400D3D5
            CF00D7E6E700D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009A735900B86C
            2A00B3571D00F7E1D100FFF3E100FDECD70060B6CE001099CC003FABCA00FFE4
            C900F3C28700CB9F5A00C9BEA400DF945700813E0F003F2617006F3C1C009A53
            2700CEC6BB00D5DCD900D7E6E700D8E9EC00D8E9EC00D8E9EC00845A3E00BB6F
            2D00B65D2300FAECDF00F3F1E4005AB6D1002BA6CD00C9D7D10029A5CD00D6DD
            CF00C8A48400265C7200988C6700E89A4E00C1732800773F0B00542C10005A31
            170077411E0095502600C9BAAC00D3D5CF00D7E2E200D7E6E7008B624500C470
            2A00B7632D00FFFCF200B0D8E0002CA8D000DFE4DA00FFF0D6004BB1CE007FBE
            CB00FFEBCA00AEAFA100C9945800FDE2C200FFDEB500F4B27000C9792A008E4A
            0A005E310E00522D15006B3A1B00894A2300A5592A00D4D8D4007B543A00C775
            2D00B6622E00FFFAF600F3F2EC00F0EDE500FFF2E300FFF2DC0097CAD30035A9
            CC00FEE7CE00FFEACB00F0C39300DC965400E5AA7400FBD9B600FFDFBB00F5BC
            8300DD8B3A00865727004735310049291A006A3A1B00BCA28D0080593D00D077
            2A00BE744600FFFDFD00FFF9F300FFF7EC00FFF3E700FFF2E200E6E5DB0020A3
            CE00CDD8D000FFE9CD00FFF2DA00DD9B6B008838010094531500D8914E00F8CF
            A300D6BB9F00B9BABD004C56AF00161D8C004D2D2E00AF8B72007B5A4200D57B
            2E00BE784C00FFFFFF00FFFBF700FFF8F200FFF6EC00FFF3E700FFF4E30054B5
            D20071BCCF00FFEDD300FFF0DA00E19D6A006F350900532E15009F542400C668
            1F00B67638009594AC002B56D200154FD100552E4C00C9BAAC0084644B00D176
            2700C4815900FFFFFF00FFFEFC00FFFAF600FFF8F200FFF6EC00FFF7E800B5D7
            DD0025A5CE00EFE6D600FFF4E000E3A17000783808004D2E1A009E552800D8E8
            EB00D8E9EC00C1A69300563E700050337300CDC4BC00D8E8EB008B6D5200CF72
            2300CA8E6B00FFFFFF00FFFFFF00FFFEFB00FFFAF700FFF8F200FFF7EC00FBF2
            E6002FA9D10081C3D200FFF8E400DF9B6A007739090052301B00A2572900D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC008C6F5700CF72
            2200C88F6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFB00FFF9F200FFF9
            EC00B7DAE000AAD3DC00FFF5E500D8915C006837100057311A00A3582900D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0098795C00D478
            2400BA612400CA8A6000D7A98E00E5CABC00F1E4E000F8F3F200FFFFFF00FFFF
            FF00FFFFF700FFFDF000FFFAEF00DA9560006838100057301A00A3582900D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009B846600D77D
            2600BE510100BC500100BC530100B9520100B95A1000C1713600C8855900D19D
            7E00E3BFAA00EFD9CB00F7ECE500D89360006A39100057301A00A4592A00D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00A4937600F3B0
            6100D5741B00D06E0E00CB630100C75B0100C65A0100C2560100BF510100BD52
            0100BB530100B8550700BD682900C36318006F4219005B341B00A75A2A00D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC008E6549009F90
            7300B5A27E00C7AA7A00D7AE7200DBA55F00DD994A00DE8D3500DB802000D472
            1000D0680200CB5E0100C7580100CA5C0100653F1D0066381D00AC5D2B00D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D5DC
            D900C9BCAE00B4957F0091684C008963460085694F008C785E009F917300B29A
            7100C3A06B00D4A56200DA9B4E00DB8D3500704E2D00894B2400D6E0DF00D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D7E6E700D7E3E300D5D8D400C8B8
            A900AF8E77008E644900845F440083684E007D543800D1CDC500D8E9EC00D8E9
            EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00}
        end
      end
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 224
    Top = 16
  end
  object SP_CreditCard: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_TCreditCard;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@CardID'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@lastName'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@NID'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@FatherName'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@Address'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 500
        Value = Null
      end
      item
        Name = '@Tel'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 50
        Value = Null
      end
      item
        Name = '@CreditGroupID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Pic'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 100
        Value = Null
      end
      item
        Name = '@IssueDate'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
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
        Name = '@Active'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Comment'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 500
        Value = Null
      end
      item
        Name = '@Type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CardIssuePrice'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NotActive'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@NumberOfCustomer'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@generalCode'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 20
        Value = Null
      end
      item
        Name = '@genderId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@isLesson'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@creditCardId'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@isSession'
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
      end>
    Left = 192
    Top = 14
  end
  object QSubCreditCard: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'CreditCardID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from TsubCreditCard'
      'where CreditCardID = :CreditCardID')
    Left = 272
    Top = 14
  end
  object QCreditCard: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CardID, Name, lastName, NID, FatherName, Address, Tel, TC' +
        'reditCard.CreditGroupID, NumberOfCustomer,'
      
        'CreditGroupName, Pic, IssueDate, IssueTime, UserID, Active, Comm' +
        'ent, Type, TCReditCardType.Title, TCreditCard.CardIssuePrice, ge' +
        'neralCode, NotActive,'
      'gender.title genderTitle, genderId, isLesson, isSession'
      'from TCreditCard inner join TCreditGroup'
      'on TCreditCard.CreditGroupID = TCreditGroup.CreditGroupID'
      
        'inner join TCReditCardType on TCreditCardType.id = TCreditCard.t' +
        'ype'
      'inner join gender on TCreditCard.genderId = gender.id'
      'order by  issueDate, IssueTime DESC')
    Left = 64
    Top = 193
  end
  object dsCreditCard: TDataSource
    DataSet = QCreditCard
    Left = 104
    Top = 193
  end
  object pmnuGrid: TPopupMenu
    Left = 56
    Top = 257
    object pmnuEdit: TMenuItem
      Caption = #1608#1610#1585#1575#1610#1588
      OnClick = pmnuEditClick
    end
    object mnuSummary: TMenuItem
      Caption = #1582#1604#1575#1589#1607' '#1662#1585#1608#1606#1583#1607
      OnClick = mnuSummaryClick
    end
  end
  object QLesson: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'lessonCode'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      
        'Select TLesson.*, TLessonType.title lessonTypeTitle, TageCategor' +
        'y.title ageCategoryTitle,'
      'TLessonGroup.title lessonGroupTitle '
      'From TLesson '
      'inner join TLessonType on TLesson.lessonTypeId = TLessonType.id'
      
        'inner join TageCategory on TLesson.ageCategoryId = TageCategory.' +
        'id'
      
        'inner join TLessonGroup on TLesson.lessonGroupId = TLessonGroup.' +
        'id'
      'where Code = :lessonCode')
    Left = 662
    Top = 88
  end
  object SP_Enrollment: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_Enrollment;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@lessonId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@creditCardId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@userId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Price'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@enrollmentDate'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@enrollmentId'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
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
    Left = 734
    Top = 88
  end
  object SP_PaymentEnrollment: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_PaymentEnrollment;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@enrollmentId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@price'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@paymentDate'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@userId'
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
    Left = 790
    Top = 88
  end
  object QCheckCreditCard: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'cardId'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from TCreditCard'
      'where CardId= :cardId')
    Left = 1021
    Top = 287
  end
  object QFirstIssueDate: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select min(IssueDate) issueDate from TCreditCard')
    Left = 116
    Top = 247
  end
end
