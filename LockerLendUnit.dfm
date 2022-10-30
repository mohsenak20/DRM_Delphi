object frmLendLockers: TfrmLendLockers
  Left = 721
  Top = 292
  Width = 436
  Height = 675
  BiDiMode = bdRightToLeft
  Caption = 'frmLendLockers'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 28
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 420
    Height = 636
    Align = alClient
    DataSource = dsLocker
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'keyNumber'
        Title.Caption = #1705#1605#1583
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inTime'
        Title.Caption = #1605#1583#1578' '#1586#1605#1575#1606' '#1581#1590#1608#1585
        Width = 143
        Visible = True
      end>
  end
  object QLoclers: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'receptionDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'select KeyNumber,dbo.Dif2Time(StartTime, dbo.FormatTimeString(ca' +
        'st(Datepart(hh, Getdate()) as char(2))+'#39':'#39'+cast(Datepart(n, Getd' +
        'ate()) as char(2)))) inTime  from TReception inner join TClosed ' +
        'on TReception.ClosedID = TClosed.KeyNumber'
      'where lend = 1 and ReceptionDate= :receptionDate'
      'order by inTime DESC')
    Left = 32
    Top = 48
  end
  object dsLocker: TDataSource
    DataSet = QLoclers
    Left = 72
    Top = 48
  end
end
