object AboutForm: TAboutForm
  Left = 192
  Top = 124
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 304
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel1: TsLabel
    Left = 0
    Top = 0
    Width = 433
    Height = 20
    Align = alTop
    Alignment = taCenter
    Caption = ' '
    ParentFont = False
    Layout = tlCenter
    OnMouseDown = FormMouseDown
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16182738
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sRichEditURL1: TsRichEditURL
    Left = 0
    Top = 20
    Width = 433
    Height = 249
    Align = alClient
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.CustomColor = True
    SkinData.CustomFont = True
    SkinData.SkinSection = 'EDIT'
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 269
    Width = 433
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    OnMouseDown = FormMouseDown
    SkinData.SkinSection = 'CHECKBOX'
    object sButton1: TsButton
      Left = 190
      Top = 5
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object FcAbout: TFileContainer
    FileName = 'about.rtf'
    Left = 65
    Top = 225
    Data = {
      7B5C727466315C616E73695C616E7369637067313235315C64656666307B5C66
      6F6E7474626C7B5C66305C6673776973735C66707271325C6663686172736574
      3020417269616C3B7D7B5C66315C6673776973735C66707271325C6663686172
      7365743230347B5C2A5C666E616D6520417269616C3B7D417269616C20435952
      3B7D7B5C66325C666E696C5C6663686172736574302043616C696272693B7D7D
      0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E305C626C756531
      32383B7D0D0A7B5C2A5C67656E657261746F72204D7366746564697420352E34
      312E31352E313531353B7D5C766965776B696E64345C7563315C706172645C63
      66315C6C616E67313033335C625C66305C6673323020417574686F72735C6C61
      6E67313034395C6631203A5C6366305C6C616E67313033335C62305C66302020
      444B54696772612C204A6F65735C7061720D0A5C6366315C6220446576656C6F
      706572733A5C6366305C623020205368696E5C7061720D0A5C6366315C622053
      70656369616C207468616E6B7320666F7220737570706F72743A205F5C636630
      5C623020616D7374795F2C20416C6578616E6465722C20566972745C7061720D
      0A5C6366315C62205472616E736C61746F72733A5C6366305C62305C7061720D
      0A20202020456E676C69736828454E2920704C616E204465765465616D5C7061
      720D0A202020204765726D616E2844452920465269545A205B4E696B6F6C6179
      202872756E3840676D782E6465295D5C7061720D0A202020205275737369616E
      2852552920704C616E204465765465616D5C7061720D0A202020205370616E69
      736828455329205B45415D47616D65525C7061720D0A5C6366315C6220486F6D
      65706167653A5C6366305C62302020687474703A2F2F706C616E67632E72752F
      5C7061720D0A5C6366315C6220466F72756D3A5C6366305C6230202068747470
      3A2F2F706C616E67632E72752F666F72756D2E68746D6C5C7061720D0A5C7061
      720D0A5C6366315C6220446576656C6F706572732070726576696F7573207665
      7273696F6E733A205C6366305C623020416E64726F732C2048657263756C6573
      2C204B2E5370656374722C2053756E6E794472616B655C7061720D0A5C636631
      5C62205370656369616C207468616E6B7320666F7220737570706F72743A205C
      6366305C62302046696C696E5C6C616E67395C66325C667332325C7061720D0A
      7D0D0A00}
  end
end
