object frmHotelInfo: TfrmHotelInfo
  Left = 824
  Top = 144
  Width = 373
  Height = 385
  BiDiMode = bdRightToLeft
  Caption = #1606#1608#1593' '#1607#1578#1604' '#1607#1575
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
  OnKeyDown = DBGridKeyDown
  PixelsPerInch = 96
  TextHeight = 28
  object DBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 357
    Height = 347
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsRiz
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
        FieldName = 'HotelType'
        Title.Caption = #1606#1608#1593' '#1607#1578#1604
        Width = 335
        Visible = True
      end>
  end
  object QHotel: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from THotelType')
    Left = 48
    Top = 16
  end
  object dsRiz: TDataSource
    DataSet = QHotel
    Left = 88
    Top = 16
  end
end
