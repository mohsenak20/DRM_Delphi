object frmTermInfo: TfrmTermInfo
  Left = 689
  Top = 276
  Width = 886
  Height = 502
  BiDiMode = bdRightToLeft
  Caption = #1578#1585#1605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
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
    Width = 870
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 737
      Top = 60
      Width = 17
      Height = 28
      Caption = #1606#1575#1605':'
    end
    object edtSearch: TEdit
      Left = 424
      Top = 56
      Width = 311
      Height = 36
      TabOrder = 0
      OnChange = edtSearchChange
      OnKeyDown = edtSearchKeyDown
    end
    object chbActive: TCheckBox
      Left = 680
      Top = 16
      Width = 57
      Height = 17
      Caption = #1601#1593#1575#1604
      Checked = True
      State = cbChecked
      TabOrder = 1
      Visible = False
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 97
    Width = 870
    Height = 366
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsTerm
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
        FieldName = 'code'
        Title.Caption = #1705#1583
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PoolTitle'
        Title.Caption = #1605#1581#1604' '#1576#1585#1711#1584#1575#1585#1610
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Title'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'startDate'
        Title.Caption = #1578#1575#1585#1610#1582' '#1588#1585#1608#1593
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endDate'
        Title.Caption = #1578#1575#1585#1610#1582' '#1662#1575#1610#1575#1606
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'startTime'
        Title.Caption = #1587#1575#1593#1578' '#1588#1585#1608#1593
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endTime'
        Title.Caption = #1587#1575#1593#1578' '#1662#1575#1610#1575#1606
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sessionNumber'
        Title.Caption = #1578#1593#1583#1575#1583' '#1580#1604#1587#1607
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        Title.Caption = #1588#1607#1585#1610#1607
        Width = 76
        Visible = True
      end>
  end
  object QTerm: TADOQuery
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
      'Select TTerm.*, TPool.title PoolTitle, startTime, endTime'
      
        'From TTerm inner join TRentPool on TRentPool.id = TTerm.rentPool' +
        'Id'
      'inner join TPool on TRentPool.poolId = TPool.id'
      'where TTerm.title Like :title')
    Left = 48
    Top = 16
  end
  object dsTerm: TDataSource
    DataSet = QTerm
    Left = 88
    Top = 16
  end
end
