#!/usr/bin/perl

$text = "ttp://www.ingress.com/intel?latE6=55615381&lngE6=37586059&z=19;";
#$text = "X=5; z117e=3.14l6; temp=lQ24;";
$docycle = 1; $counter = 0;
while ($docycle) { 
  undef $name; undef $value;
  if ($text =~ m/(\w+)\s*=\s*/g) {$name = $1;} 
  if ($text =~ m/([\d\.\*\-]*)\s*&/g) {$value = $1;}
  if (defined($name) and defined($value)) { 
    print "Name=$name, Value=$value.\n";
    $counter++;
  }else{
    $docycle = 0;
  }
}
print "I have found $conter values.\n";
