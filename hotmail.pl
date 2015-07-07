#!/usr/bin/perl
#                        ->Coder By CrashBandicot
#                        ->sh00tz<- Danzo , m0sta , hamid , HashCat , Yunus, Ghosty , M-A                      

if ($^O =~ /Win/) { system("cls"); system("title hotmail Extractor"); } else { system("clear"); }

print "\n\t
                            [+++++++++++++++++++++++]
                            [|  Hotmail Extractor  |]
                            [|  by CrashBandicot   |]
                            [+++++++++++++++++++++++]
	                     
";

open (file, "<$ARGV[0]") || die "[-] Open the Mail list file Nigga !\n\n  Usage : $0 maillist.txt   ";
my @file = <file>;
close file;

print "\n [+] ".scalar(@file)." Mail Charged \n\n";
print "  [+] Try Load The Hotmail Mail !\n\n";

foreach $hotmail(@file) {  

	if($hotmail =~ m/(.*?)hotmail.com/) {

		$mail = "$1hotmail.com\n";
        xsave($mail);
} 
	if($hotmail =~ m/(.*?)hotmail.fr/) {

		$mail1 = "$1hotmail.fr\n";
		xsave($mail1);
}   if($hotmail =~ m/(.*?)hotmail.co.uk/) {

		$mail2 = "$1hotmail.co.uk\n";
		xsave($mail2);
}   if($hotmail =~ m/(.*?)msn.com/) {          

		$mail3 = "$1msn.com\n";
        xsave($mail3);
}   if($hotmail =~ m/(.*?)outlook.com/) {         

		$mail4 = "$1outlook.com\n";
        xsave($mail4);
}

}
sub xsave { 
$ma = $_[0];
print "     ".$ma;
		open (a, ">>hotmail.txt");
        print a  "$ma";
        close a; 

}
if ($^O =~ /Win/) { system("start hotmail.txt"); } else { system("cat hotmail.txt"); }
