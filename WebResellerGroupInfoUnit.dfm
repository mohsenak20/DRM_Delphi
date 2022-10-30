object frmWebResellerGroup: TfrmWebResellerGroup
  Left = 819
  Top = 286
  Width = 379
  Height = 410
  BiDiMode = bdRightToLeft
  Caption = #1711#1585#1608#1607' '#1601#1585#1608#1588#1606#1583#1607
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 321
      Top = 60
      Width = 33
      Height = 28
      Caption = #1593#1606#1608#1575#1606':'
    end
    object edtSearch: TEdit
      Left = 32
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
    Width = 363
    Height = 274
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsWebResellers
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
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 257
        Visible = True
      end>
  end
  object QWebResellers: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'name'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from TWebResellerGroup'
      'where title Like :name and id in (2, 4)')
    Left = 48
    Top = 16
  end
  object dsWebResellers: TDataSource
    DataSet = QWebResellers
    Left = 88
    Top = 16
  end
end
