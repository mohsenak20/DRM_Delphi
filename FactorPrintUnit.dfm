object frmFactorPrint: TfrmFactorPrint
  Left = 634
  Top = 354
  Width = 337
  Height = 276
  BiDiMode = bdRightToLeft
  Caption = #1670#1575#1662' '#1589#1608#1585#1578' '#1581#1587#1575#1576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 28
  object Label12: TLabel
    Left = 257
    Top = 23
    Width = 61
    Height = 28
    Caption = #1588#1605#1575#1585#1607' '#1603#1604#1610#1583':'
  end
  object Label1: TLabel
    Left = 241
    Top = 71
    Width = 61
    Height = 28
    Caption = #1603#1583' '#1662#1584#1610#1585#1588':'
  end
  object Label2: TLabel
    Left = 244
    Top = 103
    Width = 58
    Height = 28
    Caption = #1606#1575#1605' '#1605#1588#1578#1585#1610':'
  end
  object lblReceptionID: TDBText
    Left = 8
    Top = 76
    Width = 225
    Height = 24
    DataField = 'ReceptionID'
    DataSource = DSsEARCH
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -16
    Font.Name = 'Koodak'
    Font.Style = []
    ParentFont = False
  end
  object lblCustomerName: TDBText
    Left = 16
    Top = 108
    Width = 217
    Height = 29
    DataField = 'CustomerName'
    DataSource = DSsEARCH
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -16
    Font.Name = 'Koodak'
    Font.Style = []
    ParentFont = False
  end
  object edtKeyNumber: TEdit
    Left = 192
    Top = 21
    Width = 60
    Height = 37
    Color = clInfoBk
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Koodak'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = edtKeyNumberExit
    OnExit = edtKeyNumberExit
    OnKeyDown = edtKeyNumberKeyDown
  end
  object btnAccept: TBitBtn
    Left = 11
    Top = 193
    Width = 302
    Height = 34
    Hint = #1575#1606#1578#1582#1575#1576' '#1581#1587#1575#1576
    TabOrder = 1
    OnClick = btnAcceptClick
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
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 164
    Width = 304
    Height = 25
    DataSource = DSsEARCH
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 2
  end
  object btnPrintLockerCode: TBitBtn
    Left = 11
    Top = 23
    Width = 142
    Height = 34
    Hint = #1670#1575#1662' '#1576#1585#1711#1607' '#1575#1605#1575#1606#1575#1578
    Caption = #1670#1575#1662' '#1576#1585#1711#1607' '#1705#1601#1588#1583#1575#1585#1610
    TabOrder = 3
    OnClick = btnPrintLockerCodeClick
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
  object QSearch: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'KeyNumber'
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
      end
      item
        Name = 'serviceCenterId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * from TReception inner join TClosed on'
      'TReception.ClosedID=TClosed.ClosedID'
      
        'where KeyNumber = :KeyNumber and ReceptionDate= :ReceptionDate a' +
        'nd TReception.service_center_id = :serviceCenterId')
    Left = 240
    Top = 144
  end
  object DSsEARCH: TDataSource
    DataSet = QSearch
    Left = 272
    Top = 144
  end
  object QReception: TADOQuery
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
      'select * from Treception'
      'where ReceptionID= :ReceptionID')
    Left = 241
    Top = 177
  end
end
