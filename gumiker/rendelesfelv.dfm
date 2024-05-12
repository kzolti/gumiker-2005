object rendeles: Trendeles
  Left = 215
  Top = 135
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Megrendel'#233'sek'
  ClientHeight = 254
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object leiras: TLabel
    Left = 16
    Top = 24
    Width = 41
    Height = 20
    Caption = 'leiras'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 152
    Top = 56
    Width = 29
    Height = 13
    Caption = 'Darab'
  end
  object gumia: TLabel
    Left = 48
    Top = 0
    Width = 28
    Height = 13
    Caption = 'gumia'
  end
  object datum: TLabel
    Left = 136
    Top = 8
    Width = 29
    Height = 13
    Caption = 'datum'
  end
  object beszbr: TLabel
    Left = 24
    Top = 184
    Width = 38
    Height = 13
    Caption = 'beszbr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object szumbeszbr: TLabel
    Left = 168
    Top = 184
    Width = 66
    Height = 13
    Caption = 'szumbeszbr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 40
    Top = 72
    Width = 118
    Height = 13
    Caption = 'Megjegyz'#233's a rakt'#225'r fel'#233':'
  end
  object Label3: TLabel
    Left = 40
    Top = 120
    Width = 121
    Height = 13
    Caption = 'Megjegyz'#233's  magunknak:'
  end
  object Label4: TLabel
    Left = 8
    Top = 168
    Width = 65
    Height = 13
    Caption = 'Beszerz'#225'si '#225'r:'
  end
  object Label5: TLabel
    Left = 136
    Top = 168
    Width = 133
    Height = 13
    Caption = 'A t'#233'tel  '#246'ssz. beszerz'#233'si '#225'ra:'
  end
  object db: TEdit
    Left = 72
    Top = 48
    Width = 57
    Height = 21
    TabOrder = 0
    Text = '1'
    OnChange = dbChange
  end
  object UpDown1: TUpDown
    Left = 129
    Top = 48
    Width = 16
    Height = 21
    Associate = db
    Min = 1
    Max = 5000
    Position = 1
    TabOrder = 1
  end
  object ok: TBitBtn
    Left = 184
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = okClick
    Kind = bkOK
  end
  object megse: TBitBtn
    Left = 16
    Top = 216
    Width = 75
    Height = 25
    Caption = 'M'#233'gse'
    TabOrder = 3
    OnClick = megseClick
    Kind = bkCancel
  end
  object smegj: TEdit
    Left = 40
    Top = 136
    Width = 209
    Height = 21
    TabOrder = 4
  end
  object rmegj: TEdit
    Left = 40
    Top = 88
    Width = 201
    Height = 21
    TabOrder = 5
  end
  object lekerdezes: TQuery
    DatabaseName = 'SzD'
    Left = 184
    Top = 40
  end
end
