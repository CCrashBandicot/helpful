#!/usr/bin/perl
# sh00t to magnom , 4chraf , samim
# don't change right please noob

use LWP::UserAgent;

system $^O eq 'MSWin32' ? 'cls' : 'clear';

print "\t      *****************\n\t      us-proxy.org Grabber\n\t      by CrashBandicot\n\t      *****************\n\n\n";

print "\n";

	 $ua = LWP::UserAgent->new();
	 $ua->agent("Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36");
         $res = $ua->get("https://www.us-proxy.org/")->content;

        while($res =~ m/<tr><td>(.*?)<\/td><td>(.*?)<\/td>/g) {
        	$ip = $1;
                $port = $2;

        $zebi = $ip.":".$port."\n";
       print $zebi;

       open(SAVE , ">>proxxy.txt");
       print SAVE $zebi;
       close(SAVE);
        }
 
__END__
