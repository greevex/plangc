// $Id$
unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Registry, Buttons, IdBaseComponent,
  IdComponent, IdUDPBase, IdUDPServer, IdSocketHandle, HTTPGet, CoolTrayIcon,
  MPlayer, FileContainer, Menus, SHFolder, sSkinManager, sListView,
  sRichEdit, sButton, sLabel, acAlphaHints, sBitBtn, sPageControl, sPanel,
  IRCRichEdit, sStatusBar, IdTCPConnection, IdTCPClient, IdIRC, sSplitter,
  sEdit, OpenVPNManager, ChatServer, sMemo, sComboBox, FileLauncher,
  ImgList, acAlphaImageList, acTitleBar, sSkinProvider;

type
  TWorkMode = (wmIdle, wmClient, wmServer);

type
  TDLLProc = procedure;

  TMainForm = class(TForm)
    HTTPVpnGet: THTTPGet;
    LblServerInfo: TsLabel;
    UDPPinger: TIdUDPServer;
    PingTimer: TTimer;
    HTTPVpnGetShort: THTTPGet;
    TimerVpnGetShort: TTimer;
    CoolTrayIcon1: TCoolTrayIcon;
    MediaPlayer1: TMediaPlayer;
    FcNotifyWav: TFileContainer;
    FcServerKey: TFileContainer;
    FcServerPEM: TFileContainer;
    FcDHPem: TFileContainer;
    FcClientKey: TFileContainer;
    FcClientPem: TFileContainer;
    FcCAPem: TFileContainer;
    FcCAKey: TFileContainer;
    PopupMenu1: TPopupMenu;
    MiOpen: TMenuItem;
    N3: TMenuItem;
    MiQuit1: TMenuItem;
    FcNotify2Wav: TFileContainer;
    FcPLanDLL: TFileContainer;
    FcDataXML: TFileContainer;
    sSkinManager1: TsSkinManager;
    LvRoomsList: TsListView;
    sAlphaHints1: TsAlphaHints;
    sPageControl1: TsPageControl;
    TsRoomList: TsTabSheet;
    FcRussianXML: TFileContainer;
    FcEnglishXML: TFileContainer;
    FcGermanXML: TFileContainer;
    sStatusBar1: TsStatusBar;
    sPageControl2: TsPageControl;
    TsMainChat: TsTabSheet;
    sPanel2: TsPanel;
    EdMainChat: TsEdit;
    BtnMainChatSend: TsButton;
    LvMainChatUsers: TsListView;
    sSplitter1: TsSplitter;
    ReMainChat: TIRCRichEdit;
    IdIRC1: TIdIRC;
    TsRoom: TsTabSheet;
    sPanel3: TsPanel;
    EdRoom: TsEdit;
    BtnRoomSend: TsButton;
    LvRoomUsers: TsListView;
    sSplitter2: TsSplitter;
    ReRoom: TIRCRichEdit;
    TsNews: TsTabSheet;
    TimerVpnAdd: TTimer;
    VPNManager: TOpenVPNManager;
    sSplitter3: TsSplitter;
    sPanel4: TsPanel;
    ChatServer1: TChatServer;
    BtnDisconnect: TsButton;
    HTTPVpnAdd: THTTPGet;
    HTTPVpnDel: THTTPGet;
    sMemo1: TsMemo;
    HTTPGetNews: THTTPGet;
    TimerGetNews: TTimer;
    TsIRCServer: TsTabSheet;
    ReServer: TIRCRichEdit;
    ReRoomInfo: TIRCRichEdit;
    sPanel5: TsPanel;
    EdServer: TsEdit;
    BtnServerSend: TsButton;
    TsMyGames: TsTabSheet;
    LvMyGames: TsListView;
    sPanel6: TsPanel;
    BtnAdd: TsButton;
    BtnDelete: TsButton;
    PopupMenu2: TPopupMenu;
    MiAdd: TMenuItem;
    MiEdit: TMenuItem;
    MiDelete: TMenuItem;
    sAlphaImageList1: TsAlphaImageList;
    TimerVpnGet: TTimer;
    sTitleBar1: TsTitleBar;
    PopupMenu3: TPopupMenu;
    MiQuit: TMenuItem;
    N5: TMenuItem;
    MiConnect: TMenuItem;
    MiCreateRoom: TMenuItem;
    MiSettings: TMenuItem;
    sSkinProvider1: TsSkinProvider;
    N9: TMenuItem;
    MiRefresh: TMenuItem;
    MiHelp: TMenuItem;
    MiForum: TMenuItem;
    MiHomePage: TMenuItem;
    MiAbout: TMenuItem;
    N1: TMenuItem;
    MiTeamSpeak: TMenuItem;
    FcSpanishXML: TFileContainer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure LvRoomsListDblClick(Sender: TObject);
    procedure LvRoomsListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure HTTPVpnGetDoneString(Sender: TObject; Result: string);
    procedure HTTPVpnGetShortDoneString(Sender: TObject; Result: string);
    procedure HTTPGetNewsDoneString(Sender: TObject; Result: string);
    procedure TimerVpnGetTimer(Sender: TObject);
    procedure TimerVpnGetShortTimer(Sender: TObject);
    procedure TimerVpnAddTimer(Sender: TObject);
    procedure TimerGetNewsTimer(Sender: TObject);
    procedure PingTimerTimer(Sender: TObject);
    procedure UDPPingerUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure CoolTrayIcon1Click(Sender: TObject);
    procedure CoolTrayIcon1MinimizeToTray(Sender: TObject);
    procedure MiOpenClick(Sender: TObject);
    procedure MiQuit1Click(Sender: TObject);
    procedure IdIRC1Disconnect(Sender: TObject);
    procedure IdIRC1Disconnected(Sender: TObject);
    procedure IdIRC1Error(Sender: TObject; AUser: TIdIRCUser; ANumeric,
      AError: string);
    procedure IdIRC1Join(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel);
    procedure IdIRC1Message(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel; Content: string);
    procedure IdIRC1Part(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel);
    procedure IdIRC1Names(Sender: TObject; AUsers: TIdIRCUsers;
      AChannel: TIdIRCChannel);
    procedure IdIRC1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure IdIRC1Joined(Sender: TObject; AChannel: TIdIRCChannel);
    procedure EdMainChatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IdIRC1Quit(Sender: TObject; AUser: TIdIRCUser);
    procedure IdIRC1NickChange(Sender: TObject; AUser: TIdIRCUser;
      ANewNick: string);
    procedure IdIRC1NickChanged(Sender: TObject; AOldNick: string);
    procedure BtnMainChatSendClick(Sender: TObject);
    procedure IdIRC1Raw(Sender: TObject; AUser: TIdIRCUser; ACommand,
      AContent: string; var Suppress: Boolean);
    procedure LvMainChatUsersDblClick(Sender: TObject);
    procedure VPNManagerConnected(Sender: TObject);
    procedure VPNManagerDisconnected(Sender: TObject);
    procedure BtnRoomSendClick(Sender: TObject);
    procedure EdRoomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LvRoomUsersDblClick(Sender: TObject);
    procedure BtnDisconnectClick(Sender: TObject);
    procedure IdIRC1Connected(Sender: TObject);
    procedure BtnServerSendClick(Sender: TObject);
    procedure EdServerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IdIRC1Notice(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel; Content: string);
    procedure IdIRC1Topic(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel; const AChanName, ATopic: string);
    procedure IdIRC1System(Sender: TObject; AUser: TIdIRCUser;
      ACmdCode: Integer; ACommand, AContent: string);
    procedure MiAddClick(Sender: TObject);
    procedure MiDeleteClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure MiEditClick(Sender: TObject);
    procedure LvMyGamesDblClick(Sender: TObject);
    procedure IdIRC1Kick(Sender: TObject; AUser, AVictim: TIdIRCUser;
      AChannel: TIdIRCChannel);
    procedure IdIRC1Kicked(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel);
    procedure MiConnectClick(Sender: TObject);
    procedure MiCreateRoomClick(Sender: TObject);
    procedure MiSettingsClick(Sender: TObject);
    procedure MiQuitClick(Sender: TObject);
    procedure MiRefreshClick(Sender: TObject);
    procedure MiHomePageClick(Sender: TObject);
    procedure MiForumClick(Sender: TObject);
    procedure MiAboutClick(Sender: TObject);
    procedure MiTeamSpeakClick(Sender: TObject);
    procedure IdIRC1CTCPReply(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel; Command, Args: String);
  private
    FWorkMode: TWorkMode;
    FMyGamesList: TFileLauncherList;
    FShortList: TStringList;
    FlgClosing: Boolean;
    FlgMinimized: Boolean;
    FlgCanJoinToRoomChannel: Boolean;
    procedure Reconnect(Err: string);
    procedure LvMyGamesRefresh;
    procedure ParseList(Data: string);
    function FindUser(LV: TsListView; Nick: string; var Prefix: string): Integer;
    procedure AddGame(ACaption, AFileName: string);
    procedure ExtraLanguageApply;
  protected
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
  end;

var
  MainForm: TMainForm;
  pLanDLLHandle: THandle;
  ProcHooker: TDLLProc;
  ProcUnhooker: TDLLProc;
  ProcVersion: TDLLProc;
  ReconnectNum: Integer = 0; // ��������� �������� ���������� ���������������.

implementation

{$R *.dfm}

uses
  PsAPI, ShellAPI, ComObj, ShlObj, ActiveX, UGlobal, USettings, ULanguage,
  frmConfig, AdaptItems, frmCreateRoom, frmOVPNInit, frmDetailedError,
  frmFileOpen, frmAbout;

procedure TMainForm.FormCreate(Sender: TObject);
var
  AList: TAdapterList;
  StrList: TStringList;
  I: Integer;
  Reg: TRegistry;
begin
  // ������������� �������.
  FcNotifyWav.CheckAndSaveToFile(UGlobal.DataPath + 'notify.wav');
  FcNotifyWav.Free;
  FcNotify2Wav.CheckAndSaveToFile(UGlobal.DataPath + 'notify2.wav');
  FcNotify2Wav.Free;
  FcServerPEM.CheckAndSaveToFile(UGlobal.DataPath + 'server.pem');
  FcServerPEM.Free;
  FcServerKey.CheckAndSaveToFile(UGlobal.DataPath + 'server.key');
  FcServerKey.Free;
  FcClientPEM.CheckAndSaveToFile(UGlobal.DataPath + 'client.pem');
  FcClientPEM.Free;
  FcClientKey.CheckAndSaveToFile(UGlobal.DataPath + 'client.key');
  FcClientKey.Free;
  FcCaPEM.CheckAndSaveToFile(UGlobal.DataPath + 'ca.pem');
  FcCaPEM.Free;
  FcCaKey.CheckAndSaveToFile(UGlobal.DataPath + 'ca.key');
  FcCaKey.Free;
  FcDHPem.CheckAndSaveToFile(UGlobal.DataPath + 'dh1024.pem');
  FcDHPem.Free;
  FcDataXML.CheckAndSaveToFile(UGlobal.DataPath + 'data.xml');
  FcDataXML.Free;
  FcPlanDLL.CheckAndSaveToFile(UGlobal.DataPath + 'pLan.dll');
  FcPlanDLL.Free;
  FcEnglishXML.CheckAndSaveToFile(UGlobal.AppPath + 'Languages\English.xml');
  FcEnglishXML.Free;
  FcRussianXML.CheckAndSaveToFile(UGlobal.AppPath + 'Languages\Russian.xml');
  FcRussianXML.Free;
  FcGermanXML.CheckAndSaveToFile(UGlobal.AppPath + 'Languages\German.xml');
  FcGermanXML.Free;
  FcSpanishXML.CheckAndSaveToFile(UGlobal.AppPath + 'Languages\Spanish.xml');
  FcSpanishXML.Free;

  // ��������� �������� ���������.
  Language.Apply(Self);
  ExtraLanguageApply;

  Self.Caption := UGlobal.AppTitle;

  // �����.
  sSkinManager1.SkinDirectory := AppPath + 'Skins';
  StrList := TStringList.Create;
  sSkinManager1.GetSkinNames(StrList);
  if (StrList.Count > 0) then
  begin
    StrList.Sort;
    for I := 0 to StrList.Count - 1 do
    begin
      if (StrList.Strings[I] = Settings.SkinName) then
      begin
        sSkinManager1.SkinName := Settings.SkinName;
        Break;
      end;
    end;
  end;
  StrList.Free;

  // ������������� ��������� ��������.
  FWorkMode := wmIdle;
  FlgClosing := False;
  FlgMinimized := False;
  FlgCanJoinToRoomChannel := False;

  // ��������� ���������� pLan.dll, ������������� �������.
  pLanDLLHandle := LoadLibrary(PChar(UGlobal.DataPath + 'pLan.dll'));
  if (pLanDLLHandle <> 0) then
  begin
    ProcHooker   := GetProcAddress(pLanDLLHandle, 'Hooker');
    ProcUnhooker := GetProcAddress(pLanDLLHandle, 'Unhooker');
    ProcVersion  := GetProcAddress(pLanDLLHandle, 'Version');
    ProcHooker;
  end
  else
  begin
    Application.MessageBox(PChar('Error loading pLan.dll'),
      PChar('Error loading pLan.dll'));
  end;

  // ��������� ����� ��������.
  AList := TAdapterList.Create;
  try
    if (AList.GetByIP(Settings.NetworkIP) = nil) and
      (not Settings.AutomaticIP) then
    begin
      Settings.NetworkIP := '';
      MiSettings.Click;
    end;
  finally
    AList.Free;
  end;

  // ��������� ������� OpenVPN.
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('Software\pLan', True) then
    begin
      if not Reg.ValueExists('OpenVPNHandle') then
        Reg.WriteInteger('OpenVPNHandle', 32000);
      VPNManager.VPNHandle := Reg.ReadInteger('OpenVPNHandle');
    end;
  finally
    Reg.Free;
  end;
  VPNManager.TerminateOpenVPN;

  // ������������� UserAgent ��� HTTPGet'��
  HTTPVpnGet.Agent      := UGlobal.HTTPAgent;
  HTTPVpnGetShort.Agent := UGlobal.HTTPAgent;
  HTTPVpnAdd.Agent      := UGlobal.HTTPAgent;
  HTTPVpnDel.Agent      := UGlobal.HTTPAgent;
  HTTPGetNews.Agent     := UGlobal.HTTPAgent;

  // ��������� ������ ����������.
  FShortList := TStringList.Create;
  TimerVpnGetShort.Interval := Settings.AutoNotifyPeriod * 60 * 1000;
  TimerVpnGetShort.Enabled := Settings.AutoNotify;

  // ������������ � IRC �������.
  IdIRC1.Host := IRCHost;
  IdIRC1.Port := IRCPort;
  IdIRC1.Nick := Settings.UserName;
  IdIRC1.Username := UGlobal.IRCUsername;
  IdIRC1.Replies.ClientInfo := UGlobal.IRCUsername;
  IdIRC1.Replies.Version := UGlobal.IRCUsername + ' ' + UGlobal.AppVersion;
  IdIRC1.AltNick := Settings.UserName + '_' + IntToStr(Random(3000));
  try
    IdIRC1.Connect;
  except
    on E:Exception do
      ReRoom.AddFormatedString(TAG_COLOR + '4' + E.Message);
  end;

  // ������������� ������� �� ���������.
  sPageControl1.ActivePage := TsRoomList;
  TsRoom.TabVisible := False;
  sPageControl2.ActivePage := TsMainChat;

  // ��������� ������ ���.
  FMyGamesList := TFileLauncherList.Create;
  FMyGamesList.Load;
  LvMyGamesRefresh;

  LvMainChatUsers.Columns[0].Width := LvMainChatUsers.Width -
    GetSystemMetrics(SM_CXVSCROLL);

  // ��������� ������� ����� ���� � ���������.
  DragAcceptFiles(Self.Handle, True);

  // ������ � �������� ����.
  {if Settings.MinimizeOnStartup then
    CoolTrayIcon1.HideMainForm;}

  if Settings.MinimizeOnStartup then
    Application.ShowMainForm := False;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  // ��������� ����� � ������ ������.
  Self.Left := (GetSystemMetrics(SM_CXSCREEN) - Self.Width)  div 2;
  Self.Top  := (GetSystemMetrics(SM_CYSCREEN) - Self.Height) div 2;

  // ��������� ������ ������.
  MiRefresh.Click;

  // ��������� ������ ���������� ������ ������.
  TimerVpnGet.Enabled := True;
end;

procedure TMainForm.FormHide(Sender: TObject);
begin
  // ������������� ������ ���������� ������ ������.
  TimerVpnGet.Enabled := False;
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Self.Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not FlgClosing then
  begin
    CoolTrayIcon1.HideMainForm;
    FlgMinimized := True;
  end;
  CanClose := FlgClosing;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  // ����������� �� IRC �������.
  try
    IdIRC1.Disconnect(True);
  except
  end;

  // ��������� ������� OpenVPN.
  VPNManager.Disconnect;
  while (VPNManager.GetStatus <> ovpnDisconnected) do
  begin
    Application.ProcessMessages;
    Sleep(100);
  end;

  // ����������� ������.
  FShortList.Free;
  FMyGamesList.Free;
  Language.Free;
  Settings.Free;

  DragAcceptFiles(Self.Handle, False);  
end;

procedure TMainForm.ParseList(Data: string);
var
  MemRN: string;
  S: string;
  SL: TStringList;
  I, L, N: Integer;
  TrackerTime: Integer;
  CreationTime, RoomIP, RoomPort, VpnIP, VpnPort, IRCChannel,
  TeamSpeak, RoomName, GameName, PlayersCount, Players: string;
  RoomUptime: string;
  Item: TListItem;
begin
  // ���������� �������� ��������� �������.
  if Assigned(LvRoomsList.Selected) then
    MemRN := LvRoomsList.Selected.SubItems[1];

  N := StrToIntDef(sStatusBar1.Panels[5].Text, 0); // ���������� �������.

  SL := TStringList.Create;
  try
    SL.Text := Data;

    // ����� �� ������� � IP-����� �������.
    if (SL.Count >= 1) then
    begin
      S := SL.Strings[0];
      TrackerTime := StrToIntDef('$' + Parse(S, '$'), 0);
      if (TrackerTime = 0) then Exit;
      sStatusBar1.Panels[1].Text := S;
    end;

    // ������ ������.
    if (SL.Count > 1) and (Length(SL.Strings[1]) > 4) then
    begin
      UDPPinger.Active := True;

      LvRoomsList.Items.BeginUpdate;
      try
        N := 0;
        LvRoomsList.Items.Clear;

        for I := 1 to SL.Count - 1 do
        begin
          S := SL.Strings[I];
          S := StringReplace(S, '&amp;',  '&', [rfReplaceAll]);
          S := StringReplace(S, '&lt;',   '<', [rfReplaceAll]);
          S := StringReplace(S, '&gt;',   '>', [rfReplaceAll]);
          S := StringReplace(S, '&quot;', '"', [rfReplaceAll]);
          S := StringReplace(S, '&#039;', #39, [rfReplaceAll]);

          // ���������.
          CreationTime := Parse(S, '$'); // ����� �������� �������.
          RoomIP       := Parse(S, '$'); // ����� �������.
          RoomPort     := Parse(S, '$'); // ���� �������.
          VpnIP        := Parse(S, '$'); // ����� VPN.
          VpnPort      := Parse(S, '$'); // ���� VPN.
          IRCChannel   := Parse(S, '$'); // IRC ����� �������.
          Teamspeak    := Parse(S, '$'); // ����� Teamspeak.
          RoomName     := Parse(S, '$'); // �������� �������.
          GameName     := Parse(S, '$'); // �������� ����.
          PlayersCount := Parse(S, '$'); // ���������� �������.
          Players      := S;             // ������ �������.

          try
            StrToInt(RoomPort);
            StrToInt(VpnPort);
          except
            Continue;
          end;

          // ������� ������� � ����� ������.
          L := Length(Players);
          if (L > 0) and (Players[L] = ',') then
            Delete(Players, L, 1);

          Inc(N, StrToInt(PlayersCount));

          // ToDo: ������������ RoomUptime ��� ������ ������� �� ������.
          RoomUptime := IntToStr(TrackerTime -
            StrToIntDef('$' + CreationTime, 0));

          // ��������� ������� � ������.
          Item := LvRoomsList.Items.Add;
          Item.Caption := '  ';            // Ping
          Item.SubItems.Add(GameName);     //  0 - �������� ����.
          Item.SubItems.Add(RoomName);     //  1 - �������� �������.
          Item.SubItems.Add(PlayersCount); //  2 - ���������� �������.
          Item.SubItems.Add(CreationTime); //  3 - ����� ��������.
          Item.SubItems.Add(RoomIP);       //  4 - ����� �������.
          Item.SubItems.Add(RoomPort);     //  5 - ���� �������.
          Item.SubItems.Add(VpnIP);        //  6 - ����� VPN.
          Item.SubItems.Add(VpnPort);      //  7 - ���� VPN.
          Item.SubItems.Add(IRCChannel);   //  8 - IRC �����.
          Item.SubItems.Add(TeamSpeak);    //  9 - ����� TeamSpeak [OLD].
          Item.SubItems.Add(Players);      // 10 - ������ �������.
          Item.SubItems.Add(RoomUptime);   // 11 - Uptime �������.
          Item.SubItems.Add('');           // 12 - TickCount �� ������ ��������.
        end;

      finally
        LvRoomsList.Items.EndUpdate;
      end;

    end;

  finally
    SL.Free;
  end;

  // ��������� ��������.
  for I := 0 to LvRoomsList.Items.Count - 1 do
  begin
    if (LvRoomsList.Items[I].SubItems[1] = MemRN) then
    begin
      LvRoomsList.SelectItem(I);
      Break;
    end;
  end;

  sStatusBar1.Panels[3].Text := IntToStr(LvRoomsList.Items.Count); // ���������� ������.
  sStatusBar1.Panels[5].Text := IntToStr(N);                       // ���������� �������.
end;

procedure TMainForm.LvRoomsListDblClick(Sender: TObject);
begin
  MiConnect.Click;
end;

procedure TMainForm.HTTPVpnGetDoneString(Sender: TObject; Result: string);
begin
  ParseList(Result);
  //PingTimerTimer(Self);
  PingTimer.Enabled := True;
end;

procedure TMainForm.LvRoomsListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  TickCount: string;
  B: Cardinal;

  function SecToTime(Sec: Integer): string;
  var
    H, M, S: string;
    ZH, ZM, ZS: Integer;
  begin
    ZH := Sec div 3600;
    ZM := Sec div 60 - ZH * 60;
    ZS := Sec - (ZH * 3600 + ZM * 60);
    H := IntToStr(ZH);
    M := Format('%.*d', [2, ZM]);
    S := Format('%.*d', [2, ZS]);
    Result := H + 'h' + M + 'm' + S + 's';
  end;

begin
  ReRoomInfo.Lines.Clear;

  if Selected then
  begin
    ReRoomInfo.AddFormatedString(TAG_BOLD + Language.msgGame + ': ' +
      TAG_BOLD + Item.SubItems[0], False, False);

    ReRoomInfo.AddFormatedString(TAG_BOLD + Language.msgRoomName + ': ' +
      TAG_BOLD + Item.SubItems[1], False, False);

    ReRoomInfo.AddFormatedString(TAG_BOLD + Language.msgRoomIP + ': ' +
      TAG_BOLD + Item.SubItems[4] + ':' + Item.SubItems[5], False, False);

    ReRoomInfo.AddFormatedString(TAG_BOLD + Language.msgOpenVPNIP + ': ' +
      TAG_BOLD + Item.SubItems[6] + ':' + Item.SubItems[7], False, False);

    ReRoomInfo.AddFormatedString(TAG_BOLD + Language.msgUptime + ': ' +
      TAG_BOLD + SecToTime(StrToInt(Item.SubItems[11])), False, False);

    ReRoomInfo.AddFormatedString(TAG_BOLD + Language.msgChannel + ': ' +
      TAG_BOLD + Item.SubItems[8], False, False);

    ReRoomInfo.AddFormatedString(TAG_BOLD + Language.msgPlayers + ': ' +
      TAG_BOLD + Item.SubItems[10], False, False);

    // �������.
    try
      SetLength(TickCount, SizeOf(Cardinal));
      B := GetTickCount;
      Move(B, TickCount[1], SizeOf(Cardinal));

      UDPPinger.Send(Item.SubItems[4], StrToInt(Item.SubItems[5]),
        Char(mtRoomPing) + TickCount + Item.SubItems[4] + ' ' +
          Item.SubItems[5]);
    except
    end;

  end;
end;

procedure TMainForm.PingTimerTimer(Sender: TObject);
var
  TickCount: string;
  B: Cardinal;
  Item: TListItem;
  I, J: Integer;
begin
  if (LvRoomsList.Items.Count > 0) then
  begin
    SetLength(TickCount, SizeOf(Cardinal));
    B := GetTickCount;
    Move(B, TickCount[1], SizeOf(Cardinal));
    J := 0;
    for I := 0 to LvRoomsList.Items.Count - 1 do
    begin
      Item := LvRoomsList.Items[I];
      if (Item.SubItems[12] = '') then
      begin
        try
          UDPPinger.Send(Item.SubItems[4], StrToInt(Item.SubItems[5]),
            Char(mtRoomPing) + TickCount + Item.SubItems[4] + ' ' +
            Item.SubItems[5]);
        except
        end;
        Item.SubItems[12] := IntToStr(GetTickCount);
        Inc(J);
      end;
      if (J >= 20) then
        Break;
    end;
  end;
end;

procedure TMainForm.UDPPingerUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  S: string;
  B: Cardinal;
  I: Integer;
  IP: string;
  Port: string;
begin
  SetLength(S, AData.Size);
  AData.ReadBuffer(S[1], AData.Size);
  S := Copy(S, 2, Length(S) - 1);
  Move(S[1], B, SizeOf(Cardinal));
  S := Copy(S, SizeOf(Cardinal) + 1, Length(S));
  if (Pos(' ', S) <> 0) then
  begin
    IP := Copy(S, 1, Pos(' ', S) - 1);
    Port := Copy(S, Pos(' ', S) + 1, Length(S));
  end;
  if not FlgClosing then
  begin
    for I := 0 to LvRoomsList.Items.Count - 1 do
    begin
      if (LvRoomsList.Items[I].SubItems[4] = IP) and
        (LvRoomsList.Items[I].SubItems[5] = Port) then
      begin
        LvRoomsList.Items[I].Caption := IntToStr(GetTickCount - B);
        Break;
      end;
    end;
  end;
end;

procedure TMainForm.TimerVpnGetTimer(Sender: TObject);
begin
  MiRefresh.Click;
end;

procedure TMainForm.TimerVpnGetShortTimer(Sender: TObject);
begin
  HTTPVpnGetShort.URL := UGlobal.URLTracker;
  HTTPVpnGetShort.PostQuery := 'do=vpn_getshort';
  HTTPVpnGetShort.GetString;
end;

procedure TMainForm.HTTPVpnGetShortDoneString(Sender: TObject;
  Result: string);
var
  I, J: Integer;
  SL: TStringList;
  Flag: Boolean;
  S1, S2: string;
  Count1, Count2: Integer;
  Temp: Integer;
  S: string;
begin
  SL := TStringList.Create;
  S := '';
  try
    SL.Text := Result;
    for I := 0 to SL.Count - 1 do
    begin
      S1 := Copy(SL[I], 1, Pos('|', SL[I]) - 1);
      if (SL[I] <> '') and (Settings.SelectedGames.IndexOf(S1) <> -1) then
      begin
        try
          Val(Copy(SL[I], Pos('|', SL[I]) + 1, Length(SL[I])), Count1, Temp);
        except
          Count1 := 0;
        end;
        Flag := True;
        for J := 0 to FShortList.Count - 1 do
        begin
          S2 := Copy(FShortList[I], 1, Pos('|', FShortList[I]) - 1);
          if S1 = S2 then
          begin
            try
              Val(Copy(FShortList[I], Pos('|', FShortList[I]) + 1,
                Length(FShortList[I])), Count2, Temp);
            except
              Count2 := 0;
            end;
            if (Count1 >= Count2) then
            begin
              Flag := False;
              Break;
            end;
          end;
        end;
        if Flag then
          S := S + S1 + ',';
      end;
    end;
  finally
    FShortList := SL;
  end;
  if (S <> '') then
  begin
    SetLength(S, Length(S) - 1);
    CoolTrayIcon1.ShowBalloonHint('pLan', 'New servers for games: ' + S,
      bitInfo, 10);
    if FileExists(UGlobal.DataPath + 'notify.wav') and
      Settings.SoundNotifyOnInterestingGame then
    begin
      MediaPlayer1.FileName := UGlobal.DataPath + 'notify.wav';
      MediaPlayer1.Open;
      MediaPlayer1.Play;
    end;
  end;
end;

procedure TMainForm.CoolTrayIcon1Click(Sender: TObject);
begin
  CoolTrayIcon1.ShowMainForm;
  FlgMinimized := False;
end;

procedure TMainForm.MiQuit1Click(Sender: TObject);
begin
  MiQuit.Click;
end;

procedure TMainForm.MiOpenClick(Sender: TObject);
begin
  CoolTrayIcon1.ShowMainForm;
  FlgMinimized := False;
end;

procedure TMainForm.CoolTrayIcon1MinimizeToTray(Sender: TObject);
begin
  FlgMinimized := True;
end;

procedure TMainForm.IdIRC1Disconnect(Sender: TObject);
begin
  ReMainChat.AddFormatedString(TAG_COLOR + '4Disconnect...');
  ReRoom.AddFormatedString(TAG_COLOR + '4Disconnect...');
  FlgCanJoinToRoomChannel := False;
end;

procedure TMainForm.IdIRC1Disconnected(Sender: TObject);
begin
  ReMainChat.AddFormatedString(TAG_COLOR + '4Disconnected');
  ReRoom.AddFormatedString(TAG_COLOR + '4Disconnected');
  FlgCanJoinToRoomChannel := False;
end;

procedure TMainForm.IdIRC1Error(Sender: TObject; AUser: TIdIRCUser;
  ANumeric, AError: string);
begin
  ReMainChat.AddFormatedString(TAG_COLOR + '4Error: ' + AError);
end;

procedure TMainForm.IdIRC1Join(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel);
var
  Item: TListItem;
begin
  // ����� �����.
  if (AChannel.Name = UGlobal.IRCMainChannel) then
  begin
    Item := LvMainChatUsers.Items.Add;
    Item.Caption := AUser.Nick;
    if not Settings.IgnoreJoinOnIRC then
      ReMainChat.AddFormatedString(TAG_COLOR + '15User joined: ' + AUser.Nick);
    Exit;
  end;

  // �������.
  if (AChannel.Name = Settings.RoomChannel) then
  begin
    Item := LvRoomUsers.Items.Add;
    Item.Caption := AUser.Nick;
    if not Settings.IgnoreJoinOnRoom then
      ReRoom.AddFormatedString(TAG_COLOR + '15User joined: ' + AUser.Nick);
  end;
end;

procedure TMainForm.IdIRC1Message(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel; Content: string);
begin
  if (AChannel <> nil) then
  begin
    // ����� �����.
    if (AChannel.Name = UGlobal.IRCMainChannel) then
    begin
      ReMainChat.AddFormatedString({TAG_COLOR + '1' + }TAG_BOLD + '<' +
        AUser.Nick + '>' + TAG_BOLD + ' ' + Content);
      Exit;
    end;

    // �������.
    if (AChannel.Name = Settings.RoomChannel) then
    begin
      ReRoom.AddFormatedString({TAG_COLOR + '1' + }TAG_BOLD + '<' +
        AUser.Nick + '>' + TAG_BOLD + ' ' + Content);
    end;
  end
  else
  begin
    ReMainChat.AddFormatedString(TAG_COLOR + '12(private) ' + AUser.Nick + '->'
      + IdIRC1.Nick + ': ' + Content);
    ReRoom.AddFormatedString(TAG_COLOR + '12(private) ' + AUser.Nick + '->'
      + IdIRC1.Nick + ': ' + Content);
  end;
end;

procedure TMainForm.IdIRC1Part(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel);
var
  Idx: Integer;
  Dummy: string;
begin
  // ����� �����.
  if (AChannel.Name = UGlobal.IRCMainChannel) then
  begin
    Idx := FindUser(LvMainChatUsers, AUser.Nick, Dummy);
    if (Idx <> -1) then
    begin
      LvMainChatUsers.Items.Delete(Idx);
      if not Settings.IgnoreJoinOnIRC then
        ReMainChat.AddFormatedString(TAG_COLOR + '15User parted ' + AUser.Nick);
    end;
    Exit;
  end;

  // �������.
  if (AChannel.Name = Settings.RoomChannel) then
  begin
    Idx := FindUser(LvRoomUsers, AUser.Nick, Dummy);
    if (Idx <> -1) then
    begin
      LvRoomUsers.Items.Delete(Idx);
      if not Settings.IgnoreJoinOnRoom then
        ReRoom.AddFormatedString(TAG_COLOR + '15User parted ' + AUser.Nick);
    end;
  end;
end;

const
  IRC_OP = 1;
  IRC_VOICE = 2;

type
  TIRCUserState = (ircOp, ircVoice);
  TIRCUserStates = set of TIRCUserState;

function SneakyGetUserState(Data: Integer): TIRCUserStates;
begin
  Result := [];
  if ((Data and IRC_OP) <> 0) then
    Include(Result, ircOp);
  if ((Data and IRC_VOICE) <> 0) then
    Include(Result, ircVoice);
end;

procedure TMainForm.IdIRC1Names(Sender: TObject; AUsers: TIdIRCUsers;
  AChannel: TIdIRCChannel);
var
  I, Index: Integer;
  Item: TListItem;
  pState: TIRCUserStates;
begin
  // ����� �����.
  if (AChannel.Name = UGlobal.IRCMainChannel) then
  begin
    LvMainChatUsers.Items.Clear;
    for I := 0 to AUsers.Count - 1 do
    begin
      if AChannel.Find(AUsers.Items[I].Nick, Index) then
      begin
        Item := LvMainChatUsers.Items.Add;
        pState := SneakyGetUserState(Integer(AChannel.Names.Objects[Index]));
        if (ircOp in pState) then
          Item.Caption := '@' + AUsers.Items[I].Nick;
        if (ircVoice in pState) then
          Item.Caption := '+' + AUsers.Items[I].Nick;
        if (pState = []) then
          Item.Caption := AUsers.Items[I].Nick;
      end;
    end;
    Exit;
  end;

  // �������.
  if (AChannel.Name = Settings.RoomChannel) then
  begin
    LvRoomUsers.Items.Clear;
    for I := 0 to AUsers.Count - 1 do
    begin
      if AChannel.Find(AUsers.Items[I].Nick, Index) then
      begin
        Item := LvRoomUsers.Items.Add;
        pState := SneakyGetUserState(Integer(AChannel.Names.Objects[Index]));
        if (ircOp in pState) then
          Item.Caption := '@' + AUsers.Items[I].Nick;
        if (ircVoice in pState) then
          Item.Caption := '+' + AUsers.Items[I].Nick;
        if (pState = []) then
          Item.Caption := AUsers.Items[I].Nick;
      end;
    end;
  end;
end;

procedure TMainForm.IdIRC1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
  ReMainChat.AddFormatedString(TAG_COLOR + '3' + AStatusText);
end;

procedure TMainForm.IdIRC1Joined(Sender: TObject; AChannel: TIdIRCChannel);
begin
  // ����� �����.
  if (AChannel.Name = UGlobal.IRCMainChannel) then
  begin
    LvMainChatUsers.Items.Clear;
    ReMainChat.AddFormatedString(TAG_COLOR + '3Joined to channel ' +
      AChannel.Name);
    Exit;
  end;

  // �������.
  if (AChannel.Name = Settings.RoomChannel) then
  begin
    LvRoomUsers.Items.Clear;
    ReRoom.AddFormatedString(TAG_COLOR + '3Joined to channel ' + AChannel.Name);
  end;
end;

procedure TMainForm.EdMainChatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Msg: TMsg;
begin
  if (Key = VK_RETURN) then
  begin
    PeekMessage(Msg, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    BtnMainChatSend.Click;
  end;
end;

procedure TMainForm.IdIRC1Quit(Sender: TObject; AUser: TIdIRCUser);
var
  Idx: Integer;
  Dummy: string;
begin
  // ����� �����.
  Idx := FindUser(LvMainChatUsers, AUser.Nick, Dummy);
  if (Idx <> -1) then
  begin
    LvMainChatUsers.Items.Delete(Idx);
    if not Settings.IgnoreJoinOnIRC then
      ReMainChat.AddFormatedString(TAG_COLOR + '15User parted ' + AUser.Nick);
  end;

  // �������.
  Idx := FindUser(LvRoomUsers, AUser.Nick, Dummy);
  if (Idx <> -1) then
  begin
    LvRoomUsers.Items.Delete(Idx);
    if not Settings.IgnoreJoinOnRoom then
      ReRoom.AddFormatedString(TAG_COLOR + '15User parted ' + AUser.Nick);
  end;    
end;

function TMainForm.FindUser(LV: TsListView; Nick: string;
  var Prefix: string): Integer;
var
  I: Integer;
  S: string;
  P: string;
begin
  Result := -1;
  Prefix := '';
  for I := 0 to LV.Items.Count - 1 do
  begin
    S := LV.Items[I].Caption;
    if (S[1] in ['&', '@', '+', '~', '%']) then
    begin
      P := S[1];
      Delete(S, 1, 1);
    end
    else
    begin
      P := '';
    end;
    if (S = Nick) then
    begin
      Result := I;
      Prefix := P;
      Break;
    end;
  end;
end;

procedure TMainForm.IdIRC1NickChange(Sender: TObject; AUser: TIdIRCUser;
  ANewNick: string);
var
  Idx: Integer;
  P: string;
begin
  // ����� �����.
  Idx := FindUser(LvMainChatUsers, AUser.Nick, P);
  if (Idx <> -1) then
    LvMainChatUsers.Items[Idx].Caption := P + ANewNick;

  // �������.
  Idx := FindUser(LvRoomUsers, AUser.Nick, P);
  if (Idx <> -1) then
    LvRoomUsers.Items[Idx].Caption := P + ANewNick;
end;

procedure TMainForm.IdIRC1NickChanged(Sender: TObject; AOldNick: string);
var
  Idx: Integer;
  P: string;
begin
  // ����� �����.
  Idx := FindUser(LvMainChatUsers, AOldNick, P);
  if (Idx <> -1) then
    LvMainChatUsers.Items[Idx].Caption := P + IdIRC1.Nick;
  ReMainChat.AddFormatedString(TAG_COLOR + '3Your new nickname: ' + IdIRC1.Nick);

  // �������.
  Idx := FindUser(LvRoomUsers, AOldNick, P);
  if (Idx <> -1) then
    LvRoomUsers.Items[Idx].Caption := P + IdIRC1.Nick;
  ReRoom.AddFormatedString(TAG_COLOR + '3Your new nickname: ' + IdIRC1.Nick);

  Settings.UserName := IdIRC1.Nick;
end;

procedure TMainForm.BtnMainChatSendClick(Sender: TObject);
var
  S: string;
  Name: string;
  Command: string;
  Parameters: string;
begin
  if (Trim(EdMainChat.Text) <> '') then
  begin
    S := EdMainChat.Text;
    if (Pos('/msg', S) = 1) then // ������ ���������.
    begin
      Parse(S);
      Name := Trim(Parse(S));
      if (Name <> '') then
      try
        IdIRC1.Say(Name, S);
        ReMainChat.AddFormatedString(TAG_COLOR + '2(private) ' + IdIRC1.Nick
          + '->' + Name + ': ' + S);
      except
        on E:Exception do
          Reconnect(E.Message);
      end;
    end
    else
    if (Pos('/ctcp', EdMainChat.Text) = 1) then // CTCP.
    begin
      Parse(S);
      Name := Trim(Parse(S));
      Command := Trim(Parse(S));
      Parameters := Trim(Parse(S));
      if (Name <> '') and (Command <> '') then
      try
        IdIRC1.CTCPQuery(Name, Command, Parameters);
        ReMainChat.AddFormatedString(TAG_COLOR + '2CTCP ' + Name + ' ' +
          Command + ' ' + Parameters);
      except
        on E:Exception do
          Reconnect(E.Message);
      end;
    end
    else
    if (Pos('/', S) = 1) then // ������ ����������� �������.
    begin
      Command := Copy(S, 2, Length(S) - 1);
      if (Command <> '') then
      try
        IdIRC1.WriteLn(Command);
      except
        on E:Exception do
          Reconnect(E.Message);
      end;
    end
    else
    begin
      // ����� �������� ��������� �� ����� �����.
      try
        IdIRC1.Say(UGlobal.IRCMainChannel, S);
        ReMainChat.AddFormatedString({TAG_COLOR + '1' + }TAG_BOLD + '<' +
          IdIRC1.Nick + '>' + TAG_BOLD + ' ' + S);
      except
        on E:Exception do
          Reconnect(E.Message);
      end;
    end;
    EdMainChat.Text := '';
  end;
end;

procedure TMainForm.IdIRC1Raw(Sender: TObject; AUser: TIdIRCUser;
  ACommand, AContent: string; var Suppress: Boolean);
begin
  {ReServer.AddFormatedString(TAG_COLOR + '2' + AUser.Nick + TAG_COLOR + '5 ' +
    ACommand + TAG_COLOR + '1 ' + AContent);}

  // ����� ������� ":End of MOTD command" ������� �� �������� �����.
  if (ACommand = '376') then
  begin
    FlgCanJoinToRoomChannel := True;
    try
      IdIRC1.Join(UGlobal.IRCMainChannel);
    except
      on E:Exception do
        Reconnect(E.Message);
    end;
  end;
end;

procedure TMainForm.LvMainChatUsersDblClick(Sender: TObject);
var
  S: string;
begin
  if (LvMainChatUsers.Selected <> nil) then
  begin
    S := LvMainChatUsers.Selected.Caption;
    if (S[1] in ['&', '@', '+', '~', '%']) then
      Delete(S, 1, 1);
    EdMainChat.Text := '/msg ' + S + ' ';
    Self.ActiveControl := EdMainChat;
    EdMainChat.SelStart := Length(EdMainChat.Text);
  end;
end;

procedure TMainForm.VPNManagerConnected(Sender: TObject);
begin
  ReRoom.AddFormatedString(TAG_COLOR + '3VPN Connection started');
end;

procedure TMainForm.VPNManagerDisconnected(Sender: TObject);
begin
  ReRoom.AddFormatedString(TAG_COLOR + '3VPN Connection terminated');
end;

procedure TMainForm.BtnRoomSendClick(Sender: TObject);
var
  S: string;
  Name: string;
  Command: string;
begin
  if (Trim(EdRoom.Text) <> '') then
  begin
    S := EdRoom.Text;
    if (Pos('/msg', S) = 1) then // ������ ���������.
    begin
      Parse(S);
      Name := Trim(Parse(S));
      if (Name <> '') then
      try
        IdIRC1.Say(Name, S);
        ReRoom.AddFormatedString(TAG_COLOR + '2(private) ' + IdIRC1.Nick +
          '->' + Name + ': ' + S);
      except
        on E:Exception do
          Reconnect(E.Message);
      end;
    end
    else
    if (Pos('/', S) = 1) then // ������ ����������� �������.
    begin
      Command := Copy(S, 2, Length(S) - 1);
      if (Command <> '') then
      try
        IdIRC1.WriteLn(Command);
      except
        on E:Exception do
          Reconnect(E.Message);
      end;
    end
    else
    begin
      // ����� �������� ��������� � �������.
      try
        IdIRC1.Say(Settings.RoomChannel, S);
          ReRoom.AddFormatedString({TAG_COLOR + '1' + }TAG_BOLD + '<' +
          IdIRC1.Nick + '>' + TAG_BOLD + ' ' + S);
      except
        on E:Exception do
          Reconnect(E.Message);
      end;
    end;
    EdRoom.Text := '';
  end;
end;

procedure TMainForm.EdRoomKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Msg: TMsg;
begin
  if (Key = VK_RETURN) then
  begin
    PeekMessage(Msg, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    BtnRoomSend.Click;
  end;
end;

procedure TMainForm.LvRoomUsersDblClick(Sender: TObject);
var
  S: string;
begin
  if (LvRoomUsers.Selected <> nil) then
  begin
    S := LvRoomUsers.Selected.Caption;
    if (S[1] in ['&', '@', '+', '~', '%']) then
      Delete(S, 1, 1);
    EdRoom.Text := '/msg ' + S + ' ';
    Self.ActiveControl := EdRoom;
    EdRoom.SelStart := Length(EdRoom.Text);
  end;
end;

procedure TMainForm.BtnDisconnectClick(Sender: TObject);
begin
  if ChatServer1.Active then
  begin
    ChatServer1.SendMassMessage(Char(mtServerDies) +
      'Sorry, server disconnected');
  end;

  if (FWorkMode = wmServer) then
  begin
    // ��������� ������ ���������� ������� �� ������.
    TimerVpnAdd.Enabled := False;

    // �������� � ��� ������� � ���������� ������ �������.
    if IdIRC1.Connected then
    try
      IdIRC1.Say(Settings.RoomChannel, 'Sorry, server disconnected');
    except
      on E:Exception do
        ReRoom.AddFormatedString(TAG_COLOR + '4' + E.Message);
    end;

    // ������� ������� � �������.
    HTTPVpnDel.URL := UGlobal.URLTracker;
    HTTPVpnDel.PostQuery := 'do=vpn_del';
    HTTPVpnDel.GetString;
  end;

  // �������� �����.
  try
    if IdIRC1.Connected then
      IdIRC1.Part(Settings.RoomChannel);
  except
    {on E:Exception do
      ReRoom.AddFormatedString(TAG_COLOR + '4' + E.Message);}
  end;

  if ChatServer1.Active then
    ChatServer1.Active := False;

  // ��������� OpenVPN.
  VPNManager.Disconnect;

  // ���������� ��������� � �������� ���������.
  Settings.RemoteRoomIP   := '';
  Settings.RemoteRoomPort := 0;
  Settings.RemoteVPNIP    := '';
  Settings.RemoteVPNPort  := 0;
  Settings.LocalRoomName  := '';
  Settings.LocalGameName  := '';
  Settings.RoomChannel    := '';

  FWorkMode := wmIdle;

  // ������������� �� ������� "������ ������".
  TsRoom.TabVisible := False;
  sPageControl1.ActivePage := TsRoomList;

  // �������� �������.
  PingTimer.Enabled := True;
  TimerVpnGetShort.Enabled := Settings.AutoNotify;
end;

function CheckAndFixString(S: string): string;
begin
  S := StringReplace(S, '&', '%26', [rfReplaceAll]);
  S := StringReplace(S, ' ', '%20', [rfReplaceAll]);
  S := StringReplace(S, '#', '',    [rfReplaceAll]);
  Result := S;
end;

procedure TMainForm.TimerVpnAddTimer(Sender: TObject);
var
  S, Addr: string;
  I: Integer;
  PL: string;
begin
  if Settings.AutomaticIP then
    Addr := ''
  else
    Addr := CheckAndFixString(Settings.NetworkIP);

  HTTPVpnAdd.URL := UGlobal.URLTracker;

  S := 'do=vpn_add'
    + '&addr='         + Addr
    + '&port='         + IntToStr(Settings.RoomPort)
    + '&vpnip=0.0.0.0'
    + '&vpnport='      + IntToStr(Settings.OpenVPNPort)
    + '&chan='         + CheckAndFixString(Settings.RoomChannel)
    + '&gamename='     + CheckAndFixString(Settings.LocalGameName)
    + '&roomname='     + CheckAndFixString(Settings.LocalRoomName)
    + '&playerscount=' + IntToStr(LvRoomUsers.Items.Count);

  PL := '';
  for I := 0 to LvRoomUsers.Items.Count - 1 do
    PL := PL + LvRoomUsers.Items[I].Caption + ', ';
  SetLength(PL, Length(PL) - 1);

  S := S + '&playerlist=' + CheckAndFixString(PL);

  HTTPVpnAdd.PostQuery := S;

  try
    HTTPVpnAdd.GetString;
  except
  end;
end;

procedure TMainForm.TimerGetNewsTimer(Sender: TObject);
begin
  TimerGetNews.Enabled := False;
  HTTPGetNews.URL := URLTracker;
  HTTPGetNews.PostQuery := 'do=getnews&lang=' + Language.Code;
  HTTPGetNews.GetString;
end;

procedure TMainForm.HTTPGetNewsDoneString(Sender: TObject; Result: string);
begin
  sMemo1.Text := Result;
end;

procedure TMainForm.IdIRC1Connected(Sender: TObject);
begin
  TsIRCServer.Caption := IdIRC1.Host;
  ReconnectNum := 0;
end;

procedure TMainForm.Reconnect(Err: string);
begin
  ReServer.AddFormatedString(TAG_COLOR + '4' + Err);
  if (ReconnectNum = 10) then
  begin
    IdIRC1.Disconnect;
    Exit;
  end
  else
  begin
    ReconnectNum := ReconnectNum + 1;
    IdIRC1.Disconnect;
    ReServer.Clear;

    try
      IdIRC1.Connect(1000);
    except
      on E:Exception do
        Reconnect(E.Message);
    end;
  end;
end;

procedure TMainForm.BtnServerSendClick(Sender: TObject);
begin
  if (EdServer.Text <> '') then
  begin
    try
      IdIRC1.WriteLn(EdServer.Text);
      ReServer.AddFormatedString(TAG_COLOR + '12' + EdServer.Text);
    except
      on E:Exception do
        Reconnect(E.Message);
    end;
    EdServer.Text := '';
  end;
end;

procedure TMainForm.EdServerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Msg: TMsg;
begin
  if (Key = VK_RETURN) then
  begin
    PeekMessage(Msg, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
    BtnServerSend.Click;
  end;
end;

procedure TMainForm.IdIRC1Notice(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel; Content: string);
var
  S: string;
begin
  S := TAG_COLOR + '7' + AUser.Nick + ' ' + Content;

  if (AChannel = nil) then
    ReServer.AddFormatedString(S)
  else
  begin
    if (AChannel.Name = UGlobal.IRCMainChannel) then
      ReMainChat.AddFormatedString(S)
    else
    if (AChannel.Name = Settings.RoomChannel) then
      ReRoom.AddFormatedString(S);
  end;
end;

procedure TMainForm.IdIRC1Topic(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel; const AChanName, ATopic: string);
var
  S: string;
begin
  S := TAG_COLOR + '7' + ATopic;
  if (AChanName = UGlobal.IRCMainChannel) then
    ReMainChat.AddFormatedString(S)
  else
  if (AChanName = Settings.RoomChannel) then
    ReRoom.AddFormatedString(S);
end;

procedure TMainForm.IdIRC1System(Sender: TObject; AUser: TIdIRCUser;
  ACmdCode: Integer; ACommand, AContent: string);
var
  I: Integer;
  S: string;
begin
  if (ACommand = 'NAMES') or (ACmdCode = 329) then Exit;

  if (ACommand = 'WELCOME') then
  begin
    if (ACmdCode in [1..3]) then
      I := Pos(':', AContent)
    else
      I := Pos(' ', AContent);
    if (I <> 0) then
      S := Copy(AContent, I + 1, Length(AContent) - I);
  end
  else
  begin
    S := AContent;
  end;

  ReServer.AddFormatedString(TAG_COLOR + '1' + S);
end;

procedure TMainForm.MiAddClick(Sender: TObject);
begin
  BtnAdd.Click;
end;

procedure TMainForm.MiDeleteClick(Sender: TObject);
begin
  BtnDelete.Click;
end;

procedure TMainForm.PopupMenu2Popup(Sender: TObject);
begin
  PopupMenu2.Items[1].Enabled := (LvMyGames.ItemFocused <> nil);
  PopupMenu2.Items[2].Enabled := (LvMyGames.ItemFocused <> nil);
end;

procedure TMainForm.LvMyGamesRefresh;
var
  I: Integer;
  Item: TListItem;
  Icon: TIcon;
  S: string;
begin
  LvMyGames.Items.Clear;
  sAlphaImageList1.Items.Clear;
  for I := 0 to FMyGamesList.Count - 1 do
  begin
    Item := LvMyGames.Items.Add;
    Item.Caption := FMyGamesList.Item[I].Caption;
    // ��������� ������.
    S := UGlobal.DataPath + 'cache\' + FMyGamesList.Item[I].IconName;
    if FileExists(S) then
    begin
      Icon := TIcon.Create;
      try
        Icon.LoadFromFile(S);
        Item.ImageIndex := sAlphaImageList1.AddIcon(Icon);
      finally
        Icon.Free;
      end;
    end
    else
    begin
      Item.ImageIndex := -1;
    end;
  end;
end;

procedure TMainForm.AddGame(ACaption, AFileName: string);
var
  FileOpenForm: TFileOpenForm;
  AItem: TFileLauncher;
  S: string;
begin
  FileOpenForm := TFileOpenForm.Create(Self);
  try
    FileOpenForm.CbCaption.Text := ACaption;
    FileOpenForm.EdFile.Text := AFileName;
    if (FileOpenForm.ShowModal = mrOK) then
    begin
      AItem := TFileLauncher.Create;
      AItem.LaunchString := FileOpenForm.EdFile.Text;
      AItem.Caption := FileOpenForm.CbCaption.Text;
      AItem.UseForceBindIP := FileOpenForm.ChkUseForceBindIP.Checked;
      AItem.InjectIntoProcess := FileOpenForm.ChkInjectIntoProcess.Checked;
      AItem.InjectName := FileOpenForm.EdProcessToInject.Text;
      AItem.WaitAWhile := FileOpenForm.ChkWaitAWhile.Checked;
      {repeat
        S := IntToStr(Random(65535)) + '.ico';
      until not FileExists(UGlobal.DataPath + 'cache\' + S);}
      S := IntToHex(MakeHash(AItem.LaunchString), 8) + '.ico';
      AItem.IconName := S;

      CreateDir(UGlobal.DataPath + 'cache\');
      FileOpenForm.Image.Picture.SaveToFile(UGlobal.DataPath + 'cache\' + S);
      FMyGamesList.Add(AItem);

      FMyGamesList.Save;
      LvMyGamesRefresh;
    end;
  finally
    FileOpenForm.Free;
  end;
end;

procedure TMainForm.BtnAddClick(Sender: TObject);
begin
  AddGame('', '');
end;

procedure TMainForm.MiEditClick(Sender: TObject);
var
  FileOpenForm: TFileOpenForm;
  AItem: TFileLauncher;
  S: string;
begin
  FileOpenForm := TFileOpenForm.Create(Self);
  try
    AItem := FMyGamesList.Item[LvMyGames.ItemFocused.Index];

    FileOpenForm.CbCaption.Text := AItem.Caption;
    FileOpenForm.EdFile.Text := AItem.LaunchString;
    FileOpenForm.ChkUseForceBindIP.Checked := AItem.UseForceBindIP;
    FileOpenForm.ChkInjectIntoProcess.Checked := AItem.InjectIntoProcess;
    FileOpenForm.EdProcessToInject.Text := AItem.InjectName;
    FileOpenForm.ChkWaitAWhile.Checked := AItem.WaitAWhile;

    if FileExists(UGlobal.DataPath + 'cache\' + AItem.IconName) then
      FileOpenForm.Image.Picture.Icon.LoadFromFile(UGlobal.DataPath + 'cache\' +
        AItem.IconName)
    else
      FileOpenForm.Image.Picture.Icon := nil;

    if FileOpenForm.ShowModal = mrOK then
    begin
      AItem.Caption := FileOpenForm.CbCaption.Text;
      AItem.LaunchString := FileOpenForm.EdFile.Text;
      AItem.UseForceBindIP := FileOpenForm.ChkUseForceBindIP.Checked;
      AItem.InjectIntoProcess := FileOpenForm.ChkInjectIntoProcess.Checked;
      AItem.InjectName := FileOpenForm.EdProcessToInject.Text;
      AItem.WaitAWhile := FileOpenForm.ChkWaitAWhile.Checked;
      {repeat
        S := IntToStr(Random(65535)) + '.ico';
      until not FileExists(UGlobal.DataPath + 'cache\' + S);}
      S := IntToHex(MakeHash(AItem.LaunchString), 8) + '.ico';
      AItem.IconName := S;

      CreateDir(UGlobal.DataPath + 'cache\');
      FileOpenForm.Image.Picture.SaveToFile(UGlobal.DataPath + 'cache\' + S);

      FMyGamesList.Save;
      LvMyGamesRefresh;
    end;
  finally
    FileOpenForm.Free;
  end;
end;

procedure TMainForm.BtnDeleteClick(Sender: TObject);
var
  S: string;
begin
  if (LvMyGames.ItemFocused = nil) then Exit;

  if (Application.MessageBox(PChar(Language.msgConfirmDelete),
    PChar(Language.msgDelete), MB_YESNO) <> mrYes) then Exit;

  S := UGlobal.DataPath + 'cache\';
  try
    DeleteFile(S + FMyGamesList.Item[LvMyGames.ItemFocused.Index].IconName);
  except
  end;

  FMyGamesList.Delete(LvMyGames.ItemFocused.Index);
  FMyGamesList.Save;

  LvMyGamesRefresh;
end;

function GetProcHandle(ProcName: string): THandle;
var
  Procs: array[0..$FFF] of THandle;
  ProcsCount, Needed: Cardinal;
  I: Integer;
  PH: THandle;
  MH: HMODULE;
  ModuleName: array[0..300] of Char;
  S1, S2: string;
begin
  Result := 0;
  if (ProcName = '') and (not EnumProcesses(@Procs, SizeOf(Procs),
    ProcsCount)) then Exit;
  ProcsCount := ProcsCount div SizeOf(THandle);
  for I := 0 to ProcsCount - 1 do
  begin
    PH := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False,
      Procs[I]);
    if (PH <> 0) then
    begin
      EnumProcessModules(PH, @MH, SizeOf(MH), Needed);
      GetModuleFilenameEx(PH, MH, ModuleName, SizeOf(ModuleName));
      S1 := ExtractFileName(String(ModuleName));
      S2 := ExtractFileName(ProcName);
      CloseHandle(PH);
      if LowerCase(S1) = LowerCase(S2) then
      begin
        Result := Procs[I];
        Break;
      end;
    end;
  end;
end;

procedure AttachDllToProcess(PID: Integer; LibName: string);
var
  ThreadID: Cardinal;
  ThreadHndl: THandle;
  AllocBuffer: Pointer;
  BytesWritten: Cardinal;
  ProcAddr: Pointer;
  ExitCode: Cardinal;
  hProcess: Integer;
begin
  hProcess := OpenProcess(PROCESS_ALL_ACCESS or PROCESS_CREATE_THREAD or
    PROCESS_VM_OPERATION or PROCESS_VM_WRITE, False, PID);
  if (hProcess = 0) then Exit;

  AllocBuffer := VirtualAllocEx(hProcess, nil, Length(LibName) + 1, MEM_COMMIT,
    PAGE_READWRITE);

  LibName := LibName + #0;

  if (AllocBuffer <> nil) then
    WriteProcessMemory(hProcess, AllocBuffer, PChar(LibName), Length(LibName),
      BytesWritten)
  else
    Exit;

  {ProcAddr := GetProcAddress(LoadLibrary(PChar('Kernel32.dll')),
    PChar('LoadLibraryA'));}

  ProcAddr := GetProcAddress(GetModuleHandle(PChar('Kernel32')),
    PChar('LoadLibraryA'));
  if (ProcAddr = nil) then Exit;

  ThreadHndl := CreateRemoteThread(hProcess, nil, 0, ProcAddr, AllocBuffer, 0,
    ThreadID);

  if (ThreadHndl = 0) then
    ExitCode := GetLastError;

  WaitForSingleObject(ThreadHndl, INFINITE);
  GetExitCodeThread(ThreadHndl, ExitCode);
  CloseHandle(ThreadHndl);
  VirtualFreeEx(hProcess, AllocBuffer, 0, MEM_RELEASE);
  CloseHandle(hProcess);
end;

procedure TMainForm.LvMyGamesDblClick(Sender: TObject);
var
  S: string;
  DataDir: string;
  CurItem: TFileLauncher;
  InjModule: Integer;
  CurDate: TDateTime;
begin
  // ���� ��������� VPN-����������� ��� �������� ������� �� ������, �� �������.
  if (VPNManager.GetStatus <> ovpnConnected) or
    (LvMyGames.Selected = nil) then Exit;

  CurItem := FMyGamesList.Item[LvMyGames.Selected.Index];

  DataDir := IncludeTrailingBackSlash(ExtractFilePath(CurItem.LaunchString));

  if CurItem.UseForceBindIP then
  begin
    if CurItem.InjectIntoProcess and CurItem.WaitAWhile then
      S := '-i '
    else
      S := '';

    ShellExecute(Application.Handle, PChar('open'),
      PChar('"' + UGlobal.AppPath + 'ForceBindIP.exe' + '"'),
      PChar(S + VPNManager.GetOVPNIP + ' ' +
      ExtractFileName(CurItem.LaunchString)), PChar(DataDir), SW_HIDE);

    if CurItem.InjectIntoProcess and (CurItem.InjectName <> '') then
    begin
      CurDate := Time();

      repeat
        InjModule := GetProcHandle(CurItem.InjectName);
        Application.ProcessMessages;
      until (InjModule <> 0) or (Time() > CurDate + EncodeTime(0, 0, 30, 0));

      if (InjModule <> 0) then
        AttachDllToProcess(InjModule, IncludeTrailingBackSlash(
          GetSpecialFolder(CSIDL_SYSTEM)) + 'BindIP.dll');
    end;
  end
  else
  begin
    ShellExecute(Application.Handle, PChar('open'), PChar(CurItem.LaunchString),
      nil, PChar(DataDir), SW_NORMAL);
  end;
end;

procedure TMainForm.IdIRC1Kick(Sender: TObject; AUser, AVictim: TIdIRCUser;
  AChannel: TIdIRCChannel);
var
  Idx: Integer;
  S, Dummy: string;
begin
  S := TAG_COLOR + '4*User ' + AUser.Nick + ' kick ' + AVictim.Nick + ' [' +
    AVictim.Address + ']:' + AUser.Reason;

  // ����� �����.
  if (AChannel.Name = UGlobal.IRCMainChannel) then
  begin
    Idx := FindUser(LvMainChatUsers, AVictim.Nick, Dummy);
    if (Idx <> -1) then
      LvMainChatUsers.Items.Delete(Idx);
    ReMainChat.AddFormatedString(S);
    Exit;
  end;

  // �������.
  if (AChannel.Name = Settings.RoomChannel) then
  begin
    Idx := FindUser(LvRoomUsers, AVictim.Nick, Dummy);
    if (Idx <> -1) then
      LvRoomUsers.Items.Delete(Idx);
    ReRoom.AddFormatedString(S);
  end;
end;

procedure TMainForm.IdIRC1Kicked(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel);
var
  Idx: Integer;
  S, Dummy: string;
begin
  S := TAG_COLOR + '4*User ' + AUser.Nick + ' kicked you: ' + AUser.Reason;

  // ����� �����.
  if (AChannel.Name = UGlobal.IRCMainChannel) then
  begin
    Idx := FindUser(LvMainChatUsers, IdIRC1.Nick, Dummy);
    if (Idx <> -1) then
      LvMainChatUsers.Items.Delete(Idx);
    ReMainChat.AddFormatedString(S);
    Exit;
  end;

  // �������.
  if (AChannel.Name = Settings.RoomChannel) then
  begin
    Idx := FindUser(LvRoomUsers, IdIRC1.Nick, Dummy);
    if (Idx <> -1) then
      LvRoomUsers.Items.Delete(Idx);
    ReRoom.AddFormatedString(S);
  end;
end;

procedure TMainForm.MiConnectClick(Sender: TObject);
var
  Status: Integer;
  SL: TStringList;
begin
  // ���� ������� VPN-����������� ��� �� ������� ������� �� ������, �� �������.
  if (VPNManager.GetStatus <> ovpnDisconnected) or
    (LvRoomsList.Selected = nil) then Exit;

  // ���� ������� ��� IRC-����� � ����������� ����������� � IRC-�������, �� �������.
  if (LvRoomsList.ItemFocused.SubItems.Strings[8] <> 'none') and
    (not FlgCanJoinToRoomChannel) then Exit;

  // ���� ��� �����, �� �������������.
  try
    StrToInt(LvRoomsList.ItemFocused.Caption);
  except
    if (MessageBox(Application.Handle, PChar(Language.msgRoomHasNoPing),
      PChar(UGlobal.AppTitle), MB_YESNO or MB_DEFBUTTON2) = ID_NO) then Exit;
  end;

  // ��������� �������.
  PingTimer.Enabled := False;
  TimerVpnGetShort.Enabled := False;

  // ���������� ������ �������.
  Settings.RemoteRoomIP   := LvRoomsList.ItemFocused.SubItems.Strings[4];
  Settings.RemoteRoomPort := StrToInt(LvRoomsList.ItemFocused.SubItems.Strings[5]);
  Settings.RemoteVPNIP    := LvRoomsList.ItemFocused.SubItems.Strings[6];
  Settings.RemoteVPNPort  := StrToInt(LvRoomsList.ItemFocused.SubItems.Strings[7]);
  Settings.RoomChannel    := LvRoomsList.ItemFocused.SubItems.Strings[8];

  // ������ ������.
  LvRoomUsers.Items.Clear;
  ReRoom.Clear;

  // ������������.
  OVPNInitForm := TOVPNInitForm.Create(Self);
  try
    OVPNInitForm.Show;
    repeat
      Application.ProcessMessages;
      Status := VPNManager.GetStatus;
      Sleep(100);
    until (Status = ovpnDisconnected);
    VPNManager.Connect(Settings.RemoteVPNIP, Settings.RemoteVPNPort, True,
      UGlobal.DataPath);
    repeat
      Application.ProcessMessages;
      Status := VPNManager.GetStatus;
      Sleep(100);
    until (Status <> ovpnConnecting);
  finally
    OVPNInitForm.Close;
    OVPNInitForm.Free;
  end;

  if (Status = ovpnConnected) then
  begin
    // ����� ������ - ������.
    FWorkMode := wmClient;

    // ������������� �� ������� "�������".
    TsRoom.TabVisible := True;
    sPageControl1.ActivePage := TsRoom;

    ReRoom.AddFormatedString(TAG_COLOR + '3' +
      'Connected to VPN server with local ip: ' + VPNManager.OVPNIP);

    ReRoom.AddFormatedString(TAG_COLOR + '3' +
      'Connecting chat to ' + LvRoomsList.ItemFocused.SubItems.Strings[1] +
      ' / ' + LvRoomsList.ItemFocused.SubItems.Strings[0]);

    // ������������ � ����.
    Settings.RoomChannel := '#' + Settings.RoomChannel;
    if IdIRC1.Connected then
    try
      IdIRC1.Join(Settings.RoomChannel);
    except
      on E:Exception do
        ReRoom.AddFormatedString(TAG_COLOR + '4' + E.Message);
    end;
  end
  else
  begin
    // ��������� OpenVPN.
    VPNManager.Disconnect;

    Sleep(300);

    // ��������� ��� � ���������� ���� � �������.
    SL := TStringList.Create;
    try
      SL.LoadFromFile(UGlobal.DataPath + 'log.txt');
      while (SL.Count > 30) do
        SL.Delete(0);
      with TDetailedErrorForm.Create(Self) do
      try
        Memo1.Lines := SL;
        ShowModal;
      finally
        Free;
      end;
    finally
      SL.Free;
    end;

    // ���������� ���������, ���������� �� ���� �����, � �������� ���������.
    Settings.RemoteRoomIP   := '';
    Settings.RemoteRoomPort := 0;
    Settings.RemoteVPNIP    := '';
    Settings.RemoteVPNPort  := 0;
    Settings.RoomChannel    := '';

    FWorkMode := wmIdle;
  end;
end;

procedure TMainForm.MiCreateRoomClick(Sender: TObject);
var
  Status: Integer;
  SL: TStringList;
begin
  // ���� ������� VPN-����������� ��� ����������� ����������� � IRC-�������, �� �������.
  if (VPNManager.GetStatus <> ovpnDisconnected) or
    (not FlgCanJoinToRoomChannel) then Exit;

  with TCreateRoomForm.Create(Self) do
  try
    EdRoomName.Text    := Settings.UserName + '-s room';
    CbGameName.Text    := '';
    EdRoomChannel.Text := 'plan_' + IntToStr(Random(10000));

    if (ShowModal = mrOK) then
    begin
      // ��������� �������.
      PingTimer.Enabled := False;
      TimerVpnGetShort.Enabled := False;

      // ���������� ������ �������.
      Settings.LocalRoomName := EdRoomName.Text;
      Settings.LocalGameName := CbGameName.Text;
      Settings.RoomChannel   := EdRoomChannel.Text;

      // "������ �� ������".
      Settings.RoomChannel := StringReplace(Settings.RoomChannel, '#', '',
        [rfReplaceAll]);
      Settings.RoomChannel := StringReplace(Settings.RoomChannel, ' ', '',
        [rfReplaceAll]);
      if Length(Settings.RoomChannel) < 2 then
        Settings.RoomChannel := 'plan_' + IntToStr(Random(10000));
      Settings.RoomChannel := '#' + Settings.RoomChannel;

      // ������ ������.
      LvRoomUsers.Items.Clear;
      ReRoom.Clear;

      ReRoom.AddFormatedString(TAG_COLOR + '3' + 'Creating VPN-server');

      // ��������� VPN ������.
      OVPNInitForm := TOVPNInitForm.Create(Self);
      try
        OVPNInitForm.Show;
        repeat
          Application.ProcessMessages;
          Status := VPNManager.GetStatus;
          Sleep(100);
        until (Status = ovpnDisconnected);
        Caption := 'Disconnected';
        VPNManager.CreateServer(Settings.OpenVPNPort, True, UGlobal.DataPath);
        repeat
          Application.ProcessMessages;
          Status := VPNManager.GetStatus;
          Sleep(100);
        until (Status <> ovpnConnecting);
      finally
        OVPNInitForm.Close;
        OVPNInitForm.Free;
      end;

      if (Status = ovpnConnected) then
      begin
        // ����� ������ - ������.
        FWorkMode := wmServer;

        // ������������� �� ������� "�������".
        TsRoom.TabVisible := True;
        sPageControl1.ActivePage := TsRoom;

        ReRoom.AddFormatedString(TAG_COLOR + '3' + 'Created VPNServer with IP: '
          + VPNManager.OVPNIP);

        ChatServer1.Port := Settings.RoomPort;
        ChatServer1.Active := True;

        ReRoom.AddFormatedString(TAG_COLOR + '3' + 'Creating room for ' +
          Settings.LocalGameName);

        // ������� �� ����� �������.
        if IdIRC1.Connected then
        try
          IdIRC1.Join(Settings.RoomChannel);
        except
          on E:Exception do
            ReRoom.AddFormatedString(TAG_COLOR + '4' + E.Message);
        end;

        // ��������� ������ ���������� ������� �� ������.
        TimerVpnAdd.Enabled := True;
        TimerVpnAddTimer(Self);
      end
      else
      begin
        // ��������� OpenVPN.
        VPNManager.Disconnect;

        Sleep(300);

        // ��������� ��� � ���������� ���� � �������.
        SL := TStringList.Create;
        try
          SL.LoadFromFile(UGlobal.DataPath + 'log.txt');
          while (SL.Count > 30) do
            SL.Delete(0);
          with TDetailedErrorForm.Create(Self) do
          try
            Memo1.Lines := SL;
            ShowModal;
          finally
            Free;
          end;
        finally
          SL.Free;
        end;

        // ���������� ���������, ���������� �� ���� �����, � �������� ���������.
        Settings.LocalRoomName := '';
        Settings.LocalGameName := '';
        Settings.RoomChannel   := '';

        FWorkMode := wmIdle;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.MiSettingsClick(Sender: TObject);
var
  I: Integer;
begin
  with TConfigForm.Create(Self) do
  try
    if IdIRC1.Connected then
      EdName.Text := IdIRC1.Nick;

    FillLanguageCombo;
    FillSkinCombo;

    if (ShowModal = mrOK) then
    begin
      if (Settings.LanguageName <> ComboLanguage.Text) then
      begin
        {Application.MessageBox(PChar(Language.msgYouNeedToRestart),
          PChar(Language.msgWarning));}
        Language.Load(ComboLanguage.Text);
        for I := 0 to Application.ComponentCount - 1 do
        begin
           if Application.Components[I] is TForm then
             Language.Apply(TForm(Application.Components[I]));
        end;
        ExtraLanguageApply;
      end;

      SaveSettings;

      TimerVpnGetShort.Interval := Settings.AutoNotifyPeriod * 60 * 1000;
      TimerVpnGetShort.Enabled := Settings.AutoNotify;

      if IdIRC1.Connected and (IdIRC1.Nick <> Settings.UserName) then
      try
        IdIRC1.Nick := Settings.UserName;
      except
      end;

    end;
  finally
    Free;
  end;
end;

procedure TMainForm.MiQuitClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar(Language.msgConfirmQuit),
    PChar(UGlobal.AppTitle), MB_YESNO or MB_DEFBUTTON2) <> mrYes) then Exit;

  // �����������.
  BtnDisconnect.Click;

  FlgClosing := True;
  Self.Close;
end;

procedure TMainForm.MiRefreshClick(Sender: TObject);
begin
  HTTPVpnGet.URL := UGlobal.URLTracker;
  HTTPVpnGet.PostQuery := 'do=vpn_get&ver=3';
  HTTPVpnGet.GetString;
end;

procedure TMainForm.MiHomePageClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', 'http://plangc.ru/', nil, nil,
    SW_NORMAL);
end;

procedure TMainForm.MiForumClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', 'http://plangc.ru/forum.html', nil,
    nil, SW_NORMAL);
end;

procedure TMainForm.MiAboutClick(Sender: TObject);
begin
  with TAboutForm.Create(Self) do
  try
    if (ShowModal = mrOK) then
    begin
      //
    end;
  finally
    Free;
  end;
end;

function ResolveShortcut(Wnd: HWND; ShortcutPath: string): string;
var
  obj: IUnknown;
  isl: IShellLink;
  ipf: IPersistFile;
  pfd: TWin32FindDataA;
begin
  Result := '';
  obj := CreateComObject(CLSID_ShellLink);
  isl := obj as IShellLink;
  ipf := obj as IPersistFile;
  ipf.Load(PWChar(WideString(ShortcutPath)), STGM_READ);
  with isl do
  begin
    Resolve(Wnd, SLR_ANY_MATCH);
    SetLength(Result, MAX_PATH);
    GetPath(PChar(Result), Length(Result), pfd, SLGP_UNCPRIORITY);
    Result := PChar(Result);
  end;
end; 

procedure TMainForm.WMDropFiles(var Msg: TWMDropFiles);
var
  Count: Integer;
  I: Integer;
  FileNameLen: Integer;
  FileName: string;
begin
  inherited;

  try
    Count := DragQueryFile(Msg.Drop, $FFFFFFFF, nil, 0);
    for I := 0 to Count - 1 do
    begin
      FileNameLen := DragQueryFile(Msg.Drop, I, nil, 0);
      SetLength(FileName, FileNameLen);
      DragQueryFile(Msg.Drop, I, PChar(FileName), FileNameLen + 1);
      if AnsiUpperCase(ExtractFileExt(FileName)) = '.LNK' then
      begin
        FileName := ResolveShortcut(Application.Handle, FileName);
        AddGame(ChangeFileExt(ExtractFileName(FileName), ''), FileName);
      end;
    end;
  finally
    DragFinish(Msg.Drop);
  end;

  Msg.Result := 0;
end;

procedure TMainForm.MiTeamSpeakClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open',
    PChar('ts3server://plangc.nanoloop.ru?port=9987&nickname=' +
    Settings.UserName), nil, nil, SW_NORMAL);
end;

procedure TMainForm.ExtraLanguageApply;
begin
  LvRoomsList.Columns[0].Caption := Language.msgPing;
  LvRoomsList.Columns[1].Caption := Language.msgGame;
  LvRoomsList.Columns[2].Caption := Language.msgRoomName;
  LvRoomsList.Columns[3].Caption := Language.msgPlayersCount;
  LvRoomsList.DoubleBuffered := True;
  sStatusBar1.Panels[0].Text := Language.msgYourIP + ':';
  sStatusBar1.Panels[0].Width := TextExtent(sStatusBar1.Panels[0].Text,
    sStatusBar1.Font).cx + 20;
  sStatusBar1.Panels[2].Text := Language.msgRoomsCount + ':';
  sStatusBar1.Panels[2].Width := TextExtent(sStatusBar1.Panels[2].Text,
    sStatusBar1.Font).cx + 20;
  sStatusBar1.Panels[4].Text := Language.msgPlayersCount + ':';
  sStatusBar1.Panels[4].Width := TextExtent(sStatusBar1.Panels[4].Text,
    sStatusBar1.Font).cx + 20;
  MiAdd.Caption := Language.msgAdd;
  MiEdit.Caption := Language.msgEdit;
  MiDelete.Caption := Language.msgDelete;
  MiConnect.Caption := Language.msgConnect;
  MiCreateRoom.Caption := Language.msgCreateRoom;
  MiRefresh.Caption := Language.msgRefresh;
  MiSettings.Caption := Language.msgSettings;
  MiHelp.Caption := Language.msgHelp;
  MiHomePage.Caption := Language.msgHomePage;
  MiForum.Caption := Language.msgForum;
  MiAbout.Caption := Language.msgAbout;
  MiQuit.Caption := Language.msgQuit;
end;

procedure TMainForm.IdIRC1CTCPReply(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel; Command, Args: string);
begin
  ReMainChat.AddFormatedString(TAG_COLOR + '5CTCP ' + Command + ' ����� �� ' +
    AUser.Nick + ' [' + AUser.Address + ']: ' + Args);
end;

end.
