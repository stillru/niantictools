#!/usr/bin/perl

$text = "2013-4-12 5:52:52 @nervoz 0088FF>nervoz</mark><span class=invisep>&gt;</span></td><td> destroyed an L1 Resonator on <a onclick=window.zoomToAndShowPortal(c7c9bb75883343fcbdf488f008735c47.12, [55.736009, 37.608604]);return false title=Krymskaya naberezhnaya, 16 строение 2, Moscow, Russia, 119049 href=https://ingress.com/intel?latE6=55736009&amp;lngE6=37608604&amp;z=17&amp;pguid=c7c9bb75883343fcbdf488f008735c47.12 class=help>Stalin and Lenin in park";
#$text = "X=5; z117e=3.14l6; temp=lQ24;";
$docycle = 1; $counter = 0;
while ($docycle) { 
  undef $name; 
#undef $value; 
undef $nickname;
  if ($test =~ m/(@nevroz)/) {$nickname = $1;}
  if ($text =~ m/(\d{2}\.\d*),\s(\d{2}\.\d*)/) {$long = $1; $lat = $2} 
#  if ($text =~ m/([\d\.\*\-]*)\s*&/g) {$value = $1;}
  if (
defined($nickname) and defined($long) and defined($lat) 
#or defined($value)
) { 
    print "NickName=$nickname, Long=$long, Lat=$lat.\n";
    $counter++;
  }else{
    $docycle = 0;
  }
}
print "I have found $counter values.\n";

