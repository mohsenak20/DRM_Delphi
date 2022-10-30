object frmLastEnter: TfrmLastEnter
  Left = 427
  Top = 176
  Width = 132
  Height = 174
  Caption = 'frmLastEnter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblNumberOfCustomer: TLabel
    Left = 40
    Top = 8
    Width = 37
    Height = 75
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -67
    Font.Name = 'arial'
    Font.Style = []
    ParentFont = False
  end
  object lblLockerNumber: TLabel
    Left = 16
    Top = 104
    Width = 18
    Height = 13
    Caption = '123'
  end
  object QEnter: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      
        'select NumberOfAdult+NumberOfChild as NumberOfCustomer, ClosedID' +
        ' as LockerNumber from TReception'
      
        'where ReceptionID = (select LastEnterReceptionIDOnGate1 from TPa' +
        'rameter)')
    Left = 8
    Top = 8
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 16
    Top = 64
  end
end
