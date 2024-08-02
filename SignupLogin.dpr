program SignupLogin;

uses
  Vcl.Forms,
  SignupForm in 'SignupForm.pas' {formSignup},
  LoginForm in 'LoginForm.pas' {formLogin},
  DefaultForm in 'DefaultForm.pas' {formDefault};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformDefault, formDefault);
  Application.Run;
end.
