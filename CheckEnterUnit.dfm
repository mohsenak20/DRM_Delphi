object frmCheckEnter: TfrmCheckEnter
  Left = 329
  Top = 129
  Width = 462
  Height = 675
  BiDiMode = bdRightToLeft
  Caption = #1608#1585#1608#1583#1610
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 446
    Height = 637
    Align = alClient
    DataSource = dsEnter
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
        FieldName = 'ReceptionID'
        Title.Alignment = taCenter
        Title.Caption = #1705#1583
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustomerName'
        Title.Alignment = taCenter
        Title.Caption = #1606#1575#1605
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumberOfCustomer'
        Title.Alignment = taCenter
        Title.Caption = #1578#1593#1583#1575#1583
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LockerNumber'
        Title.Alignment = taCenter
        Title.Caption = #1705#1605#1583
        Visible = True
      end>
  end
  object QEnter: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ReceptionDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'select ReceptionID, CustomerName, NumberOfAdult+NumberOfChild as' +
        ' NumberOfCustomer, ClosedID as LockerNumber from TReception'
      
        'where ReceptionDate = :ReceptionDate and Enter = 1 and EnterTime' +
        ' <> '#39'99:99'#39
      'order by  EnterTime Desc')
    Left = 32
    Top = 32
  end
  object dsEnter: TDataSource
    DataSet = QEnter
    Left = 72
    Top = 32
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 56
    Top = 144
  end
end
