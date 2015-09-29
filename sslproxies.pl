#!/usr/bin/perl
# grabb ssl proxy from www.sslproxies.org

use strict;
use LWP::UserAgent;
 
system(($^O eq 'MSWin32') ? 'cls' : 'clear');
 
my $ua = LWP::UserAgent->new( agent => q{Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36}, );
 

my $rsp = $ua->get('http://www.sslproxies.org/')->content;
while($rsp =~ m/<tr><td>(.*?)<\/td><td>(.*?)<\/td>/g) {
 
 
        print $1.":".$2."\n";
}
 
