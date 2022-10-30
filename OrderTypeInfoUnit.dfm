object frmOrderTypeInfo: TfrmOrderTypeInfo
  Left = 512
  Top = 236
  Width = 365
  Height = 387
  BiDiMode = bdRightToLeft
  Caption = #1606#1608#1593' '#1575#1605#1585#1610#1607
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 349
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 287
      Top = 60
      Width = 51
      Height = 28
      Caption = #1606#1608#1593' '#1575#1605#1585#1610#1607':'
    end
    object edtSearch: TEdit
      Left = 8
      Top = 57
      Width = 273
      Height = 36
      TabOrder = 0
      OnChange = edtSearchChange
      OnKeyDown = edtSearchKeyDown
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 97
    Width = 349
    Height = 251
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsOrderType
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
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
        FieldName = 'OrderType'
        Title.Caption = #1606#1608#1593' '#1575#1605#1585#1610#1607
        Width = 239
        Visible = True
      end>
  end
  object dsOrderType: TDataSource
    DataSet = QOrderType
    Left = 88
    Top = 16
  end
  object QOrderType: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'OrderTypeTitle'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'select * from TOrderType'
      'where OrderType like :OrderTypeTitle')
    Left = 48
    Top = 16
  end
end
