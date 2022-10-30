object frmActiveUser: TfrmActiveUser
  Left = 490
  Top = 131
  Width = 526
  Height = 603
  BiDiMode = bdRightToLeft
  Caption = #1705#1575#1585#1576#1585#1575#1606' '#1662#1584#1610#1585#1588' '#1608' '#1581#1585#1608#1580#1610' '#1583#1585' '#1585#1608#1586#1607#1575#1610' '#1575#1606#1578#1582#1575#1576' '#1588#1583#1607
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
    Width = 510
    Height = 565
    Align = alClient
    DataSource = dsActiveUser
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
        FieldName = 'UserID'
        Title.Alignment = taCenter
        Title.Caption = #1705#1583
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UserName'
        Title.Alignment = taCenter
        Title.Caption = #1705#1575#1585#1576#1585
        Width = 299
        Visible = True
      end>
  end
  object dsActiveUser: TDataSource
    DataSet = QActiveUser
    Left = 32
    Top = 48
  end
  object QActiveUser: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'StartDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'EndDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      ''
      'Declare @StartDate char(10), @EndDate char(10)'
      'set @StartDate = :StartDate'
      'set @EndDate = :EndDate'
      'declare @TUser table'
      '('
      '  UserID  int,'
      '  UserName  nvarchar(100)'
      ')'
      'insert into @TUser'
      
        'select TUser.UserID, UserName from TReception inner join TUser o' +
        'n TReception.UserID = TUser.UserID'
      'where ReceptionDate <= @EndDate and ReceptionDate >= @StartDate'
      'Group By TUser.UserID, UserName'
      ''
      'insert into @Tuser'
      
        'select TCRedit.UserID, UserName from TReception inner join TCred' +
        'it'
      'on TReception.ReceptionID = TCredit.ReceptionID'
      'inner join TUser on TCredit.UserID = TUser.UserID'
      'where ReceptionDate <= @EndDate and ReceptionDate >= @StartDate'
      'Group By TCRedit.UserID, UserName'
      ''
      'insert into @TUser'
      
        'select TUser.UserID, UserName from TReception inner join TUser o' +
        'n TReception.ExitUserID = TUser.UserID'
      'where ReceptionDate <= @EndDate and ReceptionDate >= @StartDate'
      'Group By TUser.UserID, UserName'
      ''
      'select * from @TUser'
      'Group By UserID, UserName')
    Left = 40
    Top = 88
  end
end
