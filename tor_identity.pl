#!/usr/bin/perl -w
# C:\> telnet 127.0.0.1 9051
# Trying 127.0.0.1...
# Connected to localhost.
# Escape character is '^]'
# AUTHENTICATE ""
# 250 OK
# SIGNAL NEWYM
# 250 OK

use Socket;

system(($^O eq 'MSWin32') ? 'cls' : 'clear');

my($sock);
socket($sock, AF_INET, SOCK_STREAM, getprotobyname('tcp')) 
	or die "could not create socket : $!";

$iaddr = inet_aton("127.0.0.1") 
	or die "Unable to resolve hostname : 127.0.0.1";
$addr = sockaddr_in("9051", $iaddr);	#socket address structure

connect($sock , $addr) 
	or die "connect failed : $!";

print " [+] Connected to 127.0.0.1 on port 9051\n";

send($sock , "AUTHENTICATE ''\r\nSIGNAL NEWNYM\r\n" , 0)
	or die "send fail $!";

print " [+] Authenticated : 250 OK\n [+] SIGNAL NEWYM : 250 OK";

while ($response = <$sock>) 
{
	print $response;
}

close($sock);
exit(0);
