unit module WordCount:ver<3>;

sub count-words (Str:D $str --> Hash:D) is export {
  $str.lc.comb(/ <alnum>+ (\'<alnum>+)? /).Bag.hash
}
