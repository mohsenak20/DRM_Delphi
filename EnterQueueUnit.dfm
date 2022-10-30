object frmEnterQueue: TfrmEnterQueue
  Left = 316
  Top = 207
  Width = 892
  Height = 707
  BiDiMode = bdRightToLeft
  Caption = #1587#1610#1587#1578#1605' '#1606#1608#1576#1578' '#1583#1607#1610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Koodak'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object DBGrid1: TDBGrid
    Left = 0
    Top = 465
    Width = 876
    Height = 183
    Align = alClient
    DataSource = dsQueue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Koodak'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Koodak'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1705#1583
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -20
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Koodak'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1589#1601
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -20
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'state_title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Koodak'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1608#1590#1593#1610#1578
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -20
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 133
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'enter_queue_time'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Koodak'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1587#1575#1593#1578' '#1711#1585#1601#1578#1606' '#1606#1608#1576#1578
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -20
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 149
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'estimate_waiting_time'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Koodak'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1587#1575#1593#1578' '#1606#1608#1576#1578
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -20
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 133
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'use_service_time'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Koodak'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1586#1605#1575#1606' '#1575#1587#1578#1601#1575#1583#1607
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -20
        Title.Font.Name = 'Koodak'
        Title.Font.Style = []
        Width = 122
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 876
    Height = 465
    Align = alTop
    TabOrder = 1
    DesignSize = (
      876
      465)
    object Label1: TLabel
      Left = 398
      Top = 7
      Width = 103
      Height = 29
      Caption = #1605#1583#1578' '#1586#1605#1575#1606' '#1578#1575#1582#1610#1585
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Traffic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn3: TButton
      Left = 8
      Top = 173
      Width = 385
      Height = 69
      Anchors = [akTop, akRight]
      Caption = 'Button1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btn3Click
    end
    object btn2: TButton
      Left = 8
      Top = 95
      Width = 385
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
      OnClick = btn2Click
    end
    object btn1: TButton
      Left = 8
      Top = 11
      Width = 385
      Height = 78
      Anchors = [akTop, akRight]
      Caption = 'btn1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btn1Click
    end
    object GroupBox2: TGroupBox
      Left = 506
      Top = 3
      Width = 353
      Height = 105
      Anchors = [akTop, akRight]
      Caption = #1580#1587#1578#1580#1608
      TabOrder = 3
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
    object GroupBox1: TGroupBox
      Left = 506
      Top = 110
      Width = 353
      Height = 230
      Anchors = [akTop, akRight]
      Caption = #1605#1588#1582#1589#1575#1578' '#1605#1588#1578#1585#1610
      TabOrder = 4
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
    object cbx1: TComboBox
      Left = 400
      Top = 40
      Width = 97
      Height = 44
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Koodak'
      Font.Style = []
      ItemHeight = 36
      ParentFont = False
      TabOrder = 5
      Text = '0'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '10'
        '15'
        '20')
    end
    object cbx2: TComboBox
      Left = 400
      Top = 104
      Width = 97
      Height = 44
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Koodak'
      Font.Style = []
      ItemHeight = 36
      ParentFont = False
      TabOrder = 6
      Text = '0'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '10'
        '15'
        '20')
    end
    object cbx3: TComboBox
      Left = 400
      Top = 184
      Width = 97
      Height = 44
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Koodak'
      Font.Style = []
      ItemHeight = 36
      ParentFont = False
      TabOrder = 7
      Text = '0'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '10'
        '15'
        '20')
    end
    object btn4: TButton
      Left = 8
      Top = 246
      Width = 385
      Height = 69
      Anchors = [akTop, akRight]
      Caption = 'btn4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = btn4Click
    end
    object cbx4: TComboBox
      Left = 400
      Top = 257
      Width = 97
      Height = 44
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Koodak'
      Font.Style = []
      ItemHeight = 36
      ParentFont = False
      TabOrder = 9
      Text = '0'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '10'
        '15'
        '20')
    end
    object btn6: TButton
      Left = 8
      Top = 390
      Width = 385
      Height = 69
      Anchors = [akTop, akRight]
      Caption = 'Button1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = btn6Click
    end
    object btn5: TButton
      Left = 8
      Top = 317
      Width = 385
      Height = 69
      Anchors = [akTop, akRight]
      Caption = 'Button1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Koodak'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = btn5Click
    end
    object cbx5: TComboBox
      Left = 400
      Top = 328
      Width = 97
      Height = 44
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Koodak'
      Font.Style = []
      ItemHeight = 36
      ParentFont = False
      TabOrder = 12
      Text = '0'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '10'
        '15'
        '20')
    end
    object cbx6: TComboBox
      Left = 400
      Top = 401
      Width = 97
      Height = 44
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Koodak'
      Font.Style = []
      ItemHeight = 36
      ParentFont = False
      TabOrder = 13
      Text = '0'
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '10'
        '15'
        '20')
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
    Left = 528
    Top = 11
  end
  object QServiceProviders: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from TServiceProviders')
    Left = 528
    Top = 40
  end
  object sp_queue_insert: TADOStoredProc
    Connection = DM.ADOConnection
    ProcedureName = 'SP_queue_insert;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@service_provider_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@reception_id'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@delayTime'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@estimate_waiting_time'
        Attributes = [paNullable]
        DataType = ftWideString
        Direction = pdInputOutput
        Size = 8
        Value = Null
      end>
    Left = 528
    Top = 120
  end
  object QQueue: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ReceptionID'
        Attributes = [paSigned]
        DataType = ftLargeint
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'select Tqueues.id, title, state, '
      'case'
      #9'when state = 1 then '#39#1606#1608#1576#1578' '#1711#1585#1601#1578#1607' '#1588#1583#1607#39
      #9'when state = 2 then '#39#1585#1586#1585#1608' '#1588#1583#1607#39
      #9'when state = 3 then '#39#1576#1575#1591#1604' '#1588#1583#1607#39
      '  when state = 4 then '#39#1575#1587#1578#1601#1575#1583#1607' '#1588#1583#1607#39
      #9'else '#39#1606#1575#1605#1588#1582#1589#39
      'end as state_title,'
      'enter_queue_time, estimate_waiting_time, use_service_time '
      
        'from TServiceProviders inner join TQueues on TServiceProviders.i' +
        'd = TQueues.service_provider_id'
      'where Reception_id = :ReceptionID'
      'order by state, estimate_waiting_time')
    Left = 72
    Top = 400
  end
  object dsQueue: TDataSource
    DataSet = QQueue
    Left = 120
    Top = 400
  end
  object QcheckActive: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'id'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @person_in_queue int, @id int'
      'set @id = :id'
      ''
      'select @person_in_queue = person_in_queue from TServiceProviders'
      'where id = @id'
      ''
      'update TServiceProviders set'
      'person_in_queue = 0'
      'where id =  @id'
      ''
      'select @person_in_queue person_in_queue')
    Left = 514
    Top = 278
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
