object frmWebRecptionMobile: TfrmWebRecptionMobile
  Left = 248
  Top = 285
  Width = 1425
  Height = 675
  BiDiMode = bdRightToLeft
  Caption = #1582#1585#1610#1583' '#1610#1705' '#1588#1605#1575#1585#1607' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 28
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1409
    Height = 636
    Align = alClient
    DataSource = dsWebReception
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Caption = #1705#1583
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Alignment = taCenter
        Title.Caption = #1606#1575#1605
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customerUsageDate'
        Title.Alignment = taCenter
        Title.Caption = #1578#1575#1585#1610#1582' '#1575#1587#1578#1601#1575#1583#1607
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'number'
        Title.Alignment = taCenter
        Title.Caption = #1576#1586#1585#1711#1587#1575#1604
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vahedPrice'
        Title.Alignment = taCenter
        Title.Caption = #1601#1610' '#1608#1575#1581#1583
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'child_amount'
        Title.Alignment = taCenter
        Title.Caption = #1582#1585#1583#1587#1575#1604
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'child_price'
        Title.Alignment = taCenter
        Title.Caption = #1601#1610' '#1608#1575#1581#1583
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'trancCode'
        Title.Alignment = taCenter
        Title.Caption = #1578#1585#1575#1705#1606#1588
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'webReceptionType'
        Title.Alignment = taCenter
        Title.Caption = #1588#1610#1601#1578
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Alignment = taCenter
        Title.Caption = #1662#1575#1585#1705
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt'
        Title.Alignment = taCenter
        Title.Caption = #1578#1575#1585#1610#1582
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mobile'
        Title.Caption = #1605#1608#1576#1575#1610#1604
        Width = 174
        Visible = True
      end>
  end
  object dsWebReception: TDataSource
    DataSet = QWebReception
    Left = 88
    Top = 56
  end
  object QWebReception: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'mobile'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'select * from tfactors'
      'where mobile = :mobile'
      'order by id desc')
    Left = 32
    Top = 56
  end
end
