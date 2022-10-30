object frmEdtReception: TfrmEdtReception
  Left = 265
  Top = 255
  Width = 787
  Height = 543
  BiDiMode = bdRightToLeft
  Caption = #1608#1610#1585#1575#1610#1588' '#1662#1584#1610#1585#1588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Koodak'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 28
  object Label1: TLabel
    Left = 671
    Top = 24
    Width = 61
    Height = 28
    Caption = #1705#1583' '#1662#1584#1610#1585#1588':'
  end
  object Label2: TLabel
    Left = 440
    Top = 24
    Width = 17
    Height = 28
    Caption = #1606#1575#1605':'
  end
  object Label3: TLabel
    Left = 671
    Top = 68
    Width = 60
    Height = 28
    Caption = #1588#1605#1575#1585#1607' '#1705#1605#1583':'
  end
  object Label4: TLabel
    Left = 439
    Top = 67
    Width = 21
    Height = 28
    Caption = #1606#1608#1593':'
  end
  object Label5: TLabel
    Left = 144
    Top = 67
    Width = 74
    Height = 28
    Caption = #1578#1575#1585#1610#1582' '#1662#1584#1610#1585#1588':'
  end
  object Label6: TLabel
    Left = 671
    Top = 252
    Width = 64
    Height = 28
    Caption = #1606#1608#1593' '#1662#1584#1610#1585#1588':'
  end
  object Label7: TLabel
    Left = 440
    Top = 252
    Width = 34
    Height = 28
    Caption = #1588#1610#1601#1578':'
  end
  object Label8: TLabel
    Left = 144
    Top = 253
    Width = 64
    Height = 28
    Caption = #1587#1575#1593#1578' '#1608#1585#1608#1583':'
  end
  object Label9: TLabel
    Left = 671
    Top = 299
    Width = 70
    Height = 28
    Caption = #1587#1575#1593#1578' '#1582#1585#1608#1580':'
  end
  object Label10: TLabel
    Left = 440
    Top = 386
    Width = 92
    Height = 28
    Caption = #1705#1583' '#1705#1575#1585#1576#1585' '#1582#1585#1608#1580#1610':'
  end
  object Label11: TLabel
    Left = 671
    Top = 382
    Width = 49
    Height = 28
    Caption = #1705#1583' '#1705#1575#1585#1576#1585':'
  end
  object Label12: TLabel
    Left = 142
    Top = 300
    Width = 77
    Height = 28
    Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578'1:'
  end
  object Label13: TLabel
    Left = 440
    Top = 299
    Width = 24
    Height = 28
    Caption = #1605#1576#1604#1594':'
  end
  object Label14: TLabel
    Left = 671
    Top = 204
    Width = 30
    Height = 28
    Caption = #1583#1610#1711#1585':'
  end
  object Label15: TLabel
    Left = 142
    Top = 347
    Width = 77
    Height = 28
    Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578'2:'
  end
  object Label16: TLabel
    Left = 444
    Top = 346
    Width = 80
    Height = 28
    Caption = #1578#1593#1583#1575#1583' '#1582#1585#1583#1587#1575#1604':'
  end
  object Label17: TLabel
    Left = 670
    Top = 342
    Width = 82
    Height = 28
    Caption = #1578#1593#1583#1575#1583' '#1576#1586#1585#1711#1587#1575#1604':'
  end
  object Label18: TLabel
    Left = 142
    Top = 387
    Width = 77
    Height = 28
    Caption = #1588#1605#1575#1585#1607' '#1705#1575#1585#1578'3:'
  end
  object Label19: TLabel
    Left = 673
    Top = 422
    Width = 39
    Height = 28
    Caption = #1578#1582#1601#1610#1601':'
  end
  object Label20: TLabel
    Left = 435
    Top = 426
    Width = 65
    Height = 28
    Caption = #1588#1605#1575#1585#1607' '#1575#1605#1585#1610#1607':'
  end
  object Label21: TLabel
    Left = 674
    Top = 462
    Width = 46
    Height = 28
    Caption = #1606#1608#1593' '#1576#1604#1610#1591':'
  end
  object DBEdit1: TDBEdit
    Left = 544
    Top = 20
    Width = 121
    Height = 36
    DataField = 'ReceptionID'
    DataSource = dsReception
    Enabled = False
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 21
    Width = 417
    Height = 36
    DataField = 'CustomerName'
    DataSource = dsReception
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 544
    Top = 64
    Width = 121
    Height = 36
    DataField = 'ClosedID'
    DataSource = dsReception
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 312
    Top = 64
    Width = 121
    Height = 36
    DataField = 'CustomerType'
    DataSource = dsReception
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 16
    Top = 64
    Width = 121
    Height = 36
    DataField = 'ReceptionDate'
    DataSource = dsReception
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 544
    Top = 248
    Width = 121
    Height = 36
    DataField = 'ReceptionType'
    DataSource = dsReception
    TabOrder = 6
  end
  object DBCheckBox1: TDBCheckBox
    Left = 664
    Top = 120
    Width = 97
    Height = 17
    Caption = #1601#1593#1575#1604
    DataField = 'Active'
    DataSource = dsReception
    TabOrder = 0
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 544
    Top = 120
    Width = 97
    Height = 17
    Caption = #1605#1608#1576#1575#1610#1604
    DataField = 'Mobile'
    DataSource = dsReception
    TabOrder = 7
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox3: TDBCheckBox
    Left = 424
    Top = 120
    Width = 97
    Height = 17
    Caption = #1662#1608#1604
    DataField = 'Pool'
    DataSource = dsReception
    TabOrder = 8
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox4: TDBCheckBox
    Left = 304
    Top = 120
    Width = 97
    Height = 17
    Caption = #1587#1575#1593#1578
    DataField = 'Saat'
    DataSource = dsReception
    TabOrder = 9
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox5: TDBCheckBox
    Left = 176
    Top = 120
    Width = 97
    Height = 17
    Caption = #1575#1606#1711#1588#1578#1585' '#1608' '#1662#1604#1575#1705
    DataField = 'AngoshtarPlak'
    DataSource = dsReception
    TabOrder = 10
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox6: TDBCheckBox
    Left = 32
    Top = 120
    Width = 97
    Height = 17
    Caption = #1587#1608#1574#1610#1670
    DataField = 'Sooeech'
    DataSource = dsReception
    TabOrder = 11
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox7: TDBCheckBox
    Left = 664
    Top = 160
    Width = 97
    Height = 17
    Caption = #1575#1587#1606#1575#1583
    DataField = 'Asnad'
    DataSource = dsReception
    TabOrder = 12
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox8: TDBCheckBox
    Left = 544
    Top = 160
    Width = 97
    Height = 17
    Caption = #1662#1582#1588
    DataField = 'Pakhsh'
    DataSource = dsReception
    TabOrder = 13
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox9: TDBCheckBox
    Left = 424
    Top = 160
    Width = 97
    Height = 17
    Caption = #1705#1610#1601' '#1662#1608#1604
    DataField = 'KeefPool'
    DataSource = dsReception
    TabOrder = 14
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox10: TDBCheckBox
    Left = 304
    Top = 160
    Width = 97
    Height = 17
    Caption = #1587#1575#1605#1587#1608#1606#1578
    DataField = 'Samsonet'
    DataSource = dsReception
    TabOrder = 15
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 471
    Width = 222
    Height = 25
    DataSource = dsReception
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
    TabOrder = 16
  end
  object DBEdit7: TDBEdit
    Left = 312
    Top = 248
    Width = 121
    Height = 36
    DataField = 'Shift'
    DataSource = dsReception
    TabOrder = 17
  end
  object DBEdit8: TDBEdit
    Left = 16
    Top = 248
    Width = 121
    Height = 36
    DataField = 'StartTime'
    DataSource = dsReception
    TabOrder = 18
  end
  object DBEdit9: TDBEdit
    Left = 544
    Top = 296
    Width = 121
    Height = 36
    DataField = 'EndTime'
    DataSource = dsReception
    TabOrder = 19
  end
  object DBEdit10: TDBEdit
    Left = 16
    Top = 200
    Width = 649
    Height = 36
    DataField = 'Other'
    DataSource = dsReception
    TabOrder = 20
  end
  object DBEdit11: TDBEdit
    Left = 312
    Top = 296
    Width = 121
    Height = 36
    DataField = 'Price'
    DataSource = dsReception
    TabOrder = 21
  end
  object DBEdit12: TDBEdit
    Left = 16
    Top = 296
    Width = 121
    Height = 36
    DataField = 'CardID'
    DataSource = dsReception
    TabOrder = 22
  end
  object DBEdit13: TDBEdit
    Left = 544
    Top = 380
    Width = 121
    Height = 36
    DataField = 'UserID'
    DataSource = dsReception
    Enabled = False
    TabOrder = 23
  end
  object DBEdit14: TDBEdit
    Left = 312
    Top = 383
    Width = 121
    Height = 36
    DataField = 'ExitUserID'
    DataSource = dsReception
    Enabled = False
    TabOrder = 24
  end
  object DBEdit15: TDBEdit
    Left = 16
    Top = 343
    Width = 121
    Height = 36
    DataField = 'CardID2'
    DataSource = dsReception
    TabOrder = 25
  end
  object DBEdit16: TDBEdit
    Left = 544
    Top = 340
    Width = 121
    Height = 36
    DataField = 'NumberOfAdult'
    DataSource = dsReception
    TabOrder = 26
  end
  object DBEdit17: TDBEdit
    Left = 312
    Top = 343
    Width = 121
    Height = 36
    DataField = 'NumberOfChild'
    DataSource = dsReception
    TabOrder = 27
  end
  object DBEdit18: TDBEdit
    Left = 16
    Top = 383
    Width = 121
    Height = 36
    DataField = 'CardID3'
    DataSource = dsReception
    TabOrder = 28
  end
  object DBEdit19: TDBEdit
    Left = 544
    Top = 419
    Width = 121
    Height = 36
    DataField = 'ReceptionDiscount'
    DataSource = dsReception
    TabOrder = 29
  end
  object DBEdit20: TDBEdit
    Left = 310
    Top = 421
    Width = 121
    Height = 36
    DataField = 'OrderNumber'
    DataSource = dsReception
    TabOrder = 30
  end
  object DBEdit21: TDBEdit
    Left = 544
    Top = 459
    Width = 121
    Height = 36
    DataField = 'TicketType'
    DataSource = dsReception
    TabOrder = 31
  end
  object TReception: TADOTable
    Connection = DM.ADOConnection
    CursorType = ctStatic
    TableName = 'TReception'
    Left = 16
    Top = 160
  end
  object dsReception: TDataSource
    DataSet = frmViewReception.QReception
    Left = 56
    Top = 160
  end
end
