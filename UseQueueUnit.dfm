object frmUseQueue: TfrmUseQueue
  Left = 411
  Top = 157
  Width = 813
  Height = 519
  BiDiMode = bdRightToLeft
  Caption = 'frmUseQueue'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  ParentBiDiMode = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 424
    Top = 0
    Width = 373
    Height = 460
    Align = alRight
    TabOrder = 0
    DesignSize = (
      373
      460)
    object GroupBox1: TGroupBox
      Left = 12
      Top = 118
      Width = 353
      Height = 230
      Anchors = [akTop, akRight]
      Caption = #1605#1588#1582#1589#1575#1578' '#1605#1588#1578#1585#1610
      TabOrder = 0
      object Label3: TLabel
        Left = 252
        Top = 60
        Width = 74
        Height = 29
        Caption = #1588#1605#1575#1585#1607' '#1603#1604#1610#1583':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 305
        Top = 92
        Width = 21
        Height = 29
        Caption = #1606#1575#1605':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 249
        Top = 124
        Width = 77
        Height = 29
        Caption = #1587#1575#1593#1578' '#1608#1585#1608#1583':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblKeyNumber: TLabel
        Left = 167
        Top = 60
        Width = 74
        Height = 29
        Caption = #1588#1605#1575#1585#1607' '#1603#1604#1610#1583':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCustomerName: TLabel
        Left = 276
        Top = 92
        Width = 21
        Height = 29
        Caption = #1606#1575#1605':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblStartTme: TLabel
        Left = 164
        Top = 124
        Width = 77
        Height = 29
        Caption = #1587#1575#1593#1578' '#1608#1585#1608#1583':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 252
        Top = 30
        Width = 74
        Height = 29
        Caption = #1603#1583' '#1662#1584#1610#1585#1588':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblReceptionID: TLabel
        Left = 167
        Top = 30
        Width = 74
        Height = 29
        Caption = #1588#1605#1575#1585#1607' '#1603#1604#1610#1583':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 12
      Top = 11
      Width = 353
      Height = 105
      Anchors = [akTop, akRight]
      Caption = #1580#1587#1578#1580#1608
      TabOrder = 1
      object Label12: TLabel
        Left = 249
        Top = 44
        Width = 72
        Height = 29
        Caption = #1588#1605#1575#1585#1607' '#1705#1605#1583':'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Traffic'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnSearch: TBitBtn
        Left = 118
        Top = 42
        Width = 35
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnSearchClick
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
      object edtKeyNumber: TEdit
        Left = 154
        Top = 40
        Width = 91
        Height = 37
        Color = clInfoBk
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Koodak'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 424
    Height = 460
    Align = alClient
    TabOrder = 1
    DesignSize = (
      424
      460)
    object Label1: TLabel
      Left = 260
      Top = 30
      Width = 122
      Height = 29
      Caption = #1587#1585#1587#1585#1607' '#1670#1575#1604#1607' '#1601#1590#1575#1610#1610
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 263
      Top = 110
      Width = 103
      Height = 29
      Caption = #1587#1585#1587#1585#1607' '#1576#1608#1605#1585#1606#1711
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 267
      Top = 190
      Width = 91
      Height = 29
      Caption = #1587#1585#1587#1585#1607' '#1587#1601#1610#1606#1607
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 261
      Top = 262
      Width = 97
      Height = 29
      Caption = #1587#1585#1587#1585#1607' '#1578#1608#1610#1587#1578#1585
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 262
      Top = 334
      Width = 96
      Height = 29
      Caption = #1587#1585#1587#1585#1607' '#1705#1575#1605#1610#1705#1575#1586
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 262
      Top = 406
      Width = 80
      Height = 29
      Caption = #1587#1585#1587#1585#1607' '#1604#1608#1662
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn1: TButton
      Left = 17
      Top = 11
      Width = 200
      Height = 78
      Anchors = [akTop, akRight]
      Caption = 'btn1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = takeService
    end
    object btn2: TButton
      Left = 8
      Top = 95
      Width = 209
      Height = 69
      Anchors = [akTop, akRight]
      Caption = 'Button1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = takeService
    end
    object btn3: TButton
      Left = 8
      Top = 173
      Width = 209
      Height = 69
      Anchors = [akTop, akRight]
      Caption = 'Button1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = takeService
    end
    object btn4: TButton
      Left = 8
      Top = 246
      Width = 209
      Height = 69
      Anchors = [akTop, akRight]
      Caption = 'btn4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = takeService
    end
    object btn5: TButton
      Left = 8
      Top = 317
      Width = 209
      Height = 69
      Anchors = [akTop, akRight]
      Caption = 'Button1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = takeService
    end
    object btn6: TButton
      Left = 8
      Top = 390
      Width = 209
      Height = 69
      Anchors = [akTop, akRight]
      Caption = 'Button1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = takeService
    end
  end
  object QReception: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'UserID'
        Size = -1
        Value = Null
      end
      item
        Name = 'KeyNumber'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'declare @service_center_id int'
      
        'select @service_center_id = service_center_id from Tuser where U' +
        'serID = :UserID'
      
        'select Treception.ReceptionID, CustomerName, CustomerType, Recep' +
        'tionDate,'
      
        'ReceptionType, Shift, StartTime, EndTime, TReception.Active, Mob' +
        'ile, Pool, Saat,'
      
        'AngoshtarPlak, Sooeech, Asnad, Pakhsh, KeefPool, Samsonet, Other' +
        ', Price,'
      
        'Treception.UserID as ReceptionUser, Enter, TCard.CardID, BarCode' +
        ', CardType, CreateDate, ExpireDate,'
      'TClosed.ClosedID, KeyNumber, PositionClosed'
      
        'from TReception inner join TCard on TReception.CardID=TCard.Card' +
        'ID'
      'inner join TCardType on TCard.CardType=TCardType.CardTypeID'
      'inner join TClosed on TReception.ClosedID=TClosed.ClosedID'
      
        'where KeyNumber= :KeyNumber and EndTime='#39'99:99'#39' and TReception.s' +
        'ervice_center_id = @service_center_id')
    Left = 488
    Top = 43
  end
  object QChechQueue: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from ')
    Left = 484
    Top = 91
  end
  object QServiceProviders: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from TServiceProviders')
    Left = 528
    Top = 40
  end
  object QQueue: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ReceptionID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @now time(0) = getdate()'
      
        'select id, service_provider_id, state, enter_queue_time, estimat' +
        'e_waiting_time, datediff(second, estimate_waiting_time, @now)/60' +
        ' as diff'
      'from tqueues'
      
        'where reception_id = :ReceptionID and state = 1 and is_active = ' +
        '1')
    Left = 496
    Top = 160
  end
  object sp_take_service: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_get_service;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@queue_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 384
    Top = 168
  end
  object MainMenu1: TMainMenu
    Left = 576
    Top = 376
    object N1: TMenuItem
      Caption = #1606#1605#1575#1610#1588' '#1589#1601
      object mnuSpaceSlide: TMenuItem
        Caption = #1670#1575#1604#1607' '#1601#1590#1575#1610#1610
        OnClick = mnuSpaceSlideClick
      end
      object mnuBoomrang: TMenuItem
        Caption = #1576#1608#1605#1585#1606#1711
        OnClick = mnuBoomrangClick
      end
      object mnuShuttel: TMenuItem
        Caption = #1587#1601#1610#1606#1607
        OnClick = mnuShuttelClick
      end
      object mnuTwister: TMenuItem
        Caption = #1578#1608#1610#1587#1578#1585
        OnClick = mnuTwisterClick
      end
      object mnuKamikaz: TMenuItem
        Caption = #1705#1575#1605#1610#1705#1575#1586
        OnClick = mnuKamikazClick
      end
      object mnuLoop: TMenuItem
        Caption = #1604#1608#1662
        OnClick = mnuLoopClick
      end
    end
  end
end
