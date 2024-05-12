unit megrendelesek_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, ComCtrls, Mask, Buttons,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdBaseComponent, IdMessage, Sockets, ExtCtrls;

type
  Tmegrendelesek = class(TForm)
    rendeles: TTable;
    reszletek: TTable;
    rendelesekhez: TDataSource;
    reszletekhez: TDataSource;
    rendelesek: TDBGrid;
    reszletekgrid: TDBGrid;
    reszletekRendreszla: TAutoIncField;
    reszletekRendelesa: TIntegerField;
    reszletekgumia: TIntegerField;
    reszletekdb: TIntegerField;
    reszletekDatum: TFloatField;
    reszletekLeiras: TStringField;
    reszletekSmegj: TStringField;
    reszletekRmegj: TStringField;
    reszletekBeszbr: TFloatField;
    reszletekido: TDateTimeField;
    rendelesRendelesa: TAutoIncField;
    rendelesido: TDateTimeField;
    rendelesEdate: TFloatField;
    sumbeszbr: TLabel;
    szamolo: TQuery;
    kuldes: TBitBtn;
    Label1: TLabel;
    cegadatq: TQuery;
    beszallitokq: TQuery;
    TcpClient1: TTcpClient;
    TcpServer1: TTcpServer;
    Timer1: TTimer;
    Timer2: TTimer;
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure reszletekCalcFields(DataSet: TDataSet);
    procedure rendelesCalcFields(DataSet: TDataSet);
    procedure rendelesAfterScroll(DataSet: TDataSet);
    procedure kuldesClick(Sender: TObject);
    function uzenetkuldes:Boolean ;
    procedure uzenetoszerako(var u:string);
    procedure TcpServer1Accept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  megrendelesek: Tmegrendelesek;
  visszajelzes:Boolean;
  vuzenet:string;

implementation
 uses Unit1;
{$R *.dfm}
procedure Tmegrendelesek.uzenetoszerako(var u:string);
begin
  u:='';
   if  VarIsNull  (rendeles['ido'])then begin

        u:= rendeles.fieldbyname('rendelesa').AsString
        + '.MEGRENDELÉS' + #13 ;
   		end else begin

        u:= rendeles.fieldbyname('rendelesa').AsString
        +  '.MEGRENDELÉS ISMÉTLÉSE' + #13;
   end;
   u:=u + 'Feladó:' + #13 + '    ' +
      		cegadatq .fieldbyname('fejlec').AsString + #13;
   reszletek.First;
        while not reszletek.Eof do begin
          	u:=u + reszletek.fieldbyname('leiras').AsString + ' méretû ; ' +
                  reszletek.fieldbyname('db').AsString     +' darab ; ' +
                  reszletek.fieldbyname('rmegj').AsString + #13;
        		reszletek.next;
        end;

end;

function Tmegrendelesek.uzenetkuldes:Boolean ;
var uzenet:String ;
begin
	result:=true;
  uzenetoszerako(uzenet) ;

 vuzenet:='';
	try
    TcpClient1.RemoteHost:=beszallitokq.fieldbyname('host').AsString;;
    try
    if TcpClient1.Connect then TcpClient1.Sendln(uzenet);
    finally
    TcpClient1.Disconnect;
    end;
  except
    result:=false;
    end;
  if result then begin
  ProgressBar1.Visible:=true;
  timer1.Enabled:=true;

  Timer2.Enabled :=true;
  kuldes.Enabled:=False;

    end
    else
    MessageDLG('Hiba az üzenet küldése közben!',
                           mtError , [mbOk],0);
end;

procedure Tmegrendelesek.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tmegrendelesek.FormActivate(Sender: TObject);
begin
rendeles.last;
end;

procedure Tmegrendelesek.reszletekCalcFields(DataSet: TDataSet);
begin
  with DataSet  do begin
  if not VarIsNull  (FieldByName('datum').value) then
  FieldByName('ido').Value :=FloatToDateTime (FieldByName('datum').Value)

  end;

end;

procedure Tmegrendelesek.rendelesCalcFields(DataSet: TDataSet);
begin

with dataset do begin
  if not VarIsNull  (FieldByName('edate').value) then
  FieldByName('ido').value:=FloatToDateTime (FieldByName('edate').Value )
end;

end;

procedure Tmegrendelesek.rendelesAfterScroll(DataSet: TDataSet);
var a:Boolean ;
begin
  with szamolo do begin
    Close;
    SQL.Clear;
    SQL.Text:='select sum(beszbr * db)  sumbeszbr from "rendelesreszl.db" '
    							+ 'where rendelesa="'
                	+ rendeles.fieldbyname('rendelesa').AsString + '"';
    Open ;
  end;
  if not varisnull (szamolo ['sumbeszbr']) then begin
    sumbeszbr.Caption:=FloatToStrF
                    ( (szamolo.fieldbyname('sumbeszbr').asfloat),ffnumber,15,1)
                    + '0 Ft' ;
  end
  else begin
    sumbeszbr.Caption:='0 Ft'
  end;
  if  VarIsNull  (rendeles['ido']) then begin
     a:=true;
  end
  else begin
  	a:=false;
  end;

 reszletekgrid.Enabled:=a;
 Label1.Enabled:=a;
 sumbeszbr.Enabled:=a;
end;

procedure Tmegrendelesek.kuldesClick(Sender: TObject);
begin
	if  VarIsNull  (rendeles['ido'])then begin
    if frmkeret.vaneinternetcs  then begin
        uzenetkuldes ;
    end;
  end
  else begin
  	if  Application.MessageBox('Ezt a rendelést már elküldtük!'+ #13 +
    					'Megismételjük a küldést ? ','FIGYELEM !',MB_YESNO  )
              	=Idyes then begin
              								if frmkeret.vaneinternetcs then
                              		uzenetkuldes ;
     end;
  end;
end;




procedure Tmegrendelesek.TcpServer1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);

begin
  vuzenet :=clientsocket.Receiveln;


end;

procedure Tmegrendelesek.Timer1Timer(Sender: TObject);
begin
  Timer2.Enabled:=false;
  Timer1.Enabled:=false;
  kuldes.Enabled:=True ;
  if vuzenet='' then
  ShowMessage('hiba nem érkezett meg a visszaigazolás')
  else begin
    if  VarIsNull  (rendeles['ido'])then begin
      with szamolo  do begin
         Close;
         SQL.Clear ;
         SQL.Text:='UPDATE  "rendeles.db"  SET edate="' +
               frmkeret.floattosqlstr(date + time) +
              '" where rendelesa="' +
              rendeles.fieldbyname('rendelesa').asstring + '"';
         ExecSQL  ;
      end;
      rendeles.Refresh;
      rendeles.prior;
      rendeles.Last ;
    end;
    ShowMessage(vuzenet) ;
  end;
  ProgressBar1.Visible :=false;
  ProgressBar1.Position:=0;
end;

procedure Tmegrendelesek.Timer2Timer(Sender: TObject);
begin
ProgressBar1.Position:=ProgressBar1.Position + 100;
if vuzenet <>   '' then Timer1Timer(self); 
end;

procedure Tmegrendelesek.FormDeactivate(Sender: TObject);
begin
close;
end;

end.


