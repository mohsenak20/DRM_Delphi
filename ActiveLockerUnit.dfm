object frmActiveLocker: TfrmActiveLocker
  Left = 535
  Top = 179
  Width = 597
  Height = 174
  BiDiMode = bdRightToLeft
  Caption = #1601#1593#1575#1604' '#1606#1605#1608#1583#1606' '#1705#1605#1583' '#1607#1575
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
  DesignSize = (
    581
    135)
  PixelsPerInch = 96
  TextHeight = 28
  object Label12: TLabel
    Left = 419
    Top = 49
    Width = 55
    Height = 29
    Caption = #1575#1586' '#1588#1605#1575#1585#1607':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 304
    Top = 49
    Width = 18
    Height = 29
    Caption = #1575#1604#1610
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Traffic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtStartLocker: TEdit
    Left = 328
    Top = 45
    Width = 82
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
  object edtEndLocker: TEdit
    Left = 200
    Top = 45
    Width = 90
    Height = 37
    Color = clInfoBk
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Koodak'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object bbtnAccept: TBitBtn
    Left = 24
    Top = 91
    Width = 548
    Height = 31
    Anchors = [akTop, akRight]
    Caption = #1578#1575#1610#1610#1583
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Koodak'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = bbtnAcceptClick
    Glyph.Data = {
      36090000424D3609000000000000360000002800000018000000180000000100
      20000000000000090000120B0000120B00000000000000000000D7E6E700CDC2
      B6009565460078411F00986A4B00B8998200C9BAAC00D1CDC500D5DCD900D7E5
      E700D7E6E700D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D5DCD9006E46
      2A00523524003E2A1E0044291700552E170068381B007D442000914F2500A358
      2900CDC2B600D3D5CF00D7E2E200D7E6E700D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00CCC3B700894F
      1C00A540030081310A0061290F0046291A0039291E003E291A004D2B16005D32
      1800723E1D00874922009C542700C9BAAC00D1CDC500D5DCD900D7E6E700D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C4B09F008D53
      1D00AE440200D0896000D38B6000B35E2F00953F110075321000542A14003E29
      1D003B281D0044291800552E160068381B007D44200097522600D1CDC500D7E6
      E700D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C5B4A4009858
      1F00AB410200E9BC9A00FFF3D700FEDBB900F5C69F00E09E7100C8774500A953
      2300873A0F006430150046291A0039281E003F281A005E33180098522700D5DC
      D900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00BAA08C009F5C
      2200AF470700E7BC9D00FFEBCF00FFE3C400FFE2C200FFE4C100FFE0BA00FCD0
      A600F1B88900DC905B00C06A31009F4B190069371A00432A1B00894A2300D3D5
      CF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B89D8800A561
      2300B04D0F00EEC9B000FFEBD300FFE3C700FFE0C200FFDFBC00FFDDB700FFDB
      B400FFDDB600FFD59B00FFCA8000EA9D6000903E0D00412C1E00894A2300D3D5
      CF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00A9887000AD67
      2900AE4B0E00EECCB300FFEDD800FFE5CD00FFE6C600D3D5C400CCD0C000FFDD
      B700FFD9B400FFBF7200FFBB5B00EDA460008E411200432C1E008F4D2400D5DC
      D900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009F7B6100B169
      2900B4561A00F5DCC800FFEEDB00FFEAD200F5E4CC002BA5CB0071B8C700FFE2
      BF00FFD9AE00FFB33E00FFCB7900EFB2820085411500422A1B008E4D2400D3D5
      CF00D7E6E700D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009A735900B86C
      2A00B3571D00F7E1D100FFF3E100FDECD70060B6CE001099CC003FABCA00FFE4
      C900F3C28700CB9F5A00C9BEA400DF945700813E0F003F2617006F3C1C009A53
      2700CEC6BB00D5DCD900D7E6E700D8E9EC00D8E9EC00D8E9EC00845A3E00BB6F
      2D00B65D2300FAECDF00F3F1E4005AB6D1002BA6CD00C9D7D10029A5CD00D6DD
      CF00C8A48400265C7200988C6700E89A4E00C1732800773F0B00542C10005A31
      170077411E0095502600C9BAAC00D3D5CF00D7E2E200D7E6E7008B624500C470
      2A00B7632D00FFFCF200B0D8E0002CA8D000DFE4DA00FFF0D6004BB1CE007FBE
      CB00FFEBCA00AEAFA100C9945800FDE2C200FFDEB500F4B27000C9792A008E4A
      0A005E310E00522D15006B3A1B00894A2300A5592A00D4D8D4007B543A00C775
      2D00B6622E00FFFAF600F3F2EC00F0EDE500FFF2E300FFF2DC0097CAD30035A9
      CC00FEE7CE00FFEACB00F0C39300DC965400E5AA7400FBD9B600FFDFBB00F5BC
      8300DD8B3A00865727004735310049291A006A3A1B00BCA28D0080593D00D077
      2A00BE744600FFFDFD00FFF9F300FFF7EC00FFF3E700FFF2E200E6E5DB0020A3
      CE00CDD8D000FFE9CD00FFF2DA00DD9B6B008838010094531500D8914E00F8CF
      A300D6BB9F00B9BABD004C56AF00161D8C004D2D2E00AF8B72007B5A4200D57B
      2E00BE784C00FFFFFF00FFFBF700FFF8F200FFF6EC00FFF3E700FFF4E30054B5
      D20071BCCF00FFEDD300FFF0DA00E19D6A006F350900532E15009F542400C668
      1F00B67638009594AC002B56D200154FD100552E4C00C9BAAC0084644B00D176
      2700C4815900FFFFFF00FFFEFC00FFFAF600FFF8F200FFF6EC00FFF7E800B5D7
      DD0025A5CE00EFE6D600FFF4E000E3A17000783808004D2E1A009E552800D8E8
      EB00D8E9EC00C1A69300563E700050337300CDC4BC00D8E8EB008B6D5200CF72
      2300CA8E6B00FFFFFF00FFFFFF00FFFEFB00FFFAF700FFF8F200FFF7EC00FBF2
      E6002FA9D10081C3D200FFF8E400DF9B6A007739090052301B00A2572900D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC008C6F5700CF72
      2200C88F6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFB00FFF9F200FFF9
      EC00B7DAE000AAD3DC00FFF5E500D8915C006837100057311A00A3582900D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0098795C00D478
      2400BA612400CA8A6000D7A98E00E5CABC00F1E4E000F8F3F200FFFFFF00FFFF
      FF00FFFFF700FFFDF000FFFAEF00DA9560006838100057301A00A3582900D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009B846600D77D
      2600BE510100BC500100BC530100B9520100B95A1000C1713600C8855900D19D
      7E00E3BFAA00EFD9CB00F7ECE500D89360006A39100057301A00A4592A00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00A4937600F3B0
      6100D5741B00D06E0E00CB630100C75B0100C65A0100C2560100BF510100BD52
      0100BB530100B8550700BD682900C36318006F4219005B341B00A75A2A00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC008E6549009F90
      7300B5A27E00C7AA7A00D7AE7200DBA55F00DD994A00DE8D3500DB802000D472
      1000D0680200CB5E0100C7580100CA5C0100653F1D0066381D00AC5D2B00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D5DC
      D900C9BCAE00B4957F0091684C008963460085694F008C785E009F917300B29A
      7100C3A06B00D4A56200DA9B4E00DB8D3500704E2D00894B2400D6E0DF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D7E6E700D7E3E300D5D8D400C8B8
      A900AF8E77008E644900845F440083684E007D543800D1CDC500D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00}
  end
  object rbActive: TRadioButton
    Left = 392
    Top = 16
    Width = 81
    Height = 17
    Caption = #1601#1593#1575#1604' '#1587#1575#1586#1610
    Checked = True
    TabOrder = 3
    TabStop = True
    OnClick = rbActiveClick
  end
  object RadioButton2: TRadioButton
    Left = 200
    Top = 16
    Width = 105
    Height = 17
    Caption = #1594#1610#1585#1601#1593#1575#1604' '#1587#1575#1586#1610
    TabOrder = 4
    OnClick = RadioButton2Click
  end
  object QActiveLocker: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <
      item
        Name = 'Type'
        Size = -1
        Value = Null
      end
      item
        Name = 'StartLocker'
        Size = -1
        Value = Null
      end
      item
        Name = 'EndLocker'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Update TClosed set'
      'Active= :Type'
      'where ClosedID>= :StartLocker and ClosedID<= :EndLocker')
    Left = 8
    Top = 37
  end
end
