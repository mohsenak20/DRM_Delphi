object frmAdvansedSearch: TfrmAdvansedSearch
  Left = 256
  Top = 110
  Width = 726
  Height = 500
  BiDiMode = bdRightToLeft
  Caption = #1580#1587#1578#1580#1608#1610' '#1662#1610#1588#1585#1601#1578#1607
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
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 121
    Align = alTop
    TabOrder = 0
    DesignSize = (
      710
      121)
    object Label21: TLabel
      Left = 395
      Top = 10
      Width = 72
      Height = 27
      Caption = #1588#1605#1575#1585#1607' '#1603#1604#1610#1583':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 216
      Top = 10
      Width = 47
      Height = 27
      Caption = #1575#1586' '#1578#1575#1585#1610#1582':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 107
      Top = 11
      Width = 17
      Height = 27
      Caption = #1575#1604#1610
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 593
      Top = 10
      Width = 90
      Height = 27
      Caption = #1588#1605#1575#1585#1607' '#1662#1584#1610#1585#1588':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 626
      Top = 78
      Width = 68
      Height = 27
      Caption = #1606#1575#1605' '#1605#1588#1578#1585#1610':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtStartDate: TMaskEdit
      Left = 128
      Top = 7
      Width = 86
      Height = 34
      Color = clInfoBk
      EditMask = '1300/00/00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '13  /  /  '
    end
    object edtKeyNumber: TEdit
      Left = 304
      Top = 7
      Width = 87
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
    object edtEndDate: TMaskEdit
      Left = 16
      Top = 7
      Width = 86
      Height = 34
      Color = clInfoBk
      EditMask = '1300/00/00;1;_'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '13  /  /  '
    end
    object edtReceptionID: TEdit
      Left = 499
      Top = 7
      Width = 92
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
    object edtCustomerName: TEdit
      Left = 408
      Top = 75
      Width = 215
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
    object BBtnAccept: TBitBtn
      Left = 16
      Top = 46
      Width = 689
      Height = 25
      Anchors = [akTop, akRight]
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 121
    Width = 710
    Height = 340
    Align = alClient
    DataSource = dsSearch
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
        Title.Caption = #1603#1583' '#1662#1584#1610#1585#1588
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustomerName'
        Title.Caption = #1606#1575#1605' '#1605#1588#1578#1585#1610
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ReceptionDate'
        Title.Caption = #1578#1575#1585#1610#1582' '#1662#1584#1610#1585#1588
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KeyNumber'
        Title.Caption = #1588#1605#1575#1585#1607' '#1603#1604#1610#1583
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StartTime'
        Title.Caption = #1587#1575#1593#1578' '#1608#1585#1608#1583
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EndTime'
        Title.Caption = #1587#1575#1593#1578' '#1582#1585#1608#1580
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Caption = #1605#1576#1604#1594' '#1583#1585#1610#1575#1601#1578#1610
        Width = 80
        Visible = True
      end>
  end
  object QSearch: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Treception')
    Left = 56
    Top = 152
  end
  object dsSearch: TDataSource
    DataSet = QSearch
    Left = 96
    Top = 152
  end
end
