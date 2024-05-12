
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, DBTables, Grids, DBGrids, Menus, ActnList,
  jpeg, ExtCtrls, ComCtrls, ToolWin, ActnMan, ActnCtrls, XPMan,   wininet;


type
  Tfrmkeret = class(TForm)
    fomenu: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Keress1: TMenuItem;
    Mretszerint1: TMenuItem;
    pusszerint1: TMenuItem;
    Sajtadatok1: TMenuItem;
    frmcegadatnyito: TMenuItem;
    Beszltk1: TMenuItem;
    Kedvezmnyek1: TMenuItem;
    Megrendelsek1: TMenuItem;
    Sg1: TMenuItem;
    Image1: TImage;
    Adatbazis: TDatabase;
    ablakok: TMenuItem;
    prba1: TMenuItem;
    XPManifest1: TXPManifest;
    Nvjegy1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure Mretszerint1Click(Sender: TObject);
    procedure Kedvezmnyek1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Beszltk1Click(Sender: TObject);
    procedure pusszerint1Click(Sender: TObject);
    procedure frmcegadatmenuClick(Sender: TObject);
    procedure Megrendelsek1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Nvjegy1Click(Sender: TObject);

  private
    { Private declarations }
  public
    function floattosqlstr(mit: Extended ): string;
    function aktivforms(nev:string):Boolean ;
    function vaneinternetcs: bool;
    { Public declarations }
  end;

var
  frmkeret: Tfrmkeret;
  OpenArgs:string;
const
kepekhelye='..\kepek';

implementation

uses Unit2, Unit3, StrUtils, Unit4, beszallitok_u, tipuskereso,
  megrendelesek_u;

{$R *.dfm}


function Tfrmkeret.aktivforms(nev:string ): Boolean;

    var i:integer;
begin
  result:=false   ;
  for i:=0 to Screen.FormCount -1 do begin
  if Screen.Forms [i].name =nev then result :=true end ;
end;


 function tfrmkeret.floattosqlstr(mit: Extended): string;
begin
 result:=AnsiReplaceStr(FloatToStr(mit),',','.')
end;

procedure Tfrmkeret.FormActivate(Sender: TObject);
begin

  with image1 do
  begin
     Width :=frmkeret.ClientWidth  ;
     Height :=frmkeret.clientheight   ;
  end;

end;

procedure Tfrmkeret.Mretszerint1Click(Sender: TObject);


begin
  openargs:='meret';
  if aktivforms('frmMeretSzK') then begin
  	frmmeretszk.hogynezki ;
  end else begin
  	Application.CreateForm(Tfrmmeretszk, frmmeretszk);
  end;
end;
procedure Tfrmkeret.pusszerint1Click(Sender: TObject);

begin
	openargs:='tipus';
  if aktivforms('frmMeretSzK') then begin
  	frmmeretszk.hogynezki  ;

  end else begin
  	Application.CreateForm(Tfrmmeretszk, frmmeretszk);
  end;
end;




procedure Tfrmkeret.Kedvezmnyek1Click(Sender: TObject);
begin

  Application.CreateForm(Tfrmkedvbeal, frmkedvbeal);


end;

procedure Tfrmkeret.Exit1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmkeret.Beszltk1Click(Sender: TObject);
begin

 Application.CreateForm(Tfrmbeszallitok, frmbeszallitok);

end;







procedure Tfrmkeret.frmcegadatmenuClick(Sender: TObject);
begin

    Application.CreateForm(Tfrmcegadat, frmcegadat);

end;

procedure Tfrmkeret.Megrendelsek1Click(Sender: TObject);
begin

    Application.CreateForm(Tmegrendelesek, megrendelesek);

end;

procedure Tfrmkeret.FormCreate(Sender: TObject);
begin
Width:=800;
Height:=600;
end;





function Tfrmkeret.vaneinternetcs: bool;

var csatltipus:WORD   ;
begin
  csatltipus := INTERNET_CONNECTION_MODEM
                       + INTERNET_CONNECTION_LAN
                       + INTERNET_CONNECTION_PROXY ;
  if InternetGetConnectedState(@csatltipus, 0) then
    Result := True
  else begin
		Result := False;
    MessageDLG('Csatlakozz az INTERNET-hez '+ #13 +
    						' és probáld ujra !', mtInformation, [mbOk],0);
  end;
end;


procedure Tfrmkeret.Nvjegy1Click(Sender: TObject);
begin
  Application.MessageBox
  	(
  	'Kada Zoltán'+ #10#13 + 'kadazoli@freestart.hu',
    'KAdatSoft:',
    MB_OK
  	) ;

end;

end.
