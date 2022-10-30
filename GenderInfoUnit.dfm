object frmGenderInfo: TfrmGenderInfo
  Left = 874
  Top = 263
  Width = 375
  Height = 385
  BiDiMode = bdRightToLeft
  Caption = #1580#1606#1587#1610#1578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 28
  object DBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 359
    Height = 346
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsGender
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    OnKeyDown = DBGridKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = #1705#1583
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 243
        Visible = True
      end>
  end
  object QGender: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from gender')
    Left = 48
    Top = 16
  end
  object dsGender: TDataSource
    DataSet = QGender
    Left = 88
    Top = 16
  end
end
