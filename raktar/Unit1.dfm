object Form1: TForm1
  Left = 243
  Top = 105
  Width = 316
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 32
    Width = 95
    Height = 13
    Caption = 'raktar oldali program'
  end
  object servserport: TLabel
    Left = 168
    Top = 16
    Width = 52
    Height = 13
    Caption = 'servserport'
  end
  object cliensport: TLabel
    Left = 0
    Top = 16
    Width = 45
    Height = 13
    Caption = 'cliensport'
  end
  object Memo1: TMemo
    Left = 8
    Top = 64
    Width = 281
    Height = 361
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object TcpClient1: TTcpClient
    RemotePort = '2222'
    Left = 96
    Top = 8
  end
  object TcpServer1: TTcpServer
    Active = True
    LocalPort = '2224'
    OnAccept = TcpServer1Accept
    Left = 184
    Top = 8
  end
end
