object frmPrivateTaxiInfo: TfrmPrivateTaxiInfo
  Left = 389
  Top = 123
  Width = 956
  Height = 567
  BiDiMode = bdRightToLeft
  Caption = #1578#1575#1705#1587#1610' '#1588#1582#1589#1610
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 940
    Height = 529
    Align = alClient
    DataSource = dsPrivateTaxi
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = #1705#1583
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DriverName'
        Title.Caption = #1606#1575#1605' '#1585#1575#1606#1606#1583#1607
        Width = 271
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'licensePlate1'
        Title.Caption = #1662#1604#1575#1705'1'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'licensePlate2'
        Title.Caption = #1662#1604#1575#1705'2'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'licensePlate3'
        Title.Caption = #1662#1604#1575#1705'3'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'licensePlate4'
        Title.Caption = #1662#1604#1575#1705'4'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'licensePlate5'
        Title.Caption = #1662#1604#1575#1705'5'
        Width = 135
        Visible = True
      end>
  end
  object dsPrivateTaxi: TDataSource
    DataSet = TPrivateTaxi
    Left = 104
    Top = 72
  end
  object TPrivateTaxi: TADOTable
    Connection = DM.ADOConnection
    CursorType = ctStatic
    TableName = 'TPrivateTaxi'
    Left = 104
    Top = 112
  end
end
