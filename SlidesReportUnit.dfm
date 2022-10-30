object frmSlidesReport: TfrmSlidesReport
  Left = 741
  Top = 182
  Width = 397
  Height = 505
  BiDiMode = bdRightToLeft
  Caption = #1587#1585#1587#1585#1607' '#1607#1575
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
    Top = 89
    Width = 381
    Height = 377
    Align = alClient
    DataSource = dcSlides
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
        FieldName = 'SlideName'
        Title.Alignment = taCenter
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 165
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Number'
        Title.Alignment = taCenter
        Title.Caption = #1578#1593#1583#1575#1583
        Width = 96
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 89
    Align = alTop
    TabOrder = 1
    object Label7: TLabel
      Left = 319
      Top = 22
      Width = 46
      Height = 26
      Caption = #1575#1586' '#1587#1575#1593#1578':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 238
      Top = 22
      Width = 15
      Height = 26
      Caption = #1575#1604#1610
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtStartTime: TEdit
      Left = 256
      Top = 18
      Width = 56
      Height = 34
      Color = clInfoBk
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edtEndTime: TEdit
      Left = 176
      Top = 18
      Width = 56
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
    object BBtnAccept: TBitBtn
      Left = 7
      Top = 60
      Width = 362
      Height = 24
      Caption = #1580#1587#1578#1580#1608
      TabOrder = 2
      OnClick = BBtnAcceptClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object QSlides: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'start_time'
        Size = -1
        Value = Null
      end
      item
        Name = 'end_time'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Declare @Date char(10), @start_time char(5), @end_time char(5)'
      'set @Date = convert(date, sysdatetime())'
      'set @start_time = :start_time'
      'set @end_time = :end_time'
      ''
      ''
      'Declare @TSlides table('
      'Number int,'
      'SlideName nvarchar(50)'
      ')'
      ''
      'insert into @TSlides'
      'select top 1 C224-(select top 1 C224 from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id ASC) , '#39'boomrang'#39
      'from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id DESC'
      ''
      'insert into @TSlides'
      'select top 1 C225-(select top 1 C225 from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id ASC) , '#39'chaleh'#39
      'from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id DESC'
      ''
      'insert into @TSlides'
      'select top 1 C226-(select top 1 C226 from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id ASC) , '#39'safineh'#39
      'from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id DESC '
      ''
      'insert into @TSlides'
      'select top 1 C227-(select top 1 C227 from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id ASC) , '#39'kamikaz'#39
      'from counters '
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id DESC'
      ''
      'insert into @TSlides'
      'select top 1 C228-(select top 1 C228 from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id ASC) , '#39'twister'#39
      'from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id DESC'
      ''
      'insert into @TSlides'
      'select top 1 C229-(select top 1 C229 from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id ASC) , '#39'loop'#39
      'from counters'
      'where date = @Date and time >= @start_time and time <= @end_time'
      'order by id DESC'
      ''
      'select * from @TSlides'
      '')
    Left = 56
    Top = 64
  end
  object dcSlides: TDataSource
    DataSet = QSlides
    Left = 96
    Top = 64
  end
  object QSelectDate: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'select ID, TimeStamp from TTemperature where Twister3_LC > 0 and' +
        ' IssueDate = '#39'0'#39)
    Left = 16
    Top = 104
    object QSelectDateID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QSelectDateTimeStamp: TWideStringField
      FieldName = 'TimeStamp'
      Size = 50
    end
  end
  object QUpdateDate: TADOQuery
    Parameters = <
      item
        Name = 'IssueDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update TTemperature set'
      'IssueDate = :IssueDate'
      'where ID = :ID')
    Left = 56
    Top = 104
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Neginak20;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=slides;Data Source=svrsql1;Use Proc' +
      'edure for Prepare=1;Auto Translate=True;Packet Size=4096;Worksta' +
      'tion ID=MANAGER-IT;Use Encryption for Data=False;Tag with column' +
      ' collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 64
  end
end
