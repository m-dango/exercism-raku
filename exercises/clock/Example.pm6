unit class Clock:ver<2>;

has Int:D $.hour = 0;
has Int:D $.minute = 0;

method time {
  sprintf '%02d:%02d', ($!hour + $!minute div 60) % 24, $!minute % 60;
}

method add-minutes (Int:D $min) {
  $!minute += $min and return self;
}
