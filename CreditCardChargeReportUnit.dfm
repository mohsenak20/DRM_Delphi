object frmCreditCardChargeReport: TfrmCreditCardChargeReport
  Left = 431
  Top = 168
  Width = 1055
  Height = 594
  BiDiMode = bdRightToLeft
  Caption = #1588#1575#1585#1688' '#1705#1575#1585#1578' '#1575#1593#1578#1576#1575#1585#1610
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
    Width = 1039
    Height = 145
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
      Top = 118
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
    Top = 471
    Width = 1039
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 145
    Width = 1039
    Height = 326
    Align = alClient
    DataSource = dsCharge
    PopupMenu = pmGrid
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CreditCardChargeID'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1705#1583
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CreditCardID'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1705#1575#1585#1578
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #1606#1575#1605
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CreditGroupID'
        Title.Caption = #1602#1585#1575#1585#1583#1575#1583
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CreditGroupName'
        Title.Caption = #1591#1585#1601' '#1602#1585#1575#1585#1583#1575#1583' '#1711#1585#1608#1607#1610
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1605#1576#1604#1594
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumberOfSession'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1578#1593#1583#1575#1583
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ChargeTime'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1587#1575#1593#1578
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ChargeDate'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1578#1575#1585#1610#1582
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'used'
        Title.Caption = #1575#1587#1578#1601#1575#1583#1607' '#1588#1583#1607
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'allSeassion'
        Title.Caption = #1705#1604' '#1580#1604#1587#1575#1578' '#1582#1585#1610#1583#1575#1585#1610' '#1588#1583#1607
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Active'
        Title.Caption = #1601#1593#1575#1604
        Width = 33
        Visible = True
      end>
  end
  object DBCheckBox1: TDBCheckBox
    Left = 416
    Top = 232
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
  object QDelete: TADOQuery
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
    Left = 720
    Top = 280
  end
  object pmGrid: TPopupMenu
    Left = 264
    Top = 248
    object mnuDelete: TMenuItem
      Caption = #1581#1584#1601
      OnClick = mnuDeleteClick
    end
  end
end
