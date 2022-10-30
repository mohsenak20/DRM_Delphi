object frmViewFactors: TfrmViewFactors
  Left = 537
  Top = 141
  Width = 828
  Height = 533
  BiDiMode = bdRightToLeft
  Caption = #1605#1588#1575#1607#1583#1607' '#1601#1575#1705#1578#1608#1585#1607#1575
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 129
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 760
      Top = 12
      Width = 48
      Height = 29
      Caption = #1575#1586' '#1578#1575#1585#1610#1582':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 147
      Top = 12
      Width = 77
      Height = 29
      Caption = #1588#1605#1575#1585#1607' '#1601#1575#1705#1578#1608#1585':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 150
      Top = 50
      Width = 64
      Height = 29
      Caption = #1588#1605#1575#1585#1607' '#1705#1605#1583':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 749
      Top = 52
      Width = 35
      Height = 27
      Caption = #1705#1575#1585#1576#1585':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtFactorID: TEdit
      Left = 11
      Top = 8
      Width = 133
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
    object BBtnAccept: TBitBtn
      Left = 8
      Top = 101
      Width = 801
      Height = 25
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
    object edtReceptiondate: TMaskEdit
      Left = 643
      Top = 9
      Width = 107
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
    object edtClosedID: TEdit
      Left = 11
      Top = 46
      Width = 133
      Height = 37
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edtUserID: TEdit
      Left = 706
      Top = 50
      Width = 41
      Height = 34
      Color = clInfoBk
      Enabled = False
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object edtUserName: TEdit
      Left = 531
      Top = 50
      Width = 176
      Height = 34
      Color = clInfoBk
      Enabled = False
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object btnUser: TBitBtn
      Left = 495
      Top = 50
      Width = 35
      Height = 33
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
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
    object chbExit: TCheckBox
      Left = 336
      Top = 16
      Width = 297
      Height = 17
      Caption = #1601#1575#1705#1578#1608#1585#1607#1575#1610' '#1605#1610#1607#1605#1575#1606#1607#1575#1610' '#1582#1585#1608#1580' '#1582#1608#1585#1583#1607' '#1585#1575' '#1606#1610#1586' '#1606#1605#1575#1610#1588' '#1576#1583#1607
      TabOrder = 7
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 129
    Width = 812
    Height = 291
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 413
      Height = 289
      Align = alClient
      Color = clCream
      DataSource = DS_SubFactor
      PopupMenu = PopupMenuSubFactor
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Koodak'
      TitleFont.Style = []
      Columns = <
        item
          ButtonStyle = cbsNone
          Expanded = False
          FieldName = 'KalaName'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = []
          ReadOnly = True
          Title.Caption = #1606#1575#1605' '#1605#1581#1589#1608#1604
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Koodak'
          Title.Font.Style = []
          Width = 208
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Number'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = []
          Title.Caption = #1578#1593#1583#1575#1583
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Koodak'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VahedPrice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = []
          ReadOnly = True
          Title.Caption = #1602#1610#1605#1578' '#1608#1575#1581#1583
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Koodak'
          Title.Font.Style = []
          Width = 124
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 414
      Top = 1
      Width = 397
      Height = 289
      Align = alRight
      Color = clInfoBk
      DataSource = DS_Factor
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenuFactor
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Koodak'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid2DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'SerialNumber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = []
          Title.Caption = #1588#1605#1575#1585#1607' '#1601#1575#1705#1578#1608#1585
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Koodak'
          Title.Font.Style = []
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ExportTime'
          Title.Alignment = taCenter
          Title.Caption = #1587#1575#1593#1578
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ClosedID'
          Title.Caption = #1588#1605#1575#1585#1607' '#1705#1605#1583
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Koodak'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CustomerName'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Koodak'
          Font.Style = []
          Title.Caption = #1606#1575#1605' '#1605#1588#1578#1585#1610
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Koodak'
          Title.Font.Style = []
          Width = 174
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 439
    Width = 812
    Height = 55
    Align = alBottom
    TabOrder = 2
    object lblDel: TLabel
      Left = 712
      Top = 16
      Width = 44
      Height = 28
      Caption = #1585#1587#1578#1608#1585#1575#1606
    end
    object lblPreFactor: TLabel
      Left = 565
      Top = 16
      Width = 55
      Height = 28
      Caption = #1705#1575#1601#1610' '#1588#1575#1662
    end
    object lblBargain: TLabel
      Left = 422
      Top = 16
      Width = 38
      Height = 28
      Caption = #1593#1705#1575#1587#1610
    end
    object Label4: TLabel
      Left = 824
      Top = 16
      Width = 76
      Height = 28
      Caption = #1585#1575#1607#1606#1605#1575#1610' '#1585#1606#1711#1607#1575':'
    end
    object pnlDel: TPanel
      Left = 664
      Top = 16
      Width = 33
      Height = 25
      Color = 14859518
      TabOrder = 0
    end
    object pnlPreFactor: TPanel
      Left = 520
      Top = 16
      Width = 33
      Height = 25
      Color = clMoneyGreen
      TabOrder = 1
    end
    object pnlBargain: TPanel
      Left = 384
      Top = 16
      Width = 33
      Height = 25
      Color = clInactiveCaptionText
      TabOrder = 2
    end
    object BtnReturn: TBitBtn
      Left = 24
      Top = 11
      Width = 97
      Height = 36
      Caption = #1576#1575#1586#1711#1588#1578
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
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
    object btnDelFactors: TBitBtn
      Left = 137
      Top = 14
      Width = 144
      Height = 33
      Caption = #1601#1575#1705#1578#1608#1585#1607#1575#1610' '#1581#1584#1601' '#1588#1583#1607
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnDelFactorsClick
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
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 420
    Width = 812
    Height = 19
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Color = clInfoBk
    Panels = <
      item
        Text = #1576#1575#1586#1711#1588#1578'  :Esc'
        Width = 160
      end
      item
        Text = #1670#1575#1662': Ctrl+P'
        Width = 160
      end
      item
        Text = #1581#1584#1601':  Del'
        Width = 160
      end
      item
        Text = #1608#1610#1585#1575#1610#1588':   Ctrl+E'
        Width = 160
      end
      item
        Text = #1580#1587#1578#1580#1608': Ctrl+S'
        Width = 50
      end>
    ParentBiDiMode = False
  end
  object DS_SubFactor: TDataSource
    DataSet = QSubFactor
    Left = 384
    Top = 425
  end
  object DS_Factor: TDataSource
    DataSet = QFactors
    Left = 689
    Top = 385
  end
  object QSubFactor: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    BeforeDelete = QSubFactorBeforeDelete
    Parameters = <
      item
        Name = 'FactorID'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      
        'select TFactor.FactorID, TSubFactor.Code, TSubFactor.ProductID, ' +
        'KalaName, round(Number, 3) as Number, TSubFactor.VahedPrice from' +
        ' TFactor'
      'inner join TSubFactor on TFactor.FactorID=TSubFActor.FactorID'
      'inner join TKala on TSubFActor.ProductID=TKala.KalaID'
      'where TFactor.FactorID= :FactorID')
    Left = 320
    Top = 425
  end
  object QFactors: TADOQuery
    Connection = DM.ADOConnection
    BeforeDelete = QFactorsBeforeDelete
    AfterScroll = QFactorsAfterScroll
    Parameters = <
      item
        Name = 'ReceptionDate'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from TReception inner join TFactor'
      'on TReception.ReceptionID=TFactor.ReceptionID'
      'where ReceptionDate= :ReceptionDate'
      '')
    Left = 728
    Top = 385
  end
  object PopupMenuSubFactor: TPopupMenu
    Left = 152
    Top = 273
    object N2: TMenuItem
      Caption = #1581#1584#1601' '#1585#1583#1610#1601' '#1601#1575#1705#1578#1608#1585
      OnClick = N2Click
    end
  end
  object PopupMenuFactor: TPopupMenu
    Left = 560
    Top = 297
    object N1: TMenuItem
      Caption = #1581#1584#1601' '#1601#1575#1705#1578#1608#1585
      OnClick = N1Click
    end
  end
  object QDeleteFactor: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'FactorID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Delete TFactor'
      'where FactorID= :FactorID')
    Left = 560
    Top = 353
  end
  object QDeleteSubFactor: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'Code'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Delete TSubFactor'
      'where Code= :Code')
    Left = 152
    Top = 353
  end
end