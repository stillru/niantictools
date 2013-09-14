#!/usr/bin/perl

use strict;
use Getopt::Std;

my %options=();
my $data;
my $strings;
my $long;
my $lat;
my @strings;
my $line;
my $count;

getopts("reahp", \%options);


if ($options{h})
{
  do_help();
}
if ($options{p})
{
  portals();
}

sub do_help {
  print "Would have shown help.";
}

sub portals {
	open(FIL,"portals.xml");
	@strings=<FIL>;
	print "-----------------------\n";
	print "| All Players         |\n";
	print "-----------------------\n";
	my $count = 0;
	foreach $line (@strings) {
		if ($line =~ m/<gml:description>(\w(?=ulitsa)).+<\/qml:description>.+<gml:Point>.+<gml:pos>(\d{2}\.\d*)\s(\d{2}\.\d*)/g) {$data = $1; $long = $2; $lat = $3;}
  		if (defined($long) and defined($lat) and defined($data) ) {
    			print "$data , $long , $lat \n";
			open (NEW,">>portals.txt");
			print NEW "$long $lat \n";
			close(NEW);
			$count++;
			undef($long);
			undef($lat);
			undef($data); 
  		}
	}
        print "-----------------------\n";
        print "$count events.\n";
        print "File with geodata named portals.txt\n";
	exit 0;
}

print "Need one of options: -r for resistance, -e for enlightent, -a for all event coordinates. Use -h for usage information.\n";
exit;
