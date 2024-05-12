object frmBeszallitok: TfrmBeszallitok
  Left = 218
  Top = 102
  Width = 547
  Height = 450
  BorderIcons = [biSystemMenu]
  Caption = 'Besz'#225'll'#237't'#243'k'
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBText1: TDBText
    Left = 16
    Top = 24
    Width = 465
    Height = 33
    Alignment = taCenter
    DataField = 'nev'
    DataSource = beszallitokhoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 16
    Top = 72
    Width = 473
    Height = 41
    Cursor = crHandPoint
    DataField = 'Email'
    DataSource = beszallitokhoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSkyBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = DBText2Click
  end
  object DBText4: TDBText
    Left = 16
    Top = 128
    Width = 481
    Height = 41
    DataField = 'kapcsolattarto'
    DataSource = beszallitokhoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBText5: TDBText
    Left = 16
    Top = 192
    Width = 481
    Height = 33
    DataField = 'cim'
    DataSource = beszallitokhoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBText6: TDBText
    Left = 16
    Top = 256
    Width = 481
    Height = 33
    DataField = 'telefon'
    DataSource = beszallitokhoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 16
    Top = 320
    Width = 489
    Height = 49
    Cursor = crHandPoint
    DataField = 'Host'
    DataSource = beszallitokhoz
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSkyBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = DBText3Click
  end
  object Label1: TLabel
    Left = 0
    Top = 384
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 200
    Top = 0
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 8
    Top = 381
    Width = 75
    Height = 25
    Caption = #218'j IP'
    TabOrder = 0
    OnClick = Button1Click
  end
  object beszall: TTable
    Active = True
    DatabaseName = 'SzD'
    TableName = 'beszalitok.DB'
    Left = 314
  end
  object beszallitokhoz: TDataSource
    DataSet = beszall
    Left = 354
  end
end
