#!/usr/bin/perl

use strict;
use Getopt::Std;

my %options=();

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
	open(FIL,"test.txt");
	@strings=<FIL>;
	print "-----------------------\n";
	print "| Resistance Players  |\n";
	print "-----------------------\n";
	foreach $line (@strings) {
 		if ($line =~ m/(0088FF)/g) {$faction = $1;}
  		if ($line =~ m/event,\s(\'\w*\')/g) {$nickname = $1;}
  		if ($line =~ m/(\d{2}\.\d*),\s(\d{2}\.\d*)/g) {$long = $1; $lat = $2;}
  		if (defined($nickname) and defined($long) and defined($lat) and ($faction = "0088FF")) {
    			print "Resistance player $nickname - $long $lat \n";
			open (NEW,">>Resistance.txt");
			print NEW "$long $lat \n";
			close(NEW);
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
 		if ($line =~ m/(03DC03)/g) {$faction = $1;}
  		if ($line =~ m/event,\s(\'\w*\')/g) {$nickname = $1;}
  		if ($line =~ m/(\d{2}\.\d*),\s(\d{2}\.\d*)/g) {$long = $1; $lat = $2;}
  		if (defined($nickname) and defined($long) and defined($lat) and ($faction = "03DC03")) {
    			print "Enlightent player $nickname - $long $lat\n";
			open (NEW,">>Enlightent.txt");
			print NEW "$long $lat \n";
			close(NEW);
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
