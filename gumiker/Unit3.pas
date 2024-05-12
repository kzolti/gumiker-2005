unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  ExtCtrls,jpeg;

type
  TfrmMeretSzK = class(TForm)
    evszakk: TComboBox;
    gjmfajtak: TComboBox;
    szelessegk: TComboBox;
    magassagk: TComboBox;
    atmerok: TComboBox;
    lista: TDBGrid;
    lekerdezes: TQuery;
    ds: TDataSource;
    listaquery: TQuery;
    ujkeresesbtn: TButton;
    Image1: TImage;
    nagykepgomb: TButton;
    gyartmanyq: TQuery;
    tipusq: TQuery;
    meretq: TQuery;
    gyartmanyhoz: TDataSource;
    tipushoz: TDataSource;
    merethez: TDataSource;
    gyartmanylist: TDBLookupListBox;
    tipuslist: TDBLookupListBox;
    meretlist: TDBLookupListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure kfeltolt(Sender: TObject);
    procedure kchange(Sender: TObject);
    procedure ujkeresesbtnClick(Sender: TObject);
    procedure listaqueryAfterScroll(DataSet: TDataSet);
    procedure nagykepgombClick(Sender: TObject);
    procedure listaDblClick(Sender: TObject);
    procedure listafrissit ();
    procedure tipusfrissit();
    procedure meretfrissit();
    procedure gyartmanylistClick(Sender: TObject);
    procedure tipuslistClick(Sender: TObject);
    procedure tszlistafrissit();
    procedure tipuslistKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure meretlistClick(Sender: TObject);
    procedure hogynezki();
    procedure FormDeactivate(Sender: TObject);
   private

    { Private declarations }
  public
    { Public declarations }
  end;

var




  frmMeretSzK: TfrmMeretSzK;
  Felt,Evszakfelt,Gjmfajtafelt,Szelessegfelt,Atmerofelt,Magassagfelt:string;

  const
sqlstr='SELECT d2.gumia, D3.marka + " " + D5.minta as Marka, meret_e + " " '
    + '+ szelesseg + d4."x/" + magassag + " " + szerkezet + " " + atmero'
    + ' + meret_v Meret, D2.LI, D2.SS, D2.extra, D2.megjegyzes, D2.listanetto,'
    + ' d2.kkbr, d2.kkbrszerelve, D2.kedv, D2.besz_a ';
b=' , d2.mintaa ,d7.gumiafa FROM "evszak.DB" D, "gjmfajta.DB" D1,'
    + ' "gumi.DB" D2, "marka.DB" D3, "meret.DB" D4, "minta.DB" D5,'
    + ' "beszalitok.DB" D6, "cegadat.DB" D7 WHERE(D2.evszaka = D.evszaka)'
    + ' AND (D2.gjmfajtaa = D1.Gjmfajtaa) AND (D4.mereta = D2.mereta)';
c=' AND (D5.mintaa = D2.mintaa) AND (D5.markaa = D3.markaa) AND'
		+ ' (D6.Besz_a = D2.besz_a) AND (D7.cega = D2.cega) ';



implementation

uses Unit1, nagykep, rendelesfelv,tipuskereso;

{$R *.dfm}

procedure TfrmMeretSzK.hogynezki;
begin
  if OpenArgs ='tipus' then begin
    lista.Top:=355;lista.Left:=8;	Image1.Top:=390;lista.Height:=180;
    nagykepgomb.Top:=355;
    evszakk.Visible:=false; gjmfajtak.Visible:=false;
    szelessegk.Visible:=false;magassagk.Visible:=false;
    atmerok.Visible:=false;ujkeresesbtn.Visible:=false;
    gyartmanylist.Visible:=true;tipuslist.Visible:=true;meretlist.Visible:=true;
    Label1.Visible:=false;Label2.Visible:=false;Label3.Visible:=false;
    Label4.Visible:=false;Label5.Visible:=false;
  end
  else begin
    lista.Top:=72;lista.Left:=8;	Image1.Top:=360;lista.Height:=433;
    nagykepgomb.Top:=325;
    evszakk.Visible:=true; gjmfajtak.Visible:=true;
    szelessegk.Visible:=true;magassagk.Visible:=true;
    atmerok.Visible:=true;ujkeresesbtn.Visible:=true;
    gyartmanylist.Visible:=false;tipuslist.Visible:=false;
    meretlist.Visible:=false; Label1.Visible:=true;Label2.Visible:=true;
    Label3.Visible:=true;Label4.Visible:=true;Label5.Visible:=true;
end;


end;

procedure  queryupdate(focus:tcombobox);
var

i:byte;
mezo,sql,a:string;
kereso: array[1..5] of tcombobox;
const
ksql = ' FROM "meret.DB" meret, "gjmfajta.DB" gjmfajta, "gumi.DB" gumi,'
		+ ' "evszak.DB" evszak WHERE (gumi.gjmfajtaa = gjmfajta.Gjmfajtaa) AND'
    + ' (gumi.mereta = meret.mereta) AND (evszak.evszaka = gumi.evszaka) ';
evszakksql = 'SELECT DISTINCT evszak.evszak'+ ksql;
gjmfajtaksql = 'SELECT DISTINCT gjmfajta.Gjmfajta' + ksql;
szelessegksql = 'SELECT DISTINCT meret.szelesseg' + ksql;
magassagksql = 'SELECT DISTINCT meret.magassag' +ksql;
atmeroksql = 'SELECT DISTINCT meret.atmero'+ksql;
begin
kereso[1]:=frmmeretszk.evszakk ;kereso[2]:=frmmeretszk.gjmfajtak;
kereso[3]:=frmmeretszk.szelessegk;
kereso[4]:=frmmeretszk.magassagk;kereso[5]:=frmmeretszk.atmerok;
i:=1 ;
while i<=5 do begin
  if kereso[i]= focus then i:=i+1;
  if i=6 then exit;
    case i of
        1:sql:= evszakksql
        					+ gjmfajtafelt + szelessegfelt + magassagfelt + atmerofelt;
        2:sql:= gjmfajtaksql
        					+ evszakfelt  + szelessegfelt + magassagfelt + atmerofelt;
        3:sql:= szelessegksql
        					+ evszakfelt + gjmfajtafelt  + magassagfelt + atmerofelt;
        4:sql:= magassagksql
        					+ evszakfelt + gjmfajtafelt + szelessegfelt  + atmerofelt;
        5:sql:= atmeroksql
        					+ evszakfelt + gjmfajtafelt + szelessegfelt + magassagfelt ;
        end;
    frmmeretszk.lekerdezes.Close  ;
    frmmeretszk.lekerdezes.SQL.Clear ;
    a:=sql + evszakfelt + gjmfajtafelt
    							+ szelessegfelt + magassagfelt + atmerofelt  ;
    frmmeretszk.lekerdezes.SQL.Add (sql)  ;
    frmmeretszk.lekerdezes.open ;
    case i of
        1:mezo:='evszak';
        2:mezo:='gjmfajta';
        3:mezo:='szelesseg';
        4:mezo:='magassag';
        5:mezo:='atmero';
        end;

    kereso[i].Items.Clear ;
    frmmeretszk.lekerdezes.First ;
    kereso[i].Items.Add('**Mindegyik**') ;

    while  not frmmeretszk.lekerdezes.Eof  do begin
        kereso[i].Items.Add(frmmeretszk.lekerdezes.fieldbyname(mezo).AsString );
        frmmeretszk.lekerdezes.next ;
        end;
    i:=i+1;
  end;
end;



procedure TfrmMeretSzK.FormClose(Sender: TObject; var Action: TCloseAction);
var handle:THandle ;
begin

    handle:=FindWindow('Tnkep',nil);
    if handle <> 0 then begin
    		nkep.Close ;
    end;
    OpenArgs :='';
		action:=cafree;
end;

 {$H+}
procedure TfrmMeretSzK.listafrissit;

begin
frmmeretszk.listaquery .Close ;
frmmeretszk.listaquery.SQL.Clear ;
frmmeretszk.listaquery.SQL.Add (sqlstr + b + c
			+ evszakfelt + gjmfajtafelt + szelessegfelt + magassagfelt
      + atmerofelt +' order by 8,3 ');
frmmeretszk.listaquery.Open ;
end;
 {$H-}

procedure TfrmMeretSzK.kfeltolt(Sender: TObject);
var
i : byte;
mezo:string;
kereso: array[1..5] of tcombobox;
sql:array[1..5] of string[60];
begin
hogynezki;

if listaquery.SQL.Text = '' then  begin
  kereso[1]:=evszakk;kereso[2]:=gjmfajtak;kereso[3]:=magassagk;
  kereso[4]:=szelessegk;kereso[5]:=atmerok;
  sql[1]:='SELECT evszak FROM "evszak.DB" ORDER BY 1';
  sql[2]:='SELECT gjmfajta FROM "gjmfajta.DB" ORDER BY 1';
  sql[3]:='SELECT distinct magassag FROM "meret.DB" ORDER BY 1';
  sql[4]:='SELECT distinct szelesseg FROM "meret.DB" ORDER BY 1';
  sql[5]:='SELECT distinct atmero FROM "meret.DB" ORDER BY 1';
  for i:=1 to 5 do     begin
          frmmeretszk.lekerdezes .Close ;
          frmmeretszk.lekerdezes .SQL.Clear ;
          frmmeretszk.lekerdezes .SQL.Add (sql[i]);
          frmmeretszk.lekerdezes .Open ;
    case i of
          1:mezo:='evszak';
          2:mezo:='gjmfajta';
          3:mezo:='magassag';
          4:mezo:='szelesseg';
          5:mezo:='atmero';
    end;
    kereso[i].Items.Clear ;
    frmmeretszk.lekerdezes .First ;
    kereso[i].Items.Add('**Mindegyik**') ;
    while  not frmmeretszk.lekerdezes .Eof  do begin
        kereso[i].Items.Add(frmmeretszk.lekerdezes.fieldbyname(mezo).AsString);
        frmmeretszk.lekerdezes .next ;
    end;
    kereso[i].Text:='**Mindegyik**';
  end;
  Evszakfelt :=''; Gjmfajtafelt :=''; Szelessegfelt :='';
  Magassagfelt :='';Atmerofelt :='';
  listafrissit;
end;


end;

procedure feltcsinalo (focus:tcombobox;kfelt:string);
begin
if focus.Text ='**Mindegyik**' then begin
        if kfelt='evszakfelt' then evszakfelt :='';
        if kfelt='gjmfajtafelt' then gjmfajtafelt :='';
        if kfelt='szelessegfelt' then szelessegfelt :='';
        if kfelt='magassagfelt' then magassagfelt :='';
        if kfelt='atmerofelt' then atmerofelt :='';
        exit ;
        end;
kfelt:= focus.Text  + '") ' ;
if focus=frmmeretszk.evszakk then evszakfelt :=' and (evszak = "' + kfelt ;
if focus=frmmeretszk.gjmfajtak then gjmfajtafelt :=' and (gjmfajta= "' + kfelt ;
if focus=frmmeretszk.szelessegk then szelessegfelt :=' and (szelesseg = "'
																																			+ kfelt;
if focus=frmmeretszk.magassagk then magassagfelt :=' and (magassag = "' + kfelt;
if focus=frmmeretszk.atmerok then atmerofelt :=' and (atmero = "' + kfelt;
end;

procedure TfrmMeretSzK.kchange(Sender: TObject);
var
e:string;
begin
e:=(sender as tcombobox).Name;
delete(e,length(e),1);
feltcsinalo(sender as tcombobox,e + 'felt' );
queryupdate(sender as tcombobox);
listafrissit
end;

procedure TfrmMeretSzK.ujkeresesbtnClick(Sender: TObject);
begin
listaquery.SQL.Text := ''    ;
frmMeretSzK.kfeltolt(sender) ;
end;

procedure TfrmMeretSzK.listaqueryAfterScroll(DataSet: TDataSet);
var handle:THandle ;
begin
Image1.Visible:=true;
Image1.Picture.LoadFromFile(kepekhelye+'\kkep\'
		+  IntToStr (listaquery['mintaa'])  +'_kkep.jpg');
    handle:=FindWindow('Tnkep',nil);
       if handle <> 0 then begin
          nkep.Image1.Picture.LoadFromFile(kepekhelye+'\nkep\' +
          											IntToStr (listaquery['mintaa'])  +'_kkep.jpg');

    end;
end;

procedure TfrmMeretSzK.nagykepgombClick(Sender: TObject);

var handle:THandle ;
begin
handle:=FindWindow('Tnkep',nil);
  if handle = 0 then begin
      Application.CreateForm(Tnkep,nkep);
      nkep.Top :=60;
      nkep.Left:=150;
      nkep.Width :=649;
      nkep.Height:=514;
      nkep.Image1.Picture.LoadFromFile(kepekhelye+'\nkep\'
      		+  IntToStr (listaquery['mintaa'])  +'_kkep.jpg');
  end
  else begin
      nkep.SetFocus ;
  end;
end;

procedure TfrmMeretSzK.listaDblClick(Sender: TObject);
begin
 Application.CreateForm(trendeles, rendeles);
 rendeles.leiras.Caption  :=(listaquery ['marka'] + listaquery ['meret']) ;
 rendeles.datum.Caption :=DateTimeToStr(Date) ;
 rendeles.gumia.Caption :=IntToStr(listaquery ['gumia']);
 rendeles.beszbr.Caption :=FloatToStr (
 														 listaquery ['listanetto'] *
 														((100-listaquery ['kedv'])/100)*
                            (listaquery ['gumiafa']/100 + 1)
                            )  ;
  rendeles.szumbeszbr.Caption :=FloatToStr (
 														 listaquery ['listanetto'] *
 														((100-listaquery ['kedv'])/100)*
                            (listaquery ['gumiafa']/100 + 1)*
                             rendeles.UpDown1.Position
                            )  ;
 end;

procedure TfrmMeretSzK.tipusfrissit;
begin
  TIPUSQ.Close ;
  TIPUSQ.SQL.Text  :='';
  TIPUSQ.SQL.Text  :='select tipus.tipusa ,tipus.tipus,tipus.gyartmanya'
  		+ ' from "tipus.db" tipus where (tipus.gyartmanya ="'
  		+   inttostr(gyartmanyq['gyartmanya'])  + '") order by 2';
  TIPUSQ.Open;
  meretq.Close;
  listaquery.Close;
  Image1.visible:=false;
end;

procedure TfrmMeretSzK.gyartmanylistClick(Sender: TObject);
begin
tipusfrissit;
end;



procedure TfrmMeretSzK.meretfrissit;
begin
  meretq.Close ;
  meretq.SQL.Text  :='';
 meretq.SQL.Text  :='SELECT DISTINCT  mereta,meret_e + " " + szelesseg +'
 			+	' d."x/" + magassag + " " + szerkezet + " " + atmero + meret_v Meret,'
      + ' D2.tipusa FROM "meret.DB" D, "tipusmeret.DB" D2 WHERE'
      + ' (D2.Tipusa = D2.tipusa) AND (D2.Mereta = D.mereta) and'
      + ' (d2.tipusa="'+ IntToStr (TIPUSQ['tipusa']) +'")';
 meretq.Open ;
 listaquery.Close;
 Image1.visible:=false;
 
end;

procedure TfrmMeretSzK.tipuslistClick(Sender: TObject);
begin
meretfrissit;
end;

procedure TfrmMeretSzK.tipuslistKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;
 {$H+}
procedure TfrmMeretSzK.tszlistafrissit;
begin
with frmmeretszk.listaquery do begin
 close;
 SQL.Clear;
 SQL.text:= (sqlstr + b + c
  	+ 'and ( mereta="' + IntToStr(meretq ['mereta'])+ '") order by 8,3 ');
 open;
end;

 {$H-}

end;

procedure TfrmMeretSzK.meretlistClick(Sender: TObject);
begin
tszlistafrissit ;
end;

procedure TfrmMeretSzK.FormDeactivate(Sender: TObject);
var
i:Integer ;
a:Boolean ;
begin
  a:=false;
  for i:=0 to Screen.formcount-1 do begin
  	if (Screen.Forms[i].Name = 'nkep')
    	or (Screen.Forms[i].Name='rendeles')
      	then a:=true;
    if a=false then close;
  end;

end;

end.
