inherited FrmCadastroCidade: TFrmCadastroCidade
  Caption = 'Cadastro de Cidade'
  ClientHeight = 215
  ClientWidth = 592
  ExplicitWidth = 608
  ExplicitHeight = 254
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 592
    ExplicitWidth = 592
    inherited lbCabecalho: TLabel
      Width = 188
      Caption = 'CADASTRO DE CIDADE'
      ExplicitWidth = 188
    end
  end
  inherited gbLocalizar: TGroupBox
    Width = 592
    ExplicitWidth = 592
  end
  inherited pnlBotoes: TPanel
    Top = 174
    Width = 592
    ExplicitTop = 174
    ExplicitWidth = 592
    inherited btnLimpar: TBitBtn
      Left = 357
      ExplicitLeft = 357
    end
    inherited btnExcluir: TBitBtn
      Left = 240
      ExplicitLeft = 240
    end
    inherited btnGravar: TBitBtn
      Left = 123
      ExplicitLeft = 123
    end
    inherited btnSair: TBitBtn
      Left = 474
      ExplicitLeft = 474
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 592
    Height = 88
    Align = alClient
    Caption = ' Informa'#231#245'es '
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    object edNome: TLabeledEdit
      Left = 104
      Top = 24
      Width = 369
      Height = 19
      Color = clInfoBk
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      MaxLength = 60
      ParentFont = False
      TabOrder = 0
    end
    object edPopulacao: TLabeledEdit
      Left = 104
      Top = 51
      Width = 121
      Height = 19
      Color = clInfoBk
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Popula'#231#227'o'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited pmOpcoes: TPopupMenu
    Left = 536
  end
end
