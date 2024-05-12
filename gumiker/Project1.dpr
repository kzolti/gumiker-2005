program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmkeret},
  Unit2 in 'Unit2.pas' {frmkedvbeal},
  Unit3 in 'Unit3.pas' {frmMeretSzK},
  Unit4 in 'Unit4.pas' {frmcegadat},
  beszallitok_u in 'beszallitok_u.pas' {frmBeszallitok},
  tipuskereso in 'tipuskereso.pas' {frmtipuskereso},
  nagykep in 'nagykep.pas' {nkep},
  rendelesfelv in 'rendelesfelv.pas' {rendeles},
  megrendelesek_u in 'megrendelesek_u.pas' {megrendelesek};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmkeret, frmkeret);
  Application.Run;
end.
