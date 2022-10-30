object frmLockers: TfrmLockers
  Left = 265
  Top = 136
  Width = 1169
  Height = 819
  BiDiMode = bdRightToLeft
  Caption = 'frmLockers'
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 28
  object pnlOP: TPanel
    Left = 928
    Top = 0
    Width = 225
    Height = 760
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 100
      Top = 112
      Width = 85
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1705#1605#1583' '#1582#1575#1604#1610':'
    end
    object Label2: TLabel
      Left = 100
      Top = 136
      Width = 72
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1705#1605#1583' '#1662#1585':'
    end
    object Label3: TLabel
      Left = 100
      Top = 160
      Width = 96
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1705#1605#1583' '#1605#1593#1610#1608#1576':'
    end
    object Label4: TLabel
      Left = 100
      Top = 187
      Width = 107
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1705#1605#1583' '#1594#1610#1585' '#1601#1593#1575#1604':'
    end
    object lblFree: TLabel
      Left = 44
      Top = 114
      Width = 43
      Height = 28
      Caption = 'lblFree'
    end
    object lblOccupied: TLabel
      Left = 43
      Top = 138
      Width = 44
      Height = 28
      Caption = 'Label5'
    end
    object lblHaveProblem: TLabel
      Left = 43
      Top = 162
      Width = 44
      Height = 28
      Caption = 'Label5'
    end
    object lblDeactive: TLabel
      Left = 43
      Top = 187
      Width = 44
      Height = 28
      Caption = 'Label5'
    end
    object Label5: TLabel
      Left = 100
      Top = 216
      Width = 68
      Height = 28
      Caption = #1578#1593#1583#1575#1583' '#1705#1605#1583#1607#1575':'
    end
    object lblAllLockers: TLabel
      Left = 43
      Top = 216
      Width = 44
      Height = 28
      Caption = 'Label5'
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 612
      Width = 223
      Height = 147
      Align = alBottom
      Caption = #1575#1606#1578#1582#1575#1576' '#1585#1582#1578#1705#1606
      TabOrder = 0
      object Label6: TLabel
        Left = 161
        Top = 108
        Width = 47
        Height = 28
        Caption = #1575#1586' '#1588#1605#1575#1585#1607':'
      end
      object Label7: TLabel
        Left = 76
        Top = 108
        Width = 19
        Height = 28
        Caption = #1575#1604#1610':'
      end
      object lblStart: TLabel
        Left = 112
        Top = 108
        Width = 40
        Height = 33
        Caption = '1000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEnd: TLabel
        Left = 15
        Top = 108
        Width = 40
        Height = 33
        Caption = '1000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnLockerRoom: TBitBtn
        Left = 7
        Top = 73
        Width = 210
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnLockerRoomClick
        Glyph.Data = {
          B6040000424DB604000000000000360000002800000012000000100000000100
          20000000000080040000120B0000120B00000000000000000000D8E9EC00D8E9
          EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
          EC00D8E9EC00D8E9EC00D7E8EB00D8E9EC00CADBE100D6E6E900D8E9EC00D7E7
          EA00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
          EC00D8E9EC00D8E9EC00D8E9EC00D8E9EB00D7E8EB00A2B9D000496DA1001A20
          3B00D8E9EC00D8E9EC00D9EAEC00D8E9EC00DAEAEC00DAEAEC00D9E9EC00D9E9
          EC00D9E9EC00D9E9EC00D9E9EC00D9E9EC00D8E9EC00D6E5E700869FC1004A6E
          A3007E8B9E001A203B00D8E9EC00D8E9EC00D8E9EC00D8E9EC00DAEAEC00D9E9
          EC00D8E9EC00DBE8EB00D9E9EB00D8E9EC00D8E9EC00D8E9EC00D8E9EC0087A0
          C2004A6EA3007D8A9D001A203B00D2E1E500D8E9EC00D8E9EC00D8E9EC00DAEA
          EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
          EC008C9DB2004A6EA3007E8B9E001A203B00BDC6CC00DAEAEC00D8E9EC00DAEA
          ED00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
          EC00D8E9EC00CBC2A100978557001A203B001A203B00C9D7DB00D8E9EC00D9E9
          EC00D9EAED00D9EAEC00D8E9EC00D8E9EC00D8E9EC00989B940066604000403B
          200037321D00514D3A009EA39E00A7905200B6A8850060512A00C6D1D500D8E9
          EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00999063008479
          4500B1A97800C1B88700B4AE82008F8A6A003C371C00342F1C007A683500D4E1
          E000D8E9EC00D8E9EC00D8E9EC00DAEAED00DAEAED00DAEAED00D8E9EC00BBC3
          BE00A3955200D8D6C000D2CFB400CECAA900EBEBE300D4CFB100AFA983003C37
          1C00B8C1BF00D8E9EC00D9E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
          EC00D8E9EC00A1955600D1CCA900DEDECF00D8D7C400D5D3BD00DBDAC800EFF0
          EE00E2E1D200908B6B004F4C3900D8E9EC00D9E9EC00D8E9EC00D8E9EC00D8E9
          EC00D8E9EC00D8E9EC00D8E9EC00A4985700E6E6DB00E2E4DC00DEDFD300D9D9
          C900D7D5C200D8D6C100E1E1D100B3AD830037321D00D8E9EC00D8E9EC00D9E9
          EC00D9EAEC00DBEAED00DBEAED00DAEAED00D8E9EC00BAAD6B00ECEDE700EAEB
          E900E1E3DC00DDDED300D9D9C900D4D2BD00CDC9AA00C1B98900403B2000D8E9
          EC00D8E9EC00D9E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C8C5
          9900E5E2D000F0F2F200E8EAE800E3E4DE00DFE0D400DAD9C700D3D0B700B3AB
          7D00645D3E00D8E9EC00D8E9EC00D8E9EC00E0EDEF00E0EDEF00E0EDEF00E0ED
          EF00D8E9EC00C3C5B700D6CEA300F6F7F700F2F4F400ECEEEB00E6E6DF00E2E1
          D300DDDBC60081774400A4A49F00DAEAED00DCEBEE00DBEBED00DEECEE00DEEC
          EE00DEECEE00DDECEE00D8E9EC00D8E9EC00CCC29000D7D5B400E6E3D000F0F0
          EB00ECECE100D6D0AF009F9352009E966800DBEAED00D8E9EC00D8E9EC00D8E9
          EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C9CD
          C400C2B47300AE9E500098894500A1945600B0B0A700D9E9EC00D8E9EC00D8E9
          EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00}
      end
      object edtLockerRoomTitle: TEdit
        Left = 6
        Top = 33
        Width = 176
        Height = 34
        Color = clInfoBk
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edtLockerRoomId: TEdit
        Left = 184
        Top = 33
        Width = 31
        Height = 34
        Color = clInfoBk
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 223
      Height = 104
      Align = alTop
      TabOrder = 1
      object lblLockerTitle: TLabel
        Left = 19
        Top = 32
        Width = 107
        Height = 28
        Caption = 'lblLockerTitle'
      end
      object Label10: TLabel
        Left = 169
        Top = 32
        Width = 40
        Height = 28
        Caption = #1585#1582#1578#1705#1606':'
      end
      object Label11: TLabel
        Left = 129
        Top = 32
        Width = 7
        Height = 28
        Caption = '-'
      end
      object lblLockerRoomId: TLabel
        Left = 136
        Top = 32
        Width = 29
        Height = 28
        Caption = 'lblLockerTitle'
      end
      object btnRefresh: TButton
        Left = 8
        Top = 59
        Width = 211
        Height = 39
        Caption = #1576#1607' '#1585#1608#1586' '#1585#1587#1575#1606#1610
        TabOrder = 0
        OnClick = btnRefreshClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 507
      Width = 223
      Height = 105
      Align = alBottom
      Caption = #1585#1575#1607#1606#1605#1575#1610' '#1585#1606#1711
      TabOrder = 2
      object pnlFree: TPanel
        Left = 128
        Top = 32
        Width = 73
        Height = 30
        Caption = #1582#1575#1604#1610
        Color = 49408
        TabOrder = 0
      end
      object pnlOccupied: TPanel
        Left = 32
        Top = 32
        Width = 73
        Height = 30
        Caption = #1662#1585
        Color = 8421631
        TabOrder = 1
      end
      object pnlDeactive: TPanel
        Left = 32
        Top = 66
        Width = 73
        Height = 30
        Caption = #1594#1610#1585#1601#1593#1575#1604
        Color = 15204584
        TabOrder = 2
      end
      object pnlHaveProblem: TPanel
        Left = 128
        Top = 66
        Width = 73
        Height = 30
        Caption = #1605#1593#1610#1608#1576
        Color = clYellow
        TabOrder = 3
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 402
      Width = 223
      Height = 105
      Align = alBottom
      Caption = #1606#1605#1575#1610#1588
      TabOrder = 3
      object rbSmall: TRadioButton
        Left = 72
        Top = 28
        Width = 113
        Height = 17
        Caption = #1705#1608#1670#1705
        TabOrder = 0
      end
      object rbMedium: TRadioButton
        Left = 72
        Top = 52
        Width = 113
        Height = 17
        Caption = #1605#1578#1608#1587#1591
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object rbLarge: TRadioButton
        Left = 72
        Top = 76
        Width = 113
        Height = 17
        Caption = #1576#1586#1585#1711
        TabOrder = 2
      end
    end
  end
  object pnlLockers: TPanel
    Left = 0
    Top = 0
    Width = 928
    Height = 760
    Align = alClient
    AutoSize = True
    TabOrder = 1
  end
  object QLockers: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'lockerRoomId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from TClosed'
      'where KeyNumber > 0 and lockerRoomId = :lockerRoomId')
    Left = 40
    Top = 56
  end
  object QLockerStatus: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ClosedID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select Top 1 ReceptionID, CustomerName, CustomerType, ReceptionD' +
        'ate, ReceptionType, Shift, '
      
        'StartTime, EndTime, Credit, Mobile, Pool, Saat, AngoshtarPlak, S' +
        'ooeech, Asnad, Pakhsh, KeefPool, '
      
        'Samsonet, Other, Price, CardID, UserID, Enter, ExitUserID,  TClo' +
        'sed.ClosedID, KeyNumber, PositionClosed, '
      
        'Status, Lend, TClosed.Active from TReception inner join TClosed ' +
        'on TReception.ClosedID=TClosed.ClosedID'
      'Where TReception.ClosedID= :ClosedID'
      'Order by ReceptionID Desc'
      '')
    Left = 112
    Top = 64
  end
  object MainMenu1: TMainMenu
    object N1: TMenuItem
      Caption = #1662#1585#1608#1606#1583#1607
      object mnuLendLockers: TMenuItem
        Caption = #1705#1605#1583#1607#1575#1610' '#1662#1585
        OnClick = mnuLendLockersClick
      end
      object mnuActive: TMenuItem
        Caption = #1601#1593#1575#1604' '#1608' '#1594#1610#1585#1601#1593#1575#1604
        OnClick = mnuActiveClick
      end
      object ih1: TMenuItem
        Caption = #1705#1605#1583#1607#1575
        OnClick = ih1Click
      end
    end
  end
  object QSummery: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'lockerRoomId'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @lockerRoomId int'
      'set @lockerRoomId = :lockerRoomId'
      
        'select count(ClosedID) allLockers, min(KeyNumber) minKeyNumber, ' +
        'max(keyNumber) maxKeyNumber,'
      
        '(select count(ClosedID) from TClosed where lockerRoomId = @locke' +
        'rRoomId and KeyNumber > 0 and Lend = 0) free,'
      
        '(select count(ClosedID) from TClosed where lockerRoomId = @locke' +
        'rRoomId and KeyNumber > 0 and Lend = 1) occupied,'
      
        '(select count(ClosedID) from TClosed where lockerRoomId = @locke' +
        'rRoomId and KeyNumber > 0 and Status = 2) haveProblem,'
      
        '(select count(ClosedID) from TClosed where lockerRoomId = @locke' +
        'rRoomId and KeyNumber > 0 and Active = 0) deactive'
      'from TClosed'
      'where lockerRoomId = @lockerRoomId and KeyNumber > 0')
    Left = 48
    Top = 24
  end
  object QLockerRoom: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'lockerRoomId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from TLockerRoom'
      'where id = :lockerRoomId')
    Left = 96
    Top = 24
  end
end
