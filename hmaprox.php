 <?php
$data=source("http://proxylist.hidemyass.com/search-225758");
$total1=filter($data);
$data=source("http://proxylist.hidemyass.com/search-225758/2");
$total2=filter($data);
$data=source("http://proxylist.hidemyass.com/search-1302871");
$total3=filter($data);


$final=array_merge($total1,$total2,$total3);




print_r($final);


function filter($data) {
$final=array();
$array=explode ('<tr',str_replace(" ","",$data));
  foreach( $array as $tr) {
    $tr=preg_replace('/\s+/',"",$tr);

    $type=preg_match_all('/<td>([HTPSsocks4\/5]+)<\/td>/',$tr,$type)?$type[1][0]:false;
    $nons=preg_match_all('/.([a-z0-9A-Z_-]+){display:none}/',$tr,$maths)?$maths[1]:false;
    if($type and $nons) {
      $filtre=$tr;
      foreach($nons as $non) {
        $filtre=preg_replace("/<spanclass=\"{$non}\">.*?<\/span>/","",$filtre);
      }
      $filtre=preg_replace('/<divstyle="display:none">.*?<\/div>/','',$filtre);
      $filtre=preg_replace('/<spanstyle="display:none">.*?<\/span>/','',$filtre);
      preg_match_all('/>([0-9\.]+)</',$filtre,$ips);
      $port=end($ips[1]);
      array_pop($ips[1]);
      $host=implode("",$ips[1]);
      if(filter_var($host,FILTER_VALIDATE_IP)) {
        $final[]=array('ip' => $host.":".$port,'type' => $type);
$filee = fopen("hmaprox.html", 'a+') or die("the file cannot be open");
fwrite($filee, $host.":".$port."<br>");
fclose($filee);
      }
    }
  }

  return is_array($final)?$final:array();
}

 
function source($url,$post=false,$flw=0,$timeout=30,$cookies=0) {
  $curl=curl_init();
  curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
  curl_setopt($curl,CURLOPT_URL,$url);
  curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,0);
  curl_setopt($curl,CURLOPT_HEADER,0);
  if($cookies==1) {
    curl_setopt($curl,CURLOPT_COOKIEFILE,getcwd().'/cookie.txt');
    curl_setopt($curl,CURLOPT_COOKIEJAR,getcwd().'/cookie.txt');
  }
  curl_setopt($curl,CURLOPT_USERAGENT,'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)');
  curl_setopt($curl,CURLOPT_FOLLOWLOCATION,$flw);
  curl_setopt($curl,CURLOPT_TIMEOUT,$timeout);
  if($post) {
    curl_setopt($curl,CURLOPT_POST,1);
    curl_setopt($curl,CURLOPT_POSTFIELDS,$post);
  }
  $exec=curl_exec($curl);
  curl_close($curl);
  return $exec;
} 
