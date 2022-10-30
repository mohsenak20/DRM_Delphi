object frmCreditCardTicket: TfrmCreditCardTicket
  Left = 174
  Top = 123
  Width = 1133
  Height = 776
  BiDiMode = bdRightToLeft
  Caption = #1662#1584#1610#1585#1588' '#1575#1593#1578#1576#1575#1585#1610
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
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1117
    Height = 409
    Align = alTop
    TabOrder = 0
    DesignSize = (
      1117
      409)
    object Label7: TLabel
      Left = 101
      Top = 70
      Width = 79
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1578#1593#1583#1575#1583' '#1607#1605#1585#1575#1607':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 346
      Top = 14
      Width = 24
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1606#1608#1593':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblType: TLabel
      Left = 305
      Top = 14
      Width = 9
      Height = 29
      Anchors = [akTop, akRight]
      Caption = '6'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clHighlight
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 282
      Top = 14
      Width = 8
      Height = 29
      Anchors = [akTop, akRight]
      Caption = '-'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTypeTitle: TLabel
      Left = 228
      Top = 14
      Width = 38
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1578#1593#1583#1575#1583':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clFuchsia
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 278
      Top = 70
      Width = 84
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1583#1575#1585#1606#1583#1607' '#1705#1575#1585#1578':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnSave: TBitBtn
      Left = 148
      Top = 305
      Width = 106
      Height = 36
      Anchors = [akTop, akRight]
      Caption = #1578#1575#1610#1610#1583
      TabOrder = 8
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
      Left = 20
      Top = 305
      Width = 120
      Height = 36
      Anchors = [akTop, akRight]
      Caption = #1575#1606#1589#1585#1575#1601
      TabOrder = 0
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
    object GroupBox1: TGroupBox
      Left = 397
      Top = 1
      Width = 719
      Height = 407
      Align = alRight
      TabOrder = 1
      DesignSize = (
        719
        407)
      object lblCard: TLabel
        Left = 606
        Top = 110
        Width = 19
        Height = 24
        Caption = #1705#1583':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 608
        Top = 206
        Width = 28
        Height = 24
        Caption = #1588#1575#1585#1688':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 608
        Top = 238
        Width = 72
        Height = 24
        Caption = #1575#1587#1578#1601#1575#1583#1607' '#1588#1583#1607':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape1: TShape
        Left = 13
        Top = 105
        Width = 120
        Height = 160
      end
      object Image: TImage
        Left = 13
        Top = 105
        Width = 120
        Height = 160
        Stretch = True
        Transparent = True
      end
      object Label2: TLabel
        Left = 602
        Top = 21
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
      object Shape2: TShape
        Left = 365
        Top = 105
        Width = 90
        Height = 120
      end
      object subPic1: TImage
        Left = 365
        Top = 105
        Width = 90
        Height = 120
        Stretch = True
        Transparent = True
      end
      object Shape3: TShape
        Left = 259
        Top = 105
        Width = 90
        Height = 120
      end
      object subPic2: TImage
        Left = 259
        Top = 105
        Width = 90
        Height = 120
        Stretch = True
        Transparent = True
      end
      object Shape4: TShape
        Left = 150
        Top = 105
        Width = 90
        Height = 120
      end
      object subPic3: TImage
        Left = 150
        Top = 105
        Width = 90
        Height = 120
        Stretch = True
        Transparent = True
      end
      object Label6: TLabel
        Left = 606
        Top = 174
        Width = 59
        Height = 24
        Caption = #1588#1605#1575#1585#1607' '#1605#1604#1610':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 606
        Top = 142
        Width = 18
        Height = 24
        Caption = #1606#1575#1605':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCardID: TLabel
        Left = 566
        Top = 110
        Width = 19
        Height = 24
        Caption = #1705#1583':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblAllSession: TLabel
        Left = 508
        Top = 201
        Width = 77
        Height = 33
        Caption = #1578#1593#1583#1575#1583' '#1580#1604#1587#1607':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUsed: TLabel
        Left = 528
        Top = 233
        Width = 57
        Height = 33
        Caption = #1576#1575#1602#1610#1605#1575#1606#1583#1607':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNID: TLabel
        Left = 526
        Top = 174
        Width = 59
        Height = 24
        Caption = #1588#1605#1575#1585#1607' '#1605#1604#1610':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblName: TLabel
        Left = 567
        Top = 142
        Width = 18
        Height = 24
        Caption = #1606#1575#1605':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 606
        Top = 272
        Width = 50
        Height = 24
        Caption = #1576#1575#1602#1610#1605#1575#1606#1583#1607':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMod: TLabel
        Left = 528
        Top = 267
        Width = 57
        Height = 33
        Caption = #1576#1575#1602#1610#1605#1575#1606#1583#1607':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 411
        Top = 21
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
      object Shape5: TShape
        Left = 365
        Top = 257
        Width = 90
        Height = 120
      end
      object subPic4: TImage
        Left = 365
        Top = 257
        Width = 90
        Height = 120
        Stretch = True
        Transparent = True
      end
      object Shape6: TShape
        Left = 259
        Top = 257
        Width = 90
        Height = 120
      end
      object subPic5: TImage
        Left = 259
        Top = 257
        Width = 90
        Height = 120
        Stretch = True
        Transparent = True
      end
      object Shape7: TShape
        Left = 150
        Top = 257
        Width = 90
        Height = 120
      end
      object subPic6: TImage
        Left = 150
        Top = 257
        Width = 90
        Height = 120
        Stretch = True
        Transparent = True
      end
      object Label11: TLabel
        Left = 178
        Top = 21
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
      object Label14: TLabel
        Left = 612
        Top = 304
        Width = 20
        Height = 24
        Caption = #1606#1608#1593':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCreditCardType: TLabel
        Left = 535
        Top = 299
        Width = 57
        Height = 33
        Caption = #1576#1575#1602#1610#1605#1575#1606#1583#1607':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSubSetName1: TLabel
        Left = 445
        Top = 227
        Width = 18
        Height = 24
        Caption = #1606#1575#1605':'
        FocusControl = BBtnAccept
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSubSetName2: TLabel
        Left = 342
        Top = 227
        Width = 18
        Height = 24
        Caption = #1606#1575#1605':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSubSetName3: TLabel
        Left = 230
        Top = 227
        Width = 18
        Height = 24
        Caption = #1606#1575#1605':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSubSetName4: TLabel
        Left = 445
        Top = 378
        Width = 18
        Height = 24
        Caption = #1606#1575#1605':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSubSetName5: TLabel
        Left = 342
        Top = 378
        Width = 18
        Height = 24
        Caption = #1606#1575#1605':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSubSetName6: TLabel
        Left = 230
        Top = 378
        Width = 18
        Height = 24
        Caption = #1606#1575#1605':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCreditGroupTitle: TLabel
        Left = 639
        Top = 331
        Width = 57
        Height = 33
        Caption = #1576#1575#1602#1610#1605#1575#1606#1583#1607':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCreditCardID: TEdit
        Left = 472
        Top = 19
        Width = 127
        Height = 37
        Color = clInfoBk
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnExit = edtCreditCardIDExit
      end
      object BBtnAccept: TBitBtn
        Left = 46
        Top = 59
        Width = 635
        Height = 35
        Anchors = [akLeft, akTop, akRight]
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
      object btnSearch: TBitBtn
        Left = 526
        Top = 366
        Width = 141
        Height = 33
        Caption = #1580#1587#1578#1580#1608' '#1576#1585' '#1575#1587#1575#1587' '#1606#1575#1605
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnSearchClick
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
      object edtNID: TEdit
        Left = 280
        Top = 19
        Width = 127
        Height = 37
        Color = clInfoBk
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnExit = edtCreditCardIDExit
      end
      object edtGeneralCode: TEdit
        Left = 48
        Top = 19
        Width = 127
        Height = 37
        Color = clInfoBk
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnExit = edtCreditCardIDExit
      end
    end
    object edtSubSetNumber: TEdit
      Left = 24
      Top = 66
      Width = 72
      Height = 37
      Anchors = [akTop, akRight]
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object chb2Person: TCheckBox
      Left = 29
      Top = 24
      Width = 97
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1705#1605#1583' '#1583#1608' '#1606#1601#1585#1607
      TabOrder = 2
    end
    object gbDiscount: TGroupBox
      Left = 21
      Top = 136
      Width = 360
      Height = 153
      Anchors = [akTop, akRight]
      Enabled = False
      TabOrder = 3
      Visible = False
      object Label9: TLabel
        Left = 287
        Top = 62
        Width = 46
        Height = 29
        Caption = #1578#1582#1601#1610#1601':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDiscount: TEdit
        Left = 168
        Top = 58
        Width = 113
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
    end
    object chbDiscount: TCheckBox
      Left = 179
      Top = 143
      Width = 174
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1575#1605#1585#1610#1607' '#1580#1607#1578' '#1705#1575#1585#1578#1607#1575#1610' '#1578#1582#1601#1610#1601#1610
      TabOrder = 4
      Visible = False
      OnClick = chbDiscountClick
    end
    object btnFreeTicket: TBitBtn
      Left = 263
      Top = 305
      Width = 106
      Height = 36
      Anchors = [akTop, akRight]
      Caption = #1576#1604#1610#1591' '#1607#1583#1610#1607
      Enabled = False
      TabOrder = 5
      OnClick = btnFreeTicketClick
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
    object edtOwner: TEdit
      Left = 202
      Top = 66
      Width = 72
      Height = 37
      Anchors = [akTop, akRight]
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 409
    Width = 1117
    Height = 308
    Align = alClient
    DataSource = dsReception
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ReceptionID'
        Title.Alignment = taCenter
        Title.Caption = #1705#1583' '#1662#1584#1610#1585#1588
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustomerName'
        Title.Alignment = taCenter
        Title.Caption = #1606#1575#1605
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 269
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ClosedID'
        Title.Caption = #1588#1605#1575#1585#1607' '#1705#1605#1583
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumberOfAdult'
        Title.Alignment = taCenter
        Title.Caption = #1578#1593#1583#1575#1583' '#1576#1586#1585#1711#1587#1575#1604
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumberOfChild'
        Title.Alignment = taCenter
        Title.Caption = #1578#1593#1583#1575#1583' '#1582#1585#1583#1587#1575#1604
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ReceptionDate'
        Title.Alignment = taCenter
        Title.Caption = #1578#1575#1585#1610#1582
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StartTime'
        Title.Alignment = taCenter
        Title.Caption = #1587#1575#1593#1578
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 101
        Visible = True
      end>
  end
  object SP_CreditCardCharge: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_TCreditCardCharge;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@CreditCardChargeID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CreditCardID'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
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
        Name = '@ChargeDate'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@NumberOfSession'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ChargeGroupID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
        Name = '@Action'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 6
        Value = Null
      end>
    Left = 776
    Top = 472
  end
  object dsReception: TDataSource
    DataSet = QReception
    Left = 536
    Top = 416
  end
  object QCreditCard: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CreditCardID'
        Size = -1
        Value = Null
      end
      item
        Name = 'NID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'Declare @purchased int, @used int, @CreditCardID nvarchar(10), @' +
        'NID nvarchar(10), @ChargeDate char(10)'
      'set @CreditCardID = :CreditCardID'
      'set @NID = :NID'
      'if @NID <> '#39'-1'#39
      
        #9'select top 1 @CreditCardID = CardID from TCreditCard where NID ' +
        '= @NID'
      ''
      'if @CreditCardID is null set @CreditCardID = '#39'-1'#39
      'else'
      'begin'
      
        #9'select @purchased = SUM(price) from TCreditCardCharge where Cre' +
        'ditCardID = @CreditCardID'
      ''
      ''
      
        #9'select @used = SUM(AdultPrice*NumberOfAdult) from TReception wh' +
        'ere CreditCardID = @CreditCardID'
      ''
      'end'
      'if @purchased is null set @purchased = 0'
      'if @used is null set @used = 0'
      ''
      ''
      
        'select CardID, Name+'#39' '#39'+lastName Name, NID, FatherName, Address,' +
        ' Tel, CreditGroupID, FreeTicket,'
      
        'Pic, IssueDate, IssueTime, UserID, Active, Type, Title, PriceFor' +
        'Reception, NumberOfCustomer, startFreeTicketDate, endFreeTicketD' +
        'ate,'
      
        'Comment, @used used, @purchased purchased from TCreditCard inner' +
        ' join TCreditCardType on TCreditCard.type = TcreditCardType.id'
      'where CardID = @CreditCardID'
      ''
      '')
    Left = 872
    Top = 136
  end
  object spReception: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_InsertReceptionCreditCard;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@CustomerName'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 100
        Value = Null
      end
      item
        Name = '@CustomerType'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@ReceptionDate'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@ReceptionType'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@Shift'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@Credit'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Mobile'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Pool'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Saat'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@AngoshtarPlak'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Sooeech'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Asnad'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Pakhsh'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@KeefPool'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Samsonet'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Other'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 200
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
        Name = '@UserID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CardID'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@JumpClosed'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@NumberOfAdult'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@NumberOfChild'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@CardID2'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@CardID3'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
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
        Name = '@OrderID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@HotelReceptionID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@KinderGarten'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@CreditCardID'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@creditCardOwnerPrice'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@creditCardSubSetPrice'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@creditCardOwner'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@creditCardSubSet'
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
        Name = '@ReceptionID'
        Attributes = [paNullable]
        DataType = ftLargeint
        Direction = pdInputOutput
        Precision = 19
        Value = Null
      end>
    Left = 816
    Top = 472
  end
  object RvSystem: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemOptions = [soAllowPrintFromPreview, soPreviewModal]
    DefaultDest = rdPrinter
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.Orientation = poLandScape
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 443
    Top = 557
  end
  object RvProject: TRvProject
    Engine = RvSystem
    ProjectFile = 'Enterver.rav'
    Left = 475
    Top = 557
  end
  object QPrint: TADOQuery
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
      
        'select Treception.ReceptionID, CustomerName, CustomerType, Recep' +
        'tionDate,'
      'TReception.NumberOfAdult, TReception.NumberOfChild,'
      
        'ReceptionType, Shift, StartTime, EndTime, TReception.Active, Mob' +
        'ile, Pool, Saat,'
      
        'AngoshtarPlak, Sooeech, Asnad, Pakhsh, KeefPool, Samsonet, Other' +
        ', Price,'
      
        'Treception.UserID as ReceptionUser, Enter, TCard.CardID, CardID2' +
        ', CardID3, BarCode, CardType, CreateDate, ExpireDate,'
      
        'TClosed.ClosedID, KeyNumber, PositionClosed, CompanyName, CardTy' +
        'peName, TClosed.Code, kinderGarten, TicketType'
      
        'from TReception inner join TCard on TReception.CardID=TCard.Card' +
        'ID'
      'inner join TCardType on TCard.CardType=TCardType.CardTypeID'
      'inner join TClosed on TReception.ClosedID=TClosed.ClosedID'
      'inner join TBargain on TCard.BargainID=TBargain.BargainID'
      'inner join TCompany on TBargain.CompanyID=TCompany.CompanyID'
      'where TReception.ReceptionID = :ReceptionID')
    Left = 520
    Top = 560
  end
  object QCredit: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ReceptionID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select * from TCredit where ReceptionID= :ReceptionID')
    Left = 568
    Top = 560
  end
  object QReception: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'UserID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ReceptionDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'select ReceptionID, CustomerName, NumberOfAdult, NumberOfChild, ' +
        'ClosedID, ReceptionDate, StartTime from TReception'
      
        'where UserID = :UserID and ReceptionDate = :ReceptionDate and Cr' +
        'editCardID is not null'
      'order by ReceptionID DESC')
    Left = 672
    Top = 488
  end
  object QSubCreditCard: TADOQuery
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
      'select *  from TSubCreditCard'
      'where CreditCardID = :CreditCardID')
    Left = 872
    Top = 177
  end
  object QAdultPrice: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      
        'declare @Bozorgsal int, @Shift1 int, @Shift2 int, @Shift3 int, @' +
        'PreEndTimeForDiscount char(5), @EndTimeForDiscount char(5), @now' +
        ' char(5)'
      'declare @ActiveEndPrice bit, @ActivePreEndPrice bit'
      
        'select   @Shift1 = Bozorgsal, @Shift2 = PreEndPrice, @Shift3 = e' +
        'ndprice,  @PreEndTimeForDiscount = PreEndTimeForDiscount, @EndTi' +
        'meForDiscount = EndTimeForDiscount, '
      
        '@now = dbo.FormatTimeString(cast(Datepart(hh, Getdate()) as char' +
        '(2))+'#39':'#39'+cast(Datepart(n, Getdate()) as char(2))),'
      
        '@ActiveEndPrice = ActiveEndPrice, @ActivePreEndPrice = ActivePre' +
        'EndPrice  from TParameter'
      ''
      'if @now >= @PreEndTimeForDiscount and @now< @EndTimeForDiscount'
      #9'if @ActivePreEndPrice = 1 '
      #9#9'set @Bozorgsal = @Shift2'
      #9'else'
      #9#9'set @Bozorgsal = @Shift1'#9
      'else'
      #9'if @now>= @EndTimeForDiscount '
      #9#9'if @ActiveEndPrice = 1'
      #9#9#9'set @Bozorgsal = @Shift3'
      #9#9'else'
      #9#9#9'if @ActivePreEndPrice = 1 '
      #9#9#9#9'set @Bozorgsal = @Shift2'
      #9#9#9'else'
      #9#9#9#9'set @Bozorgsal = @Shift1'#9
      #9'else'
      #9#9'set @Bozorgsal = @Shift1'
      #9
      'select @Bozorgsal as Bozorgsal')
    Left = 992
    Top = 544
  end
  object SP_Order: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_Order;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@OrderID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PersonOrder'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 100
        Value = Null
      end
      item
        Name = '@CustomerName'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 100
        Value = Null
      end
      item
        Name = '@Adult'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Child'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@AdultDiscount'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ChildDiscount'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
        Name = '@OrderDate'
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
        Name = '@AdultPrice'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ChildPrice'
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
      end
      item
        Name = '@CustomerID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@OrderType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@OutOrderID'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 949
    Top = 543
  end
  object qFreeTicket: TADOQuery
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
      'update TCreditCard set'
      'freeTicket = false '
      'where CardID = :CreditCardID')
    Left = 424
    Top = 432
  end
  object qUpdateFreeTicket: TADOQuery
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
      'Update TCreditCard set'
      'freeTicket = 0'
      'where CardID = :CreditCardID')
    Left = 432
    Top = 464
  end
  object sp_Price: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_CalcReceptionPrice_forCreditCard;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Price'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 776
    Top = 400
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 32
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 72
    Top = 480
    object N1: TMenuItem
      Caption = #1662#1585#1608#1606#1583#1607
      object mnuDeposit: TMenuItem
        Caption = #1588#1575#1585#1688' '#1575#1593#1578#1576#1575#1585
        ShortCut = 112
        OnClick = mnuDepositClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuNew: TMenuItem
        Caption = #1580#1583#1610#1583
        OnClick = mnuNewClick
      end
    end
  end
  object QIsInShift: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'CreditGroupId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from TCReditGroupAndShift '
      
        'where CreditGroupId = :CreditGroupId and shiftId = (select top 1' +
        ' currentShiftId from Tparameter)')
    Left = 873
    Top = 225
  end
  object QCheckRestrictRule: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'cardId'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'baseDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select isNull(sum(numberOfAdult), 0) ticketCount from TReception'
      'where CreditCardID = :cardId and receptionDate > :baseDate')
    Left = 413
    Top = 305
  end
  object QGetDate: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'days'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @days int'
      'set @days= :days'
      'SELECT DateAdd(DD,-@days,GETDATE() ) as baseDate')
    Left = 456
    Top = 304
  end
end
