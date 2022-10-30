object frmCreditCard_Discount: TfrmCreditCard_Discount
  Left = -7
  Top = 139
  Width = 1038
  Height = 596
  BiDiMode = bdRightToLeft
  Caption = #1705#1575#1585#1578#1607#1575#1610' '#1578#1582#1601#1610#1601#1610
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1022
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label14: TLabel
      Left = 268
      Top = 12
      Width = 30
      Height = 26
      Caption = #1578#1575#1585#1610#1582':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 970
      Top = 8
      Width = 56
      Height = 27
      Caption = #1606#1575#1605' '#1705#1575#1585#1576#1585':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 154
      Top = 12
      Width = 18
      Height = 26
      Caption = #1575#1604#1610':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 972
      Top = 43
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
    object Label6: TLabel
      Left = 635
      Top = 40
      Width = 37
      Height = 27
      Caption = #1705#1575#1585#1578':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 634
      Top = 5
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
    object edtStartDate: TMaskEdit
      Left = 179
      Top = 9
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
    object edtUserID: TEdit
      Left = 926
      Top = 6
      Width = 41
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
    object edtUserName: TEdit
      Left = 751
      Top = 6
      Width = 176
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
    object btnUser: TBitBtn
      Left = 715
      Top = 6
      Width = 35
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnUserClick
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
    object BBtnAccept: TBitBtn
      Left = 2
      Top = 78
      Width = 1032
      Height = 23
      Caption = #1580#1587#1578#1580#1608
      TabOrder = 5
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
    object rbActive: TRadioButton
      Left = 224
      Top = 56
      Width = 48
      Height = 17
      Caption = #1601#1593#1575#1604
      TabOrder = 6
    end
    object rbNotActive: TRadioButton
      Left = 128
      Top = 56
      Width = 72
      Height = 17
      Caption = #1594#1610#1585' '#1601#1593#1575#1604
      TabOrder = 7
    end
    object RadioButton3: TRadioButton
      Left = 48
      Top = 56
      Width = 56
      Height = 17
      Caption = #1607#1585#1583#1608
      TabOrder = 8
    end
    object edtEndDate: TMaskEdit
      Left = 62
      Top = 9
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
      TabOrder = 1
      Text = '1   /  /  '
    end
    object edtCreditGroupID: TEdit
      Left = 926
      Top = 41
      Width = 41
      Height = 34
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object edtCreditGroupTitle: TEdit
      Left = 751
      Top = 41
      Width = 176
      Height = 34
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object btnCreditGroup: TBitBtn
      Left = 715
      Top = 41
      Width = 35
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = btnCreditGroupClick
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
    object edtCard: TEdit
      Left = 455
      Top = 38
      Width = 176
      Height = 34
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
    end
    object edtName: TEdit
      Left = 455
      Top = 3
      Width = 176
      Height = 34
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 473
    Width = 1022
    Height = 84
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 135
      Top = 24
      Width = 27
      Height = 27
      Caption = #1580#1605#1593':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSum: TLabel
      Left = 66
      Top = 24
      Width = 56
      Height = 27
      Caption = #1606#1575#1605' '#1705#1575#1585#1576#1585':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCount: TLabel
      Left = 282
      Top = 32
      Width = 56
      Height = 27
      Caption = #1606#1575#1605' '#1705#1575#1585#1576#1585':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 342
      Top = 32
      Width = 36
      Height = 27
      Caption = #1578#1593#1583#1575#1583':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnActive: TBitBtn
      Left = 816
      Top = 16
      Width = 193
      Height = 36
      Caption = ' '#1601#1593#1575#1604' '#1608' '#1594#1610#1585#1601#1593#1575#1604' '#1705#1585#1583#1606'(F2)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnActiveClick
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
    object Panel3: TPanel
      Left = 656
      Top = 24
      Width = 97
      Height = 33
      Caption = #1601#1593#1575#1604
      Color = clTeal
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 536
      Top = 24
      Width = 97
      Height = 33
      Caption = #1594#1610#1585#1601#1593#1575#1604
      Color = 14859518
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 105
    Width = 1022
    Height = 368
    Align = alClient
    DataSource = dsCharge
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'CardID'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1705#1575#1585#1578
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1606#1575#1605
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LastName'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1606#1575#1605' '#1582#1575#1606#1608#1575#1583#1711#1610
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CreditGroupID'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1602#1585#1575#1585#1583#1575#1583
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CreditGroupName'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1591#1585#1601' '#1602#1585#1575#1585#1583#1575#1583
        Width = 228
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CardIssuePrice'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1605#1576#1604#1594
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IssueTime'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1587#1575#1593#1578
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IssueDate'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1578#1575#1585#1610#1582
        Width = 119
        Visible = True
      end>
  end
  object DBCheckBox1: TDBCheckBox
    Left = 424
    Top = 216
    Width = 17
    Height = 17
    Color = clBtnFace
    DataField = 'Active'
    DataSource = dsCharge
    ParentColor = False
    TabOrder = 3
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    Visible = False
  end
  object QCharge: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'userID'
        Size = -1
        Value = Null
      end
      item
        Name = 'SatrtDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'EndDate'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'declare @userID int, @StartDate char(10), @EndDate char(10), @ c' +
        'har(10) '
      'set @userID = :userID'
      'set @StartDate = :SatrtDate'
      'set @EndDate = :EndDate'
      ''
      'if @userID > -1'
      'begin'
      
        '  select CreditCardChargeID, CreditCardID, Name+'#39' '#39'+lastName nam' +
        'e, CreditGroupName, TCReditGroup.CreditGroupID,Price, ChargeTime' +
        ', ChargeDate, NumberOfSession,'
      '  TCreditCard.CardIssuePrice, NotActive, NumberOfCustomer,'
      
        '  (select SUM(price) from TCreditCardCharge where ChargeDate >= ' +
        '@StartDate and ChargeDate <= @EndDate and UserID= @userID) sumPr' +
        'ice, TCreditCardCharge.Active,'
      
        '  (select count(CreditCardChargeID) from TCreditCardCharge where' +
        ' ChargeDate >= @StartDate and ChargeDate <= @EndDate and UserID=' +
        ' @userID) ChargeCount'
      
        '  from TCreditCardCharge inner join TCreditCard on TCreditCard.C' +
        'ardID = TCreditCardCharge.CreditCardID'
      
        '  inner join TCReditGroup on TCreditCard.CreditGroupID = TCRedit' +
        'Group.CreditGroupID'
      
        '  where ChargeDate >= @StartDate and ChargeDate <= @StartDate an' +
        'd TCreditCardCharge.UserID = @userID'
      '  order by ChargeDate, ChargeTime'
      'end'
      'else'
      'begin'
      ''
      
        '  select CreditCardChargeID, CreditCardID, Name+'#39' '#39'+lastName nam' +
        'e, CreditGroupName, TCReditGroup.CreditGroupID,Price, ChargeTime' +
        ', ChargeDate, NumberOfSession,'
      '  TCreditCard.CardIssuePrice, NotActive, NumberOfCustomer,'
      
        '  (select SUM(price) from TCreditCardCharge where ChargeDate >= ' +
        '@StartDate and ChargeDate <= @EndDate) sumPrice, TCreditCardChar' +
        'ge.Active,'
      
        '  (select count(CreditCardChargeID) from TCreditCardCharge where' +
        ' ChargeDate >= @StartDate and ChargeDate <= @EndDate) ChargeCoun' +
        't'
      
        '  from TCreditCardCharge inner join TCreditCard on TCreditCard.C' +
        'ardID = TCreditCardCharge.CreditCardID'
      
        '  inner join TCReditGroup on TCreditCard.CreditGroupID = TCRedit' +
        'Group.CreditGroupID'
      '  where ChargeDate >= @StartDate and ChargeDate <= @EndDate'
      '  order by ChargeDate, ChargeTime'
      'end')
    Left = 56
    Top = 216
  end
  object dsCharge: TDataSource
    DataSet = QCharge
    Left = 56
    Top = 256
  end
  object QActive: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Update TCreditCard set'
      'Active = Active ^1'
      'where id = :id')
    Left = 424
    Top = 498
  end
  object ActionList1: TActionList
    Left = 160
    Top = 217
    object Active: TAction
      Caption = 'Active'
      ShortCut = 113
      OnExecute = BtnActiveClick
    end
  end
end
