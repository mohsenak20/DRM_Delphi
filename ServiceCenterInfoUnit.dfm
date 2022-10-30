object frmService_center_info: TfrmService_center_info
  Left = 558
  Top = 123
  Width = 381
  Height = 407
  BiDiMode = bdRightToLeft
  Caption = #1606#1608#1593' '#1605#1580#1605#1608#1593#1607
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 318
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
    Width = 365
    Height = 271
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsServiceCenter
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
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 284
        Visible = True
      end>
  end
  object QService_center: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Title'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'select * from service_centers'
      'where title Like :Title')
    Left = 48
    Top = 16
  end
  object dsServiceCenter: TDataSource
    DataSet = QService_center
    Left = 88
    Top = 16
  end
end
