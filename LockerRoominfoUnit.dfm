object frmLockerRoomInfo: TfrmLockerRoomInfo
  Left = 837
  Top = 186
  Width = 376
  Height = 385
  BiDiMode = bdRightToLeft
  Caption = #1575#1606#1578#1582#1575#1576' '#1585#1582#1578#1705#1606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 324
      Top = 60
      Width = 30
      Height = 28
      Caption = #1593#1606#1608#1575#1606
    end
    object edtSearch: TEdit
      Left = 8
      Top = 55
      Width = 305
      Height = 36
      TabOrder = 0
      OnChange = edtSearchChange
      OnKeyDown = edtSearchKeyDown
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 97
    Width = 360
    Height = 249
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsLockerRoom
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'koodak'
    TitleFont.Style = []
    OnKeyDown = DBGridKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = #1705#1583' '#1608#1575#1581#1583
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 242
        Visible = True
      end>
  end
  object QLockerRoom: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'title'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from TLockerRoom'
      'where title Like :title')
    Left = 48
    Top = 16
  end
  object dsLockerRoom: TDataSource
    DataSet = QLockerRoom
    Left = 88
    Top = 16
  end
end
