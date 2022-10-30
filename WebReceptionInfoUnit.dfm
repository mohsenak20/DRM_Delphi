object frmWebReceptionInfo: TfrmWebReceptionInfo
  Left = 403
  Top = 278
  Width = 382
  Height = 407
  BiDiMode = bdRightToLeft
  Caption = #1662#1584#1610#1585#1588' '#1575#1610#1606#1578#1585#1606#1578#1610
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
    Width = 366
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
    Width = 366
    Height = 271
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsWebReception
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
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'webReceptionType'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 284
        Visible = True
      end>
  end
  object QWebReception: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Title'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'select * from TWebReception'
      'where WebReceptionType Like :Title')
    Left = 48
    Top = 16
  end
  object dsWebReception: TDataSource
    DataSet = QWebReception
    Left = 88
    Top = 16
  end
end
