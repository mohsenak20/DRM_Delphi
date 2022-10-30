object frmHotelReceptionInfo: TfrmHotelReceptionInfo
  Left = 480
  Top = 220
  Width = 375
  Height = 385
  BiDiMode = bdRightToLeft
  Caption = #1662#1584#1610#1585#1588' '#1607#1578#1604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 28
  object DBGrid: TDBGrid
    Left = 0
    Top = 81
    Width = 359
    Height = 265
    Align = alClient
    Color = clMoneyGreen
    DataSource = dsHotel
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
        FieldName = 'HotelReceptionID'
        Title.Caption = #1705#1583
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ReceptionistName'
        Title.Caption = #1606#1575#1605
        Width = 276
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 359
    Height = 81
    Align = alTop
    TabOrder = 1
    object BtnNew: TBitBtn
      Left = 312
      Top = 15
      Width = 31
      Height = 34
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Koodak'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnNewClick
      Glyph.Data = {
        6A080000424D6A08000000000000360000002800000015000000190000000100
        20000000000034080000120B0000120B00000000000000000000FFFFFF00FFFF
        FF00EBEFEF00979B9B008F949300919595009195950091959500919595009195
        95009195950091959500919595009195950091959500919595008F939300A9AA
        AA00F5F4F400FFFFFF00FFFFFF00FFFFFF00ECE2E2008C6E6F006E5152007559
        5900755959007559590075595900755959007559590075595900755959007559
        5900755959007559590075585800785E5E00827F7F00B4B5B500D6D6D600FDFD
        FD00FFFFFF00CDB1B100BE8E8F00E4C4C400DFBDBE00DFBDBE00DFBDBE00DFBD
        BE00DFBDBE00DFBDBE00DFBDBE00DFBDBE00DFBDBE00DFBDBE00DFBDBE00E3C4
        C400C68B8D0063585900696A6A0084858500B7B8B800D6D3D30078565700E5C6
        C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6A1A400775E5F009663
        6400755E5E0085898900A26B6C00A7737400DCBFBF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00D19B9E0084797A00C6ACAC0071525300868A8A00B88C
        8D00D8B9BA00D7B8B800FFFFFF00FEFCFC00FCF4F400FCF5F500FCF5F500FCF5
        F500FCF5F500FFFEFE00FBFBFB00F5F5F500FBFBFB00FFFFFF00FFFFFF00D19B
        9E00837B7C00C4ABAB0071535400878B8B00B78A8B00D7B6B600DABBBB00FFFF
        FF00FEF5F500FADBDB00FADEDE00FADEDE00FADEDE00FADDDD00FFFDFD00F2F4
        F400C0C0C000C8C8C800FAFBFB00FFFFFF00D19B9E00837B7C00C4ABAB007053
        5400868B8B00B98D8E00D8B9B900DBBDBD00FFFFFF00FFFDFD00FEF9F900FEFA
        FA00FEFAFA00FEFAFA00FEFAFA00FFFFFF00BCBCBC00484746007B767400C5C6
        C600FEFBFB00D39DA000837B7C00C4ABAB0070535400868B8B00BD919300DBBC
        BC00DEC0C000FFFFFF00FEF6F600F9DEDE00F9E1E100F9E1E100F9E1E100F9E1
        E100FFEDED00B09D9D0000000000273D470073716F00C8C7C700CD989B00857D
        7D00C4ABAB0070535400868B8B00C1979700DEC0C000E0C3C300FFFFFF00FFFB
        FB00FDF0F000FDF1F100FDF1F100FDF1F100FDF1F100FFF5F500BEB1B000063E
        5100016B9A0028536C0075747200AA7C7F00877D7E00C5ABAB0070535400868B
        8B00C59C9C00E1C3C400E3C6C700FFFFFF00FEFAFA00FBECEC00FBEDED00FBED
        ED00FBEDED00FBEDED00FFF2F200DEC4C3007CADB60052C2F9004368B5005D47
        47007C5B5C0080787900C5ACAC0070535400868B8B00C9A0A100E4C8C800E5CA
        CA00FFFFFF00FEF7F700FCE3E300FCE5E500FCE5E500FCE5E500FCE5E500FEE7
        E700EFCCCB00B6B9B9007ED8FB005C8BDF0056486100583C3A006F6A6A00C6AC
        AC0070535400868B8B00CDA6A700E7CCCC00E8CECE00FFFFFF00FFFDFD00FDF8
        F800FDF9F900FDF9F900FDF9F900FDF9F900FDF8F800FFF3F300D5AFAE0095D0
        D50064C2FF005A5EA8004828280053535100BBA1A10072555500868B8B00D3AC
        AD00EACFCF00EBD1D100FFFFFF00FEF5F500FADBDB00FADEDE00FADEDE00FADE
        DE00FADEDE00FADEDE00FBE2E200F6CFCF00B9ADAD007FD8F4005891EF004D3D
        63003D3A3500A189890072555600878B8B00D7B2B300EDD2D200EED4D400FFFF
        FF00FFFDFD00FEF9F900FEF9F900FEF9F900FEF9F900FEF9F900FEF9F900FEF9
        F900FFFAFA00D5B8B70097D2DB0065BBFF0056599A00352D30007A6463006D54
        5400878B8B00DCB9B900F0D7D700F1D8D800FFFFFF00FEF6F600F9DFDF00F9E1
        E100F9E1E100F9E1E100F9E1E100F9E1E100F9E1E100FBE2E200F9DAD900B6B5
        B2007EDFFD00578EEB0056425D0052423F005A4747008E919100E2BFBF00F3DA
        DA00F3DADA00FFFFFF00FFFBFB00FDEFEF00FDF0F000FDF0F000FDF0F000FDF0
        F000FDF0F000FDF0F000FDEFEF00FFFCFC00D9BBBA0098CCD40068BEFD005663
        A40051363B004B3D3D00979A9900E6C6C500F5DDDD00F5DDDD00FFFFFF00FEFA
        FA00FBEDED00FBEFEF00FBEFEF00FBEFEF00FBEFEF00FBEFEF00FBEFEF00FBEE
        EE00FFFFFF00F7E3E200B2BBB8007BDEFE005888E800513C5400454240008A8B
        8B00EACBCB00F7DFDF00F6DFDF00FFFFFF00FEF6F600FBE0E000FBE2E200FBE2
        E200FBE2E200FBE2E200FBE2E200FBE2E200FBE1E100FFFBFB00FFFAFA00DAB7
        B60097CED40065C5FF005965B1005042410062656400EED0D000F9E2E200F9E1
        E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1E4E300AFBCBE0078BDE7005E60
        AF003E2A4A00423F3C00F2D5D500FBE3E300FAE3E300FBF1F100FBF1F100FBF1
        F100FBF1F100FBF1F100FBF0F000FBF0F000FBF0F000FBF0F000FBF0F000FBF0
        F000FBF0F000FEF3F300D2AEAC008078A500384AD40043307F003D322E00F6D9
        D900FBE8E800FADFDF00F9DEDE00F7D7D700F4D8D800F3D5D500F1D3D300EFD0
        D000EDCECE00EBCBCB00E9C9C900E7C5C500E5C3C300E3C1C100E5C4C300D9B6
        B8004441B0005E79F5005A66DA005B456500F9DBDB00FBF4F400FEFBFB00FDF7
        F700FBDEDE00FAE6E600FAE5E500F9E4E400F8E4E400F7E2E200F6E1E100F5E0
        E000F5DFDF00F4DEDE00F2DCDC00F5DCDC00F6DBD8006D62B4002D42CB00122B
        CE009E98C800FAD9D900F9DEDE00F7DBDB00F6D9D900F5D1D100F2CCCC00EFC9
        C900EDC7C700EAC2C200E7BFBF00E3B9B900E0B5B500DDB2B200DBAFAF00DBAC
        AC00C09D9D00D6C5C400F4E1DD00A59FD2009E9CD600F6F8FF00FEF7F700FEF5
        F500FDF5F500FDF4F400FCF5F500FBF4F400FAF3F300FAF2F200F9F1F100F9F1
        F100F8F0F000F8EFEF00F7EEEE00F7EEEE00F8EEEE00ECE8E800F6FBFB00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00}
    end
  end
  object dsHotel: TDataSource
    DataSet = QHotel
    Left = 88
    Top = 16
  end
  object QHotel: TADOQuery
    Connection = DM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'HotelID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from THotelReception'
      'where HotelID= :HotelID')
    Left = 48
    Top = 16
  end
end
