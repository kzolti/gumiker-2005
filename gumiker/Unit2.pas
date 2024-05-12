unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, DBTables, Grids, DBGrids, Buttons, Menus,
  strutils,ComCtrls;

type
  Tfrmkedvbeal = class(TForm)
    Label1: TLabel;
    kedvezmeny: TEdit;
    marka: TListBox;
    gjmfajta: TListBox;
    evszak: TListBox;
    beszalitok: TListBox;
    Tabla: TTable;
    csinald: TButton;
    Query1: TQuery;
    eredmenysql: TQuery;
    eredmenyhez: TDataSource;
    eredmeny: TDBGrid;
    MainMenu1: TMainMenu;
    Eszkzk1: TMenuItem;
    modosit: TMenuItem;
    Olvass1: TMenuItem;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure csinaldClick(Sender: TObject);
    procedure modositClick(Sender: TObject);
    procedure Olvass1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmkedvbeal: Tfrmkedvbeal;
  alselecte,alselectfelt,alselectkapcs:string;
  afa,arres:Byte;
  szerelesidij:integer ;
implementation

uses DateUtils,unit1;

{$R *.dfm}





procedure Tfrmkedvbeal.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
	action:=cafree
end;

procedure itemsfeltolt(mit:tlistbox;honnan:tfilename;mezonev:string);
begin
frmkedvbeal.tabla.Active :=false    ;
frmkedvbeal.tabla.TableName :=honnan  ;
frmkedvbeal.tabla.Active :=true;
mit.Items.Clear ;
frmkedvbeal.tabla.First  ;
  while  not frmkedvbeal.tabla.Eof  do begin
          mit.Items.Add(frmkedvbeal.tabla.fieldbyname(mezonev).AsString );
         frmkedvbeal.tabla.next ;
  end;
end;
procedure cegadatbetolt();
begin
frmkedvbeal.tabla.Active :=false    ;
frmkedvbeal.tabla.TableName :='cegadat.db'  ;
frmkedvbeal.tabla.Active :=true;

frmkedvbeal.tabla.Last   ;
afa :=frmkedvbeal.tabla['gumiafa'];
arres:=frmkedvbeal.tabla['arres'];
szerelesidij:=frmkedvbeal.tabla['szerelesidij'];
//ShowMessage(inttostr(afa) );
end;


procedure Tfrmkedvbeal.FormActivate(Sender: TObject);
begin

itemsfeltolt(beszalitok,'beszalitok.db','nev')  ;
itemsfeltolt(marka,'marka.db','marka') ;
itemsfeltolt(evszak,'evszak.db','evszak') ;
itemsfeltolt(gjmfajta,'gjmfajta.db','gjmfajta') ;

alselecte:=' SELECT  gumi.gumia' ;
alselecte:=
		alselecte + ' FROM "marka.DB" marka, "minta.DB" minta,'
    + ' "beszalitok.DB" beszalitok, "evszak.DB" evszak,'
    + ' "gjmfajta.DB" gjmfajta, "gumi.DB" gumi where ';

alselectfelt :='';

alselectkapcs :=' (minta.markaa = marka.markaa) '
									+	' AND (gumi.evszaka = evszak.evszaka)'
                  + ' AND (gumi.gjmfajtaa = gjmfajta.Gjmfajtaa) '
                  + ' AND (gumi.mintaa = minta.mintaa) '
                  + ' AND (gumi.besz_a = beszalitok.Besz_a) ';
cegadatbetolt;
end;

function feltetelgyarto():boolean;
var lbox:tlistbox;
		mezonev:string;
    i:byte;
		nitem:Integer ;
    //elso:Boolean ;
begin
  for  i:=1  to 4  do begin
   		case i of
        1:begin lbox:=frmkedvbeal.beszalitok ; mezonev:='beszalitok.nev' ; end;
        2:begin lbox:=frmkedvbeal.marka ; mezonev:='marka.marka' ; end;
        3:begin lbox:=frmkedvbeal.gjmfajta ; mezonev:='gjmfajta.gjmfajta' ; end;
        4:begin lbox:=frmkedvbeal.evszak ; mezonev:='evszak.evszak' ; end;
      end;
        result:=false;
        for nitem:=0  to lbox.count -1 do begin
            if lbox.selected[nitem] then begin
                  if result then
                    begin
                      alselectfelt :=alselectfelt
                      	+ ' or (' + mezonev + '="' + lbox.Items[nitem] + '") ' ;
                    end
                    else
                    begin
                      result:=true;
                      alselectfelt :=alselectfelt
                      + ' and ((' + mezonev + '="' + lbox.Items[nitem] + '") ' ;
                  end;
             end;
        end;
         if result then begin
            alselectfelt :=alselectfelt + ')';
         end
         else begin
            MessageDLG('Minden listából jelölj ki valamit!',
            																				 mtInformation, [mbOk],0);
            alselectfelt :='';
            result:=false;
            exit;
         end;
   end;
end;
procedure szereles();

begin
frmkedvbeal.Query1.SQL.Text:='' ;
with frmkedvbeal.Query1.SQL  do begin
  Add(
      'UPDATE  "gumi.db" gum SET kkbrszerelve=listanetto * ' +
      frmkeret.floattosqlstr(
                      (
                        (
                        (100-StrToInt(frmkedvbeal.kedvezmeny.Text))
                        /100)
                      * (1 + afa/100))
                    )+ ' + ' +  IntToStr(szerelesidij) + ' * ' +
      frmkeret.floattosqlstr(1 + afa/100)  );
  add('WHERE  gum.gumia in ('+ alselecte + alselectkapcs  + alselectfelt + ')');
end;
frmkedvbeal.Query1.ExecSQL   ;

frmkedvbeal.Query1.SQL.Text:='' ;
with frmkedvbeal.Query1.SQL  do begin
  Add('UPDATE  "gumi.db" gum SET kkbrszerelve=kkbr ');
  add('WHERE (kkbr > kkbrszerelve) and  (gum.gumia in ('+ alselecte
  																			+ alselectkapcs  + alselectfelt + '))');
end;
frmkedvbeal.Query1.ExecSQL   ;
end;

procedure kkbrupdate();
begin
  frmkedvbeal.Query1.SQL.Text:='' ;
  with frmkedvbeal.Query1.SQL  do begin
    Add(
        'UPDATE  "gumi.db" gum SET kkbr=listanetto  * "' + frmkeret.floattosqlstr(
        ((100-
        StrToInt(frmkedvbeal.kedvezmeny.Text))
        /100) * (arres/100+1) * (1 + afa/100)
        ) + '" '
        );
    add('WHERE  gum.gumia in ('+ alselecte + alselectkapcs
    			+ alselectfelt   + ')');
  end;
  frmkedvbeal.Query1.ExecSQL   ;

end;


procedure Tfrmkedvbeal.csinaldClick(Sender: TObject);
begin
if csinald.Caption ='Feldolgoz' then begin
  if kedvezmeny.Text <>'' then begin
    if feltetelgyarto then begin
        case  Application.MessageBox
          (
        		'Biztos ,hogy módosítod a kedvezményt ?' + #10#13
            			+' Ez már nem visszavonható !',
            				'Vigyázz!',MB_OKCANCEL
          )
          of
          IDOK:begin
                    frmkedvbeal.Query1.SQL.Text:='' ;
                    with frmkedvbeal.Query1.SQL  do begin
                      Add('UPDATE  "gumi.db" gum SET gum.kedv ="'
                      				+ kedvezmeny.Text  +'"');
                      add('WHERE  gum.gumia in ('+ alselecte + alselectkapcs
                      				+ alselectfelt   + ')');
                    end;

                    frmkedvbeal.Query1.ExecSQL   ;
                    kkbrupdate;
                    szereles;

                    frmkedvbeal.eredmenysql.Close ;
                    frmkedvbeal.eredmenysql.SQL.Clear  ;
                    with frmkedvbeal.eredmenysql.SQL  do begin
                      Add('SELECT DISTINCT D4.marka, D1.evszak, D2.gjmfajta,'
                      	+	' D3.kedv ');
                      add('FROM  "evszak.DB" D1, "gjmfajta.DB" D2,'
                      	+	' "gumi.DB" D3, "marka.DB" D4, "minta.DB" D5 ');
                      add('WHERE (D3.evszaka = D1.evszaka) AND'
                        + ' (D3.gjmfajtaa = D2.Gjmfajtaa)');
                      add(' AND (D5.mintaa = D3.mintaa)'
                      	+ ' AND (D5.markaa = D4.markaa)');
                      add('and  d3.gumia in ('+ alselecte + alselectkapcs
                      	+ alselectfelt   + ')');
                      add('ORDER BY    1 ,2,3');
                    end;
                    frmkedvbeal.eredmenysql.Open ;
                    FormActivate(frmkedvbeal);

               end;
          IDCANCEL:begin ;end;
          IDABORT:begin  ;end;
          IDRETRY:begin  ;end;
          IDIGNORE:begin  ;end;
          IDYES:begin  ;end;
          IDNO:begin  ;end;
        end;
    end
  end
  else begin
     MessageDLG('A kedvezményt nem állítotad be!', mtInformation, [mbOk],0);
     kedvezmeny.SetFocus ;
  end;

end
else begin
   if feltetelgyarto then begin
        frmkedvbeal.eredmenysql.Close ;
        frmkedvbeal.eredmenysql.SQL.Clear  ;
        with frmkedvbeal.eredmenysql.SQL  do begin
          Add('SELECT DISTINCT D4.marka, D1.evszak, D2.gjmfajta, D3.kedv ');
          add('FROM  "evszak.DB" D1, "gjmfajta.DB" D2, "gumi.DB" D3,'
          	+ ' "marka.DB" D4, "minta.DB" D5 ');
          add('WHERE (D3.evszaka = D1.evszaka)'
          	+ ' AND (D3.gjmfajtaa = D2.Gjmfajtaa)'
          	+	' AND (D5.mintaa = D3.mintaa) AND (D5.markaa = D4.markaa)'
          	+ 'and  d3.gumia in ('+ alselecte + alselectkapcs
            + alselectfelt   + ')');
          add('ORDER BY    1 ,2,3');
        end;
       	frmkedvbeal.eredmenysql.Open ;
     end;
end;
alselectfelt:='';
end;

procedure Tfrmkedvbeal.modositClick(Sender: TObject);
begin
csinald.Caption:='Feldolgoz';
kedvezmeny.Visible:=True ;
end;

procedure Tfrmkedvbeal.Olvass1Click(Sender: TObject);
begin
csinald.Caption:='Lista készítés';
kedvezmeny.Visible:=False;
end;

procedure Tfrmkedvbeal.FormDeactivate(Sender: TObject);
begin
close;
end;

end.
