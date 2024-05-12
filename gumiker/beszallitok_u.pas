unit beszallitok_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables,ShellAPI,  StdCtrls, DBCtrls, Mask;

type
  TfrmBeszallitok = class(TForm)
    beszall: TTable;
    beszallitokhoz: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText3: TDBText;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBText2Click(Sender: TObject);
    procedure DBText3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBeszallitok: TfrmBeszallitok;

implementation

{$R *.dfm}

procedure TfrmBeszallitok.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	action:=cafree
end;

procedure TfrmBeszallitok.Button1Click(Sender: TObject);
begin
beszall.Edit ;
beszall['host']:=
                  InputBox('IP -cím megadás.'
                  ,'Kérem gépelje be az új IP cimet!',beszall['host']);

beszall.Post ;
end;

procedure TfrmBeszallitok.FormDeactivate(Sender: TObject);
begin
close;
end;

procedure TfrmBeszallitok.FormActivate(Sender: TObject);
begin
Height:=450;
Width:=550;
end;

procedure TfrmBeszallitok.DBText2Click(Sender: TObject);
begin

ShellExecute(Handle,'open',pchar('mailto:' + beszall.FieldByName ('email').AsString ) ,'','',
             SW_SHOWNORMAL);


end;

procedure TfrmBeszallitok.DBText3Click(Sender: TObject);
begin
ShellExecute(Handle,'open',pchar('http://' + beszall.FieldByName ('host').AsString ) ,'','',
             SW_SHOWMAXIMIZED);

end;

end.
