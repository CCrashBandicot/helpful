#!/usr/bin/perl
# ..in progress
# C:\>ppm => install File-Find , Modern-Perl , Win32-Shortcut
# by CrashBandicot

use Win32::Shortcut;
use Modern::Perl;
use strict;
use warnings; 
use File::Find::Rule;
use Win32::Registry;
use Win32 qw(CSIDL_COMMON_DESKTOPDIRECTORY CSIDL_COMMON_APPDATA CSIDL_LOCAL_APPDATA);

system(($^O eq 'MSWin32') ? 'cls' : 'clear');

my $regdir = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run";

my ($CurrVerr, $CurrVer, %vals2, %vals);

my $path = Win32::GetFolderPath(CSIDL_LOCAL_APPDATA);

my $temp = $path."/Temp";

xlog("\n\t        ********* ~ Log File ~ ***********\n");
xlog("\n  [+] Search Files .exe , .bat , .vbs and .bin in Folder Temp....\n\n");

my @files = File::Find::Rule->maxdepth( 1 )
                            ->file
                            ->name( '*.exe', '*.bat', '*.vbs', '*.bin', '*.dll')
                            ->in( $temp );

foreach my $file (@files) {  
xlog($file."\n");
}

$main::HKEY_LOCAL_MACHINE->Open($regdir, $CurrVer) || die "Open: $!";
$CurrVer->GetValues(\%vals);

xlog("\n\n  [+] Search Files Runned in Startup via Registry ...\n\n");
foreach my $k (keys %vals) {
    my $key = $vals{$k};
    xlog("$$key[0] = $$key[2]\n");
}
$main::HKEY_CURRENT_USER->Open($regdir, $CurrVerr) || die "Open: $!";
$CurrVerr->GetValues(\%vals2);
foreach my $kk (keys %vals2) {
    my $keyy = $vals2{$kk};
    xlog("$$keyy[0] = $$keyy[2]\n");
}

system(($^O eq 'MSWin32') ? 'start log_scan.txt' : 'cat log.txt');

sub xlog {
    my $value = $_[0];
    open(LOG,">>log_scan.txt") or die(" [!] Cannot create or open log file.\n");
    print LOG "$value";
    close(LOG);
    print $value;
}
