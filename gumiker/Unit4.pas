
unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, ComCtrls;

type
  Tfrmcegadat = class(TForm)
    cegadat: TTable;
    modositas: TBitBtn;
    mentes: TBitBtn;
    nev: TEdit;
    isz: TEdit;
    cim: TEdit;
    gumiafa: TEdit;
    szerelesafa: TEdit;
    arres: TEdit;
    szerelesidij: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Query1: TQuery;
    megsem: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    usernev: TEdit;
    jelszo: TEdit;
    jelszo2: TEdit;
    email: TEdit;
    host: TEdit;
    Label19: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure modositasClick(Sender: TObject);
    procedure mentesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure cegaupdate();
    procedure kkbrupdate();
    procedure szerelveupdate();
    procedure nevChange(Sender: TObject);
    procedure megsemClick(Sender: TObject);
    procedure engedelyezve(a:Boolean );
    procedure editfeltolt();
    procedure FormDeactivate(Sender: TObject);
      private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcegadat: Tfrmcegadat;

implementation

uses Unit1;

{$R *.dfm}



procedure Tfrmcegadat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	action:=cafree
end;

procedure Tfrmcegadat.engedelyezve(a: Boolean);
var
i:integer;
begin
  for i:=0 to ComponentCount -1 do begin
  if Components [i] is TEdit then (Components[i] as TEdit).Enabled:=a;
  end;
end;

procedure Tfrmcegadat.editfeltolt;
var
i:integer;
begin
  for i:=0 to ComponentCount -1 do begin
    if Components [i] is TEdit then begin
       if (Components[i] as TEdit).Name <>'jelszo2' then
                             (Components[i] as TEdit).Text
                             :=frmcegadat.cegadat[(Components[i] as TEdit).Name]
                             else  (Components[i] as TEdit).Text
                             :=jelszo.Text;
    end;
  end;
Label12.Caption :=DateTimeToStr(FloatToDateTime ( frmcegadat.cegadat.fieldbyname('moddate').asfloat) )    ;
end;

procedure Tfrmcegadat.FormActivate(Sender: TObject);
begin

  frmcegadat.Height:=445;
  frmcegadat.cegadat.last;
  editfeltolt;
  engedelyezve(false);
  mentes.Enabled :=false;
  megsem.Enabled:=false;
  modositas.Enabled:=true;
end;

procedure Tfrmcegadat.modositasClick(Sender: TObject);
begin
engedelyezve(true) ;
megsem.Enabled:=TRUE;
modositas.Enabled :=false;
end;

procedure Tfrmcegadat.szerelveupdate();
begin
      frmcegadat.Query1.SQL.Text:='' ;
      with frmcegadat.Query1.SQL  do begin
        Add(
            'UPDATE  "gumi.db" gum SET kkbrszerelve=listanetto * (100-kedv)/100 * ' +
            frmkeret.floattosqlstr(
                             (1 + strtoint(gumiafa.text)/100)
                              )
                              );
        add(' + ' + frmkeret.floattosqlstr(
        StrToInt(szerelesidij.Text)*
        (1+ strToInt(szerelesafa.Text)/100)
            )) ;
      end;
      frmcegadat.Query1.ExecSQL   ;
      frmcegadat.Query1.SQL.Text:='' ;
      with frmcegadat.Query1.SQL  do begin
        Add('UPDATE  "gumi.db" gum SET kkbrszerelve=kkbr ');
        add('WHERE (kkbr > kkbrszerelve)');
      end;
      frmcegadat.Query1.ExecSQL   ;
end;

procedure Tfrmcegadat.cegaupdate;
begin
cegadat.prior;
cegadat.Last;
  frmcegadat.Query1.SQL.Text:='' ;
  with frmcegadat.Query1.SQL  do begin
    Add(
        'UPDATE  "gumi.db" gum SET cega="' + cegadat.fieldbyname('cega').AsString  + '"'
        );
    end;
  frmcegadat.Query1.ExecSQL   ;
end;

procedure Tfrmcegadat.kkbrupdate();
begin
  frmcegadat.Query1.SQL.Text:='' ;
  with frmcegadat.Query1.SQL  do begin
    Add(
        'UPDATE  "gumi.db" gum SET kkbr=listanetto  * (100-kedv)/100 * "' + frmkeret.floattosqlstr(
        (strtoint(arres.text)/100+1) *
        (1 + strtoint(gumiafa.text)/100)
        ) + '" '
        );
    end;
  frmcegadat.Query1.ExecSQL   ;
end;


procedure Tfrmcegadat.mentesClick(Sender: TObject);
var i:integer;
begin
  if jelszo.Text  = jelszo2.Text then begin
    if  Application.MessageBox(
                             ' Biztosan módosítod az adatokat?','Cégadatok.',
                             MB_YESNO) =idyes then
      begin
        engedelyezve(false);
        frmcegadat.cegadat.Append ;
        for i:=0 to ComponentCount -1 do begin
          if Components [i] is TEdit then begin
             if (Components[i] as TEdit).Name <>'jelszo2' then
             cegadat.FieldByName((Components[i] as TEdit).Name ).AsString :=
                                   (Components[i] as TEdit).Text;
          end;
        end;
        cegadat.FieldByName('moddate').AsString   := floattostr(date + time) ;
        frmcegadat.cegadat.Post ;
        cegaupdate ;
        kkbrupdate;
        szerelveupdate;
        FormActivate(self);
      end;
  end
  else MessageDLG('A  kettõ begépelt jelszó nem egyforma!',
                                       mtInformation, [mbOk],0);
end;

procedure Tfrmcegadat.nevChange(Sender: TObject);
var
i:byte;
a:Boolean;
begin
	a:=true;
  for i:=0 to ComponentCount -1 do begin
 		if Components [i] is TEdit then
    	if(Components[i] as TEdit).text='' then a:=false;
  end;
 mentes.Enabled :=a;
end;

procedure Tfrmcegadat.megsemClick(Sender: TObject);
begin
 cegadat.Cancel ;
 FormActivate(self) 
end;

procedure Tfrmcegadat.FormDeactivate(Sender: TObject);
begin
close;
end;

end.
