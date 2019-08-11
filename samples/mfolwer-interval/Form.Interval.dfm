object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Interval Form'
  ClientHeight = 302
  ClientWidth = 271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelExampleInfo: TLabel
    AlignWithMargins = True
    Left = 6
    Top = 10
    Width = 259
    Height = 64
    Margins.Left = 6
    Margins.Top = 10
    Margins.Right = 6
    Margins.Bottom = 10
    Align = alTop
    Caption = 
      'Inspired by Martin Folwer - Refactoring book. Chapter 8, page 15' +
      '3, Refactoring: Duplicate Observed Data. Example: IntervalWindow' +
      ' (Java)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    WordWrap = True
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 87
    Width = 265
    Height = 165
    Align = alTop
    Caption = 'Interval'
    TabOrder = 0
    ExplicitLeft = -2
    object Label1: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 255
      Height = 13
      Align = alTop
      Caption = 'Start'
      ExplicitWidth = 24
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 255
      Height = 13
      Align = alTop
      Caption = 'End'
      ExplicitWidth = 18
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 110
      Width = 255
      Height = 13
      Align = alTop
      Caption = 'Length'
      ExplicitWidth = 33
    end
    object edtStartField: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 255
      Height = 21
      Align = alTop
      TabOrder = 0
      Text = '0'
      OnExit = edtStartFieldExit
      ExplicitLeft = 46
      ExplicitTop = 115
      ExplicitWidth = 121
    end
    object edtEndField: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 83
      Width = 255
      Height = 21
      Align = alTop
      TabOrder = 1
      Text = '0'
      OnExit = edtEndFieldExit
      ExplicitLeft = 3
    end
    object edtLengthField: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 129
      Width = 255
      Height = 21
      Align = alTop
      TabOrder = 2
      Text = '0'
      OnExit = edtLengthFieldExit
      ExplicitLeft = 120
      ExplicitTop = 139
      ExplicitWidth = 121
    end
  end
end
