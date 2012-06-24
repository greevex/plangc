// $Id$
unit PrevInst;

interface

uses
  Forms, Windows, Dialogs, SysUtils;

function InitInstance: Boolean;

implementation

var
  MessageId: Integer;
  OldWProc: TFNWndProc = nil;
  MutHandle: THandle = 0;
  SecondExecution: Boolean = False;
  UniqueAppStr: PAnsiChar = #0; // ��������� ��� ������� ����������,
                                // �� ���������� ��� ������ ����� ���������.

function NewWndProc(Handle: HWND; Msg: Integer;
  wParam, lParam: Longint): Longint; stdcall;
begin
  if (Msg = MessageID) then // ���� ��������� � �����������...
  begin
    if IsIconic(Application.Handle) then // ���� �������� ����� ��������������.
    begin
      Application.Restore; // ��������������� ��.
    end
    else
    begin
      // ����������� �� �������� ����.
      ShowWindow(Application.Handle, SW_SHOW);
      SetForegroundWindow(Application.Handle);
      Application.BringToFront;
    end;
    Result := 0;
  end
  else
    // � ��������� ������ �������� ��������� ����������� ����.
    Result := CallWindowProc(OldWProc, Handle, Msg, wParam, lParam);
end;

function InitInstance : Boolean;
{var
  BSMRecipients: DWORD;}
begin
  Result := False;
  // ������� ������� MUTEX ��������� ���������� ������ ���������.
  MutHandle := CreateMutex(nil, True, UniqueAppStr);
  // ������ ��� ��� ������ ?
  SecondExecution := (GetLastError = ERROR_ALREADY_EXISTS);
  if (MutHandle = 0) then Exit;

  if (not SecondExecution) then
  begin
    // ��������� ����� ���������� ��������� ����������, � ������ ���������.
    OldWProc := TFNWndProc(SetWindowLong(Application.Handle, GWL_WNDPROC,
      Longint(@NewWndProc)));
    if (OldWProc = nil) then Exit;

    // ������������� "����������" ������ ��������� ���� ����������.
    //ShowWindow(Application.Handle, SW_SHOWNORMAL);
    // ���������� �������� ����� ����������.
    //Application.ShowMainForm := True;
    Result := True;
  end
  else
  begin
    // ������������� ������ ���� ���������� "���������".
    ShowWindow(Application.Handle, SW_HIDE);
    // �������� �������� ����� ����������.
    //Application.ShowMainForm := False;
    // �������� ������� ���������� ��������� � ����������� � �������������
    // ��������� ����� �� ����.
    //BSMRecipients := BSM_APPLICATIONS;
    //BroadcastSystemMessage(BSF_IGNORECURRENTTASK or BSF_POSTMESSAGE,
    //  @BSMRecipients, MessageID, 0, 0);
  end;
end;

initialization

  // ������� ���������� ������ ��� ��������� ����������.
  UniqueAppStr := PAnsiChar('PLANUniqString');
  // ������������ � ������� ���������� ���������.
  MessageID := RegisterWindowMessage(UniqueAppStr);

finalization

  // �������� ���������� � �������� ���������.
  if (OldWProc <> nil) then
    SetWindowLong(Application.Handle, GWL_WNDPROC, Longint(OldWProc));

end.
