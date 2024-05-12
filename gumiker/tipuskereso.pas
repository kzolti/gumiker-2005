unit tipuskereso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, StdCtrls ,strutils, Grids, DBGrids,
  DBCtrls;

type
  Tfrmtipuskereso = class(TForm)
    gyartmanyq: TQuery;
    merethez: TDataSource;
    meretq: TQuery;
    tipuslist: TDBLookupListBox;
    TIPUSQ: TQuery;
    tipushoz: TDataSource;
    gyartmanyhoz: TDataSource;
    Gyartmany: TDBLookupListBox;
    meretlist: TDBLookupListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tipusfrissit();
    procedure GyartmanyClick(Sender: TObject);
    procedure GyartmanyKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure meretfrissit();
    procedure tipuslistClick(Sender: TObject);
    procedure tipuslistKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure meretqAfterScroll(DataSet: TDataSet);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtipuskereso: Tfrmtipuskereso;

implementation

uses Unit1,Unit3;

{$R *.dfm}
procedure Tfrmtipuskereso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMeretSzK .close;
	action:=cafree;
end;

procedure Tfrmtipuskereso.tipusfrissit;
begin
  TIPUSQ.Close ;
  TIPUSQ.SQL.Text  :='';
  TIPUSQ.SQL.Text  :='select tipus.tipusa ,tipus.tipus,tipus.gyartmanya '
                    + 'from "tipus.db" tipus where (tipus.gyartmanya ="'
                    +   inttostr(gyartmanyq['gyartmanya'])  + '") order by 2';
  TIPUSQ.Open;
  meretq.Close;
end;




procedure Tfrmtipuskereso.GyartmanyClick(Sender: TObject);
begin
tipusfrissit ;
end;

procedure Tfrmtipuskereso.GyartmanyKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
tipusfrissit ;
end;

procedure Tfrmtipuskereso.meretfrissit();
begin
  meretq.Close ;
  meretq.SQL.Text  :='';
  meretq.SQL.Text  :='SELECT DISTINCT  mereta, meret_e + " " + szelesseg '
  		+ ' + d."x/" + magassag + " " + szerkezet + " " + atmero + meret_v Meret'
      + ', D2.tipusa FROM "meret.DB" D, "tipusmeret.DB" D2 '
      + 'WHERE (D2.Tipusa = D2.tipusa) AND (D2.Mereta = D.mereta)'
      + ' and (d2.tipusa="'+ IntToStr (TIPUSQ['tipusa']) +'")';
  meretq.Open ;
end;

procedure Tfrmtipuskereso.tipuslistClick(Sender: TObject);
begin
meretfrissit;
end;

procedure Tfrmtipuskereso.tipuslistKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
meretfrissit;
end;

procedure Tfrmtipuskereso.meretqAfterScroll(DataSet: TDataSet);
begin
  with frmmeretszk.listaquery do begin
    Close ;
    SQL.Clear;
    SQL.Add (sqlstr + b + c
      + 'and ( mereta="' + IntToStr(frmtipuskereso.meretq ['mereta'])+ '")'
      + ' order by 8,3 ');
    Open;
  end;
end;

procedure Tfrmtipuskereso.FormPaint(Sender: TObject);
begin
OpenArgs :='tipus';
try
   frmmeretszk.Show   ;
   frmMeretSzK.WindowState :=wsmaximized ;
except
  on EAccessViolation  do
 Application.CreateForm(Tfrmmeretszk, frmmeretszk);

end;
end;

end.






