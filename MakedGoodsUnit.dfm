object frmMakedGoods: TfrmMakedGoods
  Left = 285
  Top = 136
  Width = 1131
  Height = 802
  BiDiMode = bdRightToLeft
  Caption = #1570#1605#1575#1583#1607' '#1587#1575#1586#1610' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnCreate = Timer1Timer
  PixelsPerInch = 96
  TextHeight = 28
  object GroupBox1: TGroupBox
    Left = 834
    Top = 1
    Width = 273
    Height = 185
    TabOrder = 0
    object lblKalaName1: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblKalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object maked: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder1: TLabel
      Left = 69
      Top = 55
      Width = 111
      Height = 47
      Caption = 'lblOrder1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown1: TUpDown
      Left = 198
      Top = 101
      Width = 69
      Height = 78
      Associate = Edit1
      Min = -10
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood1: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood1Click
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
  object GroupBox2: TGroupBox
    Left = 558
    Top = 1
    Width = 273
    Height = 185
    TabOrder = 1
    object lblKalaName2: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder2: TLabel
      Left = 106
      Top = 53
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown2: TUpDown
      Left = 198
      Top = 101
      Width = 69
      Height = 78
      Associate = Edit2
      Min = -10
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood2: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood2Click
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
  object GroupBox3: TGroupBox
    Left = 282
    Top = 1
    Width = 273
    Height = 185
    TabOrder = 2
    object lblKalaName3: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder3: TLabel
      Left = 106
      Top = 54
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown3: TUpDown
      Left = 198
      Top = 101
      Width = 69
      Height = 78
      Associate = Edit3
      Min = -10
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood3: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood3Click
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
  object GroupBox4: TGroupBox
    Left = 5
    Top = 1
    Width = 273
    Height = 185
    TabOrder = 3
    object lblKalaName4: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder4: TLabel
      Left = 106
      Top = 54
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown4: TUpDown
      Left = 198
      Top = 101
      Width = 69
      Height = 78
      Associate = Edit4
      Min = -10
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood4: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood4Click
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
  object GroupBox5: TGroupBox
    Left = 834
    Top = 185
    Width = 273
    Height = 185
    TabOrder = 4
    object lblKalaName5: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder5: TLabel
      Left = 106
      Top = 55
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown5: TUpDown
      Left = 198
      Top = 101
      Width = 69
      Height = 78
      Associate = Edit5
      Min = -10
      TabOrder = 0
    end
    object Edit5: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood5: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood5Click
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
  object GroupBox6: TGroupBox
    Left = 558
    Top = 185
    Width = 273
    Height = 185
    TabOrder = 5
    object lblKalaName6: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder6: TLabel
      Left = 106
      Top = 54
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown6: TUpDown
      Left = 198
      Top = 101
      Width = 69
      Height = 78
      Associate = Edit6
      Min = -10
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood6: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood6Click
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
  object GroupBox7: TGroupBox
    Left = 282
    Top = 185
    Width = 273
    Height = 185
    TabOrder = 6
    object lblKalaName7: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder7: TLabel
      Left = 106
      Top = 53
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown7: TUpDown
      Left = 198
      Top = 101
      Width = 69
      Height = 78
      Associate = Edit7
      Min = -10
      TabOrder = 0
    end
    object Edit7: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood7: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood7Click
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
  object GroupBox8: TGroupBox
    Left = 5
    Top = 185
    Width = 273
    Height = 185
    TabOrder = 7
    object lblKalaName8: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder8: TLabel
      Left = 106
      Top = 54
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown8: TUpDown
      Left = 198
      Top = 101
      Width = 69
      Height = 78
      Associate = Edit8
      Min = -10
      TabOrder = 0
    end
    object Edit8: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood8: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood8Click
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
  object GroupBox9: TGroupBox
    Left = 835
    Top = 369
    Width = 273
    Height = 185
    TabOrder = 8
    object lblKalaName9: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder9: TLabel
      Left = 106
      Top = 54
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown9: TUpDown
      Left = 198
      Top = 101
      Width = 69
      Height = 78
      Associate = Edit9
      Min = -10
      TabOrder = 0
    end
    object Edit9: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood9: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood9Click
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
  object GroupBox10: TGroupBox
    Left = 558
    Top = 369
    Width = 273
    Height = 185
    TabOrder = 9
    object lblKalaName10: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder10: TLabel
      Left = 106
      Top = 54
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown10: TUpDown
      Left = 198
      Top = 101
      Width = 67
      Height = 78
      Associate = Edit10
      Min = -10
      TabOrder = 0
    end
    object Edit10: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood10: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood10Click
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
  object GroupBox11: TGroupBox
    Left = 282
    Top = 369
    Width = 273
    Height = 185
    TabOrder = 10
    object lblKalaName11: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder11: TLabel
      Left = 106
      Top = 54
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown11: TUpDown
      Left = 198
      Top = 101
      Width = 67
      Height = 78
      Associate = Edit11
      Min = -10
      TabOrder = 0
    end
    object Edit11: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood11: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood11Click
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
  object GroupBox12: TGroupBox
    Left = 5
    Top = 369
    Width = 273
    Height = 185
    TabOrder = 11
    object lblKalaName12: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder12: TLabel
      Left = 106
      Top = 53
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown12: TUpDown
      Left = 198
      Top = 101
      Width = 67
      Height = 78
      Associate = Edit12
      Min = -10
      TabOrder = 0
    end
    object Edit12: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood12: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood12Click
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
  object GroupBox13: TGroupBox
    Left = 834
    Top = 553
    Width = 273
    Height = 185
    TabOrder = 12
    object lblKalaName13: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder13: TLabel
      Left = 106
      Top = 53
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown13: TUpDown
      Left = 198
      Top = 101
      Width = 67
      Height = 78
      Associate = Edit13
      Min = -10
      TabOrder = 0
    end
    object Edit13: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood13: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood13Click
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
  object GroupBox14: TGroupBox
    Left = 558
    Top = 553
    Width = 273
    Height = 185
    TabOrder = 13
    object lblKalaName14: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder14: TLabel
      Left = 106
      Top = 52
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown14: TUpDown
      Left = 198
      Top = 101
      Width = 67
      Height = 78
      Associate = Edit14
      Min = -10
      TabOrder = 0
    end
    object Edit14: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood14: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood14Click
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
  object GroupBox15: TGroupBox
    Left = 282
    Top = 553
    Width = 273
    Height = 185
    TabOrder = 14
    object lblKalaName15: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder15: TLabel
      Left = 106
      Top = 54
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown15: TUpDown
      Left = 198
      Top = 101
      Width = 67
      Height = 78
      Associate = Edit15
      Min = -10
      TabOrder = 0
    end
    object Edit15: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood15: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood15Click
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
  object GroupBox16: TGroupBox
    Left = 5
    Top = 553
    Width = 273
    Height = 185
    TabOrder = 15
    object lblKalaName16: TLabel
      Left = 8
      Top = 16
      Width = 257
      Height = 39
      Alignment = taCenter
      AutoSize = False
      Caption = 'KalaName1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 189
      Top = 61
      Width = 75
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1587#1601#1575#1585#1588':'
    end
    object lblOrder16: TLabel
      Left = 106
      Top = 54
      Width = 74
      Height = 47
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object UpDown16: TUpDown
      Left = 198
      Top = 101
      Width = 67
      Height = 78
      Associate = Edit16
      Min = -10
      TabOrder = 0
    end
    object Edit16: TEdit
      Left = 77
      Top = 101
      Width = 121
      Height = 78
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -40
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
    object btnGood16: TBitBtn
      Left = 4
      Top = 101
      Width = 74
      Height = 79
      TabOrder = 2
      OnClick = btnGood16Click
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
  object QGoods: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'UserID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'Select * from TMakedGoods inner join TKala on TMakedGoods.GoodID' +
        ' = TKala.KalaID'
      'where UserID = :UserID'
      'order by priority'
      '')
    Left = 15
    Top = 25
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 287
    Top = 17
  end
  object QUpdateGood: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'NewMake'
        Size = -1
        Value = Null
      end
      item
        Name = 'GoodID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Declare @NewMake int, @GoodID int'
      'set @NewMake = :NewMake'
      'set @GoodID = :GoodID'
      ''
      'Update TMakedGoods set'
      'Maked = Maked + @NewMake'
      'where GoodID = @GoodID'
      ''
      'select GoodID, OrderGood - Maked as Mod from TMakedGoods'
      'where GoodID = @GoodID')
    Left = 15
    Top = 65
  end
  object QUpdateForm: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'UserID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select GoodID, OrderGood - Maked as Mod from TKala inner join TM' +
        'akedGoods on TKala.KalaID = TMakedGoods.GoodID'
      'where UserID = :UserID'
      'order by Priority'
      ''
      ''
      ''
      '')
    Left = 70
    Top = 33
  end
  object QClearForm: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'userID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Update TMakedGoods set'
      'OrderGood = 0,'
      'Maked = 0'
      
        'where GoodID in (select GoodID from TKala inner join TMakedGoods' +
        ' on TKala.KalaID = TMakedGoods.GoodID'
      'where UserID = :userID)')
    Left = 566
    Top = 25
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 64
    object vkni1: TMenuItem
      Caption = #1662#1585#1608#1606#1583#1607
      object mnuStart: TMenuItem
        Caption = #1588#1585#1608#1593
        OnClick = mnuStartClick
      end
    end
  end
end
