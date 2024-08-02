unit SignupForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, vcl.Wwdbedit,
  Vcl.ExtCtrls, Vcl.Menus, Data.DB, Data.Win.ADODB, vcl.wwspeedbutton,
  vcl.wwdbnavigator, vcl.wwclearpanel, Vcl.Grids, vcl.wwdbigrd, vcl.wwdbgrid;

type
  TformSignup = class(TForm)
    panelSignup: TPanel;
    editUserName: TwwDBEdit;
    editEmail: TwwDBEdit;
    editPassword: TwwDBEdit;
    lblUserName: TLabel;
    lblEmail: TLabel;
    lblPassword: TLabel;
    btnSubmitSignup: TButton;
    tblUser: TADOTable;
    srcUser: TDataSource;
    lblMessage: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnSubmitSignupClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblMessageClick(Sender: TObject);
    procedure lblMessageMouseEnter(Sender: TObject);
    procedure lblMessageMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSignup: TformSignup;

implementation
uses
  LoginForm;

{$R *.dfm}

procedure TformSignup.btnSubmitSignupClick(Sender: TObject);
begin
  try
    if (editUserName.Text = '') or (editEmail.Text = '') or (editPassword.Text = '') then
      begin
        ShowMessage('Enter Valid Fields');
        Exit;
      end
        else
          srcUser.DataSet.Post;
          ShowMessage('Signup Successful');

    if formLogin = nil then
      formLogin := TformLogin.Create(self);
      formLogin.Show;

  except
    on E: Exception do
      begin
      ShowMessage(E.Message);
    end;

  end;
end;

procedure TformSignup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
    formSignup := nil;
end;

procedure TformSignup.FormCreate(Sender: TObject);
begin
  // Calculate the center position
  Self.OnShow := FormShow;
  Self.OnResize := FormResize;
//  lblMessage.OnMouseEnter := lblMessageMouseEnter;
//  lblMessage.OnMouseLeave := lblMessageMouseLeave;
end;

procedure TformSignup.FormResize(Sender: TObject);
begin
    panelSignup.Left := (ClientWidth div 2) - (panelSignup.Width div 2);
    panelSignup.Top := (ClientHeight div 2) - (panelSignup.Height div 2);
end;

procedure TformSignup.FormShow(Sender: TObject);
begin
   panelSignup.Left := (ClientWidth div 2) - (panelSignup.Width div 2);
   panelSignup.Top := (ClientHeight div 2) - (panelSignup.Height div 2);
end;

procedure TformSignup.lblMessageClick(Sender: TObject);
begin
  if formLogin = nil then
      formLogin := TformLogin.Create(self);
      formLogin.Show;
end;

procedure TformSignup.lblMessageMouseEnter(Sender: TObject);
begin
  lblMessage.font.Color := clBlue;
end;

procedure TformSignup.lblMessageMouseLeave(Sender: TObject);
begin
  lblMessage.font.Color := clWindowText;
end;

end.
