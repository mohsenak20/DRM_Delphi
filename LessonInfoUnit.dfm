object frmLessonInfo: TfrmLessonInfo
  Left = 1017
  Top = 202
  Width = 594
  Height = 675
  BiDiMode = bdRightToLeft
  Caption = #1705#1604#1575#1587#1607#1575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 28
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 578
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 321
      Top = 20
      Width = 33
      Height = 28
      Caption = #1593#1606#1608#1575#1606':'
    end
    object Label3: TLabel
      Left = 528
      Top = 20
      Width = 23
      Height = 28
      Caption = #1705#1583':'
    end
    object edtTitle: TEdit
      Left = 8
      Top = 16
      Width = 311
      Height = 36
      TabOrder = 0
      OnChange = rbAllClick
      OnKeyDown = edtCodeKeyDown
    end
    object edtCode: TEdit
      Left = 376
      Top = 16
      Width = 148
      Height = 36
      TabOrder = 1
      OnChange = rbAllClick
      OnKeyDown = edtCodeKeyDown
    end
    object rbEnrollment: TRadioButton
      Left = 456
      Top = 68
      Width = 97
      Height = 17
      Caption = #1583#1585#1581#1575#1604' '#1579#1576#1578' '#1606#1575#1605
      TabOrder = 2
      OnClick = rbAllClick
    end
    object rbInTerm: TRadioButton
      Left = 285
      Top = 68
      Width = 113
      Height = 17
      Caption = #1583#1585#1581#1575#1604' '#1576#1585#1711#1584#1575#1585#1610
      TabOrder = 3
      OnClick = rbAllClick
    end
    object rbFinished: TRadioButton
      Left = 130
      Top = 68
      Width = 113
      Height = 17
      Caption = #1575#1578#1605#1575#1605' '#1570#1605#1608#1586#1588
      TabOrder = 4
      OnClick = rbAllClick
    end
    object rbAll: TRadioButton
      Left = 24
      Top = 68
      Width = 61
      Height = 17
      Caption = #1607#1605#1607
      Checked = True
      TabOrder = 5
      TabStop = True
      OnClick = rbAllClick
    end
    object BBtnAccept: TBitBtn
      Left = 6
      Top = 96
      Width = 568
      Height = 37
      Caption = #1580#1587#1578#1580#1608
      TabOrder = 6
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
  object DBGrid: TDBGrid
    Left = 0
    Top = 105
    Width = 578
    Height = 531
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsLesson
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    OnKeyDown = DBGridKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = #1705#1583
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Title'
        Title.Caption = #1606#1575#1605
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'startDate'
        Title.Caption = #1588#1585#1608#1593' '#1583#1608#1585#1607
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endDate'
        Title.Caption = #1662#1575#1610#1575#1606' '#1583#1608#1585#1607
        Width = 109
        Visible = True
      end>
  end
  object QLesson: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select TLesson.*, TLessonType.title lessonTypeTitle, TageCategor' +
        'y.title ageCategoryTitle,'
      'TLessonGroup.title lessonGroupTitle,'
      
        '(select count(id) from TEnrollment where lessonId = TLesson.id) ' +
        'enrollmentCount'
      'From TLesson '
      'inner join TLessonType on TLesson.lessonTypeId = TLessonType.id'
      
        'inner join TageCategory on TLesson.ageCategoryId = TageCategory.' +
        'id'
      
        'inner join TLessonGroup on TLesson.lessonGroupId = TLessonGroup.' +
        'id'
      'order by startDate DESC')
    Left = 40
    Top = 152
  end
  object dsLesson: TDataSource
    DataSet = QLesson
    Left = 80
    Top = 152
  end
end
