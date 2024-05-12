object frmMeretSzK: TfrmMeretSzK
  Left = 132
  Top = 156
  Width = 663
  Height = 357
  BorderIcons = [biSystemMenu]
  Caption = 'M'#233'ret szerinti keres'#233's.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = kfeltolt
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 606
    Top = 320
    Width = 179
    Height = 145
    AutoSize = True
    OnDblClick = nagykepgombClick
  end
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 38
    Height = 13
    Caption = #201'vszak:'
  end
  object Label2: TLabel
    Left = 144
    Top = 32
    Width = 74
    Height = 13
    Caption = 'G'#233'pj'#225'rm'#369' Fajta:'
  end
  object Label3: TLabel
    Left = 280
    Top = 32
    Width = 51
    Height = 13
    Caption = 'Sz'#233'less'#233'g:'
  end
  object Label4: TLabel
    Left = 416
    Top = 32
    Width = 52
    Height = 13
    Caption = 'Magass'#225'g:'
  end
  object Label5: TLabel
    Left = 552
    Top = 32
    Width = 36
    Height = 13
    Caption = #193'tm'#233'r'#337':'
  end
  object evszakk: TComboBox
    Left = 8
    Top = 48
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = kchange
  end
  object gjmfajtak: TComboBox
    Left = 136
    Top = 48
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = kchange
  end
  object szelessegk: TComboBox
    Left = 264
    Top = 48
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    OnChange = kchange
  end
  object magassagk: TComboBox
    Left = 392
    Top = 48
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    OnChange = kchange
  end
  object atmerok: TComboBox
    Left = 520
    Top = 48
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    OnChange = kchange
  end
  object lista: TDBGrid
    Left = 9
    Top = 80
    Width = 593
    Height = 425
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = listaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'gumia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Marka'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Meret'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'extra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'megjegyzes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kedv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'besz_a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Kkbrszerelve'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #193'r Szerelve'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kkbr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #193'r'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object ujkeresesbtn: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = #218'j keres'#233's'
    TabOrder = 6
    OnClick = ujkeresesbtnClick
  end
  object nagykepgomb: TButton
    Left = 664
    Top = 281
    Width = 75
    Height = 25
    Caption = 'Nagyk'#233'p'
    TabOrder = 7
    OnClick = nagykepgombClick
  end
  object gyartmanylist: TDBLookupListBox
    Left = 16
    Top = 8
    Width = 113
    Height = 342
    KeyField = 'gyartmanya'
    ListField = 'gyartmany'
    ListSource = gyartmanyhoz
    TabOrder = 8
    OnClick = gyartmanylistClick
  end
  object tipuslist: TDBLookupListBox
    Left = 208
    Top = 8
    Width = 201
    Height = 342
    KeyField = 'tipusa'
    ListField = 'tipus'
    ListSource = tipushoz
    TabOrder = 9
    OnClick = tipuslistClick
    OnKeyUp = tipuslistKeyUp
  end
  object meretlist: TDBLookupListBox
    Left = 488
    Top = 8
    Width = 241
    Height = 147
    KeyField = 'mereta'
    ListField = 'meret'
    ListSource = merethez
    TabOrder = 10
    OnClick = meretlistClick
  end
  object lekerdezes: TQuery
    DatabaseName = 'SzD'
    Left = 670
    Top = 1
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = listaquery
    Left = 734
  end
  object listaquery: TQuery
    AfterScroll = listaqueryAfterScroll
    DatabaseName = 'SzD'
    Left = 702
  end
  object gyartmanyq: TQuery
    Active = True
    DatabaseName = 'SzD'
    SQL.Strings = (
      
        'select gyartmany.gyartmanya,gyartmany.gyartmany from "gyartmany.' +
        'db" gyartmany where gyartmany <>"" order by 2')
    Left = 400
  end
  object tipusq: TQuery
    DatabaseName = 'SzD'
    Left = 464
  end
  object meretq: TQuery
    DatabaseName = 'SzD'
    Left = 528
  end
  object gyartmanyhoz: TDataSource
    AutoEdit = False
    DataSet = gyartmanyq
    Left = 432
  end
  object tipushoz: TDataSource
    AutoEdit = False
    DataSet = tipusq
    Left = 496
  end
  object merethez: TDataSource
    AutoEdit = False
    DataSet = meretq
    Left = 560
  end
end
