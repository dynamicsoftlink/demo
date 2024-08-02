unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, vcl.Wwdbedit,
  Vcl.ExtCtrls;

type
  TformLogin = class(TForm)
    panelLogin: TPanel;
    lblEmail: TLabel;
    lblPassword: TLabel;
    editLoginEmail: TwwDBEdit;
    editLoginPassword: TwwDBEdit;
    btnSubmitLogin: TButton;
    lblMessage: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSubmitLoginClick(Sender: TObject);
    procedure lblMessageClick(Sender: TObject);
    procedure lblMessageMouseEnter(Sender: TObject);
    procedure lblMessageMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation
uses
  SignupForm;

{$R *.dfm}

//procedure TformLogin.btnSubmitLoginClick(Sender: TObject);
//var
//  bExistEmail, bExistPassword: Boolean;
//  sEmail, sPassword: string;
//begin
//  sEmail := editLoginEmail.Text;
//  sPassword := editLoginPassword.Text;
//
//  bExistEmail := formSignup.srcUser.DataSet.Locate('Email', sEmail, []);
//
//  if not bExistEmail then
//    ShowMessage('User Not Exist.');
//
//  bExistPassword := formSignup.srcUser.DataSet.Locate('Password', sPassword, []);
//
//  if not bExistPassword then
//    ShowMessage('Incorrect Password')
//    else ShowMessage('Login Successful');
//
//end;

procedure TformLogin.btnSubmitLoginClick(Sender: TObject);
var
  bExistEmail, bExistPassword: Boolean;
  sEmail, sPassword: string;
begin
  try

    sEmail := editLoginEmail.Text;
    sPassword := editLoginPassword.Text;

    if (sEmail = '') or (sPassword = '') then
      begin
        ShowMessage('Enter Valid Fields');
        Exit;
      end;

    // Check if the email exists in the dataset
    bExistEmail := formSignup.srcUser.DataSet.Locate('Email', sEmail, []);

    if not bExistEmail then
    begin
      ShowMessage('User Not Exist.');
      Exit;
    end;

    // Check if the password matches
    bExistPassword := formSignup.srcUser.DataSet.Locate('Password', sPassword, []);

    if not bExistPassword then
      ShowMessage('Incorrect Password')
    else
      ShowMessage('Login Successful');

  except
    on E: Exception do
    begin
      ShowMessage('An error occurred during login: ' + E.Message);
    end;
  end;
end;


procedure TformLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
    formLogin := nil;
end;

procedure TformLogin.FormCreate(Sender: TObject);
begin
    Self.OnShow := FormShow;
    Self.OnResize := FormResize;
    lblMessage.OnMouseEnter := lblMessageMouseEnter;
    lblMessage.OnMouseLeave := lblMessageMouseLeave;
end;

procedure TformLogin.FormResize(Sender: TObject);
begin
    panelLogin.Left := (ClientWidth div 2) - (panelLogin.Width div 2);
    panelLogin.Top := (ClientHeight div 2) - (panelLogin.Height div 2);
end;

procedure TformLogin.FormShow(Sender: TObject);
begin
    panelLogin.Left := (ClientWidth div 2) - (panelLogin.Width div 2);
    panelLogin.Top := (ClientHeight div 2) - (panelLogin.Height div 2);
end;

procedure TformLogin.lblMessageClick(Sender: TObject);
begin
  if formSignup = nil then
      formSignup := TformSignup.Create(self);
      formSignup.Show;
end;

procedure TformLogin.lblMessageMouseEnter(Sender: TObject);
begin
  lblMessage.font.Color := clBlue;
end;

procedure TformLogin.lblMessageMouseLeave(Sender: TObject);
begin
  lblMessage.font.Color := clWindowText;
end;

end.
