#!/usr/bin/perl 

use LWP::UserAgent;
use LWP::Protocol::socks;


print "\n\t [+]------Sample-Checker-for-jce-Vulnerability-------------[+]\n";
print "\t [!]      Dev by CrashBandicot From TeaM Mosta             [!]\n";
print "\t [!]      result in jce_checker.txt                        [!]\n";
print "\t [+]-------------------------------------------------------[+]\n";
print "\n\n\t.Usage : perl $0  list.txt.\n\n";

open(tarrget,"<$ARGV[0]") or die "$!";
while(<tarrget>){
chomp($_);
$target = $_;


$website = $target."/administrator/components/com_jce/jce.xml";

$ua = LWP::UserAgent->new();
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->proxy([qw/ http https /] => 'socks://127.0.0.1:9150');
$ua->timeout(10);
$response = $ua->get($website)->content;
print "Target : $target\n";
if($response=~ /<name>JCE<\/name>/ ) {

 print "$target = Jce VUlnerability Detected !\n";
open (TEXT, '>>jce_checked.txt');
print TEXT "$target\n";
close (TEXT);
} else {
	print "$target = Fail not Vuln\n";
}

}