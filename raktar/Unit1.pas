unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Sockets, ExtCtrls;

type
  TForm1 = class(TForm)
    TcpClient1: TTcpClient;
    TcpServer1: TTcpServer;
    Memo1: TMemo;
    Label1: TLabel;
    servserport: TLabel;
    cliensport: TLabel;
    procedure TcpServer1Accept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.TcpServer1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var uzenet:string;
begin
  uzenet:='Küldõ: ' + ClientSocket.RemoteHost;
  memo1.lines.add(uzenet);
  uzenet:=clientsocket.Receiveln;
  memo1.lines.add(uzenet);



TcpClient1.RemoteHost:=ClientSocket.RemoteHost;
try
if TcpClient1.Connect then TcpClient1.Sendln('A raktár az alábbi megrendendelést megkapta:'+ #10#13 + uzenet);
finally
TcpClient1.Disconnect;
end;

end;


procedure TForm1.FormActivate(Sender: TObject);
begin
servserport.Caption:= 'server.localport: '+ TcpServer1.LocalPort ;
cliensport.Caption :='cliens.remoteport: ' + TcpClient1.remoteport ;

end;

end.
