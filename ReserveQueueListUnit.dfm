object frmReserveQueueList: TfrmReserveQueueList
  Left = 176
  Top = 124
  Width = 1245
  Height = 702
  BiDiMode = bdRightToLeft
  Caption = #1604#1610#1587#1578' '#1585#1586#1585#1608' '#1589#1601
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
  object Shape1: TShape
    Left = 17
    Top = 151
    Width = 1200
    Height = 3
    Brush.Color = clFuchsia
  end
  object Shape2: TShape
    Left = 15
    Top = 294
    Width = 1202
    Height = 3
    Brush.Color = clFuchsia
  end
  object Shape3: TShape
    Left = 17
    Top = 439
    Width = 1208
    Height = 3
    Brush.Color = clFuchsia
  end
  object q6: TPanel
    Left = 24
    Top = 16
    Width = 185
    Height = 97
    Color = 208056
    TabOrder = 0
    OnClick = takeService
    object l6: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t6: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object q5: TPanel
    Left = 224
    Top = 16
    Width = 185
    Height = 97
    Color = 207796
    TabOrder = 1
    OnClick = takeService
    object l5: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t5: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object q4: TPanel
    Left = 424
    Top = 16
    Width = 185
    Height = 97
    Color = 207279
    TabOrder = 2
    OnClick = takeService
    object l4: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t4: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object q3: TPanel
    Left = 624
    Top = 16
    Width = 185
    Height = 97
    Color = 207275
    TabOrder = 3
    OnClick = takeService
    object l3: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t3: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object q2: TPanel
    Left = 824
    Top = 16
    Width = 185
    Height = 97
    Cursor = crHandPoint
    Color = 207015
    TabOrder = 4
    OnClick = takeService
    object l2: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t2: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object q1: TPanel
    Left = 1024
    Top = 16
    Width = 185
    Height = 97
    Color = 206496
    TabOrder = 5
    OnClick = takeService
    object l1: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t1: TLabel
      Left = 58
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e6: TButton
    Left = 24
    Top = 120
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 6
    OnClick = expireQueue
  end
  object e5: TButton
    Left = 224
    Top = 120
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 7
    OnClick = expireQueue
  end
  object e4: TButton
    Left = 424
    Top = 120
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 8
    OnClick = expireQueue
  end
  object e3: TButton
    Left = 624
    Top = 120
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 9
    OnClick = expireQueue
  end
  object e2: TButton
    Left = 824
    Top = 120
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 10
    OnClick = expireQueue
  end
  object e1: TButton
    Left = 1024
    Top = 120
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 11
    OnClick = expireQueue
  end
  object q12: TPanel
    Left = 24
    Top = 160
    Width = 185
    Height = 97
    Color = 275152
    TabOrder = 12
    OnClick = takeService
    object l12: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t12: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e12: TButton
    Left = 24
    Top = 264
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 13
    OnClick = expireQueue
  end
  object q11: TPanel
    Left = 224
    Top = 160
    Width = 185
    Height = 97
    Color = 274892
    TabOrder = 14
    OnClick = takeService
    object l11: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t11: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e11: TButton
    Left = 224
    Top = 264
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 15
    OnClick = expireQueue
  end
  object q10: TPanel
    Left = 424
    Top = 160
    Width = 185
    Height = 97
    Color = 274632
    TabOrder = 16
    OnClick = takeService
    object l10: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t10: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e10: TButton
    Left = 424
    Top = 264
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 17
    OnClick = expireQueue
  end
  object q9: TPanel
    Left = 624
    Top = 160
    Width = 185
    Height = 97
    Color = 274628
    TabOrder = 18
    OnClick = takeService
    object l9: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t9: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e9: TButton
    Left = 624
    Top = 264
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 19
    OnClick = expireQueue
  end
  object q8: TPanel
    Left = 824
    Top = 160
    Width = 185
    Height = 97
    Color = 208576
    TabOrder = 20
    OnClick = takeService
    object l8: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t8: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e8: TButton
    Left = 824
    Top = 264
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 21
    OnClick = expireQueue
  end
  object q7: TPanel
    Left = 1024
    Top = 160
    Width = 185
    Height = 97
    Color = 208316
    TabOrder = 22
    OnClick = takeService
    object l7: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t7: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e7: TButton
    Left = 1024
    Top = 264
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 23
    OnClick = expireQueue
  end
  object q18: TPanel
    Left = 24
    Top = 304
    Width = 185
    Height = 97
    Color = 276714
    TabOrder = 24
    OnClick = takeService
    object l18: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t18: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e18: TButton
    Left = 24
    Top = 408
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 25
    OnClick = expireQueue
  end
  object q17: TPanel
    Left = 224
    Top = 304
    Width = 185
    Height = 97
    Color = 276454
    TabOrder = 26
    OnClick = takeService
    object l17: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t17: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e17: TButton
    Left = 224
    Top = 408
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 27
    OnClick = expireQueue
  end
  object q16: TPanel
    Left = 424
    Top = 304
    Width = 185
    Height = 97
    Color = 276193
    TabOrder = 28
    OnClick = takeService
    object l16: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t16: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e16: TButton
    Left = 424
    Top = 408
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 29
    OnClick = expireQueue
  end
  object q15: TPanel
    Left = 624
    Top = 304
    Width = 185
    Height = 97
    Color = 275933
    TabOrder = 30
    OnClick = takeService
    object l15: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t15: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e15: TButton
    Left = 624
    Top = 408
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 31
    OnClick = expireQueue
  end
  object q14: TPanel
    Left = 824
    Top = 304
    Width = 185
    Height = 97
    Color = 275673
    TabOrder = 32
    OnClick = takeService
    object l14: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t14: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e14: TButton
    Left = 824
    Top = 408
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 33
    OnClick = expireQueue
  end
  object q13: TPanel
    Left = 1024
    Top = 304
    Width = 185
    Height = 97
    Color = 275413
    TabOrder = 34
    OnClick = takeService
    object l13: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t13: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e13: TButton
    Left = 1024
    Top = 408
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 35
    OnClick = expireQueue
  end
  object q24: TPanel
    Left = 24
    Top = 448
    Width = 185
    Height = 97
    Color = 869115
    TabOrder = 36
    OnClick = takeService
    object l24: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t24: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e24: TButton
    Left = 24
    Top = 552
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 37
    OnClick = expireQueue
  end
  object q23: TPanel
    Left = 224
    Top = 448
    Width = 185
    Height = 97
    Color = 606203
    TabOrder = 38
    OnClick = takeService
    object l23: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t23: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e23: TButton
    Left = 224
    Top = 552
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 39
    OnClick = expireQueue
  end
  object q22: TPanel
    Left = 424
    Top = 448
    Width = 185
    Height = 97
    Color = 277755
    TabOrder = 40
    OnClick = takeService
    object l22: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t22: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e22: TButton
    Left = 424
    Top = 552
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 41
    OnClick = expireQueue
  end
  object q21: TPanel
    Left = 624
    Top = 448
    Width = 185
    Height = 97
    Color = 277239
    TabOrder = 42
    OnClick = takeService
    object l21: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t21: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e21: TButton
    Left = 624
    Top = 552
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 43
    OnClick = expireQueue
  end
  object q20: TPanel
    Left = 824
    Top = 448
    Width = 185
    Height = 97
    Color = 276978
    TabOrder = 44
    OnClick = takeService
    object l20: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t20: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e20: TButton
    Left = 824
    Top = 552
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 45
    OnClick = expireQueue
  end
  object q19: TPanel
    Left = 1024
    Top = 448
    Width = 185
    Height = 97
    Color = 276974
    TabOrder = 46
    OnClick = takeService
    object l19: TLabel
      Left = 59
      Top = 8
      Width = 60
      Height = 47
      Alignment = taCenter
      Caption = '6784'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
    object t19: TLabel
      Left = 59
      Top = 48
      Width = 57
      Height = 42
      Alignment = taCenter
      Caption = '12:45'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 921214
      Font.Height = -24
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
    end
  end
  object e19: TButton
    Left = 1024
    Top = 552
    Width = 185
    Height = 25
    Caption = #1575#1576#1591#1575#1604
    TabOrder = 47
    OnClick = expireQueue
  end
  object Panel25: TPanel
    Left = 0
    Top = 594
    Width = 1229
    Height = 69
    Align = alBottom
    Color = 4418812
    TabOrder = 48
    object btnClose: TButton
      Left = 1024
      Top = 6
      Width = 185
      Height = 57
      Caption = #1576#1575#1586#1711#1588#1578
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object sp_take_service: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_get_service;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@queue_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 968
    Top = 456
  end
  object sp_expireQueue: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_expire_queue;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@queue_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 968
    Top = 496
  end
  object QQueues: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ReceptionDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'Service_provider_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select top 24  id, estimate_waiting_time, ClosedID'
      
        'from Treception inner join Tqueues on TReception.ReceptionID = T' +
        'Queues.reception_id'
      
        'where ReceptionDate = :ReceptionDate and TQueues.state = 2 and s' +
        'ervice_provider_id = :Service_provider_id'
      'order by Tqueues.id')
    Left = 968
    Top = 360
  end
end
