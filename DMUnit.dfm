object DM: TDM
  OldCreateOrder = False
  Left = 702
  Top = 147
  Height = 292
  Width = 287
  object ADOConnection: TADOConnection
    CommandTimeout = 240
    ConnectionTimeout = 240
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object QCity: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'Select * From TCity')
    Left = 24
    Top = 80
  end
  object QVahed: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'Select * From TVahed')
    Left = 96
    Top = 80
  end
  object QOffice: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from TOffice')
    Left = 24
    Top = 136
  end
  object QDegree: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'Select * From TDegree')
    Left = 96
    Top = 136
  end
  object QEmployee: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Name+'#39'  '#39'+Family As Name, EmployeeID from TEmployee')
    Left = 24
    Top = 200
  end
  object QOfficeRes: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from TOfficeRes')
    Left = 96
    Top = 200
  end
  object QRaste: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From TRaste')
    Left = 176
    Top = 88
  end
  object QBaseSalary: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From  TBaseSalary')
    Left = 176
    Top = 144
  end
  object QCanon: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From TCanon')
    Left = 176
    Top = 200
  end
  object QPicture: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from TPicture')
    Left = 176
    Top = 16
  end
end
