object frmEnrollmentInfo: TfrmEnrollmentInfo
  Left = 709
  Top = 220
  Width = 697
  Height = 384
  BiDiMode = bdRightToLeft
  Caption = #1604#1610#1587#1578' '#1705#1604#1575#1587#1607#1575#1610' '#1579#1576#1578' '#1606#1575#1605#1610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 28
  object DBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 681
    Height = 345
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsEnrollment
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
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
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'startDate'
        Title.Caption = #1588#1585#1608#1593
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endDate'
        Title.Caption = #1662#1575#1610#1575#1606
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sessionNumber'
        Title.Caption = #1578#1593#1583#1575#1583' '#1580#1604#1587#1607
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sessionUsed'
        Title.Caption = #1575#1587#1578#1601#1575#1583#1607' '#1588#1583#1607
        Width = 72
        Visible = True
      end>
  end
  object QEnrollment: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CreditCardId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select TLesson.*,  TLesson.id lessonId,'
      
        '(select count(ReceptionID) from TReception where lessonId = TLes' +
        'son.id and CreditCardID = TCreditCard.CardID) sessionUsed'
      'from TEnrollment'
      'inner join TLesson on TEnrollment.lessonId = TLesson.id'
      
        'inner join TCreditCard on TEnrollment.creditCardId = TCreditCard' +
        '.id'
      'where creditCardID = :CreditCardId')
    Left = 24
    Top = 96
  end
  object dsEnrollment: TDataSource
    DataSet = QEnrollment
    Left = 64
    Top = 96
  end
end
