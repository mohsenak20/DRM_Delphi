object frmCreditCardTypeInfo: TfrmCreditCardTypeInfo
  Left = 477
  Top = 251
  Width = 384
  Height = 408
  BiDiMode = bdRightToLeft
  Caption = #1606#1608#1593' '#1705#1575#1585#1578' '#1575#1593#1578#1576#1575#1585#1610
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
    Width = 368
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 300
      Top = 60
      Width = 21
      Height = 28
      Caption = #1606#1608#1593':'
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
    Width = 368
    Height = 272
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsCreditCardType
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
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Caption = #1606#1575#1605
        Width = 248
        Visible = True
      end>
  end
  object QCreditCardType: TADOQuery
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
      'select * from TCreditCardType'
      'where Title Like :Title'
      '')
    Left = 48
    Top = 16
  end
  object dsCreditCardType: TDataSource
    DataSet = QCreditCardType
    Left = 88
    Top = 16
  end
end
