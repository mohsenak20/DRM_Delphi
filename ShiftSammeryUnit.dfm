object frmShiftSammery: TfrmShiftSammery
  Left = 192
  Top = 124
  Width = 431
  Height = 454
  BiDiMode = bdRightToLeft
  Caption = #1588#1610#1601#1578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  PixelsPerInch = 96
  TextHeight = 28
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 415
    Height = 416
    Align = alClient
    DataSource = dsShift
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Koodak'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Price'
        Title.Caption = #1602#1610#1605#1578
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'number'
        Title.Caption = #1578#1593#1583#1575#1583
        Width = 169
        Visible = True
      end>
  end
  object dsShift: TDataSource
    DataSet = QShift
    Left = 56
    Top = 56
  end
  object QShift: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'ReceptionDate'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'select adultPrice Price, SUM(NumberOfAdult+NumberOfChild) number' +
        ' from TReception'
      'where ReceptionDate = :ReceptionDate'
      'group by AdultPrice'
      'having AdultPrice is not null'
      'order by adultPrice DESC')
    Left = 104
    Top = 56
  end
end
