object frmUserType: TfrmUserType
  Left = 757
  Top = 262
  Width = 373
  Height = 386
  BiDiMode = bdRightToLeft
  Caption = #1606#1608#1593' '#1705#1575#1585#1576#1585
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
    Width = 357
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 298
      Top = 60
      Width = 48
      Height = 28
      Caption = #1606#1575#1605' '#1705#1575#1585#1576#1585':'
    end
    object edtSearch: TEdit
      Left = 8
      Top = 55
      Width = 287
      Height = 36
      TabOrder = 0
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 97
    Width = 357
    Height = 250
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsUserType
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
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 294
        Visible = True
      end>
  end
  object QUserType: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TUserType'
      '')
    Left = 40
    Top = 16
  end
  object dsUserType: TDataSource
    DataSet = QUserType
    Left = 88
    Top = 16
  end
end
