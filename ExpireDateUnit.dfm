object frmExpireDate: TfrmExpireDate
  Left = 907
  Top = 317
  BiDiMode = bdRightToLeft
  BorderStyle = bsDialog
  Caption = #1575#1593#1578#1576#1575#1585' '#1705#1575#1585#1578
  ClientHeight = 476
  ClientWidth = 451
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
  object Label14: TLabel
    Left = 382
    Top = 14
    Width = 60
    Height = 26
    Caption = #1578#1575#1585#1610#1582' '#1575#1593#1578#1576#1575#1585':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Koodak'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtExpireDate: TMaskEdit
    Left = 289
    Top = 10
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
    TabOrder = 0
    Text = '1   /  /  '
  end
  object BBtnAccept: TBitBtn
    Left = 9
    Top = 435
    Width = 434
    Height = 33
    Caption = #1578#1575#1610#1610#1583
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
  object gbCard: TGroupBox
    Left = 256
    Top = 57
    Width = 185
    Height = 105
    TabOrder = 1
    object edtCardID: TEdit
      Left = 7
      Top = 42
      Width = 113
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
  object gbBargain: TGroupBox
    Left = 12
    Top = 57
    Width = 185
    Height = 105
    Enabled = False
    TabOrder = 2
    object edtBargainID: TEdit
      Left = 63
      Top = 42
      Width = 113
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
    object btnBargain: TBitBtn
      Left = 25
      Top = 40
      Width = 35
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnBargainClick
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
  object rbCard: TRadioButton
    Left = 342
    Top = 65
    Width = 86
    Height = 17
    Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578
    TabOrder = 4
    OnClick = rbCardClick
  end
  object rbBargain: TRadioButton
    Left = 93
    Top = 65
    Width = 95
    Height = 17
    Caption = #1588#1605#1575#1585#1607' '#1602#1585#1575#1585#1583#1575#1583
    TabOrder = 5
    TabStop = True
    OnClick = rbBargainClick
  end
  object GroupBox1: TGroupBox
    Left = 11
    Top = 167
    Width = 430
    Height = 59
    Enabled = False
    TabOrder = 6
    object Label1: TLabel
      Left = 277
      Top = 25
      Width = 45
      Height = 26
      Caption = #1575#1586' '#1588#1605#1575#1585#1607':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 136
      Top = 25
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
    object edtStartCardNumber: TEdit
      Left = 162
      Top = 20
      Width = 107
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
    object edtEndCardNumber: TEdit
      Left = 18
      Top = 19
      Width = 107
      Height = 34
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object rbFromTo: TRadioButton
    Left = 336
    Top = 169
    Width = 86
    Height = 17
    Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578
    TabOrder = 7
    OnClick = rbFromToClick
  end
  object gbAllBargain: TGroupBox
    Left = 12
    Top = 231
    Width = 429
    Height = 81
    Enabled = False
    TabOrder = 8
    object Label12: TLabel
      Left = 350
      Top = 34
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
    object edtCompanyID: TEdit
      Left = 308
      Top = 31
      Width = 41
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
    object edtCompanyName: TEdit
      Left = 133
      Top = 31
      Width = 176
      Height = 34
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btnCompany: TBitBtn
      Left = 97
      Top = 32
      Width = 35
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
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
  end
  object rbAllBargain: TRadioButton
    Left = 208
    Top = 240
    Width = 217
    Height = 17
    Caption = #1578#1605#1583#1610#1583' '#1602#1585#1575#1585#1583#1575#1583#1607#1575#1610' '#1610#1705' '#1588#1585#1705#1578' '#1582#1575#1589
    TabOrder = 9
    OnClick = rbAllBargainClick
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 321
    Width = 425
    Height = 105
    TabOrder = 10
    object Label3: TLabel
      Left = 345
      Top = 46
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
    object Label4: TLabel
      Left = 149
      Top = 46
      Width = 48
      Height = 26
      Caption = #1575#1604#1610' '#1578#1575#1585#1610#1582':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtStartDate: TMaskEdit
      Left = 249
      Top = 42
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
      TabOrder = 0
      Text = '1   /  /  '
    end
    object edtEndDate: TMaskEdit
      Left = 57
      Top = 42
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
  end
  object rbStartDateTo: TRadioButton
    Left = 264
    Top = 329
    Width = 164
    Height = 17
    Caption = #1575#1586' '#1578#1575#1585#1610#1582' '#1602#1585#1575#1585#1583#1575#1583' '#1575#1604#1610' '#1578#1575#1585#1610#1582
    Checked = True
    TabOrder = 11
    TabStop = True
    OnClick = rbCardClick
  end
  object QCard: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ExpireDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'CardID'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'Update TCard set'
      'ExpireDate= :ExpireDate'
      'where CardID= :CardID')
    Left = 8
    Top = 7
  end
  object QBargain: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ExpireDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'BargainID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Update TCard set'
      'ExpireDate= :ExpireDate'
      'where BargainID= :BargainID')
    Left = 48
    Top = 7
  end
  object QFromTo: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ExpireDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'StartCardID'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end
      item
        Name = 'EndCardID'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'Update TCard set'
      'ExpireDate= :ExpireDate'
      'where CardID >= :StartCardID and CardID <= :EndCardID ')
    Left = 96
    Top = 7
  end
  object QAllBargain: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ExpireDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'CompanyID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update TCard set'
      'ExpireDate = :ExpireDate'
      
        'where BargainID in (select BargainID from TBargain where Company' +
        'ID = :CompanyID)')
    Left = 44
    Top = 255
  end
  object QBargainDateTo: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ExpireDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'startDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'endDate'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update TCard set'
      'ExpireDate = :ExpireDate'
      
        'where BargainID in (select BargainID from TBargain where Bargain' +
        'Date >= :startDate and BargainDate <= :endDate)')
    Left = 52
    Top = 327
  end
end
