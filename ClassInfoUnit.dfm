object frmClassInfo: TfrmClassInfo
  Left = 433
  Top = 403
  Width = 853
  Height = 500
  BiDiMode = bdRightToLeft
  Caption = #1705#1604#1575#1587' '#1607#1575
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
    Width = 837
    Height = 72
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 793
      Top = 20
      Width = 33
      Height = 28
      Caption = #1593#1606#1608#1575#1606':'
    end
    object edtSearch: TEdit
      Left = 480
      Top = 16
      Width = 311
      Height = 36
      TabOrder = 0
      OnChange = edtSearchChange
      OnKeyDown = edtSearchKeyDown
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 72
    Width = 837
    Height = 389
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsClass
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
        FieldName = 'id'
        Title.Caption = #1705#1583
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'title'
        Title.Caption = #1593#1606#1608#1575#1606
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ageCategoryTitle'
        Title.Caption = #1711#1585#1608#1607' '#1587#1606#1610
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CourseTitle'
        Title.Caption = #1587#1585#1601#1589#1604
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TermTitle'
        Title.Caption = #1578#1585#1605
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InstructorName'
        Title.Caption = #1605#1585#1576#1610
        Width = 129
        Visible = True
      end>
  end
  object QClass: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'title'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      
        'select TClass.*,  TageCategory.title ageCategoryTitle, TCourse.t' +
        'itle CourseTitle, '
      'TTerm.title TermTitle, TInstructor.name InstructorName'
      'from TClass'
      
        'inner join TageCategory on TClass.ageCategoryId = TageCategory.i' +
        'd'
      'inner join TCourse on TClass.courseId = TCourse.id'
      'inner join TTerm on TClass.termId = TTerm.id'
      'inner join TInstructor on TClass.instructorId = TInstructor.id'
      'where TClass.title Like :title')
    Left = 48
    Top = 16
  end
  object dsClass: TDataSource
    DataSet = QClass
    Left = 88
    Top = 16
  end
end
