object frmHotelSectionInfo: TfrmHotelSectionInfo
  Left = 708
  Top = 275
  Width = 372
  Height = 385
  BiDiMode = bdRightToLeft
  Caption = #1605#1606#1591#1602#1607
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 28
  object DBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 356
    Height = 346
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsHotelSection
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    OnKeyDown = DBGridKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = #1705#1583
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 271
        Visible = True
      end>
  end
  object QHotelSection: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from THotelSection')
    Left = 48
    Top = 16
  end
  object dsHotelSection: TDataSource
    DataSet = QHotelSection
    Left = 88
    Top = 16
  end
end
