object frmStartShift: TfrmStartShift
  Left = 509
  Top = 229
  Width = 522
  Height = 246
  BiDiMode = bdRightToLeft
  Caption = #1588#1585#1608#1593' '#1588#1610#1601#1578' '#1580#1583#1610#1583
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 28
  object Label1: TLabel
    Left = 391
    Top = 70
    Width = 83
    Height = 29
    Caption = #1588#1610#1601#1578' '#1580#1583#1610#1583':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 367
    Top = 22
    Width = 75
    Height = 29
    Caption = #1588#1610#1601#1578' '#1602#1576#1604#1610':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCurrentShift: TLabel
    Left = 279
    Top = 22
    Width = 75
    Height = 29
    Caption = #1588#1610#1601#1578' '#1602#1576#1604#1610':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtShiftTitle: TEdit
    Left = 102
    Top = 70
    Width = 247
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
  object btnShift: TBitBtn
    Left = 66
    Top = 70
    Width = 35
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Koodak'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnShiftClick
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
  object edtShiftId: TEdit
    Left = 346
    Top = 70
    Width = 42
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
  object BtnSave: TBitBtn
    Left = 32
    Top = 152
    Width = 75
    Height = 36
    Caption = #1584#1582#1610#1585#1607
    TabOrder = 3
    OnClick = BtnSaveClick
    Glyph.Data = {
      46030000424D460300000000000036000000280000000E0000000E0000000100
      20000000000010030000120B0000120B00000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000008080000000000000000000008080000080800000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000008080000000
      0000000000000080800000808000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000080800000000000000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000808000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000808000008080000000
      000000000000008080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000080800000000000000000000080
      80000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000008080000000000000000000008080000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000008080000000000000000000008080000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008080000000
      000000000000008080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000080
      80000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000}
  end
  object BtnCancel: TBitBtn
    Left = 136
    Top = 152
    Width = 75
    Height = 36
    Caption = #1575#1606#1589#1585#1575#1601
    TabOrder = 4
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
      44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
      00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
      33833F333383F33300003333AA463362A433333333383F333833F33300003333
      6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
      33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
      6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
      000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
      333383333333F3330000333333322AAA4333333333333833333F333300003333
      333322A4333333333333338333F333330000333333344A433333333333333338
      3F333333000033333336A24333333333333333833F333333000033333336AA43
      33333333333333833F3333330000333333336663333333333333333888333333
      0000}
    NumGlyphs = 2
  end
  object chbLockerReset: TCheckBox
    Left = 232
    Top = 120
    Width = 225
    Height = 17
    Caption = #1578#1605#1575#1605' '#1705#1605#1583' '#1607#1575' '#1580#1607#1578' '#1662#1584#1610#1585#1588' '#1570#1605#1575#1583#1607' '#1588#1608#1606#1583'.'
    TabOrder = 5
  end
  object QStartReception: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'shiftId'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'lockerReset'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update TParameter set'
      'currentShiftId = :shiftId'
      ''
      'declare @lockerReset bit'
      ''
      'set @lockerReset= :lockerReset'
      ''
      ''
      'if @lockerReset = 1'
      'begin'
      '  Update TClosed set'
      '  Lend=0,'
      '  Active=1'
      ''
      '  Update TClosed set'
      '  Lend=1'
      '  where status = 2'
      ''
      '  Update TReception set'
      
        '  EndTime= dbo.FormatTimeString(cast(Datepart(hh, Getdate()) as ' +
        'char(2))+'#39':'#39'+cast(Datepart(n, Getdate()) as char(2)))'
      '  where EndTime='#39'99:99'#39
      ''
      '  Update TChangingRoom'
      '  set CanIssueExit = 1'
      'end')
    Left = 81
    Top = 20
  end
  object QCurrentShift: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from TShift'
      'where id = (select top 1 currentShiftId from TParameter)')
    Left = 152
    Top = 24
  end
end