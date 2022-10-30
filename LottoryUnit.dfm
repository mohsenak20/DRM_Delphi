object frmLottory: TfrmLottory
  Left = 282
  Top = 169
  Width = 576
  Height = 562
  BiDiMode = bdRightToLeft
  Caption = #1601#1585#1593#1607' '#1705#1588#1610
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 560
    Height = 65
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 448
    Width = 560
    Height = 76
    Align = alBottom
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 560
    Height = 383
    Align = alClient
    DataSource = dsLottory
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
  end
  object QLottory: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ReceptionDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'enterTime'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Declare @ReceptionDate char(10), @enterTime char(5)'
      'set @ReceptionDate = :receptionDate set @enterTime = :enterTime'
      'select * from TReception where ReceptionID  in'
      
        '(select top 8 receptionID from TReception where ReceptionDate = ' +
        '@ReceptionDate and ReceptionType = 3 and Enter = 1'
      
        'and Credit = 0 and EnterTime >= @enterTime and ExitUserID is nul' +
        'l order by newid())'
      
        'and ReceptionDate = @ReceptionDate and ReceptionType = 3 and Ent' +
        'er = 1 and Credit = 0  and EnterTime >= @enterTime'
      '')
    Left = 24
    Top = 264
  end
  object dsLottory: TDataSource
    DataSet = QLottory
    Left = 56
    Top = 264
  end
end
