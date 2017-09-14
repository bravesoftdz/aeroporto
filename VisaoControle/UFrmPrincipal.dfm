object FrmPrincipal: TFrmPrincipal
  Left = 245
  Top = 191
  Caption = 'Bootstrap'
  ClientHeight = 290
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbPrincipal: TStatusBar
    Left = 0
    Top = 271
    Width = 574
    Height = 19
    Panels = <
      item
        Text = 'Banco de Dados:'
        Width = 400
      end
      item
        Text = 'Usu'#225'rio:'
        Width = 50
      end>
  end
  object mmPrincipal: TMainMenu
    Left = 496
    Top = 8
    object miCadastro: TMenuItem
      Caption = 'Cadastro'
      object miCidades: TMenuItem
        Caption = 'Cidade'
        OnClick = miCidadesClick
      end
      object miAeroporto: TMenuItem
        Caption = 'Aeroporto'
        OnClick = miAeroportoClick
      end
      object miUsuario: TMenuItem
        Caption = 'Usu'#225'rio'
        OnClick = miUsuarioClick
      end
    end
    object miPassagem: TMenuItem
      Caption = 'Passagem'
      object miCheckIn: TMenuItem
        Caption = 'Check-In'
      end
      object miEmbarque: TMenuItem
        Caption = 'Embarque'
      end
    end
    object miSair: TMenuItem
      Caption = '&Sair'
      object miLogoff: TMenuItem
        Caption = 'Logoff'
        OnClick = miLogoffClick
      end
      object miEncerrarAplicacao: TMenuItem
        Caption = 'Encerrar Aplica'#231#227'o'
        OnClick = miEncerrarAplicacaoClick
      end
    end
  end
end
