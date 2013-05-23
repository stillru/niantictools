#!/usr/bin/perl

# Script to illustrate how to parse a simple XML file
# and dump its contents in a Perl hash record.

use strict;
use XML::Simple;
use Data::Dumper;

my $booklist = XMLin('portals.xml.2');

print Dumper($booklist);
