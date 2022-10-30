object frmWebGroup: TfrmWebGroup
  Left = 192
  Top = 124
  Width = 492
  Height = 492
  BiDiMode = bdRightToLeft
  Caption = #1576#1607' '#1578#1601#1705#1610#1705
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
    Width = 476
    Height = 453
    Align = alClient
    DataSource = dsWebSales
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'number'
        Title.Alignment = taCenter
        Title.Caption = #1578#1593#1583#1575#1583
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VahedPrice'
        Title.Alignment = taCenter
        Title.Caption = #1601#1610' '#1608#1575#1581#1583
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        Title.Alignment = taCenter
        Title.Caption = #1605#1576#1604#1594
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'webReceptionType'
        Title.Alignment = taCenter
        Title.Caption = #1606#1608#1593
        Width = 193
        Visible = True
      end>
  end
  object dsWebSales: TDataSource
    DataSet = QWebSales
    Left = 144
    Top = 48
  end
  object QWebSales: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      
        'select usedate, sum(number) number, VahedPrice, SUM(number*vahed' +
        'Price) price , webReceptionType'
      
        'from tfactors inner join TWebReception on tfactors.ticketType = ' +
        'TWebREception.id'
      'where usedate ='#39'1393/11/07'#39
      'group by usedate, vahedPrice, webReceptionType')
    Left = 184
    Top = 48
  end
end
