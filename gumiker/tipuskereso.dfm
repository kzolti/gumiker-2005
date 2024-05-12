object frmtipuskereso: Tfrmtipuskereso
  Left = 50
  Top = 126
  AutoScroll = False
  Caption = 'Tipuskeres'#337
  ClientHeight = 329
  ClientWidth = 745
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
  OnClose = FormClose
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object tipuslist: TDBLookupListBox
    Left = 248
    Top = 0
    Width = 161
    Height = 329
    KeyField = 'tipusa'
    ListField = 'tipus'
    ListSource = tipushoz
    TabOrder = 0
    OnClick = tipuslistClick
    OnKeyUp = tipuslistKeyUp
  end
  object Gyartmany: TDBLookupListBox
    Left = 48
    Top = 0
    Width = 121
    Height = 329
    KeyField = 'gyartmanya'
    ListField = 'gyartmany'
    ListSource = gyartmanyhoz
    TabOrder = 1
    OnClick = GyartmanyClick
    OnKeyUp = GyartmanyKeyUp
  end
  object meretlist: TDBLookupListBox
    Left = 504
    Top = 24
    Width = 177
    Height = 95
    KeyField = 'Meret'
    ListField = 'Meret'
    ListSource = merethez
    TabOrder = 2
  end
  object gyartmanyq: TQuery
    Active = True
    DatabaseName = 'SzD'
    SQL.Strings = (
      
        'select gyartmany.gyartmanya,gyartmany.gyartmany from "gyartmany.' +
        'db" gyartmany where gyartmany <>"" order by 2')
  end
  object merethez: TDataSource
    DataSet = meretq
    Left = 504
  end
  object meretq: TQuery
    AfterScroll = meretqAfterScroll
    DatabaseName = 'SzD'
    Left = 464
  end
  object TIPUSQ: TQuery
    DatabaseName = 'SzD'
    Filtered = True
    SQL.Strings = (
      ''
      '')
    Left = 344
  end
  object tipushoz: TDataSource
    DataSet = TIPUSQ
    Left = 392
  end
  object gyartmanyhoz: TDataSource
    AutoEdit = False
    DataSet = gyartmanyq
    Left = 112
  end
end
