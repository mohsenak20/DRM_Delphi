object frmWebReceptionReportChartPerDay: TfrmWebReceptionReportChartPerDay
  Left = 265
  Top = 258
  Width = 1316
  Height = 552
  BiDiMode = bdRightToLeft
  Caption = #1605#1602#1575#1610#1587#1607' '#1587#1575#1593#1578' '#1662#1601#1585#1608#1588' '#1575#1610#1606#1578#1585#1606#1578#1610
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
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 1300
    Height = 513
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Gradient.EndColor = 8421631
    Gradient.Visible = True
    Title.Font.Charset = ARABIC_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -16
    Title.Font.Name = 'Koodak'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      #1606#1605#1608#1583#1575#1585' '#1601#1585#1608#1588' '#1575#1610#1606#1578#1585#1606#1578#1610' '#1576#1585' '#1575#1587#1575#1587' '#1587#1575#1593#1578)
    LeftAxis.LabelsFont.Charset = ARABIC_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -13
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = [fsBold]
    LeftAxis.Title.Font.Charset = ARABIC_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -13
    LeftAxis.Title.Font.Name = 'Koodak'
    LeftAxis.Title.Font.Style = [fsBold]
    LeftAxis.Visible = False
    Legend.Font.Charset = ARABIC_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -16
    Legend.Font.Name = 'Koodak'
    Legend.Font.Style = [fsBold]
    Legend.Visible = False
    Align = alClient
    TabOrder = 0
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Font.Charset = ARABIC_CHARSET
      Marks.Font.Color = clBlack
      Marks.Font.Height = -13
      Marks.Font.Name = 'Koodak'
      Marks.Font.Style = [fsBold]
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clRed
      Title = #1587#1575#1593#1578
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object QWeb: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      
        'select convert(char(2), dt, 108) hour, sum(number+child_amount) ' +
        'count from tfactors'
      'where CONVERT(DATE, dt) = CONVERT(DATE, getdate())'
      'group by convert(char(2), dt, 108)')
    Left = 88
    Top = 16
  end
end
