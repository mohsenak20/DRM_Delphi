object frmOneSlidesReport: TfrmOneSlidesReport
  Left = 277
  Top = 300
  Width = 671
  Height = 743
  BiDiMode = bdRightToLeft
  Caption = #1605#1610#1607#1605#1575#1606#1575#1606#1610' '#1705#1607' '#1575#1586' '#1587#1585#1587#1585#1607' '#1607#1575' '#1575#1587#1578#1601#1575#1583#1607' '#1705#1585#1583#1607' '#1575#1606#1583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 28
  object Grid: TDBGrid
    Left = 0
    Top = 81
    Width = 655
    Height = 624
    Align = alClient
    DataSource = dsSlide
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    OnMouseMove = GridMouseMove
    OnTitleClick = GridTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ReceptionID'
        Title.Alignment = taCenter
        Title.Caption = #1705#1583' '#1662#1584#1610#1585#1588
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustomerName'
        Title.Alignment = taCenter
        Title.Caption = #1606#1575#1605' '#1605#1610#1607#1605#1575#1606
        Width = 208
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ClosedID'
        Title.Alignment = taCenter
        Title.Caption = #1588#1605#1575#1585#1607' '#1705#1605#1583
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Number'
        Title.Alignment = taCenter
        Title.Caption = #1578#1593#1583#1575#1583
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Times'
        Title.Alignment = taCenter
        Title.Caption = #1670#1606#1583' '#1576#1575#1585#1567
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 81
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 560
      Top = 10
      Width = 60
      Height = 28
      Caption = #1588#1605#1575#1585#1607' '#1705#1605#1583':'
    end
    object edtLockerNumber: TEdit
      Left = 432
      Top = 8
      Width = 121
      Height = 36
      TabOrder = 0
    end
    object BBtnAccept: TBitBtn
      Left = 10
      Top = 48
      Width = 637
      Height = 25
      Caption = #1580#1587#1578#1580#1608
      TabOrder = 1
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
  object QSlide: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      
        'select TReception.ReceptionID, CustomerName, ClosedID, SUM(Numbe' +
        'r) Number, COUNT(TFactor.FactorID) Times '
      
        'from TReception inner join TFactor on TReception.ReceptionID = T' +
        'Factor.ReceptionID'
      'inner join TSubFactor on TFactor.FactorID = TSubFactor.FactorID'
      'where ProductID = 744 and ReceptionDate = '#39'1392/10/23'#39
      'GROUP BY TReception.ReceptionID, CustomerName, ClosedID')
    Left = 64
    Top = 160
  end
  object dsSlide: TDataSource
    DataSet = QSlide
    Left = 144
    Top = 160
  end
end
