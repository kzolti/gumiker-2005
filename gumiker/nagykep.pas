unit nagykep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  Tnkep = class(TForm)
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  nkep: Tnkep;

implementation

{$R *.dfm}

procedure Tnkep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.
