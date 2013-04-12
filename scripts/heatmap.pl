#!/usr/bin/perl

open(FIL,"test.txt");

@strings=<FIL>;
foreach $line (@strings)
{
  if ($line =~ m/(\'\@\w*\')/g) {$nickname = $1;}
  if ($line =~ m/(\d{2}\.\d*),\s(\d{2}\.\d*)/g) {$long = $1; $lat = $2;} 
  if (defined($nickname) or defined($long) or defined($lat)) { 
    print "$long $lat \n";
  }
  else{
  print "Nothing to print...\n";
  print "$line \n";
  }
}
