object frmUserInfo: TfrmUserInfo
  Left = 248
  Top = 122
  Width = 369
  Height = 382
  BiDiMode = bdRightToLeft
  Caption = #1705#1575#1585#1576#1585#1575#1606
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
    Width = 353
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 298
      Top = 60
      Width = 48
      Height = 28
      Caption = #1606#1575#1605' '#1705#1575#1585#1576#1585':'
    end
    object edtSearch: TEdit
      Left = 8
      Top = 55
      Width = 287
      Height = 36
      TabOrder = 0
      OnChange = edtSearchChange
      OnKeyDown = edtSearchKeyDown
    end
    object chbActiveUser: TCheckBox
      Left = 192
      Top = 8
      Width = 145
      Height = 17
      Caption = #1705#1575#1585#1576#1585#1575#1606' '#1601#1593#1575#1604' '#1583#1585' '#1588#1610#1601#1578
      Checked = True
      State = cbChecked
      TabOrder = 1
      Visible = False
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 97
    Width = 353
    Height = 246
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsUser
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
        FieldName = 'UserID'
        Title.Caption = #1705#1583
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Username'
        Title.Caption = #1606#1575#1605' '#1705#1575#1585#1576#1585#1610
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WorkSectionName'
        Title.Caption = #1576#1582#1588' '#1705#1575#1585#1610
        Width = 169
        Visible = True
      end>
  end
  object QUser: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ActiveUser'
        Size = -1
        Value = Null
      end
      item
        Name = 'UserName'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      ' declare @ActiveUser int, @UserName nvarchar(100)'
      ' set @ActiveUser = :ActiveUser'
      ' set @UserName = :UserName'
      ''
      ' if @ActiveUser = 0'
      'begin'
      '    select * from TUser'
      
        '    inner join TWorkSection on TUser.WorkSectionID=TWorkSection.' +
        'WorkSectionID'
      '    where UserName like @UserName'
      '    order by UserID'
      'end'
      'else'
      'if @ActiveUser = 1'
      'begin'
      '    select * from TUser'
      
        '    inner join TWorkSection on TUser.WorkSectionID=TWorkSection.' +
        'WorkSectionID'
      '    where UserName like @UserName and  Active = 1'
      '    order by UserID'
      'end')
    Left = 40
    Top = 16
  end
  object dsUser: TDataSource
    DataSet = QUser
    Left = 88
    Top = 16
  end
end
