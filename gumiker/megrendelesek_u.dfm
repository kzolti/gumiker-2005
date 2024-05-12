object megrendelesek: Tmegrendelesek
  Left = 208
  Top = 145
  Width = 592
  Height = 375
  HorzScrollBar.Position = 218
  BorderIcons = [biSystemMenu]
  Caption = 'Megrendel'#233'sek'
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object sumbeszbr: TLabel
    Left = 507
    Top = 141
    Width = 30
    Height = 24
    Alignment = taRightJustify
    Caption = 'tztfz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 54
    Top = 144
    Width = 276
    Height = 24
    Caption = 'Rendel'#233's brutt'#243' beszerz'#233'si '#225'ron:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object rendelesek: TDBGrid
    Left = -202
    Top = 16
    Width = 185
    Height = 153
    DataSource = rendelesekhez
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ido'
        Visible = True
      end>
  end
  object reszletekgrid: TDBGrid
    Left = -210
    Top = 184
    Width = 777
    Height = 313
    DataSource = reszletekhez
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Leiras'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'db'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Beszbr'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rmegj'
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Smegj'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ido'
        Width = 115
        Visible = True
      end>
  end
  object kuldes: TBitBtn
    Left = 380
    Top = 32
    Width = 161
    Height = 25
    Caption = 'Megrendel'#233's elk'#252'ld'#233'se.'
    TabOrder = 2
    OnClick = kuldesClick
    Kind = bkOK
  end
  object ProgressBar1: TProgressBar
    Left = 384
    Top = 64
    Width = 150
    Height = 10
    Max = 5000
    TabOrder = 3
    Visible = False
  end
  object rendeles: TTable
    Active = True
    AfterScroll = rendelesAfterScroll
    OnCalcFields = rendelesCalcFields
    DatabaseName = 'SzD'
    FieldDefs = <
      item
        Name = 'Rendelesa'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Edate'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Fields = 'Rendelesa'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'Rendelesa'
    StoreDefs = True
    TableName = 'rendeles.DB'
    Left = 32
    Top = 1
    object rendelesRendelesa: TAutoIncField
      FieldName = 'Rendelesa'
      ReadOnly = True
    end
    object rendelesido: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'ido'
      Calculated = True
    end
    object rendelesEdate: TFloatField
      FieldName = 'Edate'
    end
  end
  object reszletek: TTable
    Active = True
    OnCalcFields = reszletekCalcFields
    DatabaseName = 'SzD'
    IndexName = 'Rendelesa'
    MasterFields = 'Rendelesa'
    MasterSource = rendelesekhez
    TableName = 'rendelesreszl.DB'
    Left = 376
    Top = 153
    object reszletekRendreszla: TAutoIncField
      FieldName = 'Rendreszla'
      ReadOnly = True
    end
    object reszletekRendelesa: TIntegerField
      FieldName = 'Rendelesa'
    end
    object reszletekgumia: TIntegerField
      FieldName = 'gumia'
    end
    object reszletekdb: TIntegerField
      FieldName = 'db'
    end
    object reszletekDatum: TFloatField
      FieldName = 'Datum'
    end
    object reszletekLeiras: TStringField
      FieldName = 'Leiras'
      Size = 80
    end
    object reszletekSmegj: TStringField
      FieldName = 'Smegj'
      Size = 255
    end
    object reszletekRmegj: TStringField
      FieldName = 'Rmegj'
      Size = 255
    end
    object reszletekBeszbr: TFloatField
      FieldName = 'Beszbr'
    end
    object reszletekido: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'ido'
      Calculated = True
    end
  end
  object rendelesekhez: TDataSource
    AutoEdit = False
    DataSet = rendeles
    Top = 1
  end
  object reszletekhez: TDataSource
    AutoEdit = False
    DataSet = reszletek
    Left = 352
    Top = 153
  end
  object szamolo: TQuery
    DatabaseName = 'SzD'
    Left = 504
    Top = 152
  end
  object cegadatq: TQuery
    Active = True
    DatabaseName = 'SzD'
    SQL.Strings = (
      
        'SELECT  nev + " ; " + isz + " ; " + cim + " ; " + Email fejlec ,' +
        'host,'
      'usernev,jelszo,email'
      'FROM "cegadat.DB" '
      'where  cega in (select max(b.cega) from "cegadat.DB" b)')
    Left = 208
  end
  object beszallitokq: TQuery
    Active = True
    DatabaseName = 'SzD'
    SQL.Strings = (
      'SELECT  host'
      'FROM "beszalitok.DB"')
    Left = 184
  end
  object TcpClient1: TTcpClient
    Active = True
    RemotePort = '2224'
    Left = 358
    Top = 32
  end
  object TcpServer1: TTcpServer
    Active = True
    LocalPort = '2222'
    OnAccept = TcpServer1Accept
    Left = 534
    Top = 32
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 320
    Top = 8
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer2Timer
    Left = 448
    Top = 56
  end
end
