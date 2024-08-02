unit DefaultForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Data.Win.ADODB;

type
  TformDefault = class(TForm)
    mainMenu: TMainMenu;
    menuSignup: TMenuItem;
    conn: TADOConnection;
    procedure menuSignupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDefault: TformDefault;

implementation
uses
  SignupForm;

{$R *.dfm}

procedure TformDefault.menuSignupClick(Sender: TObject);
begin
    if formSignup = nil then
      formSignup := TformSignup.Create(self);
      formSignup.panelSignup.Left := (ClientWidth div 2) - (formSignup.panelSignup.Width div 2);
      formSignup.panelSignup.Top := (ClientHeight div 2) - (formSignup.panelSignup.Height div 2);

      formSignup.srcUser.DataSet.Insert;
      formSignup.Show;


end;

end.
