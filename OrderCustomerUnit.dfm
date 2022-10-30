object frmOrderCustomer: TfrmOrderCustomer
  Left = 650
  Top = 121
  Width = 366
  Height = 383
  BiDiMode = bdRightToLeft
  Caption = #1605#1588#1578#1585#1610#1575#1606
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
    Width = 350
    Height = 63
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 297
      Top = 18
      Width = 17
      Height = 28
      Caption = #1606#1575#1605':'
    end
    object edtSearch: TEdit
      Left = 8
      Top = 15
      Width = 287
      Height = 36
      TabOrder = 0
      OnChange = edtSearchChange
      OnKeyDown = edtSearchKeyDown
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 63
    Width = 350
    Height = 282
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsOrderDiscount
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
        FieldName = 'ID'
        Title.Caption = #1705#1583
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Title'
        Title.Caption = #1606#1575#1605
        Width = 260
        Visible = True
      end>
  end
  object QOrderCustomer: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Title'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from TOrderCustomer'
      'where ID <>-1 and Title like :Title')
    Left = 40
    Top = 16
  end
  object dsOrderDiscount: TDataSource
    DataSet = QOrderCustomer
    Left = 88
    Top = 16
  end
end
