unit rendelesfelv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, DBTables;

type
  Trendeles = class(TForm)
    leiras: TLabel;
    db: TEdit;
    Label2: TLabel;
    UpDown1: TUpDown;
    ok: TBitBtn;
    megse: TBitBtn;
    gumia: TLabel;
    smegj: TEdit;
    rmegj: TEdit;
    datum: TLabel;
    lekerdezes: TQuery;
    beszbr: TLabel;
    szumbeszbr: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure okClick(Sender: TObject);
    procedure dbChange(Sender: TObject);
    procedure megseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rendeles: Trendeles;


implementation

uses Unit1;

{$R *.dfm}

procedure Trendeles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Trendeles.FormDeactivate(Sender: TObject);
begin
Close;
end;

procedure Trendeles.okClick(Sender: TObject);
var maxrendelesa :Int64 ;
begin
  lekerdezes.SQL.Text:='';
  lekerdezes.SQL.Text:='select edate  from "rendeles.db"' +
                        ' where rendelesa in'+
                        ' (select max(r.rendelesa) from "rendeles.db" r)';
  lekerdezes.Open;
  if not VarIsNull (lekerdezes['edate'])  then begin
      lekerdezes.Close ;
      lekerdezes.SQL.Text:='';
      lekerdezes.SQL.Text:='insert into "rendeles.db" (edate) values (null)';
      lekerdezes.ExecSQL ;
  end;
  lekerdezes.Close ;
  lekerdezes.SQL.Text:='';
  lekerdezes.SQL.Text:='select max(rendelesa)  as a from "rendeles.db"';
  lekerdezes.Open;
  maxrendelesa:=lekerdezes['a'];
  lekerdezes.Close;
  lekerdezes.SQL.Text:='';
  lekerdezes.SQL.Text:=
  	'insert into "rendelesreszl.db"' +
    ' (rendelesa,gumia,db,datum,leiras,smegj,rmegj,beszbr) ' +
    'values("' +  IntToStr(maxrendelesa) + '","' +  gumia.Caption  + '","'
    + db.Text + '","' + frmkeret.floattosqlstr(date + time) +
    '","' + leiras.Caption  +'","'+ smegj.Text  + '","' + rmegj.Text  + '","'
    + frmkeret.floattosqlstr(strtofloat(beszbr.Caption))  + '")';

  lekerdezes.ExecSQL ;
	close;
end;

procedure Trendeles.dbChange(Sender: TObject);
begin
try
szumbeszbr.Caption :=floattostrf((strtofloat(beszbr.Caption)
											* StrToInt (db.text)),ffnumber,15,1)+'0'  ;
except
end;

end;

procedure Trendeles.megseClick(Sender: TObject);
begin
close;
end;

end.                                     
