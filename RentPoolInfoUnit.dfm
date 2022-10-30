object frmRentPoolInfo: TfrmRentPoolInfo
  Left = 1087
  Top = 290
  Width = 786
  Height = 385
  BiDiMode = bdRightToLeft
  Caption = #1592#1585#1601#1610#1578' '#1607#1575#1610' '#1579#1576#1578' '#1606#1575#1605' '#1605#1583#1585#1587#1607
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
    Width = 770
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
    Width = 770
    Height = 249
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsRent
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
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Title'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PoolTitle'
        Title.Caption = #1606#1575#1605
        Width = 156
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
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endTime'
        Title.Caption = #1587#1575#1593#1578' '#1662#1575#1610#1575#1606
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'capacity'
        Title.Caption = #1592#1585#1601#1610#1578
        Visible = True
      end>
  end
  object QRent: TADOQuery
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
      'Select TRentPool.*, TPool.title PoolTitle'
      'From TRentPool inner join TPool on TRentPool.poolId = TPool.id'
      'where TPool.title Like :title')
    Left = 48
    Top = 16
  end
  object dsRent: TDataSource
    DataSet = QRent
    Left = 88
    Top = 16
  end
end
