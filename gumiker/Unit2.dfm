object frmkedvbeal: Tfrmkedvbeal
  Left = 354
  Top = 129
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Besz'#225'll'#237't'#243' '#225'ltal ny'#250'jtott kedvezm'#233'yek.'
  ClientHeight = 335
  ClientWidth = 400
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 472
    Top = 27
    Width = 115
    Height = 24
    Caption = 'Kedvezm'#233'ny:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 328
    Top = 117
    Width = 28
    Height = 37
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object kedvezmeny: TEdit
    Left = 272
    Top = 112
    Width = 49
    Height = 45
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
  end
  object marka: TListBox
    Left = 48
    Top = 136
    Width = 121
    Height = 137
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 1
  end
  object gjmfajta: TListBox
    Left = 48
    Top = 288
    Width = 121
    Height = 97
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 2
  end
  object evszak: TListBox
    Left = 48
    Top = 400
    Width = 121
    Height = 97
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 3
  end
  object beszalitok: TListBox
    Left = 48
    Top = 56
    Width = 121
    Height = 65
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 24
    ParentFont = False
    TabOrder = 4
  end
  object csinald: TButton
    Left = 248
    Top = 56
    Width = 137
    Height = 25
    Caption = 'Lista k'#233'sz'#237't'#233's'
    TabOrder = 5
    OnClick = csinaldClick
  end
  object eredmeny: TDBGrid
    Left = 472
    Top = 56
    Width = 281
    Height = 465
    DataSource = eredmenyhez
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'marka'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'evszak'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gjmfajta'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kedv'
        Width = 40
        Visible = True
      end>
  end
  object Tabla: TTable
    DatabaseName = 'SzD'
    Left = 24
  end
  object Query1: TQuery
    DatabaseName = 'SzD'
    Left = 48
  end
  object eredmenysql: TQuery
    DatabaseName = 'SzD'
    SQL.Strings = (
      'SELECT DISTINCT D4.marka, D1.evszak, D2.gjmfajta, D3.kedv'
      
        'FROM  "evszak.DB" D1, "gjmfajta.DB" D2, "gumi.DB" D3, "marka.DB"' +
        ' D4, "minta.DB" D5'
      'WHERE'
      '(D3.evszaka = D1.evszaka)'
      ' AND (D3.gjmfajtaa = D2.Gjmfajtaa)'
      ' AND (D5.mintaa = D3.mintaa)'
      ' AND (D5.markaa = D4.markaa)'
      'ORDER BY    1 ,2,3')
    Left = 688
  end
  object eredmenyhez: TDataSource
    DataSet = eredmenysql
    Left = 656
  end
  object MainMenu1: TMainMenu
    Left = 280
    object Eszkzk1: TMenuItem
      Caption = '&Eszk'#246'z'#246'k'
      GroupIndex = 3
      object modosit: TMenuItem
        Caption = '&M'#243'dos'#237't'#225's'
        OnClick = modositClick
      end
      object Olvass1: TMenuItem
        Caption = '&Olvas'#225's'
        GroupIndex = 5
        OnClick = Olvass1Click
      end
    end
  end
end
