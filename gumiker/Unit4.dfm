object frmcegadat: Tfrmcegadat
  Left = 195
  Top = 100
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'C'#233'gadatok'
  ClientHeight = 432
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 16
  object Label12: TLabel
    Left = 505
    Top = 8
    Width = 48
    Height = 16
    Caption = 'Label12'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 381
    Top = 8
    Width = 108
    Height = 16
    Caption = 'Utols'#243' m'#243'dos'#237't'#225's:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 24
    Top = 32
    Width = 545
    Height = 361
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Alapadatok'
      object Label9: TLabel
        Left = 464
        Top = 274
        Width = 15
        Height = 24
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 224
        Top = 186
        Width = 15
        Height = 24
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 296
        Top = 202
        Width = 78
        Height = 16
        Caption = 'Szerel'#233's '#225'fa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 48
        Top = 274
        Width = 106
        Height = 16
        Caption = 'Nett'#243' szerel'#233'sid'#237'j:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 272
        Top = 282
        Width = 101
        Height = 16
        Caption = 'Gumik'#246'peny '#225'fa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 112
        Top = 194
        Width = 35
        Height = 16
        Caption = #193'rr'#233's:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 200
        Top = 76
        Width = 26
        Height = 16
        Caption = 'Cim:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 32
        Top = 100
        Width = 78
        Height = 16
        Caption = 'Ir'#225'ny'#237't'#243'sz'#225'm:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 240
        Top = 274
        Width = 16
        Height = 24
        Caption = 'Ft'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 464
        Top = 194
        Width = 15
        Height = 24
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 28
        Height = 16
        Caption = 'N'#233'v:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object nev: TEdit
        Left = 8
        Top = 32
        Width = 577
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'nev'
        OnChange = nevChange
      end
      object isz: TEdit
        Left = 8
        Top = 96
        Width = 121
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'isz'
        OnChange = nevChange
      end
      object gumiafa: TEdit
        Left = 384
        Top = 194
        Width = 73
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'gumiafa'
        OnChange = nevChange
      end
      object szerelesafa: TEdit
        Left = 384
        Top = 274
        Width = 73
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = 'szerelesafa'
        OnChange = nevChange
      end
      object szerelesidij: TEdit
        Left = 168
        Top = 266
        Width = 65
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = 'szerelesidij'
        OnChange = nevChange
      end
      object cim: TEdit
        Left = 200
        Top = 96
        Width = 393
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = 'cim'
        OnChange = nevChange
      end
      object arres: TEdit
        Left = 168
        Top = 186
        Width = 49
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Text = 'arres'
        OnChange = nevChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Kapcsolat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Label14: TLabel
        Left = 5
        Top = 24
        Width = 37
        Height = 16
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 184
        Top = 192
        Width = 98
        Height = 16
        Caption = 'Felhaszn'#225'l'#243'n'#233'v:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 8
        Top = 96
        Width = 123
        Height = 16
        Caption = 'SMTP Szerver neve:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 240
        Top = 242
        Width = 42
        Height = 16
        Caption = 'Jelsz'#243':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 184
        Top = 290
        Width = 103
        Height = 16
        Caption = 'Jelsz'#243' ism'#233'tl'#233'se:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 16
        Top = 8
        Width = 475
        Height = 11
        Caption = 
          'Ezen adatok kit'#246'lt'#233's'#233'nek nincs semilyen jelent'#246's'#233'ge a program eg' +
          'y el'#337'z'#337' verzi'#243'ja haszn'#225'lta a rendel'#233's k'#252'ldes'#233'n'#233'l.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object email: TEdit
        Left = 40
        Top = 50
        Width = 449
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Email'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'email'
        OnChange = nevChange
      end
      object usernev: TEdit
        Left = 320
        Top = 184
        Width = 169
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'usernev'
        OnChange = nevChange
      end
      object host: TEdit
        Left = 40
        Top = 120
        Width = 449
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'host'
        OnChange = nevChange
      end
      object jelszo: TEdit
        Left = 320
        Top = 234
        Width = 169
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PasswordChar = #8226
        TabOrder = 3
        Text = 'jelszo'
        OnChange = nevChange
      end
      object jelszo2: TEdit
        Left = 320
        Top = 282
        Width = 169
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PasswordChar = #8226
        TabOrder = 4
        Text = 'jelszo2'
        OnChange = nevChange
      end
    end
  end
  object modositas: TBitBtn
    Left = 0
    Top = 0
    Width = 75
    Height = 25
    Caption = 'modos'#237't'#225's'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = modositasClick
  end
  object mentes: TBitBtn
    Left = 72
    Top = 0
    Width = 75
    Height = 25
    Caption = 'ment'#233's'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = mentesClick
  end
  object megsem: TButton
    Left = 144
    Top = 0
    Width = 75
    Height = 25
    Caption = 'M'#233'gsem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = megsemClick
  end
  object cegadat: TTable
    Active = True
    DatabaseName = 'SzD'
    TableName = 'cegadat.DB'
    Left = 240
  end
  object Query1: TQuery
    DatabaseName = 'SzD'
    Left = 344
    Top = 65528
  end
end
