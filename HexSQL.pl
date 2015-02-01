#!/usr/bin/perl
# Used for SQl Injection     /CrashBandicot/

system(($^O eq 'MSWin32') ? 'cls' : 'clear');

if ($#ARGV<0) { 
  print "\n* Enter string to encode: "; 
  chomp($string = <STDIN>);
} else { 
  $string = @ARGV[0]; 
} 

$string =~ s/(.)/sprintf("%x",ord($1))/eg;

print "\t\n  Your String Encoded : ";
print "0x".$string."\n";

__END__
