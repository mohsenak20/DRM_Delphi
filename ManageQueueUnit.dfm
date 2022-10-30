object frmManageQueue: TfrmManageQueue
  Left = 241
  Top = 236
  Width = 1244
  Height = 700
  BiDiMode = bdRightToLeft
  Caption = #1605#1583#1610#1585#1610#1578' '#1589#1601
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
    Tag = 6
    Left = 24
    Top = 16
    Width = 185
    Height = 97
    Color = 41472
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
    Tag = 5
    Left = 224
    Top = 16
    Width = 185
    Height = 97
    Color = 40192
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
    Tag = 4
    Left = 424
    Top = 16
    Width = 185
    Height = 97
    Color = 39168
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
    Tag = 3
    Left = 624
    Top = 16
    Width = 185
    Height = 97
    Color = 38144
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
    Tag = 2
    Left = 824
    Top = 16
    Width = 185
    Height = 97
    Cursor = crHandPoint
    Color = 37120
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
    Tag = 1
    Left = 1024
    Top = 16
    Width = 185
    Height = 97
    Color = clGreen
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
  object r6: TButton
    Left = 24
    Top = 120
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 6
    OnClick = gotoReserve
  end
  object r5: TButton
    Left = 224
    Top = 120
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 7
    OnClick = gotoReserve
  end
  object r4: TButton
    Left = 424
    Top = 120
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 8
    OnClick = gotoReserve
  end
  object r3: TButton
    Left = 624
    Top = 120
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 9
    OnClick = gotoReserve
  end
  object r2: TButton
    Left = 824
    Top = 120
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 10
    OnClick = gotoReserve
  end
  object r1: TButton
    Left = 1024
    Top = 120
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 11
    OnClick = gotoReserve
  end
  object q12: TPanel
    Tag = 12
    Left = 24
    Top = 160
    Width = 185
    Height = 97
    Color = 47872
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
  object r12: TButton
    Left = 24
    Top = 264
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 13
    OnClick = gotoReserve
  end
  object q11: TPanel
    Tag = 11
    Left = 224
    Top = 160
    Width = 185
    Height = 97
    Color = 46848
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
  object r11: TButton
    Left = 224
    Top = 264
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 15
    OnClick = gotoReserve
  end
  object q10: TPanel
    Tag = 10
    Left = 424
    Top = 160
    Width = 185
    Height = 97
    Color = 45824
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
  object r10: TButton
    Left = 424
    Top = 264
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 17
    OnClick = gotoReserve
  end
  object q9: TPanel
    Tag = 9
    Left = 624
    Top = 160
    Width = 185
    Height = 97
    Color = 44544
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
  object r9: TButton
    Left = 624
    Top = 264
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 19
    OnClick = gotoReserve
  end
  object q8: TPanel
    Tag = 8
    Left = 824
    Top = 160
    Width = 185
    Height = 97
    Color = 43520
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
  object r8: TButton
    Left = 824
    Top = 264
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 21
    OnClick = gotoReserve
  end
  object q7: TPanel
    Tag = 7
    Left = 1024
    Top = 160
    Width = 185
    Height = 97
    Color = 42496
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
  object r7: TButton
    Left = 1024
    Top = 264
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 23
    OnClick = gotoReserve
  end
  object q18: TPanel
    Tag = 18
    Left = 24
    Top = 304
    Width = 185
    Height = 97
    Color = 54528
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
  object r18: TButton
    Left = 24
    Top = 408
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 25
    OnClick = gotoReserve
  end
  object q17: TPanel
    Tag = 17
    Left = 224
    Top = 304
    Width = 185
    Height = 97
    Color = 53248
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
  object r17: TButton
    Left = 224
    Top = 408
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 27
    OnClick = gotoReserve
  end
  object q16: TPanel
    Tag = 16
    Left = 424
    Top = 304
    Width = 185
    Height = 97
    Color = 52224
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
  object r16: TButton
    Left = 424
    Top = 408
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 29
    OnClick = gotoReserve
  end
  object q15: TPanel
    Tag = 15
    Left = 624
    Top = 304
    Width = 185
    Height = 97
    Color = 51200
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
  object r15: TButton
    Left = 624
    Top = 408
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 31
    OnClick = gotoReserve
  end
  object q14: TPanel
    Tag = 14
    Left = 824
    Top = 304
    Width = 185
    Height = 97
    Color = 50176
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
  object r14: TButton
    Left = 824
    Top = 408
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 33
    OnClick = gotoReserve
  end
  object q13: TPanel
    Tag = 13
    Left = 1024
    Top = 304
    Width = 185
    Height = 97
    Color = 48896
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
  object r13: TButton
    Left = 1024
    Top = 408
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 35
    OnClick = gotoReserve
  end
  object q24: TPanel
    Tag = 24
    Left = 24
    Top = 448
    Width = 185
    Height = 97
    Color = 60928
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
  object r24: TButton
    Left = 24
    Top = 552
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 37
    OnClick = gotoReserve
  end
  object q23: TPanel
    Tag = 23
    Left = 224
    Top = 448
    Width = 185
    Height = 97
    Color = 59904
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
  object r23: TButton
    Left = 224
    Top = 552
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 39
    OnClick = gotoReserve
  end
  object q22: TPanel
    Tag = 22
    Left = 424
    Top = 448
    Width = 185
    Height = 97
    Color = 58880
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
  object r22: TButton
    Left = 424
    Top = 552
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 41
    OnClick = gotoReserve
  end
  object q21: TPanel
    Tag = 21
    Left = 624
    Top = 448
    Width = 185
    Height = 97
    Color = 57600
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
  object r21: TButton
    Left = 624
    Top = 552
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 43
    OnClick = gotoReserve
  end
  object q20: TPanel
    Tag = 20
    Left = 824
    Top = 448
    Width = 185
    Height = 97
    Color = 56576
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
  object r20: TButton
    Left = 824
    Top = 552
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 45
    OnClick = gotoReserve
  end
  object q19: TPanel
    Tag = 19
    Left = 1024
    Top = 448
    Width = 185
    Height = 97
    Color = 55552
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
  object r19: TButton
    Left = 1024
    Top = 552
    Width = 185
    Height = 25
    Caption = #1585#1586#1585#1608
    TabOrder = 47
    OnClick = gotoReserve
  end
  object Panel25: TPanel
    Left = 0
    Top = 592
    Width = 1228
    Height = 69
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 48
    object Button25: TButton
      Left = 1024
      Top = 6
      Width = 185
      Height = 57
      Caption = #1605#1588#1575#1607#1583#1607' '#1604#1610#1587#1578' '#1585#1586#1585#1608
      TabOrder = 0
      OnClick = Button25Click
    end
    object Button1: TButton
      Left = 16
      Top = 7
      Width = 185
      Height = 57
      Caption = #1601#1593#1575#1604' '#1608' '#1594#1610#1585' '#1601#1593#1575#1604' '#1705#1585#1583#1606
      TabOrder = 1
      OnClick = Button1Click
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
      
        'where ReceptionDate = :ReceptionDate and TQueues.state = 1 and s' +
        'ervice_provider_id = :Service_provider_id'
      'order by Tqueues.id')
    Left = 288
    Top = 176
  end
  object sp_gotoReserve: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_goto_reserve_list_queue;1'
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
    Left = 848
    Top = 456
  end
  object Timer: TTimer
    Interval = 60000
    OnTimer = TimerTimer
    Left = 600
    Top = 137
  end
end
