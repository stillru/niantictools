#!/usr/bin/perl

use strict;
use Getopt::Std;

my %options=();
my $date;
my $faction;
my $strings;
my $nickname;
my $long;
my $lat;
my @strings;
my $line;
my $count;

getopts("reah", \%options);


if ($options{h})
{
  do_help();
}
if ($options{r})
{
  res();
}
if ($options{e})
{
  enl();
}
if ($options{a})
{
  all();
}

sub do_help {
  print "Would have shown help.";
}


sub res {
	open(FIL,"portals.xml");
	@strings=<FIL>;
	print "-----------------------\n";
	print "| Resistance Players  |\n";
	print "-----------------------\n";
	foreach $line (@strings) {
  		if ($line =~ m/<gml:pos>(\d{2}\.\d*)\s(\d{2}\.\d*)<\/gml:pos\>/g) {$lat = $1; $long = $2;}
		if ($line =~ m/<gml:description>('\w*')<\/gml:description\>/g) {$nickname = $1;}
  		if (defined($long) and defined($lat)) {
    			print "$faction player $nickname at $date - $long $lat \n";
			open (NEW,">>portals_name.txt");
			print NEW "$long $lat \n";
			close(NEW);
			undef($nickname);
			undef($long);
			undef($lat);
			undef($faction);
			undef($date);
		}
                else {
		print "Nothing to do...\n";
		}
	}
        print "-----------------------\n";
        print "File with geodata named Resistsnce.txt\n";
	exit 0;
}
sub enl {
	open(FIL,"test.txt");
	@strings=<FIL>;
	print "-----------------------\n";
	print "| Enlightent Players  |\n";
	print "-----------------------\n";
	foreach $line (@strings) {
		if ($line =~ m/title\=\"(\d{4}\-\d{1,2}-\d{1,2}\s\d{2}\:\d{2}\:\d{2})/g) {$date = $1;}
 		if ($line =~ m/(0088FF)/g) {$faction = "ENLIGHTENT";}
  		if ($line =~ m/event,\s(\'\w*\')/g) {$nickname = $1;}
  		if ($line =~ m/(\d{2}\.\d*),\s(\d{2}\.\d*)/g) {$long = $1; $lat = $2;}
  		if (defined($nickname) and defined($long) and defined($lat) and ($faction = "ENLIGHTENT")) {
    			print "$faction player $nickname at $date - $long $lat\n";
			open (NEW,">>Enlightent_name.txt");
			print NEW "$nickname \n";
			close(NEW);
			undef($nickname);
			undef($long);
			undef($lat);
			undef($faction);
			undef($date);
  		}
                else {
		print "Nothing to do...\n";
		}
	}
        print "-----------------------\n";
        print "File with geodata named Enlightent.txt\n";
	exit 0;
}
sub all {
	open(FIL,"test.txt");
	@strings=<FIL>;
	print "-----------------------\n";
	print "| All Players         |\n";
	print "-----------------------\n";
	my $count = 0;
	foreach $line (@strings) {
  		if ($line =~ m/(\d{2}\.\d*),\s(\d{2}\.\d*)/g) {$long = $1; $lat = $2;}
  		if (defined($long) and defined($lat) ) {
    			print "Player - $long $lat \n";
			open (NEW,">>All.txt");
			print NEW "$long $lat \n";
			close(NEW);
			$count++;
  		}
	}
        print "-----------------------\n";
        print "$count events.\n";
        print "File with geodata named All.txt\n";
	exit 0;
}

print "Need one of options: -r for resistance, -e for enlightent, -a for all event coordinates. Use -h for usage information.\n";
exit;
