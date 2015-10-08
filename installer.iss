#define MyAppName "Runtriz Casino"
#define MyAppVersion "2.0"
#define MyAppPublisher "www.runtriz.com"
#define MyAppURL "http://www.runtriz.com/"
#define MyAppExeName "Runtriz"



[Code]
function IsApp2Installed: boolean;
begin
  result := RegKeyExists(HKEY_LOCAL_MACHINE,'SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe');
end;

function InitializeSetup: boolean;
begin
  result := IsApp2Installed;
  if not result then
    MsgBox('Google Chrome is missing. Please install Google Chrome and then run this installer again.', mbError, MB_OK);
end;




[Setup]
AppId={{B2BE3581-36CD-4601-A200-017247F8BFBB}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\Runtriz
DisableDirPage=yes
DefaultGroupName=Runtriz Casino Tools
DisableProgramGroupPage=yes
OutputBaseFilename=Runtriz_Casino_Setup
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin
BackColor=$000000
BackSolid=yes


[Registry]


;Port listener for fast printing port 12004
Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\Run; ValueType: string; ValueName: epsonportcom; ValueData: "{win}\runtriz.tcp.exe"; Flags: uninsdeletevalue

;Makes Printer always default 
Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\Run; ValueType: string; ValueName: default.printer; ValueData: "cmd /c RUNDLL32 PRINTUI.DLL,PrintUIEntry /y /n ""EPSON TM-T88V Receipt""" ; Flags: uninsdeletevalue

;Printer paper settings 
Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\Run; ValueType: string; ValueName: printing.paper.settings; ValueData: "{win}\regedit.exe /S ""{app}\notepad.reg""" ; Flags: uninsdeletevalue

;Makes Powershell accesable to HKLM 
Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce; ValueType: string; ValueName: power.shell; ValueData: "{win}\regedit.exe /S ""{app}\PowerShell.reg""" ; Flags: uninsdeletevalue

;Registry entry untill the URL updater is setup, starts chrome on kiosk mode 
Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\Run; ValueType: string; ValueName: runtrizurl; ValueData: ; Flags: uninsdeletevalue

;Save Notepad registry Settings
Root: HKCU; Subkey: SOFTWARE\Microsoft\Notepad; ValueType: string; ValueName: fSavePageSettings; ValueData: "1"; Flags: uninsdeletevalue

;Test Printer
Root: HKLM; Subkey: SOFTWARE\Microsoft\Windows\CurrentVersion\Run; ValueType: string; ValueName: test.printer; ValueData: "{win}\test.printer.exe"; Flags: uninsdeletevalue

[Languages]
Name: english; MessagesFile: compiler:Default.isl
Name: spanish; MessagesFile: compiler:Languages\Spanish.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}

[Files]
Source: resources\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs
;Don't use "Flags: ignoreversion" on any shared system files

Source: resources\runtriz.tcp.exe; DestDir: {win}; Flags: ignoreversion
;Don't use "Flags: ignoreversion" on any shared system files

Source: resources\test.printer.exe; DestDir: {win}; Flags: ignoreversion
;Don't use "Flags: ignoreversion" on any shared system files

Source: resources\test.printer.txt; DestDir: {win}; Flags: ignoreversion
;Don't use "Flags: ignoreversion" on any shared system files

[Icons]
;creates shortcut to update URL
Name: {group}\Runtriz URL Tool; Filename: %ProgramFiles%\Runtriz\bin\urlsetup.exe; IconFilename: {app}\ico\runtriz.ico

;Test printer with port 12004
Name: {group}\Printer Test; Filename: {win}\test.printer.exe; IconFilename: {app}\ico\runtriz.ico

[Run]
;Install Epson drivers
Filename: {app}\APD_501_T88V.exe; StatusMsg: Installing Printer Drivers...

;runs URLsetup script 
Filename: {app}\bin\urlsetup.exe; StatusMsg: Setting up your System...

