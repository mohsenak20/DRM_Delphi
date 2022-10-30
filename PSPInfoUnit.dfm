object frmPSPInfo: TfrmPSPInfo
  Left = 1019
  Top = 226
  Width = 374
  Height = 385
  BiDiMode = bdRightToLeft
  Caption = #1662#1610' '#1575#1587' '#1662#1587
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
    Width = 358
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 300
      Top = 60
      Width = 38
      Height = 28
      Caption = #1606#1575#1605' '#1603#1575#1604#1575':'
    end
    object edtSearch: TEdit
      Left = 8
      Top = 55
      Width = 287
      Height = 36
      TabOrder = 0
      OnChange = edtSearchChange
      OnKeyDown = edtSearchKeyDown
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 97
    Width = 358
    Height = 249
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsPSP
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
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
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 239
        Visible = True
      end>
  end
  object QPSP: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'title'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'select * from TPSP'
      'where title like :title')
    Left = 48
    Top = 16
  end
  object dsPSP: TDataSource
    DataSet = QPSP
    Left = 88
    Top = 16
  end
end
