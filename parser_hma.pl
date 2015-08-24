#!/usr/bin/perl

# GO HMA Proxy List Select 100 per page and submit and take proxy and paste in notepad and save
# after parsed proxy via this tools Test Good Proxy on http://incloak.com/proxy-checker/ and dl the good proxy
 	
# @array = ("France","Usa","China","Australia","Spain","Korea","Germany","China","Viet Nam","Canada","Venezuela","Brazil","Mongolia","Kazakhstan","UK","Sweden","HongKong","Chile","India","HTTPS","HTTP","High +KA","High","Medium","Low","Fast","Socks4/5","flag");

open(op,"<$ARGV[0]") or die "$!";
while(<op>){
chomp($prox = $_);


$prox =~ s/France//gi;
$prox =~ s/Usa//gi;
$prox =~ s/India//gi;
$prox =~ s/Spain//gi;
$prox =~ s/China//gi;
$prox =~ s/Korea//gi;
$prox =~ s/Canada//gi;
$prox =~ s/flag//gi;
$prox =~ s/Hong Kong//gi;
$prox =~ s/Mongolia//gi;
$prox =~ s/UK//gi;
$prox =~ s/Sweden//gi;
$prox =~ s/Kazakhstan//gi;
$prox =~ s/Chile//gi;  
$prox =~ s/Brazil//gi; 
$prox =~ s/Germany//gi; 
$prox =~ s/Switzerland//gi;
$prox =~ s/Russia//gi;
$prox =~ s/Netherlands//gi;
$prox =~ s/Serbia//gi;
$prox =~ s/Italy//gi;
$prox =~ s/Czechia//gi;
$prox =~ s/Japan//gi;
$prox =~ s/Iraq//gi;
$prox =~ s/Singapore//gi;
$prox =~ s/Romania//gi;
$prox =~ s/Belarus//gi;
$prox =~ s/Thailand//gi;
$prox =~ s/Low//gi;
$prox =~ s/Fast//gi;
$prox =~ s/Slow//gi;
$prox =~ s/Medium//gi;
$prox =~ s/High//gi;
$prox =~ s/\+//gi;
$prox =~ s/KA//gi;
$prox =~ s/socks4\/5//gi;
$prox =~ s/HTTPS//gi;
$prox =~ s/HTTP//gi;
$prox =~ s/ 	80/:80/gi;
$prox =~ s/ 	13101/:13101/gi;
$prox =~ s/ 	3128/:3128/gi;
$prox =~ s/ 	8118/:8118/gi;
$prox =~ s/ 	50255/:50255/gi;
$prox =~ s/ 	843/:843/gi;
$prox =~ s/ 	83/:83/gi;
$prox =~ s/ 	82/:82/gi;
$prox =~ s/ 	1468/:1468/gi;
$prox =~ s/ 	3130/:3130/gi;
$prox =~ s/ 	9999/:9999/gi;
$prox =~ s/ 	1080/:1080/gi;
$prox =~ s/ 	9000/:9000/gi;
$prox =~ s/1min 	//gi;
$prox =~ s/6secs 	//gi;



open(sa , ">>proxy_parsed.txt");
print sa $prox."\n";
close(sa);


}
