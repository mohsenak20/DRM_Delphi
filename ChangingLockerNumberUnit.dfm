object frmChangingLockerNumber: TfrmChangingLockerNumber
  Left = 730
  Top = 362
  Width = 451
  Height = 260
  BiDiMode = bdRightToLeft
  Caption = #1578#1594#1610#1610#1585' '#1588#1605#1575#1585#1607' '#1705#1605#1583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 28
  object Label20: TLabel
    Left = 266
    Top = 85
    Width = 119
    Height = 29
    Caption = #1578#1594#1610#1610#1585' '#1588#1605#1575#1585#1607' '#1705#1605#1583' '#1575#1586':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 168
    Top = 85
    Width = 17
    Height = 29
    Caption = #1576#1607':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 396
    Top = 13
    Width = 21
    Height = 29
    Caption = #1606#1575#1605':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblName: TLabel
    Left = 364
    Top = 13
    Width = 21
    Height = 29
    Caption = #1606#1575#1605':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 119
    Top = 13
    Width = 74
    Height = 29
    Caption = #1705#1583' '#1662#1584#1610#1585#1588':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblReceptionId: TLabel
    Left = 92
    Top = 13
    Width = 21
    Height = 29
    Caption = #1606#1575#1605':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtFirst: TEdit
    Left = 200
    Top = 82
    Width = 49
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
  object edtLast: TEdit
    Left = 104
    Top = 82
    Width = 49
    Height = 37
    Color = clInfoBk
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Koodak'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object BtnSave: TBitBtn
    Left = 32
    Top = 150
    Width = 385
    Height = 36
    Caption = #1578#1575#1610#1610#1583
    TabOrder = 2
    OnClick = BtnSaveClick
    Glyph.Data = {
      46030000424D460300000000000036000000280000000E0000000E0000000100
      20000000000010030000120B0000120B00000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000008080000000000000000000008080000080800000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000008080000000
      0000000000000080800000808000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000080800000000000000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000000
      000000000000008080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000080800000000000000000000080
      80000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000008080000000000000000000008080000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000008080000000000000000000008080000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008080000000
      000000000000008080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000080
      80000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000}
  end
  object QCheckLocker: TADOQuery
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
        Name = 'serviceCenterId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from TClosed'
      
        'where KeyNumber  = :KeyNumber and service_center_id = :serviceCe' +
        'nterId')
    Left = 8
    Top = 16
  end
  object QChangingLocker: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'KeyNumber'
        Size = -1
        Value = Null
      end
      item
        Name = 'serviceCenterId'
        Size = -1
        Value = Null
      end
      item
        Name = 'oldKeyNumber'
        Size = -1
        Value = Null
      end
      item
        Name = 'ReceptionId'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Declare @KeyNumber int, @serviceCenterId bigint'
      'set @KeyNumber = :KeyNumber'
      'set @serviceCenterId = :serviceCenterId'
      ''
      'update TClosed set'
      'lend = 1'
      
        'where KeyNumber = @KeyNumber and service_center_id = @serviceCen' +
        'terId'
      ''
      'update TClosed set'
      'lend = 0'
      
        'where KeyNumber = :oldKeyNumber and service_center_id = @service' +
        'CenterId'
      ''
      ''
      'update TReception set'
      'ClosedID = @KeyNumber'
      'where ReceptionId = :ReceptionId')
    Left = 8
    Top = 56
  end
end
