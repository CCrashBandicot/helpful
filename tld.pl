#!/usr/bin/perl
#                        ->Coder By CrashBandicot

if ($^O =~ /Win/) { system("cls"); system("title Domain Extractor"); } else { system("clear"); }

print "\n\t
                            [+++++++++++++++++++++++]
                            [|   DOmain Extractor  |]
                            [+++++++++++++++++++++++]
	                     
";

open (file, "<$ARGV[0]") || die "[-] Open the ZOnes List  !\n\n  Usage : $0 tld.txt   ";
my @file = <file>;
close file;

print "\n [+] ".scalar(@file)." DOmain Charged \n\n";
print "  [+] Try Load The TLD list !\n\n";

foreach $tld(@file) {  

	if($tld =~ m/(.*?).COM/) {

		$saved = "$1.COM\n";
        xsave($saved);
} 


}

sub xsave { 
$ma = $_[0];
print "     ".$ma;
		open (a, ">>domain_com.txt");
        print a  "$ma";
        close a; 

}
