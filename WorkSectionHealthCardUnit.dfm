object frmWorkSectionHealthCard: TfrmWorkSectionHealthCard
  Left = 1075
  Top = 204
  Width = 374
  Height = 383
  BiDiMode = bdRightToLeft
  Caption = #1576#1582#1588#1607#1575#1610' '#1705#1575#1585#1610' '
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
    Height = 248
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsWorkSectionHealthCard
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
        FieldName = 'Code'
        Title.Caption = #1705#1583
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WorkSectionHealthCard'
        Title.Caption = #1576#1582#1588
        Width = 239
        Visible = True
      end>
  end
  object QWorkSectionHealthCard: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'WorkSectionHealthCard'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'select * from TWorkSectionHealthCard'
      'where WorkSectionHealthCard like :WorkSectionHealthCard')
    Left = 48
    Top = 16
  end
  object dsWorkSectionHealthCard: TDataSource
    DataSet = QWorkSectionHealthCard
    Left = 88
    Top = 16
  end
end
