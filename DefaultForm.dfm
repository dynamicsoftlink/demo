object formDefault: TformDefault
  Left = 0
  Top = 0
  Caption = 'Default'
  ClientHeight = 548
  ClientWidth = 1022
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mainMenu: TMainMenu
    Left = 104
    Top = 56
    object menuSignup: TMenuItem
      Caption = 'Signup'
      OnClick = menuSignupClick
    end
  end
  object conn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=saadmin;Persist Security Info=True;' +
      'User ID=sa;Initial Catalog=Demodb;Data Source=DESKTOP-URIO3KB'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 176
    Top = 56
  end
end
