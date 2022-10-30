object frmDeActiveCard: TfrmDeActiveCard
  Left = 568
  Top = 230
  Width = 475
  Height = 453
  BiDiMode = bdRightToLeft
  Caption = #1605#1587#1583#1608#1583' '#1606#1605#1608#1583#1606' '#1705#1575#1585#1578#1607#1575
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
  object Label3: TLabel
    Left = 371
    Top = 255
    Width = 77
    Height = 28
    Caption = #1583#1604#1610#1604' '#1605#1587#1583#1608#1583#1610':'
  end
  object BBtnAccept: TBitBtn
    Left = 17
    Top = 380
    Width = 434
    Height = 33
    Caption = #1578#1575#1610#1610#1583
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
  object gbCard: TGroupBox
    Left = 264
    Top = 44
    Width = 185
    Height = 105
    TabOrder = 0
    object edtCardID: TEdit
      Left = 10
      Top = 34
      Width = 113
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
    object btnCheckStatus: TBitBtn
      Left = 8
      Top = 75
      Width = 169
      Height = 25
      Caption = #1608#1590#1593#1610#1578' '#1705#1575#1585#1578
      TabOrder = 0
      OnClick = btnCheckStatusClick
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
  object gbBargain: TGroupBox
    Left = 20
    Top = 44
    Width = 185
    Height = 105
    Enabled = False
    TabOrder = 1
    object edtBargainID: TEdit
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
  object rbCard: TRadioButton
    Left = 350
    Top = 50
    Width = 86
    Height = 17
    Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578
    Checked = True
    TabOrder = 3
    TabStop = True
    OnClick = rbCardClick
  end
  object rbBargain: TRadioButton
    Left = 101
    Top = 50
    Width = 95
    Height = 17
    Caption = #1588#1605#1575#1585#1607' '#1602#1585#1575#1585#1583#1575#1583
    TabOrder = 4
    TabStop = True
    OnClick = rbBargainClick
  end
  object gbFromTo: TGroupBox
    Left = 20
    Top = 152
    Width = 429
    Height = 105
    TabOrder = 5
    object Label1: TLabel
      Left = 292
      Top = 45
      Width = 47
      Height = 28
      Caption = #1575#1586' '#1588#1605#1575#1585#1607':'
    end
    object Label2: TLabel
      Left = 152
      Top = 45
      Width = 19
      Height = 28
      Caption = #1575#1604#1610':'
    end
    object edtEndNumber: TEdit
      Left = 32
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
    object edtStartNumber: TEdit
      Left = 175
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
      TabOrder = 1
    end
  end
  object rbFromTo: TRadioButton
    Left = 358
    Top = 160
    Width = 86
    Height = 17
    Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578
    TabOrder = 6
    OnClick = rbFromToClick
  end
  object memComment: TMemo
    Left = 20
    Top = 281
    Width = 428
    Height = 95
    Color = clInfoBk
    TabOrder = 7
  end
  object GroupBox2: TGroupBox
    Left = 20
    Top = 0
    Width = 429
    Height = 44
    TabOrder = 8
    object rbDeActive: TRadioButton
      Left = 303
      Top = 19
      Width = 113
      Height = 17
      Caption = #1605#1587#1583#1608#1583' '#1705#1585#1583#1606
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbActive: TRadioButton
      Left = 63
      Top = 19
      Width = 113
      Height = 17
      Caption = #1601#1593#1575#1604' '#1606#1605#1608#1583#1606
      TabOrder = 1
    end
  end
  object QCheckStatus: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'CardID'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'select * from TCard'
      'where CardID= :CardID')
    Left = 264
    Top = 60
  end
end
